
<%
    ui.includeCss("kenyaemr", "referenceapplication.css")
%>
<script type="text/javascript">

</script>
<div style="margin-left: 5px; margin-right: 5px">
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
		<a href="${ui.pageLink("openhmis.inventory", "inventory/manageModule")}">
			${ ui.message("openhmis.inventory.manage.module")}
		</a>
	</li>
	<li>
		<i class="glyphicon glyphicon-menu-right link"></i>
		${ ui.message("openhmis.inventory.admin.items")}
	</li>
</ul>
</div>
<div style="margin-left: 5px; margin-right: 5px" id="entities-body">
	<br/>

	<div id="manage-entities-header">
		<span class="h1-substitue-left" style="float:left;">
			${ui.message('openhmis.inventory.admin.items')}
		</span>
		<span style="float:right;">
			<a class="button confirm" ui-sref="new">
				<i class="icon-plus"></i>
				{{newEntityLabel}}
			</a>
		</span>
	</div>
	<br/><br/><br/>

	<div>
		<div id="entities">

			${ ui.message('openhmis.inventory.department.name') }:
			<ul class="search-area">
				<li>
					<select ng-model="department" ng-change="searchItems(currentPage)" style="height:33px;"
					        ng-options='department.name for department in departments track by department.uuid'>
						<option value="" selected="selected">Any</option>
					</select>
				</li>
				<li>
					${ ui.includeFragment("openhmis.commons", "searchFragment", [
							model: "searchField",
							onChangeEvent: "searchItemsByName(currentPage)",
							class: ["field-display ui-autocomplete-input form-control searchinput"],
							placeholder: [ui.message("openhmis.commons.general.enterSearchPhrase")]
					])}

				</li>
			</ul>
			<br/><br/>
			<table style="margin-bottom:5px;" class="manage-entities-table">
				<thead>
				<tr>
					<th>${ui.message('general.name')}</th>
					<th>${ui.message('openhmis.inventory.department.name')}</th>
					<th>Codes</th>
					<th>${ui.message('openhmis.inventory.item.defaultPrice')}</th>
				</tr>
				</thead>
				<tbody>
				<tr class="clickable-tr" dir-paginate="entity in fetchedEntities | itemsPerPage: limit"
				    total-items="totalNumOfResults" current-page="currentPage" ui-sref="edit({uuid: entity.uuid})">
					<td ng-style="strikeThrough(entity.retired)">{{entity.name}}</td>
					<td ng-style="strikeThrough(entity.retired)">{{entity.department.name}}</td>
					<td ng-style="strikeThrough(entity.retired)">
						<span ng-repeat="code in entity.codes" >{{code.code}}{{\$last ? '' : ', '}} </span>
					</td>
					<td ng-style="strikeThrough(entity.retired)">{{entity.defaultPrice.price | number:2}} <span
							ng-if="entity.defaultPrice.name != ''  && entity.defaultPrice.name != null">({{entity.defaultPrice.name}})</span></td>
				</tr>
				</tbody>
			</table>

			<div ng-show="fetchedEntities.length == 0">
				<br/>
				${ui.message('openhmis.commons.general.preSearchMessage')} - <b> {{searchField}} </b> - {{postSearchMessage}}
				<br/><br/>
				<span><input type="checkbox" ng-checked="includeRetired" ng-model="includeRetired"
				             ng-change="searchItems(currentPage)"></span>
				<span>${ui.message('openhmis.commons.general.includeRetired')}</span>
			</div>
			${ui.includeFragment("openhmis.commons", "paginationFragment", [onPageChange: "searchItems(currentPage)", onChange: "searchItems(currentPage)"])}
		</div>
	</div>
</div>
