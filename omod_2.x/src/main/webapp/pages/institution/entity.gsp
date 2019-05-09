<script type="text/javascript">


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
			<a href="${ui.pageLink("openhmis.inventory", "inventory/manageModule")}">
				${ ui.message("openhmis.inventory.manage.module")}
			</a>
		</li>
		<li>
			<i class="glyphicon glyphicon-menu-right link"></i>
			<a href="${ui.pageLink("openhmis.inventory", "institution/entities")}">
			${ ui.message("openhmis.inventory.admin.institutions")}
			</a>
		</li>
		<li>
			<i class="glyphicon glyphicon-menu-right link"></i>
			${ ui.message("openhmis.inventory.institution.name")}
		</li>
	</ul>
</div>

<div ng-show="loading" class="loading-msg">
	<span>${ui.message("openhmis.commons.general.processingPage")}</span>
	<br />
	<span class="loading-img">
		<img src="${ ui.resourceLink("uicommons", "images/spinner.gif") }"/>
	</span>
</div>

<form ng-hide="loading" name="entityForm" class="entity-form" ng-class="{'submitted': submitted}" style="font-size:inherit">
	<div style="margin:0 50px">
		${ ui.includeFragment("openhmis.commons", "editEntityHeaderFragment")}
	</div>

	
	<input type="hidden" ng-model="entity.uuid"/>

	<fieldset class="format">
		<ul class="table-layout">
			<li class="required">
				<span>{{messageLabels['general.name']}}</span>
			</li>
			<li>
				<input type="text" class="form-control" ng-model="entity.name" style="min-width: 50%;" placeholder="{{messageLabels['general.name']}}"
				       required/>
				<p class="checkRequired" ng-hide="nameIsRequiredMsg == '' || nameIsRequiredMsg == undefined">{{nameIsRequiredMsg}}</p>
			</li>
		</ul>
		<ul class="table-layout">
			<li style="vertical-align: top" class="not-required">
				<span>{{messageLabels['general.description']}}</span>
			</li>
			<li>
				<textarea ng-model="entity.description" placeholder="{{messageLabels['general.description']}}" rows="3"
				          cols="40">
				</textarea>
			</li>
		</ul>
	</fieldset>
	<fieldset class="format">
		<span>
			<input type="button" class="cancel" value="{{messageLabels['general.cancel']}}" ng-click="cancel()" />
			<input type="button" class="confirm left" value="{{messageLabels['general.save']}}" ng-click="saveOrUpdate()" />
		</span>
	</fieldset>
</form>
<div style="margin:0 50px">
${ ui.includeFragment("openhmis.commons", "retireUnretireDeleteFragment") }
</div>
