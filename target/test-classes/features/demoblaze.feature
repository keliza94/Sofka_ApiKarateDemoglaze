
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

  