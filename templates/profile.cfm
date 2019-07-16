<div class="container">

  <div class="row info-field py-3">
    <div class="col">
      <cfoutput>
        <p>
          <span class="label-text">
            #Request.Locale.login#:
          </span>
        </p>
        <p>
          <span class="label-text">
            #Request.Locale.name#:
          </span>
        </p>
        <p>
          <span class="label-text">
            #Request.Locale.surname#:
          </span>
        </p>
        <p>
          <a class="btn btn-light" href="?component=user&method=editProfile">
            #Request.Locale.editProfile#
          </a>
          <br>
          <a class="btn btn-light" href="?component=user&method=settings">
            #Request.Locale.settings#
          </a>
        </p>
      </cfoutput>
    </div>
    <div class="col">
      <cfoutput query="getProfileInfo">
        <p>
          #HTMLEditFormat(login)#
        </p>
        <p>
          #HTMLEditFormat(name)#
        </p>
        <p>
          #HTMLEditFormat(surname)#
        </p>
      </cfoutput>
    </div>
  </div>

  <div class="row info-field py-2">
    <div class="col">
      <cfoutput>
        <p>
          <span class="label-text">
            #Request.Locale.activeTasks#:
          </span>
        </p>
        <p>
          <span class="label-text">
            #Request.Locale.closedTasks#:
          </span>
        </p>
      </cfoutput>
    </div>
    <div class="col">
      <cfoutput query="getUserTasksStatistic">
        <p>
          #task_count#
        </p>
      </cfoutput>
    </div>
  </div>

</div>
