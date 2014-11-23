#-------------------------------------------#
# Dependancy Configuration
    ############################
    require 'rubygems'
    require 'rest-client' 
    require 'json'
    require 'base64'
    gem 'minitest'
    require 'minitest/autorun'
    ############################
    # Req Test Execution Settings
    require '../Utilities/InitSettings.rb'
    require '../Utilities/Metadata.rb'
    require '../Stub/Stub_Implementation.rb' # comment Stub script to run it with real end point
    
#-------------------------------------------#

class TestTeamAPI < Minitest::Unit::TestCase
    
    include TestInitialSettings #API_Settings.rb
    include TeamAPISettings #API_Settings.rb

  def test_TeamAPI
    begin
          
      TeamCreate() #create Team and validate the response
                        
      TeamEdit() #update Team and validate the response
            
      TeamGet() #Get Team and validate the response

      TeamDelete() #update Team and validate the response

      TeamCreateWInvalidJSON() #create Team with Invalid Json and validate the response

      TeamCreateWInvalidField() #create Team with Invalid Field and validate the response

                        
    rescue Exception => e
        case e.message
        when Regexp.new(/(\bErrMsg\b)/)
                puts e.message
                puts ''
                puts '******* Assert Failure Backtrace *******'
                puts e.backtrace
                puts '****************************************'
                puts ''
        else
                puts e.message
                puts ''
                puts '******* Non-Assert Failure Backtrace *******'
                puts e.backtrace
                puts '********************************************'
                puts ''
        end
    end
  end
  
  
  def TeamCreate()
      Team.APIrequest("CREATE")
      assert_equal(201,$ReqResponse.code,"[ErrMsg] #{$ReqResponse}")
      assert_equal($TeamName, $name,"[ErrMsg] TeamName doesn't match")
      assert_equal($perm, $permission,"[ErrMsg] Permission doesn't match")
      assert_equal(0, $memCount,"[ErrMsg] Member Count doesn't match")
      assert_equal($Org, $Orglogin,"[ErrMsg] Organization doesn't match")
  end
  
  def TeamEdit()
      Team.APIrequest("EDIT")
      assert_equal(200,$ReqResponse.code,"[ErrMsg] #{$ReqResponse}")
      assert_equal($updTeamName, $name,"[ErrMsg] TeamName doesn't match")
      assert_equal($updperm, $permission,"[ErrMsg] Permission doesn't match")
      assert_equal(0, $memCount,"[ErrMsg] Member Count doesn't match")
      assert_equal($Org, $Orglogin,"[ErrMsg] Organization doesn't match")
  end
  
  def TeamDelete()
      Team.APIrequest("DELETE")
      assert_equal(204,$ReqResponse.code,"[ErrMsg] #{$ReqResponse}")
  end

  def TeamGet()
      Team.APIrequest("GET")
      assert_equal(200,$ReqResponse.code,"[ErrMsg] #{$ReqResponse}")
      assert_equal($updTeamName, $name,"[ErrMsg] TeamName doesn't match")
      assert_equal($updperm, $permission,"[ErrMsg] Permission doesn't match")
      assert_equal(0, $memCount,"[ErrMsg] Member Count doesn't match")
      assert_equal($Org, $Orglogin,"[ErrMsg] Organization doesn't match")
  end

  def TeamCreateWInvalidJSON()
      Team.APIrequest("CREATEwInvalidJSON")
      assert_equal(400,$ReqResponse.code,"[ErrMsg] #{$ReqResponse}")
  end

  def TeamCreateWInvalidField()
      Team.APIrequest("CREATEwInvalidField")
      assert_equal(422,$ReqResponse.code,"[ErrMsg] #{$ReqResponse}")
  end
	
end




  
