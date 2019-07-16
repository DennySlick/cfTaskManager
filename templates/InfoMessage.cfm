<div class="container info-field p-3">

  <div class="row">
    <cfoutput>
      <div class="col">

        <cfif Scenario eq "1">
          <p>
            #Request.Locale.msg_thx_for_reg#, #HTMLEditFormat(Session.fullname)#!
          </p>
        <cfelseif Scenario eq "2">
          <p>
            #Request.Locale.msg_hello#, #HTMLEditFormat(Session.fullname)# !
          </p>
          <p>
            #Request.Locale.msg_logged_in#
          </p>
        <cfelseif Scenario eq "3">
          <p>
            #HTMLEditFormat(Session.fullname)#,
          </p>
          <p>
            #Request.Locale.msg_profile_upd#
          </p>
        </cfif>

        <p>
          <a class="btn btn-light" href="/index.cfm?component=home&method=index"> #Request.Locale.home# </a>

          <a class="btn btn-light" href="?component=user&method=profile"> #Request.Locale.profilePage# </a>

          <a class="btn btn-light" href="/index.cfm?component=user&method=signOut"> #Request.Locale.signout# </a>
        </p>
      </div>
    </cfoutput>
  </div>

</div>
