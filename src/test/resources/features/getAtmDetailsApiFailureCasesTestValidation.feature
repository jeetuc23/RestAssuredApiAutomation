
Feature: Validate get Atm details feature
	User wants to get information of the atm like address, supported currency etc.

Scenario: Validate success response with no data found from the api
		Given "identification" number is "LFFFBC1"
		When user makes a GET call to the api
		Then user get 200 status code

	Scenario: User is able to get request validation error when incorrect query param is passed
		Given "identificatio" number is "LFFFBC11"
		When user makes a GET call to the api
		Then user get 400 status code



	@Exclude
	Scenario: User is able to get service unavailable error when api is down
		Given "identification" number is "LFFFBC11"
		When user makes a GET call to the api
		Then user get 503 status code


  #	Below scenario can not be executed as this requires mock to get the error from downstream. Wiremock can be created.
	@Exclude
	Scenario: User is able to get service unavailable error when underlying api is down
		Given "identification" number is "LFFFBC11"
		When user makes a GET call to the api
		Then user get 503 status code
	@Exclude
	Scenario: User is able to get internal server error when underlying api is given error
		Given "identification" number is "LFFFBC11"
		When user makes a GET call to the api
		Then user get 503 status code

	