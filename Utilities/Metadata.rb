
module Team
    
  def Team.APIrequest(requestType)
      begin
        user = $userlogin
        #pass = Base64.decode64($userpass) #To make sure the test script works with Stub implementation and actual end point,
                                           #commenting out base64 decoding as we the password used in settings is not base64 encoded.
        pass = $userpass
        case requestType
        when "CREATE"
                  payload = {
                      "name" => $TeamName,
                      "permission" => $perm,
                      "repo_names" => [ $repo ]
                    }.to_json
                uri = "#{$apiUri}/orgs/#{$Org}/teams"
                method = "post"
                $ReqResponse = RestClient::Request.new(:method => method, :url => uri, :user => user, :password => pass, :payload => payload, :headers => {:accept => :json, :content_type => :json}).execute 
                attribProcess($ReqResponse)
        when "EDIT"
                payload = {
                    "name" => $updTeamName,
                    "permission" => $updperm
                    }.to_json
                uri = "#{$apiUri}/teams/#{$teamID}"
                method = "patch"
                $ReqResponse = RestClient::Request.new(:method => method, :url => uri, :user => user, :password => pass, :payload => payload, :headers => {:accept => :json, :content_type => :json}).execute 
                attribProcess($ReqResponse)
        when "DELETE"
                uri = "#{$apiUri}/teams/#{$teamID}"
                method = "delete"
                $ReqResponse = RestClient::Request.new(:method => method, :url => uri, :user => user, :password => pass, :headers => {:content_type => :json}).execute 
        when "CREATEwInvalidField"
                  payload = {
                      "name" => $TeamName,
                      "permission" => "dsaf",
                      "repo_names" =>  $repo,
                    }.to_json
                uri = "#{$apiUri}/orgs/#{$Org}/teams"
                method = "post"
                $ReqResponse = RestClient::Request.new(:method => method, :url => uri, :user => user, :password => pass, :payload => payload, :headers => {:accept => :json, :content_type => :json}).execute 
        when "CREATEwInvalidJSON"
                  payload = {
                      "name" => $TeamName,
                      "permission" => "dsaf",
                      "repo_names" => [ $repo ]
                    }
                uri = "#{$apiUri}/orgs/#{$Org}/teams"
                method = "post"
                $ReqResponse = RestClient::Request.new(:method => method, :url => uri, :user => user, :password => pass, :payload => payload, :headers => {:accept => :json, :content_type => :json}).execute 
        else
                  uri = "https://api.github.com/teams/#{$teamID}"
                  method = "get"
                  $ReqResponse = RestClient::Request.new(:method => method, :url => uri, :user => user, :password => pass, :headers => {:accept => :json, :content_type => :json}).execute  
                  attribProcess($ReqResponse)

        end
      rescue Exception => e
           case e.message
            when Regexp.new(/(\bNoMethodError\b)/)
               puts "* Teardown Error *"
               puts e.message
               raise
            else
                  $ReqResponse = e.response
                  attribProcess($ReqResponse)
            end
      end
  end

  
  def Team.attribProcess(response)
    begin
      parsedResp = JSON.parse(response)
      $teamID = parsedResp["id"]
      $name = parsedResp["name"]
      $permission = parsedResp["permission"]
      $memCount = parsedResp["members_count"]
      organizationInfo = parsedResp["organization"]
      if organizationInfo != nil
        $Orglogin = organizationInfo["login"]
      end
      $errorMessage = parsedResp["message"]
    end
  end
  
end

