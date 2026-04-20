# Guía de entorno

<p align="center">
  <a href="../README.es.md">⬅ Volver al README (Español)</a> •
  <a href="../README.md">⬅ Go to README in English</a> •
  <a href="./ENVIRONMENT.md">🇺🇸 View this guide in English</a>
</p>

Este documento explica el entorno local de ejecución requerido para el proyecto Karate ServeRest API Automation.

---

## 1. Herramientas requeridas

Debes tener instalado:

- **Java**
- **Maven**
- un entorno local compatible para ejecutar pruebas JUnit 5 con Karate

La documentación actual del proyecto también hace referencia a:

- **Karate DSL**
- **JUnit 5**
- **DataFaker**

---

## 2. Verificación recomendada

```bash
java -version
mvn -version
```

---

## 3. API bajo prueba

La API bajo prueba es **ServeRest**.

Documentación en inglés:

```text
https://serverest.dev/?lang=en
```

Documentación en español:

```text
https://serverest.dev/?lang=es
```

---

## 4. Flujo común de ejecución local

```bash
mvn clean install
mvn test
```

---

## 5. Nota sobre ejecución paralela

El proyecto incluye un runner paralelo que ejecuta la suite `@users` con **5 hilos**, genera reportes en `target/karate-reports` y además produce salidas **JUnit XML** y **Cucumber JSON**.

---

## 6. Recomendación práctica

Mantén el README principal enfocado en onboarding y comandos clave, y usa este archivo para el contexto de entorno y ejecución.
