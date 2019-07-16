<cfcomponent name="User" extends="Base" accessors="true">

  <cfset saltHash = "mySalt">

  <cffunction name="signIn">
    <cfif structKeyExists(Session, "user")>
      <cfset invoke(this, Redirect("?component=user&method=infoMessage&id=2"))>
    <cfelse>
      <cfset Session.designPattern = "LongLine">
      <cfset headerName = "#Request.Locale.loginPage#">
      <cfset errArr = signInTry()>
      <cfset signInFormPrepareValues()>
      <cfset this.Content("SignInForm.cfm")>
    </cfif>
  </cffunction>

  <cffunction name="signUp">
    <cfif structKeyExists(Session, "user")>
      <cfset invoke(this, Redirect("?component=user&method=infoMessage&id=2"))>
    <cfelse>
      <cfset headerName = "#Request.Locale.registrationPage#">
      <cfset errArr = signUpTry()>
      <cfset signUpFormPrepareValues()>
      <cfset this.Content("signUpForm.cfm")>
    </cfif>
  </cffunction>

  <cffunction name="signOut">
    <cfset var lang = Session.Lang>
    <cfset structClear(session)>
    <cfset Session.designPattern = "LongLine">
    <cfset Session.Lang = lang>
    <cfset Session.Theme = "light-theme">
    <cfset signIn()>
  </cffunction>

  <cffunction name="infoMessage">
    <cfset args = Request.methodArguments.Split(";")>
    <cfset Scenario = args[1]>

    <cfif Scenario eq "1">
      <cfset headerName = "#Request.Locale.succesRegistration#">
    <cfelseif Scenario eq "2">
      <cfset headerName = "#Request.Locale.loggedIn#">
    <cfelseif Scenario eq "3">
      <cfset headerName = "#Request.Locale.profileUpdated#">
    </cfif>

    <cfset this.Content("InfoMessage.cfm")>
  </cffunction>

  <cffunction name="Profile">
    <cfquery name="getProfileInfo" datasource="tm">
      SELECT [login], [name], [surname]
      FROM [tm_user]
      WHERE [user_id] = #Session.user#
    </cfquery>
    <cfquery name="getUserTasksStatistic" datasource="tm">
      SELECT COUNT([task_id]) task_count
      FROM [tm_task]
      WHERE [owner] = #Session.user#
      GROUP BY [status]
      ORDER BY [status]
    </cfquery>
    <cfset headerName = "#Request.Locale.profilePage#">
    <cfset this.Content("profile.cfm")>
  </cffunction>

  <cffunction name="editProfile">
    <cfset headerName = "#Request.Locale.editProfile#">
    <cfset errArr = editProfileTry()>
    <cfset editProfileFormPrepareValues()>
    <cfset this.Content("updateProfileForm.cfm")>
  </cffunction>

  <cffunction name="editPassword">
    <cfset headerName = "#Request.Locale.editPassword#">
    <cfset errArr = editPasswordTry()>
    <cfset editPasswordFormPrepareValues()>
    <cfset this.Content("updatePasswordForm.cfm")>
  </cffunction>

  <cffunction name="settings">
    <cfset headerName = "#Request.Locale.settings#">
    <cfset this.Content("settingsPage.cfm")>
  </cffunction>

  <cffunction name="switchDesignPattern">
    <cfif Session.designPattern eq "LongLine">
      <cfset Session.designPattern = "Minimal">
    <cfelseif Session.designPattern eq "Minimal">
      <cfset Session.designPattern = "LongLine">
    </cfif>
    <cfset invoke(this, RedirectToMethod("user","settings"))>
  </cffunction>

  <cffunction name="switchLanguage">
    <cfif Session.Lang eq "en">
      <cfif StructKeyExists(Session, "user")>
        <cfquery name="setRuLangToUser" datasource="tm">
          UPDATE [tm_user]
          SET [lang] = 'ru'
          WHERE [user_id] = #Session.user#;
        </cfquery>
      </cfif>
      <cfset Session.Lang = "ru">

    <cfelseif Session.Lang eq "ru">
      <cfif StructKeyExists(Session, "user")>
        <cfquery name="setEnLangToUser" datasource="tm">
          UPDATE [tm_user]
          SET [lang] = 'en'
          WHERE [user_id] = #Session.user#;
        </cfquery>
      </cfif>
      <cfset Session.Lang = "en">
    </cfif>

    <!---
    <cfif StructKeyExists(URL, "id")>
      <cfset invoke(this, Redirect("id"))>--->
    <cfif StructKeyExists(Session, "user")>
      <cfset invoke(this, RedirectToMethod("user","settings"))>
    <cfelse>
      <cfset invoke(this, RedirectToMethod("user","signIn"))>
    </cfif>
  </cffunction>

  <cffunction name="switchTheme">
    <cfif Session.Theme eq "light-theme">
      <cfif StructKeyExists(Session, "user")>
        <cfquery name="setDarkThemeToUser" datasource="tm">
          UPDATE [tm_user]
          SET [theme] = 'dark-theme'
          WHERE [user_id] = #Session.user#;
        </cfquery>
      </cfif>
      <cfset Session.Theme = "dark-theme">

    <cfelseif Session.Theme eq "dark-theme">
      <cfif StructKeyExists(Session, "user")>
        <cfquery name="setLightThemeToUser" datasource="tm">
          UPDATE [tm_user]
          SET [theme] = 'light-theme'
          WHERE [user_id] = #Session.user#;
        </cfquery>
      </cfif>
      <cfset Session.Theme = "light-theme">
    </cfif>

    <cfif StructKeyExists(Session, "user")>
      <cfset invoke(this, RedirectToMethod("user","settings"))>
    <cfelse>
      <cfset invoke(this, RedirectToMethod("user","signIn"))>
    </cfif>
  </cffunction>

  <cffunction name="isPublic">
    <cfargument name="method" type="string" required="true">
    <cfreturn method eq "signIn" or method eq "signUp" or method eq "switchLanguage">
  </cffunction>

  <cffunction name="signInFormPrepareValues" access="private">
    <cfif (structKeyExists(Form, "login")
        and structKeyExists(Form, "password"))>
      <cfset Request.loginValue = HTMLEditFormat(Form.login)>
      <cfset Request.passwordValue = HTMLEditFormat(Form.password)>
    <cfelse>
      <cfset Request.loginValue = "">
      <cfset Request.passwordValue = "">
    </cfif>
  </cffunction>

  <cffunction name="signUpFormPrepareValues" access="private">
    <cfif (structKeyExists(Form, "login")
        and structKeyExists(Form, "password")
        and structKeyExists(Form, "repeatPassword"))>
      <cfset Request.loginValue = HTMLEditFormat(Form.login)>
      <cfset Request.passwordValue = HTMLEditFormat(Form.password)>
      <cfset Request.repeatPasswordValue = HTMLEditFormat(Form.repeatPassword)>
      <cfset Request.nameValue = HTMLEditFormat(Form.name)>
      <cfset Request.surnameValue = HTMLEditFormat(Form.surname)>
    <cfelse>
      <cfset Request.loginValue = "">
      <cfset Request.passwordValue = "">
      <cfset Request.repeatPasswordValue = "">
      <cfset Request.nameValue = "">
      <cfset Request.surnameValue = "">
    </cfif>
  </cffunction>

  <cffunction name="editProfileFormPrepareValues" access="private">
    <cfquery name="getProfile" datasource="tm">
      SELECT [login], [name], [surname], [password]
      FROM [tm_user]
      WHERE [user_id] = #Session.user#
    </cfquery>
    <cfloop query="getProfile">
      <cfset Request.loginValue = "#login#">
      <cfset Request.nameValue = "#name#">
      <cfset Request.surnameValue = "#surname#">
      <cfset Session.passwordHash = "#password#">
    </cfloop>
  </cffunction>

  <cffunction name="editPasswordFormPrepareValues" access="private">
    <cfquery name="getPassword" datasource="tm">
      SELECT [password]
      FROM [tm_user]
      WHERE [user_id] = #Session.user#
    </cfquery>
    <cfloop query="getPassword">
      <cfset Session.passwordHash = "#password#">
    </cfloop>
  </cffunction>

  <cffunction name="editPasswordTry" access="private">
    <cfset errArr = []>
    <cfif (structKeyExists(Form, "password") and structKeyExists(Form, "repeatPassword"))>
      <!--- Check Password Pattern --->
      <cfset ArrayAppend(errArr, checkPasswordPattern(), "true")>
      <!--- Check Old Password Validation --->
      <cfset ArrayAppend(errArr, checkOldPasswordValidation(), "true")>

      <!--- If no errors exist : update user to database --->
      <cfif ArrayLen(errArr) eq 0>
        <!--- Hash the password with salt to store in database --->
        <cfset passwordHash = Hash((saltHash & Trim(Form.password)), "SHA")>
        <cfquery name="updateUser" datasource="tm">
          UPDATE [tm_user]
          SET
            [password] = <cfqueryparam value="#passwordHash#" cfsqltype="cf_sql_nvarchar">
          WHERE [user_id] = #Session.user#
        </cfquery>
        <!--- <cfset invoke(this, RedirectToMethod("user","infoMessage","3"))> --->
        <cfset invoke(this, Redirect("?component=user&method=infoMessage&id=3"))>
      </cfif>

    </cfif>
    <!--- if errors occurred : show problems --->
    <cfreturn errArr>
  </cffunction>

  <cffunction name="editProfileTry" access="private">
    <!--- Make error list --->
    <cfset errArr = []>
    <!--- Check if Sign Up Form fullfilled --->
    <cfif (structKeyExists(Form, "login") and structKeyExists(Form, "oldPassword"))>

      <!--- Check Login Pattern --->
      <cfset ArrayAppend(errArr, checkLoginPattern(), "true")>
      <!--- Check Name, Surname Patterns --->
      <cfset ArrayAppend(errArr, checkNameSurnamePattern(), "true")>
      <!--- Check Old Password Validation --->
      <cfset ArrayAppend(errArr, checkOldPasswordValidation(), "true")>

      <!--- Check if User already exists --->
      <cfquery name="userExists" datasource="tm">
        SELECT COUNT(user_id) exist
        FROM [tm_user]
        WHERE [login] = <cfqueryparam value="#Form.login#" cfsqltype="cf_sql_varchar">
        AND [user_id] != #Session.user#
      </cfquery>
      <cfloop query="userExists">
        <cfif userExists.exist gt 0>
          <cfset errorMsg = "#Request.Locale.error_login_exists#">
          <cfset ArrayAppend(errArr,errorMsg)>
        </cfif>
      </cfloop>

      <!--- If no errors exist : update user to database --->
      <cfif ArrayLen(errArr) eq 0>
        <cfquery name="updateUser" datasource="tm">
          UPDATE [tm_user]
          SET
            [login] = <cfqueryparam value="#Form.login#" cfsqltype="cf_sql_nvarchar">,
            [name] = <cfqueryparam value="#Form.name#" cfsqltype="cf_sql_nvarchar">,
            [surname] = <cfqueryparam value="#Form.surname#" cfsqltype="cf_sql_nvarchar">
          WHERE [user_id] = #Session.user#
        </cfquery>

        <cfset Session.fullname = "#Form.name# #Form.surname#">

        <!--- <cfset invoke(this, RedirectToMethod("user","infoMessage","3"))> --->
        <cfset invoke(this, Redirect("?component=user&method=infoMessage&id=3"))>
      </cfif>
    </cfif>
    <!--- if errors occurred : show problems --->
    <cfreturn errArr>
  </cffunction>

  <cffunction name="signInTry" access="private">
    <!--- Make error list --->
    <cfset errArr = []>
    <!--- Check if Sign In Form fullfilled --->
    <cfif (structKeyExists(Form, "login") and structKeyExists(Form, "password"))>

      <cfset passwordHash = Hash((saltHash & Trim(Form.password)), "SHA")>
      <cfquery name="findUser" datasource="tm" result="findUserRes">
        SELECT [user_id], [name], [surname], [lang], [theme]
        FROM [tm_user]
        WHERE [login] = <cfqueryparam value="#Form.login#" cfsqltype="cf_sql_varchar">
        AND [password] = <cfqueryparam value="#passwordHash#" cfsqltype="cf_sql_varchar">
      </cfquery>

      <cfif findUser.recordCount eq 1>
        <cfloop query="findUser">
          <cfset Session.user = findUser.user_id>
          <cfset Session.fullname = findUser.name & " " & findUser.surname>
          <cfset Session.Lang = findUser.lang>
          <cfset Session.Theme = findUser.theme>
          <cfset invoke(this, Redirect(""))>
        </cfloop>
      <cfelse>
          <cfset errorMsg = "#Request.Locale.error_pair_loging_password#">
          <cfset ArrayAppend(errArr,errorMsg)>
      </cfif>

    </cfif>
    <!--- if errors occurred : show problems --->
    <cfreturn errArr>
  </cffunction>

  <cffunction name="checkLoginPattern" access="private">
    <cfset var localErrArr = []>
    <!---
    <cfif not isValid("regex", Form.login, "^[a-zA-Z0-9_]+$")>
      <cfset errorMsg = "#Request.Locale.error_only_latin_digits_underscore#">
      <cfset ArrayAppend(localErrArr,errorMsg)>
    </cfif>
    --->
    <cfif (Len(Form.login) lt 3 or Len(Form.login) gt 30)>
      <cfset errorMsg = "#Request.Locale.error_login_3_to_30_symbols#">
      <cfset ArrayAppend(localErrArr,errorMsg)>
    </cfif>
    <cfreturn localErrArr>
  </cffunction>

  <cffunction name="checkPasswordPattern" access="private">
    <cfset var localErrArr = []>
    <cfif (Len(Form.password) lt 3 or Len(Form.password) gt 30)>
      <cfset errorMsg = "#Request.Locale.error_password_3_to_30_symbols#">
      <cfset ArrayAppend(localErrArr,errorMsg)>
    </cfif>
    <cfif Form.password neq Form.repeatPassword>
      <cfset errorMsg = "#Request.Locale.error_repeat_password#">
      <cfset ArrayAppend(localErrArr,errorMsg)>
    </cfif>
    <cfreturn localErrArr>
  </cffunction>

  <cffunction name="checkNameSurnamePattern" access="private">
    <cfset var localErrArr = []>
      <cfif Len(Form.name) gt 32>
        <cfset errorMsg = "#Request.Locale.error_name_max_32_symbols#">
        <cfset ArrayAppend(localErrArr,errorMsg)>
      </cfif>
      <cfif Len(Form.surname) gt 32>
        <cfset errorMsg = "#Request.Locale.error_surname_max_32_symbols#">
        <cfset ArrayAppend(localErrArr,errorMsg)>
      </cfif>
    <cfreturn localErrArr>
  </cffunction>

  <cffunction name="checkOldPasswordValidation" access="private">
    <cfset var localErrArr = []>
      <cfset passwordHash = Hash((saltHash & Trim(Form.oldPassword)), "SHA")>
      <cfif passwordHash neq Session.passwordHash>
        <cfset errorMsg = "#Request.Locale.error_valid_old_pass#">
        <cfset ArrayAppend(localErrArr,errorMsg)>
      </cfif>
      <cfset structDelete(Session, "passwordHash")>
    <cfreturn localErrArr>
  </cffunction>



  <cffunction name="signUpTry" access="private">
    <!--- Make error list --->
    <cfset errArr = []>
    <!--- Check if Sign Up Form fullfilled --->
    <cfif (structKeyExists(Form, "login") and structKeyExists(Form, "password"))>
      <!--- Check Login Pattern --->
      <cfset ArrayAppend(errArr, checkLoginPattern(), "true")>
      <!--- Check Password Pattern --->
      <cfset ArrayAppend(errArr, checkPasswordPattern(), "true")>
      <!--- Check Name, Surname Patterns --->
      <cfset ArrayAppend(errArr, checkNameSurnamePattern(), "true")>

      <!--- Check if User already exists --->
      <cfquery name="userExists" datasource="tm">
        SELECT COUNT(user_id) exist
        FROM [tm_user]
        WHERE [login] = <cfqueryparam value="#Form.login#" cfsqltype="cf_sql_varchar">
      </cfquery>
      <cfloop query="userExists">
        <cfif userExists.exist gt 0>
          <cfset errorMsg = "#Request.Locale.error_login_exists#">
          <cfset ArrayAppend(errArr,errorMsg)>
        </cfif>
      </cfloop>

      <!--- If no errors exist : add new user to database --->
      <cfif ArrayLen(errArr) eq 0>
        <!--- Hash the password with salt to store in database --->
        <cfset passwordHash = Hash((saltHash & Trim(Form.password)), "SHA")>
        <cfquery name="insertUser" datasource="tm">
          INSERT INTO [tm_user]
            ([login],[password],[name],[surname],[lang])
          VALUES
            (<cfqueryparam value="#Form.login#" cfsqltype="cf_sql_nvarchar">,
            <cfqueryparam value="#passwordHash#" cfsqltype="cf_sql_nvarchar">,
            <cfqueryparam value="#Form.name#" cfsqltype="cf_sql_nvarchar">,
            <cfqueryparam value="#Form.surname#" cfsqltype="cf_sql_nvarchar">,
            '#Session.Lang#')
        </cfquery>
        <cfquery name="getUserID" datasource="tm">
          SELECT [user_id]
          FROM [tm_user]
          WHERE [login] = <cfqueryparam value="#Form.login#" cfsqltype="cf_sql_nvarchar">
        </cfquery>

        <cfset Session.fullname = "#Form.name# #Form.surname#">
        <cfset Session.user = "#getUserID.user_id#">

        <!--- <cfset invoke(this, RedirectToMethod("user","infoMessage","1"))> --->
        <cfset invoke(this, Redirect("?component=user&method=infoMessage&id=1"))>
      </cfif>
    </cfif>
    <!--- if errors occurred : show problems --->
    <cfreturn errArr>

  </cffunction>





</cfcomponent>
