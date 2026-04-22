@auth @login
Feature: Auth - Login

  Background:
    * url baseUrl
    * def payload =
      """
      {
        "email": "#(fakeEmail())",
        "password": "#(fakePassword())"
      }
      """

  @TC_AUTH_001 @positive @smoke
  Scenario:Login successfully with valid credential
    * set payload.email = 'fulano@qa.com'
    * set payload.password = 'teste'
    Given path 'login'
    And request payload
    When method post
    Then status 200
    And match response.message == 'Login realizado com sucesso'
    And match response.authorization == '#string'

  @TC_AUTH_002 @negative
  Scenario: Login fails with valid email and invalid password
    * set payload.email = 'fulano@qa.com'
    Given path 'login'
    And request payload
    When method post
    Then status 401
    And match response.message == 'Email e/ou senha inválidos'

  @TC_AUTH_003 @negative
  Scenario: Login fails with invalid email and valid password
    * set payload.password = 'teste'
    Given path 'login'
    And request payload
    When method post
    Then status 401
    And match response.message == 'Email e/ou senha inválidos'

  @TC_AUTH_004 @negative
  Scenario: Login fails with invalid email and invalid password
    Given path 'login'
    And request payload
    When method post
    Then status 401
    And match response.message == 'Email e/ou senha inválidos'

