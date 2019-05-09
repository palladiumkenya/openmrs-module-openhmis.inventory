<script type="text/javascript">
    var breadcrumbs = [
        {icon: "icon-home", link: '/' + OPENMRS_CONTEXT_PATH + '/index.htm'},
        {
            label: "${ ui.message("openhmis.inventory.page")}",
            link: '${ui.pageLink("openhmis.inventory", "inventoryLanding")}'
        },
        {
            label: "${ ui.message("openhmis.inventory.admin.task.dashboard")}",
            link: '/' + OPENMRS_CONTEXT_PATH + '/openhmis.inventory/inventory/inventoryTasksDashboard.page'
        },
        {label: "${ ui.message("openhmis.inventory.admin.operations")}",}
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
            ${ ui.message("openhmis.inventory.admin.operations")}
        </li>
    </ul>
</div>
<div style="margin:0 50px">
    ${ui.includeFragment("openhmis.inventory", "stockOperations/entities")}
</div>

