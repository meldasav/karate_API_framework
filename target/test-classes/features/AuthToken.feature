Feature:Use Token in scenario

  Scenario: Get user Details
    Given header Authorization = 'Bearer ' + tokenId
    Given url baseUrl + '/public/v1/users'
    And path '30'
    When method GET
    Then status 200