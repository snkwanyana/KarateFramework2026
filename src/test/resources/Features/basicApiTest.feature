Feature: Basic API Test with Karate

  Scenario: Validate GET request response
    Given url 'https://jsonplaceholder.typicode.com/posts/1'
    When method GET
    Then status 200
    And match response contains { "id": 1 ,"title": "#string", "body": "#string" }
    And match response.userId == 1

  Scenario: Validate POST request
  Given url 'https://jsonplaceholder.typicode.com/posts'
    And request { title: 'Karate API', body: 'Testing POST request', userId: 1 }
    When method POST
    Then status 201
    And match response contains { "id": "#number", "title": "Karate API", "body": "Testing POST request", "userId": 1 }

  Scenario: Validate PUT request
    Given url 'https://jsonplaceholder.typicode.com/posts/1'
    And request { id: 1, title: 'Updated Title', body: 'Updated Body', userId: 1 }
    When method PUT
    Then status 200
    And match response.title == 'Updated Title'

  Scenario: Validate DELETE request
    Given url 'https://jsonplaceholder.typicode.com/posts/1'
    When method DELETE
    Then status 200

#    Handling Authentication in Karate

  Scenario: Basic Authentication
    Given url 'https://httpbin.org/basic-auth/user/passwd'
    And header Authorization = 'Basic dXNlcjpwYXNzd2Q='
    When method GET
    Then status 200

  Scenario: Bearer Token Authentication
    Given url 'https://httpbin.org/bearer'
    And header Authorization = 'Bearer abcdef123456'
    When method GET
    Then status 200

#    Parameterization Using Karate

  Scenario Outline: Validate GET request with different parameters with Examples data
    Given url 'https://jsonplaceholder.typicode.com/posts/<postId>'
    When method GET
    Then status 200
    And match response.id == <postId>

    Examples:
      | postId |
      | 1      |
      | 2      |
      | 3      |

  Scenario Outline: Validate GET request with dynamic data from JSON  file
    Given url 'https://jsonplaceholder.typicode.com/posts/<id>'
    When method GET
    Then status 200
    And match response.title == '<title>'

    Examples:
      | read('data.json') |