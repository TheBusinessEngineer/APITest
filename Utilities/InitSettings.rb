
#############################################
# BEGIN: User Configurable Test Settings
module TestInitialSettings
  $apiUri = "https://api.github.com"
  $userlogin = "junutula" 
  #$userpass = 'ZUVHRKYWQjMTk4MQ==\kkn'# Dummy base64 
                                          # To make sure the test script works with stub implementation and actual end point,
                                          # commented out base64 encoded password 
  $userpass = 'junutula'  #dummy Can replace with real credentials to run it with real end point
end


module UserAPISettings
  $login = "junutula"
  $id = 9900265
  $type = "User"
end

module TeamAPISettings
  $Org = "SCTest"
  $TeamName = "TeamSC"
  $perm = "admin"
  $repo = "junutula/SC"
  $updTeamName = "UpdTeamSC"
  $updperm = "push"
  $teamID = 123456
end


# END: User Configurable Test Settings

####################################################


