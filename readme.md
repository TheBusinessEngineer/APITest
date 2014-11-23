Assuming Ruby is installed on the machine on which the test script will be run
Gems needed to run the script
rest-client
base64
webmock
json

Test Run is based on Settings in InitSettings.rb 

Test script is run from Drivers
Execution of script from command line
ruby TeamTest.rb

Test script is run against the stub with out any changes
Following changes are needed, if the test script needs to be run against real end point.
1. Change the credentials in InitSettings.rb under TestInitialSettings
2. Comment out "require '../Stub/Stub_Implementation.rb'" in TeamTest.rb script
