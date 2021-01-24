require 'webmock'
require 'rest-client'
require 'rubygems'
require 'json'
require 'base64'

include WebMock::API

WebMock.disable_net_connect!(allow_localhost: true)

# Create
 stub_request(:post, "https://#{$userlogin}:#{$userpass}@api.github.com/orgs/TestSC/teams").with(:body => {"name" => "TeamSC", "permission" => "admin", "repo_names" => [ "junutula/SC" ]}, :headers => {:content_type => 'application/json'}).
 to_return(:body => '{"name":"TeamSC","id":123456,"slug":"TeamSC","permission":"admin","url":"https://api.github.com/teams/123456","members_url":"https://api.github.com/teams/123456/members{/member}","repositories_url":"https://api.github.com/teams/1145494/repos","members_count":0,"repos_count":0,"organization":{"login":"TestSC","id":9903961,"url":"https://api.github.com/orgs/TestSC","repos_url":"https://api.github.com/orgs/TestSC/repos","events_url":"https://api.github.com/orgs/TestSC/events","members_url":"https://api.github.com/orgs/TestSC/members{/member}","public_members_url":"https://api.github.com/orgs/TestSC/public_members{/member}","avatar_url":"https://avatars.githubusercontent.com/u/9903961?v=3","public_repos":0,"public_gists":0,"followers":0,"following":0,"html_url":"https://github.com/TestSC","created_at":"2014-11-22T19:39:37Z","updated_at":"2014-11-22T19:39:37Z","type":"Organization"}}',:status => 201, :headers => { :content_type => 'application/json', 'Content-Length' => 3 })

# Edit
stub_request(:patch, "https://#{$userlogin}:#{$userpass}@api.github.com/teams/123456").
 to_return(:body => '{"name":"UpdTeamSC","id":123456,"slug":"UpdTeamSC","permission":"push","url":"https://api.github.com/teams/123456","members_url":"https://api.github.com/teams/123456/members{/member}","repositories_url":"https://api.github.com/teams/1145494/repos","members_count":0,"repos_count":0,"organization":{"login":"TestSC","id":9903961,"url":"https://api.github.com/orgs/TestSC","repos_url":"https://api.github.com/orgs/TestSC/repos","events_url":"https://api.github.com/orgs/TestSC/events","members_url":"https://api.github.com/orgs/TestSC/members{/member}","public_members_url":"https://api.github.com/orgs/TestSC/public_members{/member}","avatar_url":"https://avatars.githubusercontent.com/u/9903961?v=3","public_repos":0,"public_gists":0,"followers":0,"following":0,"html_url":"https://github.com/TestSC","created_at":"2014-11-22T19:39:37Z","updated_at":"2014-11-22T19:39:37Z","type":"Organization"}}',:status => 200, :headers => { :content_type => 'application/json','Content-Length' => 3 })

# Get
 stub_request(:get, "https://#{$userlogin}:#{$userpass}@api.github.com/teams/123456").
 to_return(:body => '{"name":"UpdTeamSC","id":123456,"slug":"UpdTeamSC","permission":"push","url":"https://api.github.com/teams/123456","members_url":"https://api.github.com/teams/123456/members{/member}","repositories_url":"https://api.github.com/teams/1145494/repos","members_count":0,"repos_count":0,"organization":{"login":"TestSC","id":9903961,"url":"https://api.github.com/orgs/TestSC","repos_url":"https://api.github.com/orgs/TestSC/repos","events_url":"https://api.github.com/orgs/TestSC/events","members_url":"https://api.github.com/orgs/TestSC/members{/member}","public_members_url":"https://api.github.com/orgs/TestSC/public_members{/member}","avatar_url":"https://avatars.githubusercontent.com/u/9903961?v=3","public_repos":0,"public_gists":0,"followers":0,"following":0,"html_url":"https://github.com/TestSC","created_at":"2014-11-22T19:39:37Z","updated_at":"2014-11-22T19:39:37Z","type":"Organization"}}',:status => 200, :headers => { :content_type => 'application/json', 'Content-Length' => 3 })

#Delete
stub_request(:delete, "https://#{$userlogin}:#{$userpass}@api.github.com/teams/123456").
 to_return(:status => 204)

# invalid fields
stub_request(:post, "https://#{$userlogin}:#{$userpass}@api.github.com/orgs/TestSC/teams").with(:body => {"name" => "TeamSC", "permission" => "dsaf", "repo_names" =>  "junutula/SC" }, :headers => {:content_type => 'application/json'}).
 to_return(:body => '{"message":"Validation Failed"}', :status => 422)

# Invalid JSON
stub_request(:post, "https://#{$userlogin}:#{$userpass}@api.github.com/orgs/TestSC/teams").with(:body => {"name" => "TeamSC", "permission" => "dsaf", "repo_names" => [ "junutula/SC" ]}).
 to_return(:body => '{"message":"Problems parsing JSON"}', :status => 400)



