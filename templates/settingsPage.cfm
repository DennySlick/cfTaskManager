<div class="container info-field p-3">

  <div class="row">
    <cfoutput>
      <div class="col">

        <p class="pb-2">
          #Request.Locale.theme#
        </p>
        <p class="pb-2">
          #Request.Locale.task_view#
        </p>
        <p class="pb-2">
          #Request.Locale.language#
        </p>

      </div>
      <div class="col">

        <form name="switchTheme" method="post" action="/index.cfm?component=user&method=switchTheme">
          <input class="btn btn-light" type="submit"
            <cfif Session.Theme eq "dark-theme">
              value='#Request.Locale.dark#'
            <cfelseif Session.Theme eq "light-theme">
              value='#Request.Locale.light#'
            </cfif>
            >
        </form>

        <form name="switchDesignPattern" method="post" action="/index.cfm?component=user&method=switchDesignPattern">
          <input class="btn btn-light" type="submit" value='#Request.Locale["#Session.designPattern#"]#'>
        </form>

        <form name="switchLanguage" method="post" action="/index.cfm?component=user&method=switchLanguage">
          <input class="btn btn-light" type="submit" value='#Request.Locale["#Session.Lang#"]#'>
        </form>

      </div>
    </cfoutput>
  </div>

</div>
