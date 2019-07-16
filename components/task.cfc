<cfcomponent name="Task" extends="Base" accessors="true">

  <cffunction name="create">
    <cfset headerName = "#Request.Locale.newTask#">
    <cfset errArr = taskCreateTry()>
    <cfset createTaskFormPrepareValues()>
    <cfset this.Content("TaskForm.cfm")>
  </cffunction>

  <cffunction name="detail">
    <cfset headerName = "#Request.Locale.taskDetail#">
    <cfset args = Request.methodArguments.Split(";")>
    <cfset taskID = args[1]>

    <cfquery name="getTaskDetail" datasource="tm">
      SELECT *
      FROM [tm_task]
      WHERE [owner] = #Session.user#
      AND [task_id] = <cfqueryparam value="#taskID#" cfsqltype="cf_sql_integer" />
    </cfquery>
    <cfquery name="getTaskHistory" datasource="tm">
      SELECT *
      FROM [tm_history] LEFT JOIN [tm_actions]
      ON [tm_history].[action] = [tm_actions].[action_id]
      WHERE [user_id] = #Session.user#
      AND [task_id] = <cfqueryparam value="#taskID#" cfsqltype="cf_sql_integer" />
      ORDER BY [history_id] DESC
    </cfquery>

    <cfset this.Content("TaskDetail.cfm")>
  </cffunction>

  <cffunction name="taskUpdate">
    <cfset headerName = "#Request.Locale.taskUpdate#">
    <cfif StructKeyExists(Form, "task_id")>
      <cfset taskID = Form.task_id>
    <cfelseif StructKeyExists(URL, "id")>
      <cfset taskID = #URL.id#>
    </cfif>

    <cfquery name="getTaskDetail" datasource="tm">
      SELECT *
      FROM [tm_task]
      WHERE [owner] = #Session.user#
      AND [task_id] = <cfqueryparam value="#taskID#" cfsqltype="cf_sql_integer" />
    </cfquery>
    <cfquery name="getTaskHistory" datasource="tm">
      SELECT *
      FROM [tm_history] LEFT JOIN [tm_actions]
      ON [tm_history].[action] = [tm_actions].[action_id]
      WHERE [user_id] = #Session.user#
      AND [task_id] = <cfqueryparam value="#taskID#" cfsqltype="cf_sql_integer" />
      ORDER BY [history_id] DESC
    </cfquery>

    <cfset updateTaskFormPrepareValues()>
    <cfset this.Content("TaskUpdate.cfm")>
  </cffunction>

  <cffunction name="BitToWord">
    <cfargument name="bit">
    <cfset word="">
    <cfif bit eq 0>
      <cfset word="No">
    <cfelseif bit eq 1>
      <cfset word="Yes">
    </cfif>
    <cfreturn word>
  </cffunction>

  <cffunction name="StatusWord">
    <cfargument name="inputWord">
    <cfargument name="bit">
    <cfset BitWordSt = {
      importance : ["#Request.Locale.unimportant#", "#Request.Locale.important#"],
      urgency : ["#Request.Locale.non_urgent#", "#Request.Locale.urgent#"],
      status : ["#Request.Locale.active_status#", "#Request.Locale.closed_status#"]
      }>
    <cfreturn #BitWordSt["#inputWord#"]["#bit#"+1]#>
  </cffunction>

  <cffunction name="showClosedTasks">
    <cfset taskDetailURL = "/?component=task&method=detail&id=">
    <cfquery name="getClosedTasks" datasource="tm">
      SELECT [task_id], [task_name], [last_modify]
      FROM [tm_task]
      WHERE [owner] = #Session.user#
      AND [status] = '1'
      ORDER BY [task_id] DESC
    </cfquery>
    <cfset headerName = "#Request.Locale.closedTasks#">
    <cfset this.Content("closedTasks.cfm")>
  </cffunction>

  <cffunction name="showSomeTasks">
    <cfset taskDetailURL = "/?component=task&method=detail&id=">
    <cfset showSomeTasksFormPrepareValues()>

    <cfquery name="getSomeTasks" datasource="tm">
      SELECT [task_id], [task_name], [last_modify]
      <cfif Application.Debug eq True>
        ,[status],[importance],[urgency]
      </cfif>
      FROM [tm_task]
      WHERE [owner] = #Session.user#

      <cfif StructKeyExists(Form, "status")>
        <cfif Form.status eq "active">
          AND [status] = '0'
        <cfelseif Form.status eq "closed">
          AND [status] = '1'
        </cfif>
      <cfelseif StructKeyExists(Request, "taskActive")>
        <cfif Request.taskActive eq "checked">
          AND [status] = '0'
        <cfelseif Request.taskClosed eq "checked">
          AND [status] = '1'
        </cfif>
      </cfif>

      <cfif StructKeyExists(Form, "importance")>
        <cfif Form.importance eq "important">
          AND [importance] = '1'
        <cfelseif Form.importance eq "unimportant">
          AND [importance] = '0'
        </cfif>
      <cfelseif StructKeyExists(Request, "taskImportant")>
        <cfif Request.taskImportant eq "checked">
          AND [importance] = '1'
        <cfelseif Request.taskUnimportant eq "checked">
          AND [importance] = '0'
        </cfif>
      </cfif>

      <cfif StructKeyExists(Form, "urgency")>
        <cfif Form.urgency eq "urgent">
          AND [urgency] = '1'
        <cfelseif Form.urgency eq "non_urgent">
          AND [urgency] = '0'
        </cfif>
      <cfelseif StructKeyExists(Request, "taskUrgent")>
        <cfif Request.taskUrgent eq "checked">
          AND [urgency] = '1'
        <cfelseif Request.taskNonUrgent eq "checked">
          AND [urgency] = '0'
        </cfif>
      </cfif>

      <!--- Да простят меня за это ... --->
      <!---
      <cfif StructKeyExists(Form, "startDate") and StructKeyExists(Form, "endDate") >
          AND ([last_modify]  <= CONVERT(DATETIME, '#Form.endDate#', 102))
          AND ([last_modify]  >= CONVERT(DATETIME, '#Form.startDate#', 102))
      </cfif>
      --->


      <cfif StructKeyExists(Form, "startDate") and StructKeyExists(Form, "endDate") >
          AND ([last_modify]  >= CONVERT(DATETIME, '#DateTimeFormat(Form.startDate, "yyyy-mm-dd 00:00:00")#', 102))
          AND ([last_modify]  <= CONVERT(DATETIME, '#DateTimeFormat(Form.endDate, "yyyy-mm-dd 23:59:59")#', 102))
      </cfif>



      <cfif StructKeyExists(Form, "order")>
        <cfif Form.order eq "on">
          ORDER BY [last_modify] ASC
        <cfelse>
          ORDER BY [last_modify] DESC
        </cfif>
      <cfelse>
        ORDER BY [last_modify] DESC
      </cfif>

    </cfquery>

    <cfset headerName = "#Request.Locale.showTasks#">
    <cfset this.Content("taskList.cfm")>
  </cffunction>


  <cffunction name="showActiveTasks">
    <cfset taskDetailURL = "/?component=task&method=detail&id=">

    <cfquery name="getRedTasks" datasource="tm">
      SELECT [task_id], [task_name], [last_modify]
      FROM [tm_task]
      WHERE [owner] = #Session.user#
      AND [status] = '0'
      AND [importance] = '1'
      AND [urgency] = '1'
      ORDER BY [last_modify] DESC
    </cfquery>

    <cfquery name="getOrangeTasks" datasource="tm">
      SELECT [task_id], [task_name], [last_modify]
      FROM [tm_task]
      WHERE [owner] = #Session.user#
      AND [status] = '0'
      AND [importance] = '1'
      AND [urgency] = '0'
      ORDER BY [last_modify] DESC
    </cfquery>

    <cfquery name="getGreenTasks" datasource="tm">
      SELECT [task_id], [task_name], [last_modify]
      FROM [tm_task]
      WHERE [owner] = #Session.user#
      AND [status] = '0'
      AND [importance] = '0'
      AND [urgency] = '1'
      ORDER BY [last_modify] DESC
    </cfquery>

    <cfquery name="getBlueTasks" datasource="tm">
      SELECT [task_id], [task_name], [last_modify]
      FROM [tm_task]
      WHERE [owner] = #Session.user#
      AND [status] = '0'
      AND [importance] = '0'
      AND [urgency] = '0'
      ORDER BY [last_modify] DESC
    </cfquery>

    <cfset headerName = "#Request.Locale.activeTasks#">
    <cfset this.Content("ShowMatrix.cfm")>
  </cffunction>

  <!--- Still not used.
  ToDo: make more agile --->
  <cffunction name="getUserTasks" access="private">
    <cfargument name="queryName" type="string" default="getUserTasks">
    <cfargument name="status" type="numeric">
    <cfargument name="importance" type="numeric">
    <cfargument name="urgency" type="numeric">
    <cfargument name="order" type="string" default="ASC">

    <cfquery name="#queryName#" datasource="tm">
      SELECT [task_id], [task_name], [last_modify]
      FROM [tm_task]
      WHERE [owner] = #Session.user#
      AND [status] = #status#
      AND [importance] = #importance#
      AND [urgency] = #urgency#
      ORDER BY [task_id] #order#
    </cfquery>
  </cffunction>

  <cffunction name="createTaskFormPrepareValues" access="private">
    <cfif StructKeyExists(URL, "id")>
      <cfif URL.id eq "red">
        <cfset Request.taskImportance = "checked">
        <cfset Request.taskUrgency = "checked">
      <cfelseif URL.id eq "orange">
        <cfset Request.taskImportance = "checked">
        <cfset Request.taskUrgency = "">
      <cfelseif URL.id eq "green">
        <cfset Request.taskImportance = "">
        <cfset Request.taskUrgency = "checked">
      <cfelseif URL.id eq "blue">
        <cfset Request.taskImportance = "">
        <cfset Request.taskUrgency = "">
      </cfif>
    <cfelse>
      <cfset Request.taskImportance = "">
      <cfset Request.taskUrgency = "">
    </cfif>

    <cfif (structKeyExists(Form, "task_name")
        and structKeyExists(Form, "description"))>
      <cfset Request.taskNameValue = HTMLEditFormat(Form.task_name)>
      <cfset Request.taskDescription = HTMLEditFormat(Form.description)>
    <cfelse>
      <cfset Request.taskNameValue = "">
      <cfset Request.taskDescription = "">
    </cfif>
  </cffunction>


  <cffunction name="showSomeTasksFormPrepareValues" access="private">
    <!--- Set empty values --->
    <cfset Request.taskImportant = "">
    <cfset Request.taskUnimportant = "">
    <cfset Request.taskAnyImportance = "">

    <cfset Request.taskUrgent = "">
    <cfset Request.taskNonUrgent = "">
    <cfset Request.taskAnyUrgency = "">

    <cfset Request.taskActive = "">
    <cfset Request.taskClosed = "">
    <cfset Request.taskAnyStatus = "">

    <cfset Request.taskOrder = "">

    <cfset endDateValue = Now()>
    <cfset startDateValue = DateAdd("d", -7,endDateValue)>
    <cfset endDateValueStr = DateTimeFormat(endDateValue, "yyyy-mm-dd")>
    <cfset startDateValueStr = DateTimeFormat(startDateValue, "yyyy-mm-dd")>

    <cfif StructKeyExists(URL, "id")>
      <cfif URL.id eq "red">
        <cfset Request.taskImportant = "checked">
        <cfset Request.taskUrgent = "checked">
        <cfset Request.taskActive = "checked">

      <cfelseif URL.id eq "orange">
        <cfset Request.taskImportant = "checked">
        <cfset Request.taskNonUrgent = "checked">
        <cfset Request.taskActive = "checked">

      <cfelseif URL.id eq "green">
        <cfset Request.taskUnimportant = "checked">
        <cfset Request.taskUrgent = "checked">
        <cfset Request.taskActive = "checked">

      <cfelseif URL.id eq "blue">
        <cfset Request.taskUnimportant = "checked">
        <cfset Request.taskNonUrgent = "checked">
        <cfset Request.taskActive = "checked">

      <cfelseif URL.id eq "closed">
        <cfset Request.taskAnyImportance = "checked">
        <cfset Request.taskAnyUrgency = "checked">
        <cfset Request.taskClosed = "checked">
      </cfif>

    <cfelseif (structKeyExists(Form, "status")
        and structKeyExists(Form, "importance")
        and structKeyExists(Form, "urgency"))>

      <cfif Form.status eq "active">
        <cfset Request.taskActive = "checked">
      <cfelseif Form.status eq "closed">
        <cfset Request.taskClosed = "checked">
      <cfelse>
        <cfset Request.taskAnyStatus = "checked">
      </cfif>

      <cfif Form.importance eq "important">
        <cfset Request.taskImportant = "checked">
      <cfelseif Form.importance eq "unimportant">
        <cfset Request.taskUnimportant = "checked">
      <cfelse>
        <cfset Request.taskAnyImportance = "checked">
      </cfif>

      <cfif Form.urgency eq "urgent">
        <cfset Request.taskUrgent = "checked">
      <cfelseif Form.urgency eq "non_urgent">
        <cfset Request.taskNonUrgent = "checked">
      <cfelse>
        <cfset Request.taskAnyUrgency = "checked">
      </cfif>

      <cfif StructKeyExists(Form, "order")>
        <cfif Form.order eq "on">
          <cfset Request.taskOrder = "checked">
        </cfif>
      </cfif>

      <cfset startDateValueStr = HTMLEditFormat(Form.startDate)>
      <cfset endDateValueStr = HTMLEditFormat(Form.endDate)>

    <cfelse>
      <!--- Common values --->
      <cfset Request.taskImportant = "">
      <cfset Request.taskUnimportant = "">
      <cfset Request.taskAnyImportance = "checked">

      <cfset Request.taskUrgent = "">
      <cfset Request.taskNonUrgent = "">
      <cfset Request.taskAnyUrgency = "checked">

      <cfset Request.taskActive = "checked">
      <cfset Request.taskClosed = "">
      <cfset Request.taskAnyStatus = "">
    </cfif>

  </cffunction>


  <cffunction name="updateTaskFormPrepareValues" access="private">
    <cfif structKeyExists(Form, "comment")>
      <cfset Request.taskComment = HTMLEditFormat(Form.comment)>
    <cfelse>
      <cfset Request.taskComment = "">
    </cfif>
  </cffunction>

  <cffunction name="taskCreateTry" access="private">
    <!--- Make error list --->
    <cfset errArr = []>
    <!--- Check if Create Task Form fullfilled --->
    <cfif (structKeyExists(Form, "task_name") and structKeyExists(Form, "description"))>
      <!--- Check Task Name and Description Pattern --->
      <cfset ArrayAppend(errArr, checkTaskNamePatternValidation(), "true")>
      <cfset ArrayAppend(errArr, checkDescriptionPatternValidation(), "true")>

      <cfset urgency = false>
      <cfif structKeyExists(Form, "urgency")>
        <cfif Form.urgency eq "on">
          <cfset urgency = true>
        </cfif>
      </cfif>

      <cfset importance = false>
      <cfif structKeyExists(Form, "importance")>
        <cfif Form.importance eq "on">
          <cfset importance = true>
        </cfif>
      </cfif>

      <!--- If no errors exist : add new task to database --->
      <cfif ArrayLen(errArr) eq  0>
        <cfquery name="insertTask" datasource="tm">
          INSERT INTO [tm_task]
            ([task_name],[description],[owner],[importance],[urgency],[status])
          VALUES
            (<cfqueryparam value="#Form.task_name#" cfsqltype="cf_sql_nvarchar">,
            <cfqueryparam value="#Form.description#" cfsqltype="cf_sql_nvarchar">,
            <cfqueryparam value="#Session.user#" cfsqltype="cf_sql_integer">,
            <cfqueryparam value="#importance#" cfsqltype="cf_sql_bit">,
            <cfqueryparam value="#urgency#" cfsqltype="cf_sql_bit">,
            <cfqueryparam value="false" cfsqltype="cf_sql_bit">)
          SELECT @@IDENTITY AS 'someTaskID'
        </cfquery>
        <cfloop query="insertTask">
          <cfset taskID = #someTaskID#>
        </cfloop>
        <!--- History Insert Record --->
        <cfset changeTaskHistory("create", "")>

        <cfset invoke(this, RedirectToMethod("home","index"))>
      </cfif>

    </cfif>
    <!--- if errors occurred : show problems --->
    <cfreturn errArr>
  </cffunction>

  <cffunction name="changeImportance">
    <cfset errArr = []>
    <!--- Check if Task Closed --->
    <cfif StructKeyExists(Form, "task_id")>
      <cfset taskID = Form.task_id>
      <!--- Check task unclosed Validation --->
      <cfset ArrayAppend(errArr, checkIfTaskClosed(#taskID#), "true")>

      <!--- Check History Comment Validation --->
      <cfset ArrayAppend(errArr, checkHistoryCommentValidation(), "true")>

      <cfif ArrayLen(errArr) eq 0>
        <cfquery name="getTaskImportance" datasource="tm">
          SELECT [importance]
          FROM [tm_task]
          WHERE [owner] = #Session.user#
          AND [task_id] = <cfqueryparam value="#taskID#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfloop query="getTaskImportance">
          <cfif #importance# eq 0>
            <cfset importanceUpd = 1>
          <cfelse>
            <cfset importanceUpd = 0>
          </cfif>
        </cfloop>
        <cfquery name="changeTaskImportance" datasource="tm">
          UPDATE [tm_task]
          SET [importance] = #importanceUpd#, [last_modify] = DEFAULT
          WHERE [owner] = #Session.user#
          AND [task_id] = <cfqueryparam value="#taskID#" cfsqltype="cf_sql_integer">
        </cfquery>

        <!--- Insert Record Into History --->
        <cfset changeTaskHistory("change_importance", history_comment)>

      </cfif>
      <cfset this.RedirectToMethod("task","taskUpdate","#taskID#")>

    </cfif>

  </cffunction>


  <cffunction name="checkIfTaskClosed" access="private">
    <cfargument name="local_task_id" type="numeric" required="yes">

    <cfset var localErrArr =[]>
    <cfquery name="getTaskStatus" datasource="tm">
      SELECT [status]
      FROM [tm_task]
      WHERE [owner] = #Session.user#
      AND [task_id] = <cfqueryparam value="#local_task_id#" cfsqltype="cf_sql_integer">
    </cfquery>
    <cfloop query="getTaskStatus">
      <cfif #status# eq 1>
        <cfset errorMsg = "#Request.Locale.error_change_close#">
        <cfset ArrayAppend(localErrArr, errorMsg)>
      </cfif>
    </cfloop>
    <cfreturn localErrArr>

  </cffunction>


  <cffunction name="checkIfTaskActive" access="private">
    <cfargument name="local_task_id" type="numeric" required="yes">
    <cfset var localErrArr =[]>
    <cfset ArrayAppend(localErrArr, checkIfTaskClosed(local_task_id), "true")>
    <!--- if Task is Closed -> Go Forward --->
    <cfif ArrayLen(localErrArr) gt 0>
      <cfset errArr = []>
    <cfelse>
      <cfset errorMsg = "#Request.Locale.error_change_active#">
      <cfset ArrayAppend(localErrArr, errorMsg)>
    </cfif>
    <cfreturn localErrArr>
  </cffunction>


  <cffunction name="checkHistoryCommentValidation" access="private">
    <cfset var localErrArr =[]>
    <cfset history_comment = "">
    <cfif StructKeyExists(Form, "comment")>
      <cfif Len(Form.comment) lt 255>
        <cfset history_comment = Form.comment>
      <cfelse>
        <cfset errorMsg = "#Request.Locale.error_comment_length#">
        <cfset ArrayAppend(localErrArr, errorMsg)>
      </cfif>
    </cfif>
    <cfreturn localErrArr>
  </cffunction>


  <cffunction name="changeTaskHistory" access="private">
    <cfargument name="action" required="yes" type="string">
    <cfargument name="comment_upd" required="yes" type="string">

    <cfif action eq "create">
      <cfset action_id = 1>
    <cfelseif action eq "close">
      <cfset action_id = 2>
    <cfelseif action eq "change_urgency">
      <cfset action_id = 3>
    <cfelseif action eq "change_importance">
      <cfset action_id = 4>
    <cfelseif action eq "change_description">
      <cfset action_id = 5>
    <cfelseif action eq "reopen">
      <cfset action_id = 6>
    <cfelse>
      <cfset action_id = 7>
    </cfif>

    <cfquery name="historyUpdateImportance" datasource="tm">
      INSERT INTO [tm_history]
        ([user_id],[task_id],[action],[comment])
      VALUES
        (<cfqueryparam value="#Session.user#" cfsqltype="cf_sql_integer">,
        <cfqueryparam value="#taskID#" cfsqltype="cf_sql_integer">,
        '#action_id#',
        <cfqueryparam value="#comment_upd#" cfsqltype="cf_sql_nvarchar">)
    </cfquery>
  </cffunction>

  <cffunction name="changeUrgency">
    <cfset errArr = []>
    <cfif StructKeyExists(Form, "task_id")>
      <cfset taskID = Form.task_id>
      <!--- Check if Task Closed --->
      <cfset ArrayAppend(errArr, checkIfTaskClosed(taskID), "true")>

      <!--- Check History Comment Validation --->
      <cfset ArrayAppend(errArr, checkHistoryCommentValidation(), "true")>

      <cfif ArrayLen(errArr) eq 0>
        <cfquery name="getTaskUrgency" datasource="tm">
          SELECT [urgency]
          FROM [tm_task]
          WHERE [owner] = #Session.user#
          AND [task_id] = <cfqueryparam value="#taskID#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfloop query="getTaskUrgency">
          <cfif #urgency# eq 0>
            <cfset urgencyUpd = 1>
          <cfelse>
            <cfset urgencyUpd = 0>
          </cfif>
        </cfloop>
        <cfquery name="changeTaskUrgency" datasource="tm">
          UPDATE [tm_task]
          SET [urgency] = #urgencyUpd#, [last_modify] = DEFAULT
          WHERE [owner] = #Session.user#
          AND [task_id] = <cfqueryparam value="#taskID#" cfsqltype="cf_sql_integer">
        </cfquery>
        <!--- Insert Record Into History --->
        <cfset changeTaskHistory("change_urgency", history_comment)>
      </cfif>

      <cfset this.RedirectToMethod("task","taskUpdate","#taskID#")>
    </cfif>

  </cffunction>

  <cffunction name="closeTask">
    <cfset errArr = []>
    <cfif StructKeyExists(Form, "task_id")>
      <cfset taskID = Form.task_id>
      <!--- Check if Task Closed --->
      <cfset ArrayAppend(errArr, checkIfTaskClosed(taskID), "true")>

      <!--- Check History Comment Validation --->
      <cfset ArrayAppend(errArr, checkHistoryCommentValidation(), "true")>

      <cfif ArrayLen(errArr) eq 0>
        <cfquery name="changeTaskStatus" datasource="tm">
          UPDATE [tm_task]
          SET [status] = 1, [last_modify] = DEFAULT
          WHERE [owner] = #Session.user#
          AND [task_id] = <cfqueryparam value="#taskID#" cfsqltype="cf_sql_integer">
        </cfquery>
        <!--- Insert Record Into History --->
        <cfset changeTaskHistory("close", history_comment)>
      </cfif>

      <cfset this.RedirectToMethod("task","taskUpdate","#taskID#")>
    </cfif>
  </cffunction>

  <cffunction name="openTask">
    <cfset errArr = []>
    <cfif StructKeyExists(Form, "task_id")>
      <cfset taskID = Form.task_id>
      <!--- Check if Task Closed --->
      <cfset ArrayAppend(errArr, checkIfTaskActive(taskID), "true")>
      <!--- Check History Comment Validation --->
      <cfset ArrayAppend(errArr, checkHistoryCommentValidation(), "true")>

      <cfif ArrayLen(errArr) eq 0>
        <cfquery name="changeTaskStatus" datasource="tm">
          UPDATE [tm_task]
          SET [status] = 0, [last_modify] = DEFAULT
          WHERE [owner] = #Session.user#
          AND [task_id] = <cfqueryparam value="#taskID#" cfsqltype="cf_sql_integer">
        </cfquery>
        <!--- Insert Record Into History --->
        <cfset changeTaskHistory("reopen", history_comment)>
      </cfif>

      <cfset this.RedirectToMethod("task","taskUpdate","#taskID#")>
    </cfif>
  </cffunction>


  <cffunction name="changeDescription">
    <cfset errArr = []>
    <cfif StructKeyExists(Form, "task_id")>
      <cfset taskID = Form.task_id>
      <!--- Check if Task Closed --->
      <cfset ArrayAppend(errArr, checkIfTaskClosed(taskID), "true")>
      <!--- Check History Comment Validation --->
      <cfset ArrayAppend(errArr, checkHistoryCommentValidation(), "true")>
      <!--- Check Description Pattern Validation --->
      <cfset ArrayAppend(errArr, checkDescriptionPatternValidation(), "true")>

      <cfif ArrayLen(errArr) eq 0>
        <cfquery name="changeTaskStatus" datasource="tm">
          UPDATE [tm_task]
          SET [description] = <cfqueryparam value="#Form.description#" cfsqltype="cf_sql_nvarchar">,
            [last_modify] = DEFAULT
          WHERE [owner] = #Session.user#
          AND [task_id] = <cfqueryparam value="#taskID#" cfsqltype="cf_sql_integer">
        </cfquery>
        <!--- Insert Record Into History --->
        <cfset changeTaskHistory("change_description", history_comment)>
      </cfif>

      <cfset this.RedirectToMethod("task","taskUpdate","#taskID#")>
    </cfif>
  </cffunction>


  <cffunction name="checkDescriptionPatternValidation" access="private">
    <cfset var localErrArr =[]>
    <cfif StructKeyExists(Form, "description")>
      <cfif Len(Form.description) gt 1000>
        <cfset errorMsg = "#Request.Locale.error_description_length#">
        <cfset ArrayAppend(localErrArr, errorMsg)>
      </cfif>
    </cfif>
    <cfreturn localErrArr>
  </cffunction>

  <cffunction name="checkTaskNamePatternValidation" access="private">
    <cfset var localErrArr =[]>
    <cfif StructKeyExists(Form, "task_name")>
      <cfif Len(Form.task_name) gt 40>
        <cfset errorMsg = "#Request.Locale.error_taskname_length#">
        <cfset ArrayAppend(localErrArr,errorMsg)>
      </cfif>
    </cfif>
    <cfreturn localErrArr>
  </cffunction>




</cfcomponent>
