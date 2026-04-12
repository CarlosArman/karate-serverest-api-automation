<h1 align="center">Karate ServeRest API Automation</h1>

<p align="center">
  <a href="https://www.oracle.com/java/">
    <img src="https://img.shields.io/badge/Java-17%2B-orange" />
  </a>
  <a href="https://maven.apache.org/">
    <img src="https://img.shields.io/badge/Maven-Build-C71A36" />
  </a>
  <a href="https://karatelabs.github.io/karate/">
    <img src="https://img.shields.io/badge/Karate-DSL-00C853" />
  </a>
  <a href="#">
    <img src="https://img.shields.io/badge/API-Testing-1E88E5" />
  </a>
  <a href="https://www.datafaker.net/">
    <img src="https://img.shields.io/badge/Datafaker-Test%20Data-7B1FA2" />
  </a>
  <a href="#">
    <img src="https://img.shields.io/badge/Status-In%20Progress-yellow" />
  </a>
  <a href="https://github.com/CarlosArman/karate-serverest-api-automation/commits/main">
    <img src="https://img.shields.io/github/last-commit/CarlosArman/karate-serverest-api-automation" />
  </a>
  <a href="https://github.com/CarlosArman/karate-serverest-api-automation">
    <img src="https://img.shields.io/github/repo-size/CarlosArman/karate-serverest-api-automation" />
  </a>
</p>

<p align="center">
  <a href="https://serverest.dev/?lang=en">
    <img src="https://img.shields.io/badge/ServeRest-API%20Docs-0A66C2" />
  </a>
</p>

---

## 📌 Summary / Resumen

### 🇪🇸 Resumen

Proyecto de automatización de pruebas API construido con **Karate DSL** para **ServeRest**, con cobertura modular
enfocada actualmente en el dominio de **Usuarios**. Incluye escenarios **positivos y negativos**, validación de *
*schemas JSON**, datos reutilizables, respuestas esperadas externalizadas y dos modos de ejecución: un **runner estándar
con JUnit 5** y un **runner paralelo**.

### 🇺🇸 Summary

API test automation project built with **Karate DSL** for **ServeRest**, currently focused on the **Users** domain with
a modular and scalable structure. It includes **positive and negative** scenarios, **JSON schema** validation, reusable
test data, externalized expected responses, and two execution modes: a **standard JUnit 5 runner** and a **parallel
runner**.

---

<p align="center">
  <a href="#english">🇺🇸 English</a> | <a href="#espanol">🇪🇸 Español</a>
</p>

---
<a id="espanol"></a>

## 🇪🇸 Español

### Descripción

Proyecto de automatización de pruebas API construido con **Karate DSL** para **ServeRest**.

