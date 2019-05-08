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
			${ ui.message("openhmis.inventory.admin.institutions")}
		</li>
	</ul>
</div>
<div id="entities-body">
	<br/>

	<div id="manage-entities-header">
		<span class="h1-substitue-left" style="float:left;">
			${ui.message('openhmis.inventory.admin.institutions')}
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

			${ ui.includeFragment("openhmis.commons", "searchFragment", [
					model: "searchField",
					onChangeEvent: "updateContent()",
					class: ["field-display ui-autocomplete-input form-control searchinput"],
					placeholder: [ui.message("openhmis.commons.general.enterSearchPhrase")]
			])}
			<br/><br />
			
			<table style="margin-bottom:5px;" class="entities-table">
				<thead>
				<tr>
					<th>${ui.message('general.name')}</th>
					<th>${ui.message('general.description')}</th>
				</tr>
				</thead>
				<tbody>
				<tr class="clickable-tr" dir-paginate="entity in fetchedEntities | itemsPerPage: limit"
				    total-items="totalNumOfResults" current-page="currentPage" ui-sref="edit({uuid: entity.uuid})">
					<td ng-style="strikeThrough(entity.retired)">{{entity.name}}</td>
					<td ng-style="strikeThrough(entity.retired)">{{entity.description}}</td>
				</tr>
				</tbody>
			</table>

			<div ng-show="fetchedEntities.length == 0">
				<br/>
				${ui.message('openhmis.commons.general.preSearchMessage')} - <b> {{searchField}} </b> - {{postSearchMessage}}
				<br/><br/>
				<span><input type="checkbox" ng-checked="includeRetired" ng-model="includeRetired"
				             ng-change="updateContent()"></span>
				<span>${ui.message('openhmis.commons.general.includeRetired')}</span>
			</div>
			${ui.includeFragment("openhmis.commons", "paginationFragment")}
		</div>
	</div>
</div>
