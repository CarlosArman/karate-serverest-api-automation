@users @update-user
Feature: Update user

  Background:
    * url baseUrl
    * def userSchema = read('classpath:schemas/users-schema.json')
    * def createUserSuccessSchema = read('classpath:schemas/create-user-success-schema.json')
    * def messageSchema = read('classpath:schemas/message-schema.json')
    * def user = fakeUser()
    * def payload = read('classpath:data/template-user.json')
    * print payload

  @positive @update_existing_user
  Scenario Outline: <caseId> - Update an existing user successfully
    * def originalEmail = makeEmail('original')
    * def updatedEmail = makeEmail('<emailPrefix>')

    # Crear usuario base para tener una precondición controlada
    * copy originalUser = payload
    * set  originalUser.email  = originalEmail

    Given path 'usuarios'
    And request originalUser
    When method post
    Then status 201
    And match header Content-Type contains 'application/json'
    And match response == createUserSuccessSchema
    * def userId = response._id

    # Preparar payload actualizado
    * copy updatedUser = payload
    * set  updatedUser.nome          = '<updatedName>'
    * set  updatedUser.email         = updatedEmail
    * set  updatedUser.password      = '<updatedPassword>'
    * set  updatedUser.administrador = '<updatedAdmin>'

    Given path 'usuarios', userId
    And request updatedUser
    When method put
    Then status 200
    And match header Content-Type contains 'application/json'
    And match response == messageSchema

    # Validar persistencia de los cambios
    Given path 'usuarios', userId
    When method get
    Then status 200
    And match header Content-Type contains 'application/json'
    And match response               == userSchema
    And match response.nome          == updatedUser.nome
    And match response.email         == updatedUser.email
    And match response.password      == updatedUser.password
    And match response.administrador == updatedUser.administrador
    And match response._id           == userId

    Examples:
      | caseId    | updatedName      | emailPrefix | updatedPassword | updatedAdmin |
      | TC_UU_001 | Updated QA User  | updateuser  | teste456        | false        |
      | TC_UU_002 | Updated QA Admin | updateadmin | teste789        | true         |

  @TC_UU_003 @positive @update_non_existing_id_creates_user
  Scenario: TC_UU_003 - Update a non-existing valid _id should create a new user
    * def nonExistingValidId = 'ABC123DEF456GHI7'
    * def uniqueEmail = makeEmail('upsert')

    Given path 'usuarios', nonExistingValidId
    And request payload
    When method put
    Then status 201
    And match header Content-Type contains 'application/json'
    And match response    == createUserSuccessSchema
    * def createdUserId = response._id

    # Validar que el usuario fue creado
    Given path 'usuarios', createdUserId
    When method get
    Then status 200
    And match header Content-Type contains 'application/json'
    And match response               == userSchema
    And match response.nome          == payload.nome
    And match response.email         == payload.email
    And match response.password      == payload.password
    And match response.administrador == payload.administrador

  @TC_UU_004 @negative @update_user_with_duplicate_email
  Scenario: TC_UU_004 - Update a user with duplicate email
    * def firstEmail = makeEmail('first')
    * def secondEmail = makeEmail('second')

    # Crear primer usuario
    * copy firstUser = payload
    * set  firstUser.email = firstEmail

    Given path 'usuarios'
    And request firstUser
    When method post
    Then status 201
    And match header Content-Type contains 'application/json'
    And match response == createUserSuccessSchema
    * def firstUserId = response._id

    # Crear segundo usuario
    * copy secondUser = payload
    * set secondUser.email = secondEmail

    Given path 'usuarios'
    And request secondUser
    When method post
    Then status 201
    And match header Content-Type contains 'application/json'
    And match response   == createUserSuccessSchema
    * def secondUserId = response._id

    # Intentar actualizar el segundo usuario con el email del primero
    * copy duplicatedEmailPayload = secondUser
    * set  duplicatedEmailPayload.email = firstEmail

    Given path 'usuarios', secondUserId
    And request duplicatedEmailPayload
    When method put
    Then status 400
    And match header Content-Type contains 'application/json'
    And match response == messageSchema
    And match response.message == 'Este email já está sendo usado'