🔗 **Documentación oficial de la API:** [ServeRest API](https://serverest.dev/?lang=es)

La implementación actual cubre el módulo de **Usuarios**, incluyendo escenarios de prueba **positivos y negativos**,
validación de **esquemas JSON**, datos de prueba reutilizables, **generación dinámica de datos con Datafaker** y
respuestas esperadas externalizadas.

### Alcance actual

Cobertura actual del módulo **Usuarios**:

- `GET /usuarios`
- `POST /usuarios`
- `GET /usuarios/{_id}`
- `PUT /usuarios/{_id}`
- `DELETE /usuarios/{_id}`

### Stack tecnológico

- Java
- Maven
- Karate DSL
- JUnit 5
- JSON
- Datafaker

### Estructura del proyecto

```text
src/test
├── java
│   └── runner
│       ├── RunnerTest.java
│       └── RunnerTestParallel.java
└── resources
    ├── features/users
    ├── data
    ├── helpers
    ├── schemas
    ├── responses
    └── karate-config.js
```

### Runners disponibles

#### 1. Runner estándar

Ejecuta la suite etiquetada con `@users` usando el runner JUnit 5 de Karate.

```java
package runner;

import com.intuit.karate.junit5.Karate;

class RunnerTest {

    @Karate.Test
    Karate runTestSuite() {
        return Karate.run("classpath:features").tags("@users").relativeTo(getClass());
    }

}
```

#### 2. Runner paralelo

Ejecuta la misma suite en paralelo con **5 hilos**, genera reportes en `target/karate-reports` y produce salida **JUnit
XML** y **Cucumber JSON**.

```java
package runner;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class RunnerTestParallel {

    @Test
    void runTestSuite() {
        Results results = Runner.path("classpath:features")
                .tags("@users")
                .backupReportDir(false)
                .reportDir("target/karate-reports")
                .outputJunitXml(true)
                .outputCucumberJson(true)
                .parallel(5);

        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}
```

### Cómo ejecutarlo

#### Ejecutar todas las pruebas

```bash
mvn test
```

#### Ejecutar el runner estándar

```bash
mvn test -Dtest=RunnerTest
```

#### Ejecutar el runner paralelo

```bash
mvn test -Dtest=RunnerTestParallel
```

> Si tu configuración Maven requiere el nombre con paquete, puedes probar:

```bash
mvn test -Dtest=runner.RunnerTest
mvn test -Dtest=runner.RunnerTestParallel
```

#### Ejecutar por tags

```bash
mvn test -Dtest=RunnerTest -Dkarate.options="--tags @positive"
```

```bash
mvn test -Dtest=RunnerTest -Dkarate.options="--tags @negative"
```

```bash
mvn test -Dtest=RunnerTest -Dkarate.options="--tags @create-user"
```

#### Ejecutar un feature específico

```bash
mvn test -Dtest=RunnerTest -Dkarate.options="classpath:features/users/CreateUser.feature"
```

### Reportes

Después de la ejecución, Karate genera reportes en:

```text
target/karate-reports/
```

El runner paralelo además genera:

- **JUnit XML**
- **Cucumber JSON**

### Buenas prácticas aplicadas

- Escenarios positivos y negativos
- Schemas reutilizables
- Payloads y responses externalizados
- Ejecución selectiva por tags
- Ejecución paralela
- Estructura modular y escalable
- Generación dinámica de datos de prueba con Datafaker
- Enfoque de diseño basado en ISTQB

### Próximos pasos

- Agregar cobertura para **Login**

---
<a id="english"></a>

## 🇺🇸 English

### Description

API test automation project built with **Karate DSL** for **ServeRest**.

🔗 **Official API documentation:** [ServeRest API](https://serverest.dev/?lang=en)

The current implementation covers the **Users** module with **positive and negative** test scenarios, **JSON schema**
validation, reusable test data, and externalized expected responses.

### Current scope

Current coverage for the **Users** module:

- `GET /usuarios`
- `POST /usuarios`
- `GET /usuarios/{_id}`
- `PUT /usuarios/{_id}`
- `DELETE /usuarios/{_id}`

### Tech stack

- Java
- Maven
- Karate DSL
- JUnit 5
- JSON
- Datafaker

### Project structure

```text
src/test
├── java
│   └── runner
│       ├── RunnerTest.java
│       └── RunnerTestParallel.java
└── resources
    ├── features/users
    ├── data
    ├── helpers
    ├── schemas
    ├── responses
    └── karate-config.js
```

### Available runners

#### 1. Standard runner

Runs the suite tagged with `@users` using the Karate JUnit 5 runner.

```java
package runner;

import com.intuit.karate.junit5.Karate;

class RunnerTest {

    @Karate.Test
    Karate runTestSuite() {
        return Karate.run("classpath:features").tags("@users").relativeTo(getClass());
    }

}
```

#### 2. Parallel runner

Runs the same suite in parallel with **5 threads**, writes reports to `target/karate-reports`, and produces **JUnit XML
** and **Cucumber JSON** output.

```java
package runner;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class RunnerTestParallel {

    @Test
    void runTestSuite() {
        Results results = Runner.path("classpath:features")
                .tags("@users")
                .backupReportDir(false)
                .reportDir("target/karate-reports")
                .outputJunitXml(true)
                .outputCucumberJson(true)
                .parallel(5);

        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}
```

### How to run

#### Run all tests

```bash
mvn test
```

#### Run the standard runner

```bash
mvn test -Dtest=RunnerTest
```

#### Run the parallel runner

```bash
mvn test -Dtest=RunnerTestParallel
```

> If your Maven setup requires the fully qualified name, you can try:

```bash
mvn test -Dtest=runner.RunnerTest
mvn test -Dtest=runner.RunnerTestParallel
```

#### Run by tags

```bash
mvn test -Dtest=RunnerTest -Dkarate.options="--tags @positive"
```

```bash
mvn test -Dtest=RunnerTest -Dkarate.options="--tags @negative"
```

```bash
mvn test -Dtest=RunnerTest -Dkarate.options="--tags @create-user"
```

#### Run a specific feature

```bash
mvn test -Dtest=RunnerTest -Dkarate.options="classpath:features/users/CreateUser.feature"
```

### Reports

After execution, Karate generates reports in:

```text
target/karate-reports/
```

The parallel runner also generates:

- **JUnit XML**
- **Cucumber JSON**

### Applied good practices

- Positive and negative scenarios
- Reusable schemas
- Externalized payloads and responses
- Tag-based selective execution
- Parallel execution
- Modular and scalable structure
- Dynamic test data generation with Datafaker
- ISTQB-aligned test design

### Next steps

- Add **Login** coverage