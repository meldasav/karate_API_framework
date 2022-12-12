Feature: GET API headers feature

  Scenario: pass the user request with headers
  * configure headers = {Connection : 'keep-alive' , Accept-Encoding : 'gzip, deflate, br'}
    Given url baseUrl + '/public/v1/users?status=active'
    When method GET
    Then status 200
    * print response

