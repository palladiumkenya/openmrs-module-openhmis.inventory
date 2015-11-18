(function() {
  'use strict';

  angular.module('app.pagination').service('PaginationService',
          PaginationService);

  PaginationService.$inject = ['PaginateModel', 'GenericMetadataModel',
      'ManageEntityRestFactory'];

  function PaginationService(PaginateModel, GenericMetadataModel,
          ManageEntityRestFactory) {
    var service;

    service = {
      pagingTo: pagingTo,
      pagingFrom: pagingFrom,
      paginateParams: paginateParams,
      computeNumberOfPages: computeNumberOfPages,
      paginate: paginate
    };

    return service;

    function pagingTo(currentPage, limit, totalNumOfResults) {
      if (currentPage <= 0) {
        return limit;
      } else {
        var num = currentPage * limit;
        if (num > totalNumOfResults) { return totalNumOfResults; }
        return num;
      }
    }

    function pagingFrom(currentPage, limit) {
      return currentPage <= 1 ? 1 : (currentPage - 1) * limit;
    }

    function paginateParams(start, limit, includeRetired, q) {
      var startIndex = ((start - 1) * limit) + 1;
      var params;

      if (includeRetired === true || includeRetired === "true") {
        params = {
          limit: limit,
          includeAll: true,
          startIndex: startIndex
        };
      } else {
        params = {
          limit: limit,
          startIndex: startIndex
        };
      }

      if (!angular.isUndefined(q) && q !== '') {
        params['q'] = q;
      }

      return params;
    }

    function computeNumberOfPages(totalNumOfResults, limit) {
      return Math.ceil(totalNumOfResults / limit);
    }

    /*
     * Fetch a list of paginated entities and return a paginate model.
     */
    function paginate(params, onPaginateSuccess, onPaginateError) {
      var model;
      ManageEntityRestFactory.loadEntities(params, function(data) {
        var entities = GenericMetadataModel.populateModels(data.results);
        var pages = computeNumberOfPages(data.length, params['limit']);
        var totalResults = data.length;

        model = new PaginateModel(totalResults, pages, entities);
        onPaginateSuccess(model);
      }, function(error) {
        onPaginateError(error);
      });
    }
  }
})();
