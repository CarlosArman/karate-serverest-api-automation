# Guía de arquitectura

<p align="center">
  <a href="../README.es.md">⬅ Volver al README (Español)</a> •
  <a href="../README.md">⬅ Go to README in English</a> •
  <a href="./ARCHITECTURE.md">🇺🇸 View this guide in English</a>
</p>

Este documento explica el diseño arquitectónico del proyecto Karate ServeRest API Automation.

---

## 1. Objetivo de la arquitectura

El framework está diseñado para proveer una solución de automatización API **modular, mantenible y reutilizable** para
el dominio de Usuarios en ServeRest.

Busca:

- separar los puntos de entrada de ejecución de la implementación de features
- reutilizar schemas, responses y datos de prueba
- soportar ejecución selectiva y escalable
- mantener los activos de validación externalizados y mantenibles
- facilitar futura expansión a otros dominios

---

## 2. Principios de diseño

- **Separación de responsabilidades**
- **Activos de validación reutilizables**
- **Diseño legible de features**
- **Cobertura de escenarios positivos y negativos**
- **Flexibilidad de ejecución mediante runners y tags**
- **Organización escalable del proyecto**

---

## 3. Flujo de alto nivel

```text
Runner (JUnit 5 / Paralelo)
   ↓
Features de Karate
   ↓
Data, helpers, schemas y responses reutilizables
   ↓
Ejecución contra la API ServeRest
   ↓
Reportes en target/karate-reports
```

---

## 4. Responsabilidad de carpetas

### `runner/`

Contiene los puntos de entrada de ejecución:

- un runner estándar de Karate con JUnit 5
- un runner paralelo de Karate

### `features/`

Contiene los feature files enfocados en el dominio API de Usuarios y Login.

### `data/`

Contiene activos reutilizables de datos de prueba.

### `helpers/`

Contiene lógica de soporte y utilitarios para datos dinámicos.

### `schemas/`

Contiene esquemas JSON reutilizables para validación de respuestas.

### `responses/`

Contiene payloads de respuestas esperadas externalizadas.

### `karate-config.js`

Contiene la configuración centralizada de ejecución de Karate.

---

## 5. Estrategia de runners

El proyecto soporta dos estrategias complementarias de ejecución:

- **Runner estándar** → para ejecución regular con JUnit 5
- **Runner paralelo** → para ejecución más rápida con 5 hilos, generación de reportes y salidas estructuradas

Esto hace que la suite sea más útil tanto para desarrollo como para futuras integraciones CI.

---

## 6. Estrategia de validación

La validación está diseñada para ser reutilizable y mantenible mediante:

- JSON schemas externalizados
- contratos reutilizables de respuestas
- activos modulares de datos
- aserciones positivas y negativas

---

## 7. Estrategia de reportería

El framework genera reportes en:

```text
target/karate-reports/
```

El runner paralelo también genera:

- JUnit XML
- Cucumber JSON

Esto mejora la trazabilidad y facilita la integración posterior con CI.

---

## 8. Notas de escalabilidad

La estructura actual es adecuada para crecer hacía:

- más dominios API
- estrategias más avanzadas de tagging
- librerías más ricas de helpers compartidos
- integración con pipelines CI/CD
- patrones más sólidos de datos de prueba
