
Feature: Prueba Sofka API Demoblaze

  Background:
    * url 'https://api.demoblaze.com'

@id:CasodePrueba1
  Scenario Outline: Crear nuevo Usuario
    Given path '/signup'
    And request { username: '<username>', password: '<password>' }
    When method post
    Then status 200


    Examples:
      | { username: 'newUser1', password: 'newUser1' } |

@id:CasodePrueba2
  Scenario Outline: Creación de usuario existente
    Given path '/signup'
    And request { username: '<username>', password: '<password>' }
    When method post
    Then status 200
    And match response contains { errorMessage: 'This user already exist.' }

    Examples:
      | { username: 'nuevoUsuario1', password: 'password1234' } |


  