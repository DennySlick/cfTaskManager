<form class="container" method="post" action="/?component=task&method=showSomeTasks">
  <cfoutput>
    <div name="search_params" class="row info-field py-3">

      <div class="col-7">

        <p>

          <div class="pretty p-default p-round radio-fix">
              <input type="radio" name="status" value="active" #Request.taskActive#>
              <div class="state">
                  <label>#Request.Locale.active_status#</label>
              </div>
          </div>

          <div class="pretty p-default p-round radio-fix">
              <input type="radio" name="status" value="closed" #Request.taskClosed#>
              <div class="state">
                  <label>#Request.Locale.closed_status#</label>
              </div>
          </div>

          <div class="pretty p-default p-round radio-fix">
              <input type="radio" name="status" value="any_status" #Request.taskAnyStatus#>
              <div class="state">
                  <label>#Request.Locale.any_status#</label>
              </div>
          </div>

        </p>
        <p>

          <div class="pretty p-default p-round radio-fix">
              <input type="radio" name="importance" value="important" #Request.taskImportant#>
              <div class="state">
                  <label>#Request.Locale.important#</label>
              </div>
          </div>

          <div class="pretty p-default p-round radio-fix">
              <input type="radio" name="importance" value="unimportant" #Request.taskUnimportant#>
              <div class="state">
                  <label>#Request.Locale.unimportant#</label>
              </div>
          </div>

          <div class="pretty p-default p-round radio-fix">
              <input type="radio" name="importance" value="any_importance" #Request.taskAnyImportance#>
              <div class="state">
                  <label>#Request.Locale.any_importance#</label>
              </div>
          </div>

        </p>
        <p>

          <div class="pretty p-default p-round radio-fix">
              <input type="radio" name="urgency" value="urgent" #Request.taskUrgent#>
              <div class="state">
                  <label>#Request.Locale.urgent#</label>
              </div>
          </div>

          <div class="pretty p-default p-round radio-fix">
              <input type="radio" name="urgency" value="non_urgent" #Request.taskNonUrgent#>
              <div class="state">
                  <label>#Request.Locale.non_urgent#</label>
              </div>
          </div>

          <div class="pretty p-default p-round radio-fix">
              <input type="radio" name="urgency" value="any_urgency" #Request.taskAnyUrgency#>
              <div class="state">
                  <label>#Request.Locale.any_urgency#</label>
              </div>
          </div>

        </p>

      </div><!-- first col -->

      <div class="col text-right">

        <p>
          <span class="label-text">#Request.Locale.from#: </span>
          <input type="date" name="startDate" id="startDate" value="#startDateValueStr#"> <!--- "2018-10-27"--->
        </p>
        <p>
          <span class="label-text">#Request.Locale.to#: </span>
          <input type="date" name="endDate" id="endDate" value="#endDateValueStr#">
        </p>

        <p>
          <div class="pretty p-icon p-toggle p-plain">
              <input name="order" type="checkbox" #Request.taskOrder#>
              <div class="state p-on">
                <label>#Request.Locale.old_first#</label>
                <i class="fas fa-arrow-circle-left icon-fix"></i>
              </div>
              <div class="state p-off">
                <label>#Request.Locale.new_first#</label>
                <i class="fas fa-arrow-circle-right icon-fix"></i>
              </div>
          </div>
        </p>
      </div><!-- second col -->

    </div><!-- row -->
    <div class="row">
      <div class="col">
        <p>
          <button type="submit" class="btn btn-secondary" formaction="/?component=task&method=showSomeTasks">
            <i class="fas fa-search-plus"></i> #Request.Locale.search#
          </button>
        </p>
      </div>
    </div>
  </cfoutput>
</form><!-- container -->




<!---
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
--->

<div class="container info-field py-3">
  <div class="row">
    <div class="col">
      <cfoutput query="getSomeTasks">
        <a href="#taskDetailURL##task_id#">
          <div class="taskshort taskx2" title="#HTMLEditFormat(task_name)#">
            <p class="taskname">
              #HTMLEditFormat(task_name)#
              <cfif Application.Debug eq True>
                #HTMLEditFormat(status)# #HTMLEditFormat(importance)# #HTMLEditFormat(urgency)#
              </cfif>
            </p>
            <p class="taskdate">
              #DateFormat(last_modify, "dd.mm.yyyy")#
              <cfif Application.Debug eq True>
                <br>#last_modify#
              </cfif>
            </p>
          </div>
        </a>
      </cfoutput>
    </div>
  </div>
</div>



<script>
/*
Date.prototype.addDays = function(days) {
  var date = new Date(this.valueOf());
  date.setDate(date.getDate() + days);
  return date;
}

  $(document).ready(function(){

    var dt = new Date();
    var dt2 = dt.addDays(-7);

    var dateForm = (dt.getFullYear()) + "-" + (("0"+(dt.getMonth()+1)).slice(-2)) +"-"+ (("0"+dt.getDate()).slice(-2));
    var dateForm2 = (dt2.getFullYear()) + "-" + (("0"+(dt2.getMonth()+1)).slice(-2)) +"-"+ (("0"+dt2.getDate()).slice(-2));
    $("#endDate").val(dateForm);
    $("#startDate").val(dateForm2);

});
*/
</script>
