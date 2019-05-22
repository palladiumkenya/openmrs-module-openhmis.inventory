<%
    ui.decorateWith("kenyaemr", "standardPage")
    def htmlSafeId = { extension ->
        "${ extension.id.replace(".", "-") }-${ extension.id.replace(".", "-") }-extension"
    }
    ui.includeCss("kenyaemr", "referenceapplication.css")
%>

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
            ${ ui.message("openhmis.inventory.manage.module")}
        </li>
    </ul>
</div>

<div  style="margin:0 50px" class="ke-page-content">


    <div id="apps">
        <% extensions.each { ext -> %>
        <a id="${ htmlSafeId(ext) }" href="/${ contextPath }/${ ext.url }" class="button app big">
            <% if (ext.icon) { %>
            <i class="${ ext.icon }"></i>
            <% } %>
            ${ ui.message(ext.label) }
        </a>
        <% } %>

    </div>

</div>