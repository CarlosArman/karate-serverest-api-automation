<h1 align="center">Karate ServeRest API Automation</h1>

<p align="center">
  <a href="https://github.com/CarlosArman/karate-serverest-api-automation">
    <img src="https://img.shields.io/badge/Version-v1.0.0-blue" alt="Version" />
  </a>
  <img src="https://img.shields.io/badge/Architecture-Portfolio%20Ready-success" alt="Architecture" />
  <a href="https://www.oracle.com/java/">
    <img src="https://img.shields.io/badge/Java-17%2B-007396" alt="Java" />
  </a>
  <a href="https://maven.apache.org/">
    <img src="https://img.shields.io/badge/Maven-Build-C71A36" alt="Maven" />
  </a>
  <a href="https://karatelabs.github.io/karate/">
    <img src="https://img.shields.io/badge/Karate-API%20Testing-000000" alt="Karate" />
  </a>
  <a href="https://junit.org/junit5/">
    <img src="https://img.shields.io/badge/JUnit-5-25A162" alt="JUnit 5" />
  </a>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Testing-API-1E88E5" alt="API Testing" />
  <img src="https://img.shields.io/badge/Validation-JSON%20Schema-6A1B9A" alt="JSON Schema" />
  <img src="https://img.shields.io/badge/Test%20Data-DataFaker-F57C00" alt="DataFaker" />
  <img src="https://img.shields.io/badge/Execution-Parallel%20Runner-informational" alt="Parallel Runner" />
  <a href="https://serverest.dev/?lang=en">
    <img src="https://img.shields.io/badge/ServeRest-Users%20API-00ACC1" alt="ServeRest Users API" />
  </a>
</p>

<p align="center"><b>🌐 Language / Idioma</b></p>
<p align="center">
  🇬🇧 English &nbsp; | &nbsp;
  <a href="./README.es.md">🇪🇸 Español</a>
</p>

<p align="center">
  API automation framework built with <b>Karate DSL</b> for <b>ServeRest</b>, designed to demonstrate modular API test design, reusable validation assets, runner flexibility, and scalable reporting for QA Automation portfolios.
</p>

---

## 🎯 Why This Project Matters

This project demonstrates QA automation best practices for API testing with **Karate DSL**, **Java**, and **Maven**,
with a strong focus on:

- reusable test assets
- maintainable feature organization
- positive and negative coverage
- schema validation
- selective execution by tags
- standard and parallel runner strategies
- portfolio-ready documentation and reporting

It is designed to show practical capability in **API test architecture**, **reusable test design**, **debugging
readiness**, and **scalable execution patterns**.

---

## 🚀 Project Overview

This repository contains an API automation framework for **ServeRest**, currently focused on the **Users** domain.

It includes:

- positive and negative scenarios
- JSON schema validation
- reusable test data
- externalized expected responses
- dynamic data generation with DataFaker
- a standard JUnit 5 runner
- a parallel runner for faster execution

🔗 **API under test:** https://serverest.dev/?lang=en  
🔗 **Repository:** https://github.com/CarlosArman/karate-serverest-api-automation

---

## ✨ What This Framework Demonstrates

### Functional Coverage

- ✅ `GET /login`
- ✅ `GET /usuarios`
- ✅ `POST /usuarios`
- ✅ `GET /usuarios/{_id}`
- ✅ `PUT /usuarios/{_id}`
- ✅ `DELETE /usuarios/{_id}`

### Engineering Practices

- ✅ Positive and negative scenario design
- ✅ Reusable JSON schemas
- ✅ Externalized responses and data
- ✅ Dynamic data generation with DataFaker
- ✅ Tag-based selective execution
- ✅ Standard JUnit 5 runner
- ✅ Parallel Karate runner
- ✅ JUnit XML and Cucumber JSON outputs

### QA Portfolio Value

- ✅ API automation with Karate DSL
- ✅ Maintainable and modular structure
- ✅ Clear execution strategy
- ✅ Practical evidence generation
- ✅ Clean portfolio-oriented documentation

---

## 🧰 Tech Stack

- **Language:** Java
- **Build Tool:** Maven
- **API Automation Framework:** Karate DSL
- **Test Runner:** JUnit 5
- **Validation:** JSON / JSON Schema
- **Test Data:** DataFaker
- **API Under Test:** ServeRest

---

## 🏗 Project Structure

```bash
karate-serverest-api-automation
├── src/
│   └── test/
│       ├── java/
│       │   └── runner/              # Standard and parallel Karate runners
│       └── resources/
│           ├── features/            # Feature files for the Users and Login API domain
│           ├── data/                # Reusable test data
│           ├── helpers/             # Helper utilities and dynamic data support
│           ├── schemas/             # JSON schema validation files
│           ├── responses/           # Externalized expected responses
│           └── karate-config.js     # Global Karate configuration
├── docs/                            # Additional documentation
├── CHANGELOG.md                     # Project changelog
├── CONTRIBUTING.md                  # Contribution guide
├── pom.xml                          # Maven dependencies and build configuration
├── README.md                        # Main documentation in English
└── README.es.md                     # Main documentation in Spanish
```

