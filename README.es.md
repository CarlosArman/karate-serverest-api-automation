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
  <a href="https://serverest.dev/?lang=es">
    <img src="https://img.shields.io/badge/ServeRest-Users%20API-00ACC1" alt="ServeRest Users API" />
  </a>
</p>

<p align="center"><b>🌐 Idioma</b></p>
<p align="center">
  <a href="./README.md">🇬🇧 English</a> &nbsp; | &nbsp;
  🇪🇸 Español
</p>

<p align="center">
  Framework de automatización API construido con <b>Karate DSL</b> para <b>ServeRest</b>, diseñado para demostrar diseño modular de pruebas API, activos de validación reutilizables, flexibilidad de runners y reportería escalable para portafolio de QA Automation.
</p>

---

## 🎯 Por qué este proyecto importa

Este proyecto demuestra buenas prácticas de automatización QA para pruebas API con **Karate DSL**, **Java** y **Maven**,
con un fuerte enfoque en:

- activos de prueba reutilizables
- organización mantenible de features
- cobertura positiva y negativa
- validación de esquemas
- ejecución selectiva por tags
- estrategia de runners estándar y paralela
- documentación orientada a portafolio

Está pensado para mostrar capacidad práctica en **arquitectura de pruebas API**, **diseño reutilizable**, **preparación
para debugging** y **patrones de ejecución escalables**.

---

## 🚀 Resumen del proyecto

Este repositorio contiene un framework de automatización API para **ServeRest**, actualmente enfocado en el dominio de *
*Usuarios**.

Incluye:

- escenarios positivos y negativos
- validación de JSON schema
- datos de prueba reutilizables
- respuestas esperadas externalizadas
- generación dinámica de datos con DataFaker
- un runner estándar con JUnit 5
- un runner paralelo para ejecución más rápida

🔗 **API bajo prueba:** https://serverest.dev/?lang=es  
🔗 **Repositorio:** https://github.com/CarlosArman/karate-serverest-api-automation

---

## ✨ Qué demuestra este framework

### Cobertura funcional

- ✅ `GET /login`
- ✅ `GET /usuarios`
- ✅ `POST /usuarios`
- ✅ `GET /usuarios/{_id}`
- ✅ `PUT /usuarios/{_id}`
- ✅ `DELETE /usuarios/{_id}`

### Prácticas de ingeniería

- ✅ Diseño de escenarios positivos y negativos
- ✅ JSON schemas reutilizables
- ✅ Respuestas y datos externalizados
- ✅ Generación dinámica de datos con DataFaker
- ✅ Ejecución selectiva por tags
- ✅ Runner estándar con JUnit 5
- ✅ Runner paralelo con Karate
- ✅ Salidas JUnit XML y Cucumber JSON

### Valor para portafolio QA

- ✅ Automatización API con Karate DSL
- ✅ Estructura mantenible y modular
- ✅ Estrategia clara de ejecución
- ✅ Generación práctica de evidencia
- ✅ Documentación limpia orientada a portafolio

---

## 🧰 Stack tecnológico

- **Lenguaje:** Java
- **Build Tool:** Maven
- **Framework de Automatización API:** Karate DSL
- **Runner de pruebas:** JUnit 5
- **Validación:** JSON / JSON Schema
- **Datos de prueba:** DataFaker
- **API bajo prueba:** ServeRest

---

## 🏗 Estructura del proyecto

```bash
karate-serverest-api-automation
├── src/
│   └── test/
│       ├── java/
│       │   └── runner/              # Runners estándar y paralelo de Karate
│       └── resources/
│           ├── features/            # Features del dominio API de Usuarios y Login
│           ├── data/                # Datos de prueba reutilizables
│           ├── helpers/             # Utilitarios de soporte y datos dinámicos
│           ├── schemas/             # Archivos de validación JSON schema
│           ├── responses/           # Respuestas esperadas externalizadas
│           └── karate-config.js     # Configuración global de Karate
├── docs/                            # Documentación adicional
├── CHANGELOG.md                     # Historial de cambios del proyecto
├── CONTRIBUTING.md                  # Guía de contribución
├── pom.xml                          # Dependencias Maven y configuración de build
├── README.md                        # Documentación principal en inglés
└── README.es.md                     # Documentación principal en español
```

---

## ⚙ Inicio rápido

### 1. Clonar el repositorio

```bash
git clone https://github.com/CarlosArman/karate-serverest-api-automation.git
cd karate-serverest-api-automation
```

### 2. Instalar dependencias

```bash
mvn clean install
```

### 3. Ejecutar toda la suite

```bash
mvn test
```

---

## ▶ Comandos principales

