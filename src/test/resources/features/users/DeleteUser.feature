@users @delete-user
Feature: Delete user by id

  Background:
    * url baseUrl
    * def deleteSuccessResponse = read('classpath:responses/delete-user-success-response.json')
    * def noRecordDeletedResponse = read('classpath:responses/delete-user-not-found-response.json')
    * def userNotFoundResponse = read('classpath:responses/user-not-found-response.json')
    * def messageSchema = read('classpath:schemas/message-schema.json')

  @TC_DU_001 @positive @delete_existing_user_without_cart
  Scenario: TC_DU_001 - Delete an existing user without cart
    * def uniqueEmail = makeEmail('delete')
    * def newUser =
      """
      {
        "nome": "Delete User Test",
        "email": "#(uniqueEmail)",
        "password": "teste123",
        "administrador": "false"
      }
      """

    # Crear usuario para asegurar precondición controlada
    Given path 'usuarios'
    And request newUser
    When method post
    Then status 201
    And match header Content-Type contains 'application/json'
    * def createdUserId = response._id

    # Eliminar usuario recién creado
    Given path 'usuarios', createdUserId
    When method delete
    Then status 200
    And match header Content-Type contains 'application/json'
    And match response == deleteSuccessResponse

    # Validar transición de estado: el usuario ya no existe
    Given path 'usuarios', createdUserId
    When method get
    Then status 400
    And match header Content-Type contains 'application/json'
    And match response == userNotFoundResponse

  @TC_DU_002 @negative @delete_non_existing_valid_id
  Scenario: TC_DU_002 - Delete a non-existing valid _id
    * def nonExistingValidId = 'ABC123DEF456GHI7'

    Given path 'usuarios', nonExistingValidId
    When method delete
    Then status 200
    And match header Content-Type contains 'application/json'
    And match response == noRecordDeletedResponse