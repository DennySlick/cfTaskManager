<cfcomponent name="Home" extends="Base" accessors="true">

  <cffunction name="index">
    <cfset invoke(this, RedirectToMethod("task","showActiveTasks"))>
  </cffunction>

  <cffunction name="test1">
    <cfset headerName = "Hello world!">
    <cfset this.Json("#Session#")>
  </cffunction>

</cfcomponent>
