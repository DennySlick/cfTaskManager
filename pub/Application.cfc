<cfcomponent output="true">

  <cfset this.name = "Application">
  <cfset this.sessionmanagement = "Yes">
  <cfset this.sessiontimeout = CreateTimespan(0,0,45,0)>

  <cffunction name="onApplicationStart" returnType="void">
    <cfset this.loadLocale()>
  </cffunction>

  <cffunction name="loadLocale" returnType="void">
    <cfset Application.Locale = { "en" : {}, "ru" : {} }>
    <cfquery name="getLocale" datasource="tm">
      SELECT *
      FROM [tm_locale]
    </cfquery>
    <cfloop query="getLocale">
      <cfset Application.Locale[#lang#][#key#] = #value#>
    </cfloop>
  </cffunction>

  <cffunction name="onSessionStart" returnType="void">
    <cfset Session.designPattern = "LongLine">
    <cfset Session.Lang = "en">
    <cfset Session.Theme = "light-theme">
  </cffunction>

  <cffunction name="onRequest" returnType="void">
    <cfargument name="targetPage" type="String" required="true" />

    <cfset Application.Debug = False>
    <cfif Application.Debug>
      <cfoutput> Session Info: </cfoutput>
      <cfdump var=#Session#>
      <cfoutput> Form: </cfoutput>
      <cfdump var=#Form#>
      <cfoutput> URL Info: </cfoutput>
      <cfdump var=#URL#>
      <cfset this.loadLocale()>
    </cfif>

    <cfset Request.Locale = Application.Locale[#Session.Lang#]>

    <cfset componentName = "home">
    <cfset componentMethod = "index">

    <cfif structKeyExists(URL, "component") and URL["component"] neq "">
      <cfset componentName = URL["component"]>
    </cfif>
    <cfif structKeyExists(URL, "method") and URL["method"] neq "">
      <cfset componentMethod = URL["method"]>
    </cfif>
    <cfset componentObject = createobject("component", "TaskManager.components.#componentName#")>

    <cfif not StructKeyExists(Session, "user")>
      <cfif not componentObject.isPublic(componentMethod)>
        <cfset componentName = "user">
        <cfset componentObject = createObject("component","TaskManager.components.#componentName#")>
        <cfset componentMethod = "signIn">
      </cfif>
    </cfif>

    <cfif structKeyExists(URL, "id") and URL["id"] neq "">
      <cfset Request.methodArguments = URL["id"]>
    </cfif>

    <cfset invoke(componentObject, componentMethod)>

    <cfreturn>
  </cffunction>

</cfcomponent>
