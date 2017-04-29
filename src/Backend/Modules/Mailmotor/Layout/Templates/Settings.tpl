{include:{$BACKEND_CORE_PATH}/Layout/Templates/Head.tpl}
{include:{$BACKEND_CORE_PATH}/Layout/Templates/StructureStartModule.tpl}
<div class="row fork-module-heading">
  <div class="col-md-12">
    <h2>{$lblSettings|ucfirst}</h2>
  </div>
</div>
{option:!clientId}
<div class="row fork-module-messages">
  <div class="col-md-12">
    <div class="alert alert-warning" role="alert">
      <p><strong>{$msgConfigurationError}</strong></p>
      <ul>
        {option:!account}
        <li>{$errNoCMAccount}</li>
        {/option:!account}
        {option:account}
        <li>{$errNoCMClientID}</li>
        {/option:account}
      </ul>
    </div>
  </div>
</div>
{/option:!clientId}
<div class="row fork-module-content">
  <div class="col-md-12">
    <div role="tabpanel">
      <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active">
          <a href="#tabGeneral" aria-controls="general" role="tab" data-toggle="tab">{$lblGeneral|ucfirst}</a>
        </li>
        <li role="presentation">
          <a href="#tabAccount" aria-controls="account" role="tab" data-toggle="tab">CampaignMonitor - {$lblAccountSettings|ucfirst}</a>
        </li>
        {option:account}
        <li role="presentation">
          <a href="#tabClient" aria-controls="client" role="tab" data-toggle="tab">CampaignMonitor - {$lblClientSettings|ucfirst}</a>
        </li>
        {/option:account}
      </ul>
      <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="tabGeneral">
          {form:settingsGeneral}
            <div class="row">
              <div class="col-md-12">
                <div class="panel panel-default">
                  <div class="panel-heading">
                    <h4 class="panel-title">
                      {$lblSender|ucfirst}
                    </h4>
                  </div>
                  <div class="panel-body">
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group{option:txtFromNameError} has-error{/option:txtFromNameError}">
                          <label for="fromName" class="control-label">
                            {$lblName|ucfirst}
                            <abbr data-toggle="tooltip" title="{$lblRequiredField|ucfirst}">*</abbr>
                          </label>
                          {$txtFromName} {$txtFromNameError}
                        </div>
                      </div>
                      <div class="col-md-6">
                        <div class="form-group">
                          <label for="fromEmail" class="control-label">
                            {$lblEmailAddress|ucfirst}
                            <abbr data-toggle="tooltip" title="{$lblRequiredField|ucfirst}">*</abbr>
                          </label>
                          {$txtFromEmail} {$txtFromEmailError}
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="panel panel-default">
                  <div class="panel-heading">
                    <h4 class="panel-title">
                      {$lblReplyTo|ucfirst}
                    </h4>
                  </div>
                  <div class="panel-body">
                    <div class="row">
                      <div class="col-md-6">
                        <div class="form-group{option:txtReplyToEmailError} has-error{/option:txtReplyToEmailError}">
                          <label for="replyToEmail" class="control-label">
                            {$lblEmailAddress|ucfirst}
                            <abbr data-toggle="tooltip" title="{$lblRequiredField|ucfirst}">*</abbr>
                          </label>
                          {$txtReplyToEmail} {$txtReplyToEmailError}
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="panel panel-default">
                  <div class="panel-heading">
                    <h4 class="panel-title">
                      {$lblPlainTextVersion|ucfirst}
                    </h4>
                  </div>
                  <div class="panel-body">
                    <div class="form-group">
                      <ul class="list-unstyled">
                        <li class="checkbox">
                          <label for="plainTextEditable" class="control-label">
                            {$chkPlainTextEditable} {$msgPlainTextEditable|ucfirst}
                          </label>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            {option:userIsGod}
            <div class="row">
              <div class="col-md-12">
                <div class="panel panel-default">
                  <div class="panel-heading">
                    <h4 class="panel-title">
                      {$lblPrices|ucfirst}
                    </h4>
                  </div>
                  <div class="panel-body">
                    <div class="row">
                      <div class="col-md-3">
                        <div class="form-group{option:txtPricePerEmailError} has-error{/option:txtPricePerEmailError}">
                          <label for="pricePerEmail" class="control-label">
                            {$lblPerSentMailing|ucfirst}
                            <abbr data-toggle="tooltip" title="{$lblRequiredField|ucfirst}">*</abbr>
                          </label>
                          <p class="help-block">{$msgHelpPrice}</p>
                          <div class="input-group">
                            <span class="input-group-addon">&euro;</span>
                            {$txtPricePerEmail} {$txtPricePerEmailError}
                          </div>
                        </div>
                      </div>
                      <div class="col-md-3">
                        <div class="form-group{option:txtPricePerCampaignError} has-error{/option:txtPricePerCampaignError}">
                          <label for="pricePerEmail" class="control-label">
                            {$lblPerCampaign|ucfirst}
                            <abbr data-toggle="tooltip" title="{$lblRequiredField|ucfirst}">*</abbr>
                          </label>
                          <p class="help-block">{$msgHelpPrice}</p>
                          <div class="input-group">
                            <span class="input-group-addon">&euro;</span>
                            {$txtPricePerCampaign} {$txtPricePerCampaignError}
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            {/option:userIsGod}
            <div class="row">
              <div class="col-md-12">
                <div class="btn-toolbar">
                  <div class="btn-group pull-right" role="group">
                    <button id="save" type="submit" name="save" class="btn btn-success">
                      <span class="fa fa-floppy-o"></span>&nbsp;
                      {$lblSave|ucfirst}
                    </button>
                  </div>
                </div>
              </div>
            </div>
          {/form:settingsGeneral}
        </div>
        <div role="tabpanel" class="tab-pane" id="tabAccount">
          {form:settingsAccount}
            <div class="row">
              <div class="col-md-12">
                <div class="form-group{option:txtUrlError} has-error{/option:txtUrlError}">
                  <label for="url" class="control-label">
                    {$lblURL|uppercase}
                    <abbr data-toggle="tooltip" title="{$lblRequiredField|ucfirst}">*</abbr>
                  </label>
                  <p class="help-block">{$msgHelpCMURL}</p>
                  {$txtUrl} {$txtUrlError}
                </div>
                <div class="form-group{option:txtUsernameError} has-error{/option:txtUsernameError}">
                  <label for="username" class="control-label">
                    {$lblUsername|ucfirst}
                    <abbr data-toggle="tooltip" title="{$lblRequiredField|ucfirst}">*</abbr>
                  </label>
                  {$txtUsername} {$txtUsernameError}
                </div>
                <div class="form-group{option:txtPasswordError} has-error{/option:txtPasswordError}">
                  <label for="password" class="control-label">
                    {$lblPassword|ucfirst}
                    <abbr data-toggle="tooltip" title="{$lblRequiredField|ucfirst}">*</abbr>
                  </label>
                  {$txtPassword} {$txtPasswordError}
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="btn-toolbar">
                  <div class="btn-group pull-left" role="group">
                    {option:account}
                    <a id="unlinkAccount" href="#" class="btn btn-danger">
                      <span class="fa fa-unlink"></span>&nbsp;
                      {$msgUnlinkCMAccount}
                    </a>
                    {/option:account}
                  </div>
                  <div class="btn-group pull-right" role="group">
                    {option:!account}
                    <a id="linkAccount" href="#" class="btn btn-success">
                      <span class="fa fa-link"></span>&nbsp;
                      {$msgLinkCMAccount}
                    </a>
                    {/option:!account}
                    {option:account}
                    {option:clientId}
                    <a href="{$var|geturl:'index'}" class="btn btn-default">
                      <span class="fa fa-list"></span>&nbsp;
                      {$msgViewMailings}
                    </a>
                    {/option:clientId}
                    {/option:account}
                  </div>
                </div>
              </div>
            </div>
          {/form:settingsAccount}
        </div>
        {option:account}
        <div role="tabpanel" class="tab-pane" id="tabClient">
          {form:settingsClient}
            <div class="row">
              <div class="col-md-12">
                <div class="form-group">
                  <label for="clientId" class="control-label">{$lblClient|ucfirst}</label>
                  {option:!clientId}
                  <p class="text-danger"><strong>{$msgNoClientID}</strong></p>
                  {/option:!clientId}
                  {$ddmClientId}
                </div>
                <div class="form-group{option:txtCompanyNameError} has-error{/option:txtCompanyNameError}">
                  <label for="companyName" class="control-label">
                    {$lblCompanyName|ucfirst}
                    <abbr data-toggle="tooltip" title="{$lblRequiredField|ucfirst}">*</abbr>
                  </label>
                  {$txtCompanyName} {$txtCompanyNameError}
                </div>
                <div class="form-group{option:ddmCountriesError} has-error{/option:ddmCountriesError}">
                  <label for="countries" class="control-label">{$lblCountry|ucfirst}</label>
                  {$ddmCountries} {$ddmCountriesError}
                </div>
                <div class="form-group{option:ddmTimezonesError} has-error{/option:ddmTimezonesError}">
                  <label for="timezones" class="control-label">{$lblTimezone|ucfirst}</label>
                  {$ddmTimezones} {$ddmTimezonesError}
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="btn-toolbar">
                  <div class="btn-group pull-right" role="group">
                    <button id="save" type="submit" name="save" class="btn btn-success">
                      <span class="fa fa-floppy-o"></span>&nbsp;
                      {$lblSave|ucfirst}
                    </button>
                  </div>
                </div>
              </div>
            </div>
          {/form:settingsClient}
        </div>
        {/option:account}
      </div>
    </div>
  </div>
</div>
{include:{$BACKEND_CORE_PATH}/Layout/Templates/StructureEndModule.tpl}
{include:{$BACKEND_CORE_PATH}/Layout/Templates/Footer.tpl}
