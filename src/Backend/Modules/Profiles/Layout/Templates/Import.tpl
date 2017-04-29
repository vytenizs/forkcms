{include:{$BACKEND_CORE_PATH}/Layout/Templates/Head.tpl}
{include:{$BACKEND_CORE_PATH}/Layout/Templates/StructureStartModule.tpl}
<div class="row fork-module-heading">
  <div class="col-md-6">
    <h2>{$lblImport|ucfirst}</h2>
  </div>
  <div class="col-md-6">
    <div class="btn-toolbar pull-right">
      <div class="btn-group" role="group">
        {option:showProfilesIndex}
        <a href="{$var|geturl:'index'}" class="btn btn-default" title="{$lblCancel|ucfirst}">
          <span class="fa fa-times"></span>&nbsp;
          {$lblCancel|ucfirst}
        </a>
        {/option:showProfilesIndex}
        <a href="{$var|geturl:'export_template'}" class="btn btn-default" title="{$lblExportTemplate|ucfirst}">
          <span class="fa fa-download"></span>&nbsp;
          {$lblExportTemplate|ucfirst}
        </a>
      </div>
    </div>
  </div>
</div>
{form:import}
  <div class="row fork-module-content">
    <div class="col-md-12">
      <div class="form-group{option:ddmGroupError} has-error{/option:ddmGroupError}">
        <label for="group" class="control-label">{$lblGroup|ucfirst}</label>
        {$ddmGroup} {$ddmGroupError}
      </div>
      <div class="form-group{option:fileFileError} has-error{/option:fileFileError}">
        <label for="file" class="control-label">
          {$lblFile|ucfirst}&nbsp;
          <abbr data-toggle="tooltip" title="{$lblRequiredField|ucfirst}">*</abbr>
        </label>
        {$fileFile} {$fileFileError}
      </div>
      <div class="form-group">
        <ul class="list-unstyled">
          <li class="checkbox">
            <label>{$chkOverwriteExisting} {$msgOverwriteExisting}</label>
          </li>
        </ul>
      </div>
    </div>
  </div>
  <div class="row fork-module-actions">
    <div class="col-md-12">
      <div class="btn-toolbar">
        <div class="btn-group pull-right" role="group">
          <button id="importButton" type="submit" name="add" class="btn btn-success"><span class="fa fa-download"></span> {$lblImport|ucfirst}</button>
        </div>
      </div>
    </div>
  </div>
{/form:import}
{include:{$BACKEND_CORE_PATH}/Layout/Templates/StructureEndModule.tpl}
{include:{$BACKEND_CORE_PATH}/Layout/Templates/Footer.tpl}