Para la referencia completa de comandos, revisa:

- **[docs/COMMANDS.es.md](./docs/COMMANDS.es.md)**
- **[docs/COMMANDS.md](./docs/COMMANDS.md)**

```bash
# Ejecutar todas las pruebas
mvn test

# Ejecutar el runner estándar
mvn test -Dtest=RunnerTest

# Ejecutar el runner paralelo
mvn test -Dtest=RunnerTestParallel

# Ejecutar por tag
mvn test -Dtest=RunnerTest -Dkarate.options="--tags @positive"

# Ejecutar un feature específico
mvn test -Dtest=RunnerTest -Dkarate.options="classpath:features/users/CreateUser.feature"
```

> Si tu configuración de Maven requiere el nombre completo del runner, también puedes probar:
>
> ```bash
> mvn test -Dtest=runner.RunnerTest
> mvn test -Dtest=runner.RunnerTestParallel
> ```

---

## 📊 Reportería y evidencia

Después de la ejecución, Karate genera reportes en:

```text
target/karate-reports/
```

El runner paralelo además genera:

- **JUnit XML**
- **Cucumber JSON**

Esto le da al proyecto una mejor trazabilidad de ejecución y facilita futuras integraciones con pipelines CI/CD o
dashboards de reportería.

---

## 🧠 Resumen de arquitectura

El framework está organizado alrededor de una separación clara de responsabilidades:

- **`runner/`** → puntos de entrada de ejecución
- **`features/`** → escenarios API enfocados en negocio
- **`schemas/`** → contratos reutilizables de validación
- **`responses/`** → resultados esperados externalizados
- **`data/`** → datos de prueba reutilizables
- **`helpers/`** → lógica de soporte y datos dinámicos
- **`karate-config.js`** → configuración centralizada de ejecución

Para ver el detalle completo de arquitectura, revisa:

- **[docs/ARCHITECTURE.es.md](./docs/ARCHITECTURE.es.md)**
- **[docs/ARCHITECTURE.md](./docs/ARCHITECTURE.md)**

---

## 🔗 Proyecto relacionado

Si quieres explorar otro proyecto de automatización API dentro del **ecosistema Karate**, revisa:

### [PetStore_Karate](https://github.com/CarlosArman/PetStore_Karate)

Proyecto relacionado construido con **Karate** sobre la **Swagger Petstore API**, que complementa este repositorio al
extender la cobertura de automatización API hacia otro dominio. Además, está integrado con **GitHub Actions** y publica
los reportes a través de **GitHub Pages**, lo que añade visibilidad de CI y evidencia de ejecución compartible.

Esto ayuda a demostrar experiencia práctica no solo en **automatización API con Karate**, sino también en **integración
continua** y **publicación de reportes** para proyectos QA orientados a portafolio.

---

## 📚 Índice de documentación

### Documentación principal

- **[docs/COMMANDS.es.md](./docs/COMMANDS.es.md)** → Referencia de comandos (Español)
- **[docs/COMMANDS.md](./docs/COMMANDS.md)** → Commands reference (English)
- **[docs/ENVIRONMENT.es.md](./docs/ENVIRONMENT.es.md)** → Guía de entorno (Español)
- **[docs/ENVIRONMENT.md](./docs/ENVIRONMENT.md)** → Environment guide (English)
- **[docs/ARCHITECTURE.es.md](./docs/ARCHITECTURE.es.md)** → Guía de arquitectura (Español)
- **[docs/ARCHITECTURE.md](./docs/ARCHITECTURE.md)** → Architecture guide (English)

### Documentación del repositorio

- **[CHANGELOG.es.md](./CHANGELOG.es.md)** → Historial de cambios (Español)
- **[CHANGELOG.md](./CHANGELOG.md)** → Project changelog (English)
- **[CONTRIBUTING.es.md](./CONTRIBUTING.es.md)** → Guía de contribución (Español)
- **[CONTRIBUTING.md](./CONTRIBUTING.md)** → Contribution guide (English)

---

## 🛣 Roadmap

- [ ] Agregar cobertura para **Login**
- [ ] Extender cobertura más allá del dominio Users
- [ ] Mejorar la narrativa de reportería para CI/CD
- [ ] Añadir ejemplos de evidencia de ejecución en el repositorio

---

## 👨‍💻 Autor

**Carlos R.**  
QA Test Automation Engineer  
🔗 GitHub: https://github.com/CarlosArman

---

## ⭐ Nota final

Este proyecto está estructurado intencionalmente para demostrar no solo capacidad de automatización API con Karate, sino
también **diseño limpio de pruebas, activos reutilizables de validación y madurez de ingeniería en documentación de QA
Automation**.
