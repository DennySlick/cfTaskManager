<cffunction name="showTask">
  <cfoutput>
    <a href="#taskDetailURL##task_id#">
      <cfif Session.designPattern eq "Minimal">
        <div class="taskshort taskx2" title="#HTMLEditFormat(task_name)#">
          <p class="taskname">
            #HTMLEditFormat(task_name)#
          </p>
          <p class="taskdate">
            #DateFormat(last_modify, "dd.mm.yyyy")#
          </p>
        </div>
      <cfelseif Session.designPattern eq "LongLine">
        <div class="taskshort" title="#HTMLEditFormat(task_name)#">
          <p class="taskname">
            #HTMLEditFormat(task_name)#
          </p>
          <p class="taskdate">
            #DateFormat(last_modify, "dd.mm.yyyy")#
          </p>
        </div>
      </cfif>
    </a>
  </cfoutput>
</cffunction>

<div class="container my-2">

  <div class="row">

    <div class="task-field col rounded m-2 bg bg-red animated bounceInLeft">
      <cfoutput query="getRedTasks">
        #showTask()#
      </cfoutput>

      <div class="task-field-menu">
        <p class="task-field-menu-element">
          <i class="transparent-link fas fa-plus-square" onclick="location.href='/?component=task&method=create&id=red'"></i>
        </p>
        <p class="task-field-menu-element">
          <i class="transparent-link fas fa-expand-arrows-alt" onclick="location.href='/?component=task&method=showSomeTasks&id=red'"></i>
        </p>
      </div>
    </div>


    <div class="task-field col rounded m-2 bg bg-orange animated bounceInUp">
      <cfoutput query="getOrangeTasks">
        #showTask()#
      </cfoutput>

      <div class="task-field-menu">
        <p class="task-field-menu-element">
          <i class="transparent-link fas fa-plus-square" onclick="location.href='/?component=task&method=create&id=orange'"></i>
        </p>
        <p class="task-field-menu-element">
          <i class="transparent-link fas fa-expand-arrows-alt" onclick="location.href='/?component=task&method=showSomeTasks&id=orange'"></i>
        </p>
      </div>
    </div>

  </div>
  <div class="row">

    <div class="task-field col rounded m-2 bg bg-green animated bounceInDown">
      <cfoutput query="getGreenTasks">
        #showTask()#
      </cfoutput>

      <div class="task-field-menu">
        <p class="task-field-menu-element">
          <i class="transparent-link fas fa-plus-square" onclick="location.href='/?component=task&method=create&id=green'"></i>
        </p>
        <p class="task-field-menu-element">
          <i class="transparent-link fas fa-expand-arrows-alt" onclick="location.href='/?component=task&method=showSomeTasks&id=green'"></i>
        </p>
      </div>
    </div>


    <div class="task-field col rounded m-2 bg bg-blue animated bounceInRight">
      <cfoutput query="getBlueTasks">
        #showTask()#
      </cfoutput>

      <div class="task-field-menu">
        <p class="task-field-menu-element">
          <i class="transparent-link fas fa-plus-square" onclick="location.href='/?component=task&method=create&id=blue'"></i>
        </p>
        <p class="task-field-menu-element">
          <i class="transparent-link fas fa-expand-arrows-alt" onclick="location.href='/?component=task&method=showSomeTasks&id=blue'"></i>
        </p>
      </div>
    </div>

  </div>
</div>


<script>
$( ".animated" ).hover(function() {
  $( this ).removeClass( "bounceInRight bounceInLeft bounceInUp bounceInDown animated");
});

$( ".task-field" ).hover(function() {
  $(this).find(".task-field-menu").toggleClass( "task-field-menu-open");
});
</script>
