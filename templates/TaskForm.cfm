<div class="container form-field">

      <div class="row">

        <div class="col">
          <cfoutput>
            <form name="taskCreate" method="post" action="/index.cfm?component=task&method=create">
              <p><b>#Request.Locale.task_name#</b><br>
                <input class="input-field" name="task_name" type="text" value="#Request.taskNameValue#" maxlength="40">
              </p>
              <p class="textwrapper"><b>#Request.Locale.description#:</b><br>
                <textarea name="description" maxlength="1000">#Request.taskDescription#</textarea></p>
              </p>

                <div class="pretty p-icon p-toggle p-plain">
                    <input name="importance" type="checkbox" #Request.taskImportance#>
                    <div class="state p-on">
                      <i class="fas fa-exclamation text-danger icon-fix"></i>
                      <label><b>#Request.Locale.important#</b></label>
                    </div>
                    <div class="state p-off">
                      <i class="far fa-circle text-primary icon-fix"></i>
                      <label><b>#Request.Locale.unimportant#</b></label>
                    </div>
                </div>
                <br>
                <div class="pretty p-icon p-toggle p-plain">
                    <input name="urgency" type="checkbox" #Request.taskUrgency#>
                    <div class="state p-on">
                      <i class="fas fa-fire text-danger icon-fix"></i>
                      <label><b>#Request.Locale.urgent#</b></label>
                    </div>
                    <div class="state p-off">
                      <i class="fas fa-snowflake text-primary icon-fix"></i>
                      <label><b>#Request.Locale.non_urgent#</b></label>
                    </div>
                </div>
                <br>

              </p>
              <p>
                <input class="btn btn-secondary" type="submit" value="#Request.Locale.submit#">
              </p>
            </form>
          </cfoutput>
        </div>

      </div>

</div>
