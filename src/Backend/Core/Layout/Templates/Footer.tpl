  <footer id="footer">
    <div class="container">
      <div class="row">
        <div class="col-xs-2 col-xs-offset-5 col-sm-2 col-sm-offset-5">
          <p class="text-center text-muted">
            <small><i>Powered by</i></small>
          </p>
          <a href="http://www.fork-cms.be" target="_blank">
            <img src="/src/Backend/Core/Layout/images/logo_footer.svg" alt="Fork CMS" class="logo-footer img-responsive">
          </a>
        </div>
      </div>
    </div>
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          {include:{$BACKEND_CORE_PATH}/Layout/Templates/Messaging.tpl}
          <div id="ajaxSpinner" style="position: fixed; top: 10px; right: 10px; display: none;">
            <img src="/src/Backend/Core/Layout/images/spinner.gif" width="16" height="16" alt="loading" />
          </div>
        </div>
      </div>
    </div>
  </footer>
  <div class="hidden">
    {include:{$BACKEND_CORE_PATH}/Layout/Templates/Dialogs.tpl}
    {* Scripts should be placed here *}
  </div>
</body>
</html>
