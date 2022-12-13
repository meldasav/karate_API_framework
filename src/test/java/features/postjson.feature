Feature: Create user using post api

  Background:
    * def requestPayload = read('classpath:payload/user.json')
    * def random_string =
    """
    function(s){
     var text = "";
     var pattern ="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
     for(var i=0;i<s;i++)
         text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
         return text;
    }
    """
    * def randomString = random_string(10)
    * print randomString
    * def requestPayload =
    """
     {
    "name":"tommmm",
    "gender":"male",
    "status":"active"
     }

    """
    * requestPayload.email = randomString + "@gmail.com"
    * print  requestPayload


  Scenario: Create a user with the given data
    Given url baseUrl + '/public/v1/users'
    And request requestPayload
    When header Authorization = 'Bearer '+ tokenId
    When method POST
    Then status 201
    And match $.data.id == '#present'
    And match $.data.name == '#present'
    And match $.data.email == '#present'
