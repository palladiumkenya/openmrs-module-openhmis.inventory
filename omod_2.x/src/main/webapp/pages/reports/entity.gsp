<script type="text/javascript" xmlns="http://www.w3.org/1999/html">
    var breadcrumbs = [
        { icon: "icon-home", link: '/' + OPENMRS_CONTEXT_PATH + '/index.htm' },
        {
            label: "${ ui.message("openhmis.inventory.page")}" ,
            link: '${ui.pageLink("openhmis.inventory", "inventoryLanding")}'
        },
        {
            label: "${ ui.message("openhmis.inventory.admin.task.dashboard")}",
            link: '/' + OPENMRS_CONTEXT_PATH + '/openhmis.inventory/inventory/inventoryTasksDashboard.page'
        },
        {
            label: "${ ui.message("openhmis.inventory.admin.reports")}",
            link: '/' + OPENMRS_CONTEXT_PATH + '/openhmis.inventory/reports/entities.page#/'
        }
    ];
</script>

<div style="margin:0 50px">
    <br/>
    <ul id="breadcrumbs">
        <li>
            <a href="${ui.pageLink("kenyaemr", "userHome")}">
                <i class="fa fa-home"></i>
            </a>
        </li>
        <li>
            <i class="glyphicon glyphicon-menu-right link"></i>
            <a href="${ui.pageLink("openhmis.inventory", "inventoryLanding")}">
                ${ ui.message("openhmis.inventory.page")}
            </a>
        </li>
        <li>
            <i class="glyphicon glyphicon-menu-right link"></i>
            <a href="${ui.pageLink("openhmis.inventory", "inventory/inventoryTasksDashboard")}">
                ${ ui.message("openhmis.inventory.admin.task.dashboard")}
            </a>
        </li>
        <li>
            <i class="glyphicon glyphicon-menu-right link"></i>
            <a href="${ui.pageLink("openhmis.inventory", "reports/entities")}">
                ${ ui.message("openhmis.inventory.admin.reports")}
            </a>
        </li>
    </ul>
</div>
<div id="reportPage">

<h2>{{ ui.message("openhmis.inventory.admin.reports")}}</h2>

<div class="report">
    <fieldset>
        <legend>
            <i class="icon-list-alt"></i>
            {{stockTakeReport.reportName}}
        </legend>
        <small>{{stockTakeReport.reportDescription}}</small>

        <ul class="table-layout">
            <li><label>Stockroom </label></li>
            <li>
                <select required class="form-control" ng-model="StockTakeReport_stockroom" ng-options='stockroom.name for stockroom in stockrooms' autofocus>
                    <option value="" selected="selected">Select Stockroom</option>
                </select>
            </li>
        </ul>
        <ul class="table-layout">
            <li></li>
            <li><a class="btn btn-grey" ng-click="generateReport_StockTakeReport()">Generate Report</a></li>
        </ul>
    </fieldset>
</div>
<hr>

<div class="report">
    <fieldset>
        <legend>
            <i class="icon-list-alt"></i>
            {{stockCardReport.reportName}}
        </legend>
        <small>{{stockCardReport.reportDescription}}</small>

        <ul class="table-layout">
            <li><label>Item</label></li>
            <li>
                ${ ui.includeFragment("openhmis.commons", "searchFragment", [
                        typeahead: ["reportItem.name for reportItem in searchReportItems(\$viewValue)"],
                        model: "stockCardReport_item",
                        typeaheadOnSelect: "setStockCardReportItem(\$item)",
                        typeaheadEditable: "true",
                        class: ["form-control report-item"],
                        placeholder: [ui.message('openhmis.inventory.item.enterItemSearch')]
                ])}
            </li>
        </ul>

        <ul class="table-layout">
            <li><label>Start Date</label></li>
            <li>
                <span class="date">
                    ${ ui.includeFragment("uicommons", "field/datetimepicker", [
                            formFieldName: "stockCardReport_beginDate",
                            id: "stockCardReport_beginDate",
                            label: "",
                            useTime: false
                    ])}
                </span>
            </li>
        </ul>

        <ul class="table-layout">
            <li><label>End Date</label></li>
            <li>
                <span class="date">
                    ${ ui.includeFragment("uicommons", "field/datetimepicker", [
                            formFieldName: "stockCardReport_endDate",
                            id: "stockCardReport_endDate",
                            label: "",
                            useTime: false
                    ])}
                </span>
            </li>
        </ul>

        <ul class="table-layout">
            <li></li>
            <li><a class="btn btn-grey" ng-click="generateReport_StockCardReport()">Generate Report</a></li>
        </ul>
    </fieldset>
</div>
<hr>

