@users @list-users
Feature: List users with and without filters

  Background:
    * url baseUrl
    * def userSchema = read('classpath:schemas/users-schema.json')
    * def responseSchema =
      """
      {
        "quantidade": "#number",
        "usuarios": "#[]"
      }
      """

  @TC_LU_001 @positive @list_all_users
  Scenario: TC_LU_001 - List all users without filters
    Given path 'usuarios'
    When method get
    Then status 200
    And match header Content-Type contains 'application/json'
    And match response               == responseSchema
    And match each response.usuarios == userSchema
    And match response.quantidade    == response.usuarios.length

  @TC_LU_002 @positive @filter_existing_id
  Scenario: TC_LU_002 - Filter users by an existing _id
    Given path 'usuarios'
    When method get
    Then status 200
    And match response.quantidade == '#? _ > 0'
    * def existingId = response.usuarios[0]._id

    Given path 'usuarios'
    And param _id = existingId
    When method get
    Then status 200
    And match header Content-Type contains 'application/json'
    And match response                 == responseSchema
    And match response.quantidade      == 1
    And match response.usuarios        == '#[1]'
    And match response.usuarios[0]._id == existingId
    And match response.usuarios[0]     == userSchema

  @TC_LU_003 @positive @filter_admin_true
  Scenario: TC_LU_003 - Filter users by administrador=true
    Given path 'usuarios'
    And param administrador = 'true'
    When method get
    Then status 200
    And match header Content-Type contains 'application/json'
    And match response == responseSchema
    And match each response.usuarios == userSchema
    And match each response.usuarios[*].administrador == 'true'

  @TC_LU_004 @positive @combine_valid_filters
  Scenario: TC_LU_004 - Combine valid filters
    Given path 'usuarios'
    And param administrador = 'true'
    When method get
    Then status 200
    And match response.quantidade == '#? _ > 0'
    * def knownUser = response.usuarios[0]
    * def knownEmail = knownUser.email
    * def knownAdmin = knownUser.administrador

    Given path 'usuarios'
    And param email = knownEmail
    And param administrador = knownAdmin
    When method get
    Then status 200
    And match header Content-Type contains 'application/json'
    And match response                                == responseSchema
    And match response.quantidade                     == '#number? _ > 0'
    And match each response.usuarios                  == userSchema
    And match each response.usuarios[*].email         == knownEmail
    And match each response.usuarios[*].administrador == knownAdmin

  @TC_LU_005 @negative @filter_non_existing_id
  Scenario: TC_LU_005 - Filter users by a non-existing id
    * def nonExistingId = 'ID_NO_EXISTENTE_123456789'

    Given path 'usuarios'
    And param _id = nonExistingId
    When method get
    Then status 200
    And match header Content-Type contains 'application/json'
    And match response            == responseSchema
    And match response.quantidade == 0
    And match response.usuarios   == []

  @TC_LU_006 @negative @filter_invalid_email
  Scenario: TC_LU_006 - Filter users with an invalid email
    * def invalidEmail = 'correo-invalido.com'
    * def responseInvalidEmail =
      """
      {
        "email": "email deve ser um email válido"
      }
      """
    Given path 'usuarios'
    And param email = invalidEmail
    When method get
    Then status 400
    And match header Content-Type contains 'application/json'
    And match response == responseInvalidEmail

  @TC_LU_007 @negative @filter_invalid_admin_value
  Scenario: TC_LU_007 - Filter users with an invalid administrador value
    * def responseInvalidAdministradorValue =
      """
      {
        "administrador": "administrador deve ser 'true' ou 'false'"
      }
      """
    Given path 'usuarios'
    And param administrador = 'yes'
    When method get
    Then status 400
    And match header Content-Type contains 'application/json'
    And match response == responseInvalidAdministradorValue

