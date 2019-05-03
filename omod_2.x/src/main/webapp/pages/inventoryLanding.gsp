<%
    ui.decorateWith("kenyaemr", "standardPage")
%>
<div class="ke-page-content">

	<h1>${ui.message("openhmis.inventory.task.page")}</h1>

    <div id="apps">
        <% extensions.each { ext ->

        def onClick = "ui.navigate('/" + contextPath + "/" + ext.url + "')"

        %>

        <div style="float: left; margin: 5px;" >
            <button type="button" class="ke-app" onclick="${ onClick }"><img src="" />${ ui.message(ext.label) }</button>
        </div>

        <% } %>

    </div>

</div>