<div class="report">
    <fieldset>
        <legend>
            <i class="icon-list-alt"></i>
            {{stockOperationsByStockroomReport.reportName}}
        </legend>
        <small>{{stockOperationsByStockroomReport.reportDescription}}</small>
        <ul class="table-layout">
            <li><label>Stockroom </label></li>
            <li>
                <select required  class="form-control" ng-model="stockOperationsByStockroomReport_stockroom" ng-options='stockroom.name for stockroom in stockrooms'>
                    <option value="" selected="selected">Select Stockroom</option>
                </select>
            </li>
        </ul>

        <ul class="table-layout">
            <li><label>Item</label></li>
            <li>
                ${ ui.includeFragment("openhmis.commons", "searchFragment", [
                        typeahead: ["reportItem.name for reportItem in searchReportItems(\$viewValue)"],
                        model: "stockOperationsByStockroomReport_item",
                        typeaheadOnSelect: "setStockOperationsByStockroomReportItem(\$item)",
                        typeaheadEditable: "true",
                        class: ["form-control report-item"],
                        placeholder: [ui.message('openhmis.inventory.item.enterItemSearch')]
                ])}
            </li>
        </ul>

        <ul class="table-layout">
            <li><label>Start Date</label></li>
            <li>
                <span class="date">
                    ${ ui.includeFragment("uicommons", "field/datetimepicker", [
                            formFieldName: "stockOperationsByStockroomReport_beginDate",
                            id: "stockOperationsByStockroomReport_beginDate",
                            label: "",
                            useTime: false
                    ])}
                </span>
            </li>
        </ul>

        <ul class="table-layout">
            <li><label>End Date</label></li>
            <li>
                <span class="date">
                    ${ ui.includeFragment("uicommons", "field/datetimepicker", [
                            formFieldName: "stockOperationsByStockroomReport_endDate",
                            id: "stockOperationsByStockroomReport_endDate",
                            label: "",
                            useTime: false
                    ])}
                </span>
            </li>
        </ul>

        <ul class="table-layout">
            <li></li>
            <li><a class="btn btn-grey" ng-click="generateReport_StockOperationsByStockroomReport()">Generate Report</a></li>
        </ul>
    </fieldset>
</div>
<hr>

<div class="report">
    <fieldset>
        <legend>
            <i class="icon-list-alt"></i>
            {{stockroomUsageReport.reportName}}
        </legend>
        <small>{{stockroomUsageReport.reportDescription}}</small>
        <ul class="table-layout">
            <li><label>Stockroom </label></li>
            <li>
                <select required class="form-control" ng-model="stockroomUsageReport_stockroom" ng-options='stockroom.name for stockroom in stockrooms'>
                    <option value="" selected="selected">Select Stockroom</option>
                </select>
            </li>
        </ul>

        <ul class="table-layout">
            <li><label>Start Date</label></li>
            <li>
                ${ ui.includeFragment("uicommons", "field/datetimepicker", [
                        formFieldName: "stockroomUsageReport_beginDate",
                        id: "stockroomUsage_beginDate",
                        label: "",
                        useTime: false
                ])}
            </li>
        </ul>

        <ul class="table-layout">
            <li><label>End Date</label></li>
            <li>
                ${ ui.includeFragment("uicommons", "field/datetimepicker", [
                        formFieldName: "stockroomUsageReport_endDate",
                        id: "stockroomUsage_endDate",
                        label: "",
                        useTime: false
                ])}
            </li>
        </ul>

        <ul class="table-layout">
            <li></li>
            <li><a class="btn btn-grey" ng-click="generateReport_StockroomUsage()">Generate Report</a></li>
        </ul>
    </fieldset>
</div>
<hr>


<div class="report">
    <fieldset>
        <legend>
            <i class="icon-list-alt"></i>
            {{expiringStockReport.reportName}}
        </legend>
        <small>{{expiringStockReport.reportDescription}}</small>
        <ul class="table-layout">
            <li><label>Stockroom </label></li>
            <li>
                <select class="form-control" id="expiringStock-stockroom" ng-model="expiringStock_stockroom" ng-options='stockroom.name for stockroom in stockrooms'>
                    <option value="" selected="selected">All Stockrooms</option>
                </select>
            </li>
        </ul>

        <ul class="table-layout">
            <li><label>Expiry Date</label></li>
            <li>
                ${ ui.includeFragment("uicommons", "field/datetimepicker", [
                        formFieldName: "expiringStock_expiresByDate",
                        id: "expiringStock_expiresByDate",
                        label: "",
                        useTime: false
                ])}
            </li>
        </ul>

        <ul class="table-layout">
            <li></li>
            <li><a class="btn btn-grey" ng-click="generateReport_ExpiringStock()">Generate Report</a></li>
        </ul>
    </fieldset>
</div>
</div>
