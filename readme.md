Assuming Ruby is installed on the machine on which the test script will be run

Gems needed to run the script

1. rest-client
2. base64
3. webmock
4. json

Picked /teams endpoint for this exercise as Team functionality with create/edit/delete/get is ideal to automate all these scenarios.

Test Run is based on Settings in InitSettings.rb 

Test script is run from Drivers

Execution of script from command line

ruby TeamTest.rb

Test script is run against the stub with out any changes

Following changes are needed, if the test script needs to be run against real end point.

1. Change the credentials in InitSettings.rb under TestInitialSettings
2. Comment out "require '../Stub/Stub_Implementation.rb'" in TeamTest.rb script
