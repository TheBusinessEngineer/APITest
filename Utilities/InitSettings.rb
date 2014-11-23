
#############################################
# BEGIN: User Configurable Test Settings
module TestInitialSettings
  $apiUri = "https://api.github.com"
  $userlogin = "junutula" #dummy
  #$userpass = 'ZUVuYWQjMTk4MQ==\n' #dummy Base64
  $userpass = "junutulaPass"  #dummy Can replace with real credentials and comment webmock gem in the driver script
end


module UserAPISettings
  $login = "junutula"
  $id = 9900265
  $type = "User"
end

module TeamAPISettings
  $Org = "CognitiveTest"
  $TeamName = "TeamCogScale"
  $perm = "admin"
  $repo = "junutula/Cognitive"
  $updTeamName = "UpdTeamCogScale"
  $updperm = "push"
  $teamID = 123456
end


# END: User Configurable Test Settings

####################################################


