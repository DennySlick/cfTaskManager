<div class="container info-field">
  <cfoutput query="getTaskDetail">

    <div class="row">
      <div class="col pt-3">
        <p class="h4">
          #HTMLEditFormat(task_name)#
        </p>
      </div>

      <div class="col text-right">
        <p>
          <form name="taskEdit" method="post">
            <input name="task_id" type="hidden" value="#task_id#">
            <cfif status eq 0>
              <input name="taskEditButton" class="btn btn-secondary btn-right"
              formaction="/index.cfm?component=task&method=TaskUpdate"
              type="submit" value="#Request.Locale.task_edit#">
            <cfelseif status eq 1>
              <input name="changeStatus" class="btn btn-secondary"
              formaction="/?component=task&method=openTask"
              type="submit" value="#Request.Locale.reopen#">



            </cfif>
          </form>
        </p>
      </div>
    </div>

    <div class="row">
      <div class="col">
          <p>
            #StatusWord("importance","#importance#")#
            <br>
            #StatusWord("urgency","#urgency#")#
            <br>
            #StatusWord("status","#status#")#
          </p>
      </div>
    </div>

    <div class="row">
      <div class="col">
        <p>
          <span class="label-text"> #Request.Locale.description#: </span><br>
          #HTMLEditFormat(description)#
        </p>
        <p class="text-right">
          <span class="label-text"> #Request.Locale.from#: </span>
          #DateFormat(date_created, "dd.mm.yyyy")#
        </p>
      </div>
    </div>

  </cfoutput>

</div>

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
          #DateTimeFormat(datestamp, "dd.mm.yyyy HH:nn")#
        </p>
      </div>
    </div>
  </cfoutput>
</div>
