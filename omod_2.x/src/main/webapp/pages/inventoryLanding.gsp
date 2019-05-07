<%
    ui.decorateWith("kenyaemr", "standardPage")

    def htmlSafeId = { extension ->
        "${ extension.id.replace(".", "-") }-${ extension.id.replace(".", "-") }-extension"
    }
    ui.includeCss("kenyaemr", "referenceapplication.css")
%>
<div class="ke-page-content">

	<h1>${ui.message("openhmis.inventory.task.page")}</h1>

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