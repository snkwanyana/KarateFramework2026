Feature: NDOSI API Test with Karate

  Background:
    * url 'https://www.ndosiautomation.co.za/APIDEV'

  Scenario Outline: Validate POST request to create a new user

    * def Faker = Java.type('com.github.javafaker.Faker')
    * def faker = new Faker()
    * def email = faker.internet().emailAddress()
    Given path '/register'
    And request
      """
    { "firstName": "<firstName>",
    "lastName": "<lastName>",
    "email": "#(email)",
    "password": "<password>",
    "confirmPassword": "<password>",
    "groupId": <groupId>
    }
    """
    When method POST
    Then status 201
    And match response contains { "message": "Registration submitted successfully. Your account is pending admin approval." }
  Examples:
    | firstName | lastName | password | groupId |
    | John      | Doe      | @Password123 | 5328c91e-fc40-11f0-8e00-5000e6331276 |
