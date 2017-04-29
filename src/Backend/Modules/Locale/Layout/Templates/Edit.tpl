{include:{$BACKEND_CORE_PATH}/Layout/Templates/Head.tpl}
{include:{$BACKEND_CORE_PATH}/Layout/Templates/StructureStartModule.tpl}
<div class="row fork-module-heading">
  <div class="col-md-12">
    <h2>{$msgEditTranslation|ucfirst|sprintf:{$name}}</h2>
  </div>
</div>
{form:edit}
  <div class="row fork-module-content">
    <div class="col-md-12">
      <div class="form-group{option:txtNameError} has-error{/option:txtNameError}">
        <label for="name" class="control-label">
          {$lblReferenceCode|ucfirst}
          <abbr data-toggle="tooltip" title="{$lblRequiredField|ucfirst}">*</abbr>
        </label>
        <p class="help-block">{$msgHelpAddName}</p>
        {$txtName} {$txtNameError}
      </div>
      <div class="form-group{option:txtValueError} has-error{/option:txtValueError}">
        <label for="value" class="control-label">
          {$lblTranslation|ucfirst}
          <abbr data-toggle="tooltip" title="{$lblRequiredField|ucfirst}">*</abbr>
        </label>
        <p class="help-block">{$msgHelpAddValue}</p>
        {$txtValue} {$txtValueError}
      </div>
      <div class="form-group{option:ddmLanguageError} has-error{/option:ddmLanguageError}">
        <label for="language" class="control-label">{$lblLanguage|ucfirst}</label>
        {$ddmLanguage} {$ddmLanguageError}
      </div>
      <div class="form-group{option:ddmApplicationError} has-error{/option:ddmApplicationError}">
        <label for="application" class="control-label">{$lblApplication|ucfirst}</label>
        {$ddmApplication} {$ddmApplicationError}
      </div>
      <div class="form-group{option:ddmModuleError} has-error{/option:ddmModuleError}">
        <label for="module" class="control-label">{$lblModule|ucfirst}</label>
        {$ddmModule} {$ddmModuleError}
      </div>
      <div class="form-group{option:ddmTypeError} has-error{/option:ddmTypeError}">
        <label for="type" class="control-label">{$lblType|ucfirst}</label>
        {$ddmType} {$ddmTypeError}
      </div>
    </div>
  </div>
  <div class="row fork-module-actions">
    <div class="col-md-12">
      <div class="btn-toolbar">
        <div class="btn-group pull-left" role="group">
          {option:showLocaleDelete}
          <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#confirmDelete">
            <span class="glyphicon glyphicon-trash"></span>&nbsp;
            {$lblDelete|ucfirst}
          </button>
          {/option:showLocaleDelete}
        </div>
        <div class="btn-group pull-right" role="group">
          <button id="editButton" type="submit" name="edit" class="btn btn-success"><span class="fa fa-floppy-o"></span> {$lblSave|ucfirst}</button>
        </div>
      </div>
      {option:showLocaleDelete}
      <div class="modal fade" id="confirmDelete" tabindex="-1" role="dialog" aria-labelledby="{$lblDelete|ucfirst}" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <span class="modal-title h4">{$lblDelete|ucfirst}</span>
            </div>
            <div class="modal-body">
              <p>{$msgConfirmDelete}</p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">{$lblCancel|ucfirst}</button>
              <a href="{$var|geturl:'delete'}&amp;id={$id}{$filterQuery}" class="btn btn-primary">
                {$lblOK|ucfirst}
              </a>
            </div>
          </div>
        </div>
      </div>
      {/option:showLocaleDelete}
    </div>
  </div>
{/form:edit}
{include:{$BACKEND_CORE_PATH}/Layout/Templates/StructureEndModule.tpl}
{include:{$BACKEND_CORE_PATH}/Layout/Templates/Footer.tpl}
