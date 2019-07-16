<form name="taskChange" method="post" class="container info-field">
  <cfoutput query="getTaskDetail">

    <div class="row pt-3">
      <div class="col">
        <p class="h4">
          #HTMLEditFormat(task_name)#
        </p>
      </div>
      <div class="col text-right">
        <a class="btn btn-secondary btn-right" href="/?component=task&method=detail&id=#taskID#"> #Request.Locale.task_detail# </a>
      </div>
    </div>

    <div class="row">
      <input name="task_id" type="hidden" value="#taskID#">

      <div class="col pt-1">
        <p>
            <input name="changeImportance" class="btn btn-light"
            formaction="/?component=task&method=changeImportance"
            type="submit" value="#StatusWord("importance","#importance#")#"
            <cfif status eq 1> disabled </cfif>>
            <br>

            <input name="changeUrgency" class="btn btn-light"
            formaction="/?component=task&method=changeUrgency"
            type="submit" value="#StatusWord("urgency","#urgency#")#"
            <cfif status eq 1> disabled </cfif>>
            <br>

            <input name="changeStatus" class="btn btn-secondary"
            <cfif status eq 0>
              formaction="/?component=task&method=closeTask"
            <cfelseif status eq 1>
              formaction="/?component=task&method=openTask"
            <cfelse>
              disabled
            </cfif>
            type="submit" value="#StatusWord("status","#status#")#">
        </p>
      </div>

      <div class="col">

        <span class="label-text">
          #Request.Locale.comment_for_upd#:
        </span><br>
        <textarea name="comment" maxlength="255">#Request.taskComment#</textarea>

      </div>

    </div> <!--- /row --->


    <div class="row">
      <div class="col">
        <p>
          <span class="label-text">
            #Request.Locale.description#:
          </span><br>
          <textarea name="description" maxlength="1000">#HTMLEditFormat(description)#</textarea>
        </p>
      </div>
    </div>
    <div class="row">
      <div class="col">
        <p class="text-left">
          <input name="changeDescription" class="btn btn-light"
          formaction="/?component=task&method=changeDescription"
          type="submit" value="#Request.Locale.change_description_action#"
          <cfif status eq 1> disabled </cfif>>
        </p>
      </div>
      <div class="col">
        <p class="text-right">
          <span class="label-text"> #Request.Locale.from#: </span>
          #DateFormat(date_created, "dd.mm.yyyy")#
        </p>
      </div>
    </div>

  </cfoutput>
</form><!-- container -->

<div class="container info-field history-field">
  <div class="row">
    <div class="col">
      <cfoutput>
        <p class="h3 py-3">
          #Request.Locale.history_log#
        </p>
      </cfoutput>
    </div>
  </div>
  <cfoutput query="getTaskHistory">
    <div class="row history-lane" title="#HTMLEditFormat(comment)#">
      <div class="col">
        <p>
          #Request.Locale["#NAME#"]#
        </p>
      </div>
      <div class="col">
        <p class="text-right">
          #DateTimeFormat(datestamp, "dd.mm.yyyy hh:nn")#
        </p>
      </div>
    </div>
  </cfoutput>
</div>
