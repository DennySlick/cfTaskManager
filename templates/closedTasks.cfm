<div class="container py-2">
  <div class="row">
    <div class="col info-field py-3">
      <cfoutput query="getClosedTasks">
        <a href="#taskDetailURL##task_id#">
          <div class="taskshort taskx2">
            <p class="taskname">
              #HTMLEditFormat(task_name)#
            </p>
            <p class="taskdate">
              #DateFormat(date_created, "dd.mm.yyyy")#
            </p>
          </div>
        </a>
      </cfoutput>
    </div>
  </div>
</div>

<div class="container my-2">
  <div class="row">
    <div class="col">
      <cfoutput>
        <p>
          <a class="btn btn-secondary" href="/?component=home&method=index"> #Request.Locale.home# </a>
        </p>
      </cfoutput>
    </div>
  </div>
</div>
