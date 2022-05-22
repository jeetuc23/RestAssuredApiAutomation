
Feature: Get Atm details

  Scenario: User is able to get success response code from the api
    Given "identification" number is "LFFDCC11"
    When user makes a GET call to the api
    Then user get 200 status code

  Scenario: User is able to get success response code from the api
    Given "identification" number is "LFFFBC11"
    When user makes a GET call to the api
    Then user get 200 status code
    And the response is validated

  Scenario: Verify the identification details from the api response
    Given "identification" number is "LFFBHC11"
    When user makes a GET call to the api
    Then user get 200 status code
    And "Identification" is verified as "LFFBHC11"

  Scenario: Verify the supported currency details from the api response
    Given "identification" number is "LFFBHC11"
    When user makes a GET call to the api
    Then user get 200 status code
    And "SupportedCurrencies" is verified as "GBP"

  Scenario: Verify the AddressLine details from the api response
    Given "identification" number is "LFFBHC11"
    When user makes a GET call to the api
    Then user get 200 status code
    And "AddressLine" is verified as "11-12 DUDLEY COURT MANOR WALKS SHOPPING CENTRE;"

#This scenario is failing as the api is null for streetName - in the api StreetName property should be this but actually it is with small "N" Streetname
  Scenario: Verify the Streetname from the api response
    Given "identification" number is "LFFBHC11"
    When user makes a GET call to the api
    Then user get 200 status code
    And "Streetname" is verified as "11-12 DUDLEY COURT MANOR WALKS SHOPPING CENTRE"

  Scenario: Verify the TownName from the api response
    Given "identification" number is "LFFBHC11"
    When user makes a GET call to the api
    Then user get 200 status code
    And "TownName" is verified as "CRAMLINGTON"

  Scenario: Verify the CountrySubDivision from the api response
    Given "identification" number is "LFFBFC11"
    When user makes a GET call to the api
    Then user get 200 status code
    And "CountrySubDivision" is verified as "TYNE AND WEAR"

  Scenario: Verify the Country from the api response
    Given "identification" number is "LFFBFC11"
    When user makes a GET call to the api
    Then user get 200 status code
    And "Country" is verified as "GB"

  Scenario: Verify the PostCode from the api response
    Given "identification" number is "LFFBFC11"
    When user makes a GET call to the api
    Then user get 200 status code
    And "PostCode" is verified as "NE3 1JZ"
