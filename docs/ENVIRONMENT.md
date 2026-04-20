# Environment Guide

<p align="center">
  <a href="../README.md">⬅ Back to README (English)</a> •
  <a href="../README.es.md">⬅ Ir al README en Español</a> •
  <a href="./ENVIRONMENT.es.md">🇪🇸 Ver esta guía en Español</a>
</p>

This document explains the local execution environment required for the Karate ServeRest API automation project.

---

## 1. Required Tooling

You should have installed:

- **Java**
- **Maven**
- a compatible local development environment for running JUnit 5 tests with Karate

The current project documentation also references:

- **Karate DSL**
- **JUnit 5**
- **DataFaker**

---

## 2. Recommended Verification

```bash
java -version
mvn -version
```

---

## 3. API Under Test

The API under test is **ServeRest**.

English documentation:

```text
https://serverest.dev/?lang=en
```

Spanish documentation:

```text
https://serverest.dev/?lang=es
```

---

## 4. Common Local Execution Flow

```bash
mvn clean install
mvn test
```

---

## 5. Parallel Execution Note

The project includes a parallel runner that executes the `@users` suite with **5 threads**, generates reports under `target/karate-reports`, and also produces **JUnit XML** and **Cucumber JSON** outputs.

---

## 6. Practical Recommendation

Keep the main README focused on onboarding and the most important commands, and use this file for environment and execution context.
