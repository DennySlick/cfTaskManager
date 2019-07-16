<div class="container form-field">

  <div class="row">
    <div class="col">
      <cfoutput>
        <form name="signUp" method="post" action="/index.cfm?component=user&method=signUp">
          <p><b>#Request.Locale.login#:</b><br>
            <input class="input-field" name="login" type="text" value="#HTMLEditFormat(Request.loginValue)#" placeholder="*" maxlength="30">
          </p>
          <p><b>#Request.Locale.password#:</b><br>
            <input class="input-field" name="password" type="password" value="#HTMLEditFormat(Request.passwordValue)#" placeholder="*" maxlength="30">
          </p>
          <p><b>#Request.Locale.repeatPassword#:</b><br>
            <input class="input-field" name="repeatPassword" type="password" value="#HTMLEditFormat(Request.repeatPasswordValue)#" placeholder="*" maxlength="30">
          </p>
          <p><b>#Request.Locale.fullname#:</b><br>
            <input class="input-field" name="name" type="text" value="#HTMLEditFormat(Request.nameValue)#" placeholder="#Request.Locale.name#" maxlength="32"><br>
            <input class="input-field" name="surname" type="text" value="#HTMLEditFormat(Request.surnameValue)#" placeholder="#Request.Locale.surname#" maxlength="32">
          </p>
          <p>
            <input class="btn btn-secondary" type="submit" value="#Request.Locale.submit#">
          </p>
        </form>
      </cfoutput>
    </div>
  </div>

  <div class="row">
    <div class="col text-right">
      <cfoutput>
        <p class="label-text">
          #Request.Locale.have_acc#?
        </p>
        <a class="btn btn-light btn-right" href="/index.cfm?component=user&method=signIn">
          #Request.Locale.signin#
        </a>
      </cfoutput>
    </div>
  </div>

</div>
