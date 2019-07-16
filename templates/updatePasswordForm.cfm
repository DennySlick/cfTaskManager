<div class="container form-field">

  <div class="row">
    <div class="col">
      <cfoutput>
        <form name="updatePassword" method="post" action="/index.cfm?component=user&method=editPassword">
          <p><b>#Request.Locale.new_pass#:</b><br>
            <input class="input-field" name="password" type="password" value="" placeholder="*" maxlength="30">
          </p>
          <p><b>#Request.Locale.repeat_new_pass#:</b><br>
            <input  class="input-field" name="repeatPassword" type="password" value="" placeholder="*" maxlength="30">
          </p>
          <p><b>#Request.Locale.valid_old_pass#:</b><br>
            <input  class="input-field" name="oldPassword" type="password" value="" placeholder="*" maxlength="30">
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
          <a class="btn btn-light btn-right" href="?component=user&method=editProfile">
            #Request.Locale.editProfile#
          </a>
          <a class="btn btn-light btn-right" href="/index.cfm?component=user&method=profile">
            #Request.Locale.profilePage#
          </a>
        </p>
      </cfoutput>
    </div>
  </div>

</div>
