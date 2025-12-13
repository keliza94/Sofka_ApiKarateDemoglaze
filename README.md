# Prueba Sofka – API Demoblaze  
Automatización de pruebas utilizando Karate DSL para los servicios Signup y Login de la API de Demoblaze.
## 1. Descripción del ejercicio

El sitio web https://www.demoblaze.com ofrece funcionalidades de registro y login.  
El objetivo de este ejercicio es automatizar pruebas REST para los endpoints:

- Signup: https://api.demoblaze.com/signup  
- Login: https://api.demoblaze.com/login  

Los casos de prueba implementados son:

1. Crear un nuevo usuario
2. Intentar crear un usuario ya existente
3. Usuario y password correctos en login
4. Usuario y password incorrectos en login

El repositorio contiene scripts, archivos, código y reportes necesarios para reproducir completamente el ejercicio.
## 2. Requisitos previos

Antes de ejecutar el proyecto debes contar con:

✔ Java 8 o superior  
✔ Maven 3.6 o superior  
✔ Karate DSL (se descarga automáticamente vía pom.xml)

Verificar versiones:

java -version  
mvn -version
## 3. Estructura del proyecto

El repositorio contiene la siguiente estructura:

.
├── src
│   └── test
│       └── java
│           └── examples
│               └── demoblaze.feature
├── pom.xml
├── readme.txt
├── conclusiones.txt
└── target
    └── karate-reports (se genera automáticamente)

El archivo principal de pruebas es:  
src/test/java/examples/demoblaze.feature
## 4. Instrucciones de ejecución (PASO A PASO)

1. Clonar el repositorio público:
   git clone https://github.com/keliza94/Sofka_ApiKarateDemoglaze.git

2. Entrar en la carpeta del proyecto:
   cd Sofka_ApiKarateDemoglaze

3. Ejecutar todas las pruebas con Maven:
   mvn test

4. Ver reportes de Karate:
   target/karate-reports/karate-summary.html

Desde el reporte podrás visualizar:
- Casos ejecutados
- Entradas enviadas al API
- Respuestas recibidas
- Mensajes de error
- Validaciones exitosas o fallidas
## 5. Casos de prueba implementados

### Caso 1 – Crear nuevo usuario  
Realiza un POST a /signup con credenciales nuevas.

Validación:
- status 200

### Caso 2 – Usuario ya existente  
Realiza un POST a /signup con un usuario previamente registrado.

Validación:
- status 200
- Mensaje: "This user already exist."

### Caso 3 – Login correcto  
Realiza un POST a /login con usuario y password válidos.

Validación:
- status 200

### Caso 4 – Login incorrecto  
Realiza un POST a /login con credenciales erróneas.

Validación:
- status 200
- Mensaje: "Wrong password."
## 6. Código completo del archivo Feature

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

  @id:CasodePrueba3
  Scenario Outline: Usuario y Contraseña Correctos
    Given path '/login'
    And request { username: '<username>', password: '<password>' }
    When method post
    Then status 200

    Examples:
      | { username: 'nuevoUsuario1', password: 'password123' } |

  @id:CasodePrueba4
  Scenario Outline: Usuario y contraseña incorrectos 
    Given path '/login'
    And request { username: '<username>', password: '<password>' }
    When method post
    Then status 200
    And match response contains { errorMessage: 'Wrong password.' }

    Examples:
      | { username: 'Elizabeth', password: '1725531956' } |
## 7. Cómo reproducir completamente el proyecto

1. Clonar repositorio  
2. Ejecutar mvn test  
3. Abrir reporte HTML  
4. Revisar request/response de cada caso  
5. Validar resultados y mensajes devueltos por la API. 
