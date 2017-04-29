{include:{$BACKEND_CORE_PATH}/Layout/Templates/Head.tpl}
{include:{$BACKEND_CORE_PATH}/Layout/Templates/StructureStartModule.tpl}
<div class="row fork-module-heading">
  <div class="col-md-12">
    <h2>{$lblEditTemplate|ucfirst}</h2>
  </div>
</div>
{form:edit}
  <div class="row fork-module-content">
    <div class="col-md-12">
      <div class="form-inline form-group{option:ddmThemeError} has-error{/option:ddmThemeError}{option:txtFileError} has-error{/option:txtFileError}">
        <p class="help-block">{$msgHelpTemplateLocation}</p>
        <label for="file" class="control-label">{$msgPathToTemplate|ucfirst}</label>
        <label for="theme" class="hide" class="control-label">{$lblTheme|ucfirst}</label>
        {$ddmTheme}<small><code>/Core/Layout/Templates/</code></small>{$txtFile} {$ddmThemeError} {$txtFileError}
      </div>
      <div class="form-group{option:txtLabelError} has-error{/option:txtLabelError}">
        <label for="label" class="control-label">{$lblLabel|ucfirst}</label>
        {$txtLabel} {$txtLabelError}
      </div>
    </div>
  </div>
  <div class="row fork-module-content">
    <div class="col-md-12">
      <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title">{$lblPositions|ucfirst}</h3>
        </div>
        <div id="positions" class="panel-body">
          {iteration:positions}
          <div class="form-group jsPosition"{option:!positions.i} style="display: none"{/option:!positions.i}>
            <div class="row">
              {* Title & button to delete this position *}
              <div class="col-md-2">
                <div class="form-group">
                  <label for="position{$positions.i}" class="control-label">
                    <span>{$lblPosition|ucfirst}</span>
                    <a href="#" class="btn text-danger jsDeletePosition" title="{$lblDeletePosition|ucfirst}">
                      <span class="fa fa-trash-o"></span>&nbsp;
                    </a>
                  </label>
                </div>
              </div>
              {* Position name *}
              <div class="col-md-10">
                <div class="form-group">
                  {$positions.txtPosition}
                  {$positions.txtPositionError}
                </div>
              </div>
            </div>
            <div class="row jsBlocks">
              {* Default blocks for this position *}
              {option:positions.blocks}
              {iteration:positions.blocks}
              <div class="col-md-10 col-md-offset-2 jsBlock">
                <div class="form-inline form-group">
                  <div class="form-group">
                    {$positions.blocks.ddmType}
                    {$positions.blocks.ddmTypeError}
                  </div>
                  {* Button to remove block from this position *}
                  <a href="#" class="btn text-danger jsDeleteBlock" title="{$lblDeleteBlock|ucfirst}">
                    <span class="fa fa-trash-o"></span>&nbsp;
                  </a>
                </div>
              </div>
              {/iteration:positions.blocks}
              {/option:positions.blocks}
              <div class="col-md-10 col-md-offset-2">
                <div class="btn-toolbar">
                  <div class="btn-group" role="group">
                    {* Button to add new default block to this position *}
                    <a href="#" class="btn btn-default jsAddBlock">
                      <span class="fa fa-plus"></span>&nbsp;
                      <span>{$lblAddBlock|ucfirst}</span>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          {/iteration:positions}
          {* Button to add new position *}
          <div class="btn-toolbar">
            <div class="btn-group" role="group">
              <a href="#" class="btn btn-primary jsAddPosition">
                <span class="fa fa-plus"></span>&nbsp;
                <span>{$lblAddPosition|ucfirst}</span>
              </a>
            </div>
          </div>
          {option:formErrors}
          <p class="text-danger">{$formErrors}</p>
          {/option:formErrors}
        </div>
      </div>
    </div>
  </div>
  <div class="row fork-module-content">
    <div class="col-md-12">
      <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title">
            <label for="format" class="control-label">{$lblLayout|ucfirst}</label>
          </h3>
        </div>
        <div class="panel-body">
          <div class="row">
            <div class="col-md-6">
              <div class="form-group{option:txtFormatError} has-error{/option:txtFormatError}">
                {$txtFormat} {$txtFormatError}
              </div>
              <div>
                {$msgHelpPositionsLayoutText}
              </div>
            </div>
            <div class="col-md-6">
              <div>
                {$msgHelpPositionsLayoutExample}
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row fork-module-content">
    <div class="col-md-12">
      <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title">{$lblStatus|ucfirst}</h3>
        </div>
        <div class="panel-body">
          <div class="form-group{option:chkActiveError} has-error{/option:chkActiveError}{option:chkDefaultError} has-error{/option:chkDefaultError}">
            <ul class="list-unstyled">
              <li class="checkbox">
                <label for="active">{$chkActive} {$lblActive|ucfirst}</label> {$chkActiveError}
              </li>
              <li class="checkbox">
                <label for="default">{$chkDefault} {$lblDefault|ucfirst}</label> {$chkDefaultError}
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row fork-module-content">
    <div class="col-md-12">
      <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title">{$lblOverwrite|ucfirst}</h3>
        </div>
        <div class="panel-body">
          <div class="form-group{option:chkOverwriteError} has-error{/option:chkOverwriteError}">
            <p class="help-block">{$msgHelpOverwrite}</p>
            <ul class="list-unstyled">
              <li class="checkbox">
                <label for="overwrite">{$chkOverwrite} {$lblOverwrite|ucfirst}</label> {$chkOverwriteError}
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="row fork-page-actions">
    <div class="col-md-12">
      <div class="btn-toolbar">
        <div class="btn-group pull-left" role="group">
          {option:showExtensionsDeleteThemeTemplate}
          <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#confirmDelete">
            <span class="fa fa-trash-o"></span>&nbsp;
            {$lblDelete|ucfirst}
          </button>
          {/option:showExtensionsDeleteThemeTemplate}
        </div>
        <div class="btn-group pull-right" role="group">
          <button id="editButton" type="submit" name="edit" class="btn btn-success">
            <span class="fa fa-floppy-o"></span>&nbsp;{$lblSave|ucfirst}
          </button>
        </div>
      </div>
      {option:showExtensionsDeleteThemeTemplate}
      <div class="modal fade" id="confirmDelete" tabindex="-1" role="dialog" aria-labelledby="{$lblDelete|ucfirst}" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <span class="modal-title h4">{$lblDelete|ucfirst}</span>
            </div>
            <div class="modal-body">
              <p>{$msgConfirmDeleteTemplate|sprintf:{$template.label}}</p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal"><span class="fa fa-times"></span> {$lblCancel|ucfirst}</button>
              <a href="{$var|geturl:'delete_theme_template'}&amp;id={$template.id}" class="btn btn-danger">
                <span class="fa fa-trash-o"></span> {$lblDelete|ucfirst}
              </a>
            </div>
          </div>
        </div>
      </div>
      {/option:showExtensionsDeleteThemeTemplate}
    </div>
  </div>
{/form:edit}

{include:{$BACKEND_CORE_PATH}/Layout/Templates/StructureEndModule.tpl}
{include:{$BACKEND_CORE_PATH}/Layout/Templates/Footer.tpl}
