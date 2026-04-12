@users @create-user
Feature: Create user

  Background:
    * url baseUrl
    * def userSchema              = read('classpath:schemas/users-schema.json')
    * def createUserSuccessSchema = read('classpath:schemas/create-user-success-schema.json')
    * def messageSchema           = read('classpath:schemas/message-schema.json')
    * def invalidJsonPayload      = read('classpath:data/invalid-user-json.txt')
    * def emptyBodyResponse       = read('classpath:responses/create-user-empty-body-response.json')
    * def invalidJsonResponse     = read('classpath:responses/create-user-invalid-json-response.json')
    * def user = fakeUser()
    * def payload = read('classpath:data/template-user.json')
    * print payload


  @positive @create_valid_user
  Scenario Outline: <caseId> - Create a <adminValue> user successfully
    * def  uniqueEmail           = makeEmail('<emailPrefix>')
    * set  payload.nome          = '<userName>'
    * set  payload.email         = uniqueEmail
    * set  payload.administrador = '<adminValue>'

    Given path 'usuarios'
    And   request payload
    When  method post
    Then  status 201
    And   match header Content-Type contains 'application/json'
    And   match response == createUserSuccessSchema
    *     def createdUserId = response._id

    Given path 'usuarios', createdUserId
    When method get
    Then status 200
    And  match header Content-Type contains 'application/json'
    And  match response == userSchema
    And  match response.nome == payload.nome
    And  match response.email == payload.email
    And  match response.password == payload.password
    And  match response.administrador == payload.administrador
    And  match response._id == createdUserId

    Examples:
      | caseId    | userName        | emailPrefix | adminValue |
      | TC_CU_001 | Carlos QA User  | user        | false      |
      | TC_CU_002 | Carlos QA Admin | admin       | true       |

  @TC_CU_003 @negative @create_user_with_duplicate_email
  Scenario: TC_CU_003 - Create a user with duplicate email
    Given path 'usuarios'
    And   request payload
    When  method post
    Then  status 201
    And   match header Content-Type contains 'application/json'
    And   match response == createUserSuccessSchema

    Given path 'usuarios'
    And  request payload
    When method post
    Then status 400
    And  match header Content-Type contains 'application/json'
    And  match response == messageSchema

  @TC_CU_004 @negative @create_user_with_empty_body
  Scenario: TC_CU_004 - Create a user with empty body
    Given path 'usuarios'
    And   request {}
    When  method post
    Then  status 400
    And   match header Content-Type contains 'application/json'
    And   match response == emptyBodyResponse

  @negative @missing_required_field
  Scenario Outline: <caseId> - Create user without required field <missingField>
    * eval delete payload['<missingField>']
    * def expectedResponse =
    """
    {
      "<missingField>": "<expectedMessage>"
    }
    """

    Given path 'usuarios'
    And   request payload
    When  method post
    Then  status 400
    And   match header Content-Type contains 'application/json'
    And   match response == expectedResponse

    Examples:
      | caseId    | missingField  | expectedMessage             |
      | TC_CU_005 | nome          | nome é obrigatório          |
      | TC_CU_006 | email         | email é obrigatório         |
      | TC_CU_007 | password      | password é obrigatório      |
      | TC_CU_008 | administrador | administrador é obrigatório |

  @TC_CU_009 @negative @create_user_with_invalid_json
  Scenario: TC_CU_009 - Create a user with invalid JSON format
    Given path 'usuarios'
    And   header Content-Type = 'application/json'
    And   request invalidJsonPayload
    When  method post
    Then  status 400
    And   match header Content-Type contains 'application/json'
    And   match response == invalidJsonResponse