---

## ⚙ Quick Start

### 1. Clone the repository

```bash
git clone https://github.com/CarlosArman/karate-serverest-api-automation.git
cd karate-serverest-api-automation
```

### 2. Install dependencies

```bash
mvn clean install
```

### 3. Run the full suite

```bash
mvn test
```

---

## ▶ Main Commands

For the full command reference, see:

- **[docs/COMMANDS.md](./docs/COMMANDS.md)**
- **[docs/COMMANDS.es.md](./docs/COMMANDS.es.md)**

```bash
# Run all tests
mvn test

# Run the standard runner
mvn test -Dtest=RunnerTest

# Run the parallel runner
mvn test -Dtest=RunnerTestParallel

# Run by tag
mvn test -Dtest=RunnerTest -Dkarate.options="--tags @positive"

# Run a specific feature
mvn test -Dtest=RunnerTest -Dkarate.options="classpath:features/users/CreateUser.feature"
```

> If your Maven setup requires the fully qualified runner name, you can also try:
>
> ```bash
> mvn test -Dtest=runner.RunnerTest
> mvn test -Dtest=runner.RunnerTestParallel
> ```

---

## 📊 Reporting and Evidence

After execution, Karate generates reports in:

```text
target/karate-reports/
```

The parallel runner also generates:

- **JUnit XML**
- **Cucumber JSON**

This gives the project stronger execution traceability and makes it easier to integrate with CI/CD pipelines or
reporting dashboards later.

---

## 🧠 Architecture Snapshot

The framework is organized around clear separation of concerns:

- **`runner/`** → execution entry points
- **`features/`** → business-focused API scenarios
- **`schemas/`** → reusable validation contracts
- **`responses/`** → externalized expected results
- **`data/`** → reusable test data
- **`helpers/`** → dynamic data and support logic
- **`karate-config.js`** → centralized runtime configuration

For full architecture details, see:

- **[docs/ARCHITECTURE.md](./docs/ARCHITECTURE.md)**
- **[docs/ARCHITECTURE.es.md](./docs/ARCHITECTURE.es.md)**

---

## 🔗 Related Project

If you would like to explore another API automation project in the **Karate ecosystem**, check out:

### [PetStore_Karate](https://github.com/CarlosArman/PetStore_Karate)

A related project built with **Karate** against the **Swagger Petstore API**, which complements this repository by
expanding API automation coverage into a different domain. It is also integrated with **GitHub Actions** and publishes
test reports through **GitHub Pages**, adding CI visibility and shareable execution evidence.

This helps demonstrate practical experience not only in **API test automation with Karate**, but also in **CI
integration** and **report publication workflows** for portfolio-ready QA projects.

---

## 📚 Documentation Index

### Core docs

- **[docs/COMMANDS.md](./docs/COMMANDS.md)** → Commands reference (English)
- **[docs/COMMANDS.es.md](./docs/COMMANDS.es.md)** → Commands reference (Spanish)
- **[docs/ENVIRONMENT.md](./docs/ENVIRONMENT.md)** → Environment guide (English)
- **[docs/ENVIRONMENT.es.md](./docs/ENVIRONMENT.es.md)** → Environment guide (Spanish)
- **[docs/ARCHITECTURE.md](./docs/ARCHITECTURE.md)** → Architecture guide (English)
- **[docs/ARCHITECTURE.es.md](./docs/ARCHITECTURE.es.md)** → Architecture guide (Spanish)

### Repository docs

- **[CHANGELOG.md](./CHANGELOG.md)** → Project changelog (English)
- **[CHANGELOG.es.md](./CHANGELOG.es.md)** → Historial de cambios (Español)
- **[CONTRIBUTING.md](./CONTRIBUTING.md)** → Contribution guide (English)
- **[CONTRIBUTING.es.md](./CONTRIBUTING.es.md)** → Guía de contribución (Español)

---

## 🛣 Roadmap

- [ ] Add **Login** coverage
- [ ] Expand domain coverage beyond Users
- [ ] Improve CI/CD-oriented reporting narrative
- [ ] Add execution evidence samples to the repository

---

## 👨‍💻 Author

**Carlos R.**  
QA Test Automation Engineer  
🔗 GitHub: https://github.com/CarlosArman

---

## ⭐ Final Note

This project is intentionally structured to demonstrate not only API automation capability with Karate, but also **clean
test design, reusable validation assets, and engineering maturity in QA Automation documentation**.
