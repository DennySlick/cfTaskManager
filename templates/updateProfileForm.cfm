<div class="container form-field">

  <div class="row">
    <div class="col">
      <cfoutput>
        <form name="updateProfile" method="post" action="/index.cfm?component=user&method=editProfile">
          <p><b>#Request.Locale.login#:</b><br>
            <input class="input-field" name="login" type="text" value="#HTMLEditFormat(Request.loginValue)#" placeholder="*" maxlength="30">
          </p>
          <p><b>#Request.Locale.fullName#:</b><br>
            <input class="input-field" name="name" type="text" value="#HTMLEditFormat(Request.nameValue)#" placeholder="#Request.Locale.name#" maxlength="32"><br>
            <input class="input-field" name="surname" type="text" value="#HTMLEditFormat(Request.surnameValue)#" placeholder="#Request.Locale.surname#" maxlength="32">
          </p>
          <p><b>#Request.Locale.valid_old_pass#:</b><br>
            <input class="input-field" name="oldPassword" type="password" value="" placeholder="*" maxlength="30">
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
        <p>
          <a class="btn btn-light btn-right" href="/index.cfm?component=user&method=editPassword">
            #Request.Locale.editPassword#
          </a>
          <a class="btn btn-light btn-right" href="/index.cfm?component=user&method=profile">
            #Request.Locale.profilePage#
          </a>
        </p>
      </cfoutput>
    </div>
  </div>

</div>
