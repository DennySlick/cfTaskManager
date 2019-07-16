<div class="container form-field">

      <div class="row">

        <div class="col">
          <cfoutput>
            <form name="signIn" method="post" action="/index.cfm?component=user&method=signIn">
              <p><b>#Request.Locale.login#:</b><br>
                <input class="input-field" name="login" type="text" value="#HTMLEditFormat(Request.loginValue)#" maxlength="30">
              </p>
              <p><b>#Request.Locale.password#:</b><br>
                <input class="input-field" name="password" type="password" value="#HTMLEditFormat(Request.passwordValue)#" maxlength="30">
              </p>
              <p>
                <input class="btn btn-secondary" type="submit" value="#Request.Locale.submit#">
              </p>
            </form>
          </cfoutput>
        </div>

      </div>

      <div class="row">
        <cfoutput>
          <div class="col text-right">
            <p class="label-text">
              #Request.Locale.no_acc#?
            </p>
            <a class="btn btn-light btn-right" href="/index.cfm?component=user&method=signUp">
              #Request.Locale.signup#
            </a>
          </div>
        </cfoutput>
      </div>

</div>
