<script type="text/javascript">

</script>

<div ng-show="loading" class="loading-msg">
    <span>${ui.message("openhmis.commons.general.processingPage")}</span>
    <br />
    <span class="loading-img">
        <img src="${ ui.resourceLink("uicommons", "images/spinner.gif") }"/>
    </span>
</div>

<form ng-hide="loading" name="itemAttributeForm" class="entity-form" ng-class="{'submitted': submitted}">

    ${ ui.includeFragment("openhmis.commons", "editEntityHeaderFragment")}

    <input type="hidden" ng-model="entity.uuid" />
    <fieldset class="format">
        <ul class="table-layout">
            <li class="required">
                <span>{{messageLabels['general.name']}}</span>
            </li>
            <li>
                <input class="form-control" type="text" ng-model="entity.name" style="min-width: 50%;" placeholder="{{messageLabels['general.name']}}" required />
            </li>
        </ul>
        <ul class="table-layout">
            <li class="not-required">
                <span>{{messageLabels['general.description']}}</span>
            </li>
            <li>
                <input class="form-control" type="text" ng-model="entity.description" style="min-width: 50%;" placeholder="{{messageLabels['general.description']}}" />
            </li>
        </ul>
        <ul class="table-layout">
            <li class="not-required">
                <span>${ui.message('PersonAttributeType.format')}</span>
            </li>
            <li>
                <select class="form-control" style="font-size: 14px" ng-model="entity.format" ng-options="field for field in formatFields track by field">
                    <option value="" ng-if="false"></option>
                    <option ng-selected="entity.format == field">
                    </option>
                </select>
            </li>
        </ul>
        <ul class="table-layout">
            <li class="not-required">
                <span>${ui.message('PersonAttributeType.foreignKey')}</span>
            </li>
            <li>
                <input class="form-control" type="number" ng-model="entity.foreignKey"  />
            </li>
        </ul>
        <ul class="table-layout">
            <li class="not-required">
                <span>${ui.message('PatientIdentifierType.format')}</span>
            </li>
            <li>
                <input class="form-control" type="text" ng-model="entity.regExp" />
            </li>
        </ul>
        <ul class="table-layout">
            <li class="not-required">
                <span>${ui.message('FormField.required')}</span>
            </li>
            <li>
                <input type="checkbox" ng-model="entity.required" />
            </li>
        </ul>
        <ul class="table-layout">
            <li class="not-required">
                <span>${ui.message('Field.attributeName')} ${ui.message('Obs.order')}</span>
            </li>
            <li>
                <input class="form-control" type="number" ng-model="entity.attributeOrder" />
            </li>
        </ul>
    </fieldset>
    <fieldset class="format">
        <span>
            <input type="button" class="cancel" value="{{messageLabels['general.cancel']}}" ng-click="cancel()" />
            <input type="button" class="confirm right" value="{{messageLabels['general.save']}}" ng-click="saveOrUpdate()" />
        </span>
    </fieldset>
</form>
${ ui.includeFragment("openhmis.commons", "retireUnretireDeleteFragment") }
