Feature: Get API With Query Parameters

  Scenario: get all active users
    * def query = { status : 'active'}
    Given url baseUrl + '/public/v1/users'
    And params query
    When method GET
    Then status 200
