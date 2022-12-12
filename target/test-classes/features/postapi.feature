Feature: Create user using post api

  Background:
    * def requestPayload =
    """
     {
    "name":"tommmm",
    "email":"tom@gmail.commmm",
    "gender":"male",
    "status":"active"
     }
    """

    Scenario: Create a user with the given data
      Given url baseUrl + '/public/v1/users'
      And request requestPayload
      When header Authorization = 'Bearer '+ tokenId
      When method POST
      Then status 201
      And match $.data.id == '#present'
      And match $.data.name == '#present'
      And match $.data.email == '#present'
