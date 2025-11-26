
Feature: Prueba API Demoblaze

  Background:
    * url 'https://api.demoblaze.com'

@id:1
  Scenario Outline: Crear nuevo Usuario
    Given path '/signup'
    And request { username: '<username>', password: '<password>' }
    When method post
    Then status 200


    Examples:
      | read('file:src/test/resources/features/usuarios.json') |
      | { username: 'newUser1', password: 'newUser1' } |

  @id:2
  Scenario Outline: Creación de usuario existente
    Given path '/signup'
    And request { username: '<username>', password: '<password>' }
    When method post
    Then status 200
    And match response contains { errorMessage: 'This user already exist.' }

    Examples:
      | read('file:src/test/resources/features/usuarios.json') |
      | { username: 'nuevoUsuario1', password: 'password1234' } |

  @id:3
  Scenario Outline: Usuario y Contraseña Correctos
    Given path '/login'
    And request { username: '<username>', password: '<password>' }
    When method post
    Then status 200

    Examples:
      | read('file:src/test/resources/features/usuarios.json') |
      | { username: 'nuevoUsuario1', password: 'password123' } |

  @id:4
  Scenario Outline: usuario  y contraseña incorrecto 
    Given path '/login'
    And request { username: '<username>', password: '<password>' }
    When method post
    Then status 200
    And match response contains { errorMessage: 'Wrong password.' }

    Examples:
      | read('file:src/test/resources/features/usuarios.json') |
      | { username: 'darkbellS', password: '172417522' } |
