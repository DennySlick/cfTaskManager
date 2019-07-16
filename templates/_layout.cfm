<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/styles.css" >
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">

    <link href="css/animate.min.css" rel="stylesheet">

    <title>
      TaskManager
      <cfif structKeyExists(VARIABLES, "headerName")>
        <cfoutput>
          : #headerName#
        </cfoutput>
      </cfif>
    </title>

  <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
  </head>

<cfoutput>
  <body class="#Session.Theme#">
</cfoutput>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a href="?component=home&method=index" class="navbar-brand">TaskManager</a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <cfoutput>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="?component=home&method=index">
                      <i class="fas fa-building"></i>
                       #Request.Locale.home#
                      <span class="sr-only">(current)</span></a>
                </li>

                <cfif StructKeyExists(Session, "user")>

                  <li class="nav-item">
                      <a class="nav-link" href="?component=user&method=settings">
                        <i class="fas fa-cogs"></i>
                        #Request.Locale.settings#
                      </a>
                  </li>

                  <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <i class="fas fa-tasks"></i>
                          #Request.Locale.task#
                      </a>
                      <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                          <a class="dropdown-item" href="?component=home&method=index">
                            <i class="far fa-calendar-alt"></i>
                            #Request.Locale.active#
                          </a>
                          <a class="dropdown-item" href="?component=task&method=showSomeTasks&id=closed">
                            <i class="fas fa-calendar-alt"></i>
                            #Request.Locale.closed#
                          </a>
                          <div class="dropdown-divider"></div>
                          <a class="dropdown-item" href="?component=task&method=create">
                            <i class="far fa-calendar-plus"></i>
                            #Request.Locale.new#
                          </a>
                      </div>
                  </li>

                </cfif>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <cfif StructKeyExists(Session, "fullname")>
                        <i class="fas fa-user"></i>
                        #Session.fullname#
                      <cfelse>
                        <i class="fas fa-user-secret"></i>
                        #Request.Locale.user#
                      </cfif>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                      <cfif StructKeyExists(Session, "fullname")>

                        <a class="dropdown-item" href="?component=user&method=profile">
                          <i class="fas fa-user-tie"></i>
                          #Request.Locale.profile#
                        </a>
                        <a class="dropdown-item" href="?component=user&method=signOut">
                          <!--- <i class="fas fa-door-open"></i>--->
                          <i class="fas fa-sign-out-alt"></i>
                          #Request.Locale.signout#
                        </a>
                      <cfelse>

                        <a class="dropdown-item" href="?component=user&method=signIn">
                          <i class="fas fa-sign-in-alt"></i>
                          #Request.Locale.signin#
                        </a>
                        <a class="dropdown-item" href="?component=user&method=signUp">
                          <i class="fas fa-edit"></i>
                          #Request.Locale.signup#
                        </a>
                      </cfif>

                      <cfif not StructKeyExists(Session, "fullname")>
                        <li class="nav-item">
                            <a class="nav-link" href="?component=user&method=switchLanguage">
                              <i class="fas fa-globe"></i>
                              #Session.Lang#
                            </a>
                        </li>
                      </cfif>


                    </div>
                </li>
                <!---
                <li class="nav-item">
                    <a class="nav-link active disabled" href="">Disabled</a>
                    <div class="dropdown-divider"></div>
                </li>
                --->
            </ul>
        </div>
        </cfoutput>
    </nav>


    <cfif structKeyExists(VARIABLES, "headerName")>
      <div id="header" class="container p-2 my-3 ">
        <div class="row">
          <div class="col">
            <h1 class="h1 text-left py-2 animated fadeIn">
              <cfoutput>
                #headerName#
              </cfoutput>
            </h1>
          </div>
        </div>
      </div>
    </cfif>

    <cfoutput> #content# </cfoutput>

    <cfif structKeyExists(VARIABLES, "errArr")>
      <cfif ArrayLen(errArr) gt 0>
        <div id="error-log" class="container my-3 alert alert-danger">
          <div class="row">
            <div class="col">
              <cfoutput>
                <p> #Request.Locale.errOccur# (#ArrayLen(errArr)#):  </p>
              </cfoutput>
              <cfloop array="#errArr#" item="val">
                <cfoutput>
                  <p> #val# </p>
                </cfoutput>
              </cfloop>
            </div>
          </div>
        </div>
      </cfif>
    </cfif>

  <script src="js/app.js?"></script>

  </body>

</html>
