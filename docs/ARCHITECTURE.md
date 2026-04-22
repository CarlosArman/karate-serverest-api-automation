# Architecture Guide

<p align="center">
  <a href="../README.md">⬅ Back to README (English)</a> •
  <a href="../README.es.md">⬅ Ir al README en Español</a> •
  <a href="./ARCHITECTURE.es.md">🇪🇸 Ver esta guía en Español</a>
</p>

This document explains the architectural design of the Karate ServeRest API automation project.

---

## 1. Architecture Goal

The framework is designed to provide a **modular, maintainable, and reusable** API automation solution for the ServeRest
Users domain.

It aims to:

- separate execution entry points from feature implementation
- reuse schemas, responses, and test data
- support selective and scalable execution
- keep validation assets externalized and maintainable
- support future domain expansion

---

## 2. Core Design Principles

- **Separation of concerns**
- **Reusable validation assets**
- **Readable feature design**
- **Positive and negative scenario coverage**
- **Execution flexibility through runners and tags**
- **Scalable project organization**

---

## 3. High-Level Flow

```text
Runner (JUnit 5 / Parallel)
   ↓
Karate feature files
   ↓
Reusable data, helpers, schemas, and responses
   ↓
ServeRest API execution
   ↓
Reports under target/karate-reports
```

---

## 4. Folder Responsibilities

### `runner/`

Contains the execution entry points:

- a standard JUnit 5 Karate runner
- a parallel Karate runner

### `features/`

Contains feature files focused on the Users and Login API domain.

### `data/`

Contains reusable test data assets.

### `helpers/`

Contains support logic and dynamic data helpers.

### `schemas/`

Contains reusable JSON schemas used for response validation.

### `responses/`

Contains externalized expected response payloads.

### `karate-config.js`

Contains centralized Karate runtime configuration.

---

## 5. Runner Strategy

The project supports two complementary execution strategies:

- **Standard runner** → for regular JUnit 5 execution
- **Parallel runner** → for faster execution with 5 threads, report generation, and structured outputs

This makes the suite easier to use both for development and for future CI pipelines.

---

## 6. Validation Strategy

Validation is designed to be reusable and maintainable through:

- externalized JSON schemas
- reusable response contracts
- modular data assets
- positive and negative assertions

---

## 7. Reporting Strategy

The framework generates reports in:

```text
target/karate-reports/
```

The parallel runner also generates:

- JUnit XML
- Cucumber JSON

This improves traceability and makes later CI integration easier.

---

## 8. Scalability Notes

The current structure is suitable for extending into:

- more API domains
- more advanced tagging strategies
- richer shared helper libraries
- CI/CD pipeline integration
- stronger test data patterns
