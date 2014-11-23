require 'webmock'
require 'rest-client'
require 'rubygems'
require 'rest-client' 
require 'json'
require 'base64'

include WebMock::API

WebMock.disable_net_connect!(allow_localhost: true)

# Create
 stub_request(:post, "https://#{$userlogin}:#{$userpass}@api.github.com/orgs/CognitiveTest/teams").with(:body => {"name" => "TeamCogScale", "permission" => "admin", "repo_names" => [ "junutula/Cognitive" ]}, :headers => {:content_type => 'application/json'}).
 to_return(:body => '{"name":"TeamCogScale","id":123456,"slug":"TeamCogScale","permission":"admin","url":"https://api.github.com/teams/123456","members_url":"https://api.github.com/teams/123456/members{/member}","repositories_url":"https://api.github.com/teams/1145494/repos","members_count":0,"repos_count":0,"organization":{"login":"CognitiveTest","id":9903961,"url":"https://api.github.com/orgs/CognitiveTest","repos_url":"https://api.github.com/orgs/CognitiveTest/repos","events_url":"https://api.github.com/orgs/CognitiveTest/events","members_url":"https://api.github.com/orgs/CognitiveTest/members{/member}","public_members_url":"https://api.github.com/orgs/CognitiveTest/public_members{/member}","avatar_url":"https://avatars.githubusercontent.com/u/9903961?v=3","public_repos":0,"public_gists":0,"followers":0,"following":0,"html_url":"https://github.com/CognitiveTest","created_at":"2014-11-22T19:39:37Z","updated_at":"2014-11-22T19:39:37Z","type":"Organization"}}',:status => 201, :headers => { :content_type => 'application/json', 'Content-Length' => 3 })

# Edit
stub_request(:patch, "https://#{$userlogin}:#{$userpass}@api.github.com/teams/123456").
 to_return(:body => '{"name":"UpdTeamCogScale","id":123456,"slug":"UpdTeamCogScale","permission":"push","url":"https://api.github.com/teams/123456","members_url":"https://api.github.com/teams/123456/members{/member}","repositories_url":"https://api.github.com/teams/1145494/repos","members_count":0,"repos_count":0,"organization":{"login":"CognitiveTest","id":9903961,"url":"https://api.github.com/orgs/CognitiveTest","repos_url":"https://api.github.com/orgs/CognitiveTest/repos","events_url":"https://api.github.com/orgs/CognitiveTest/events","members_url":"https://api.github.com/orgs/CognitiveTest/members{/member}","public_members_url":"https://api.github.com/orgs/CognitiveTest/public_members{/member}","avatar_url":"https://avatars.githubusercontent.com/u/9903961?v=3","public_repos":0,"public_gists":0,"followers":0,"following":0,"html_url":"https://github.com/CognitiveTest","created_at":"2014-11-22T19:39:37Z","updated_at":"2014-11-22T19:39:37Z","type":"Organization"}}',:status => 200, :headers => { :content_type => 'application/json','Content-Length' => 3 })

# Get
 stub_request(:get, "https://#{$userlogin}:#{$userpass}@api.github.com/teams/123456").
 to_return(:body => '{"name":"UpdTeamCogScale","id":123456,"slug":"UpdTeamCogScale","permission":"push","url":"https://api.github.com/teams/123456","members_url":"https://api.github.com/teams/123456/members{/member}","repositories_url":"https://api.github.com/teams/1145494/repos","members_count":0,"repos_count":0,"organization":{"login":"CognitiveTest","id":9903961,"url":"https://api.github.com/orgs/CognitiveTest","repos_url":"https://api.github.com/orgs/CognitiveTest/repos","events_url":"https://api.github.com/orgs/CognitiveTest/events","members_url":"https://api.github.com/orgs/CognitiveTest/members{/member}","public_members_url":"https://api.github.com/orgs/CognitiveTest/public_members{/member}","avatar_url":"https://avatars.githubusercontent.com/u/9903961?v=3","public_repos":0,"public_gists":0,"followers":0,"following":0,"html_url":"https://github.com/CognitiveTest","created_at":"2014-11-22T19:39:37Z","updated_at":"2014-11-22T19:39:37Z","type":"Organization"}}',:status => 200, :headers => { :content_type => 'application/json', 'Content-Length' => 3 })

#Delete
stub_request(:delete, "https://#{$userlogin}:#{$userpass}@api.github.com/teams/123456").
 to_return(:status => 204)

# invalid fields
stub_request(:post, "https://#{$userlogin}:#{$userpass}@api.github.com/orgs/CognitiveTest/teams").with(:body => {"name" => "TeamCogScale", "permission" => "dsaf", "repo_names" =>  "junutula/Cognitive" }, :headers => {:content_type => 'application/json'}).
 to_return(:body => '{"message":"Validation Failed"}', :status => 422)

# Invalid JSON
stub_request(:post, "https://#{$userlogin}:#{$userpass}@api.github.com/orgs/CognitiveTest/teams").with(:body => {"name" => "TeamCogScale", "permission" => "dsaf", "repo_names" => [ "junutula/Cognitive" ]}).
 to_return(:body => '{"message":"Problems parsing JSON"}', :status => 400)



