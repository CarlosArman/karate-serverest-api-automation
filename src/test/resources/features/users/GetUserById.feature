@users @get-user-by-id
Feature: Get user by id

  Background:
    * url baseUrl
    * def userSchema = read('classpath:schemas/users-schema.json')
    * def responseUserNotFound = read('classpath:responses/user-not-found-response.json')
    * def responseInvalidId = read('classpath:responses/invalid-user-id-response.json')

  @TC_GUI_001 @positive @get_existing_user_by_id
  Scenario: TC_GUI_001 - Get user by an existing valid _id
    Given path 'usuarios'
    When method get
    Then status 200
    And match response.quantidade == '#? _ > 0'
    * def existingUser = response.usuarios[0]
    * def existingId = existingUser._id

    Given path 'usuarios', existingId
    When method get
    Then status 200
    And match header Content-Type contains 'application/json'
    And match response     == userSchema
    And match response._id == existingId

  @TC_GUI_002 @positive @validate_user_data_matches_requested_id
  Scenario: TC_GUI_002  Validate returned user matches requested _id
    Given path 'usuarios'
    When method get
    Then status 200
    And match response.quantidade == '#? _ > 0'
    * def listedUser = response.usuarios[0]
    * def listedId = listedUser._id

    Given path 'usuarios', listedId
    When method get
    Then status 200
    And match header Content-Type contains 'application/json'
    And match response               == userSchema
    And match response._id           == listedUser._id
    And match response.nome          == listedUser.nome
    And match response.email         == listedUser.email
    And match response.password      == listedUser.password
    And match response.administrador == listedUser.administrador

  @TC_GUI_003 @negative @get_non_existing_valid_id
  Scenario: TC_GUI_003 - Get user by a non-existing valid _id
    * def nonExistingValidId = 'ABC123DEF456GHI7'

    Given path 'usuarios', nonExistingValidId
    When method get
    Then status 400
    And match header Content-Type contains 'application/json'
    And match response == responseUserNotFound


  @negative @invalid_id_format
  Scenario Outline: <caseId> - Get user with invalid _id format
    * print 'Executing case:', '<caseId>'
    Given path 'usuarios', '<invalidId>'
    When method get
    Then status 400
    And match header Content-Type contains 'application/json'
    And match response == responseInvalidId

    Examples:
      | caseId     | invalidId         |
      | TC_GUI_004 | ABC123DEF456GHI   |
      | TC_GUI_005 | ABC123DEF456GHI78 |
      | TC_GUI_006 | ABC123DEF45$%HI7  |
