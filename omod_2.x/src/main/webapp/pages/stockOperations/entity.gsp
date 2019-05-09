<script type="text/javascript">


	jQuery(".tabs").tabs();

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
			<a href="${ui.pageLink("openhmis.inventory", "stockOperations/entities")}">
			${ ui.message("openhmis.inventory.admin.operations")}
			</a>
		</li>
		<li>
			<i class="glyphicon glyphicon-menu-right link"></i>
			${ ui.message("openhmis.inventory.stock.operation.name")}
		</li>
	</ul>
</div>
<div style="margin:0 50px">

${ui.includeFragment("openhmis.inventory", "stockOperations/entity")}
</div>
