# Guía de contribución

<p align="center">
  <a href="./README.es.md">⬅ Volver al README (Español)</a> •
  <a href="./README.md">⬅ Go to README in English</a> •
  <a href="./CONTRIBUTING.md">🇺🇸 View this guide in English</a>
</p>

Gracias por tu interés en contribuir.

Este proyecto busca preservar una arquitectura de automatización API con Karate que sea modular, mantenible y legible.

---

## 1. Principios de contribución

Procura que tus contribuciones sigan estos principios:

- legibilidad primero
- mantenibilidad por encima de atajos
- activos de validación reutilizables en lugar de duplicación
- separación clara entre runners, features, data, schemas y helpers
- actualización de documentación cuando cambia el comportamiento de ejecución

---

## 2. Tipos de contribución útiles

- nuevos escenarios API
- mayor cobertura de schemas
- mejoras en helpers reutilizables
- abstracciones más ricas de responses/data
- mejoras de documentación
- mejoras en runners o estrategia de ejecución
- mejoras orientadas a CI/CD

---

## 3. Flujo sugerido

1. Haz fork del repositorio
2. Crea una rama dedicada
3. Implementa el cambio con alcance claro
4. Actualiza documentación si aplica
5. Valida localmente con el runner apropiado
6. Abre un pull request con una explicación clara

---

## 4. Sugerencia de nombres de rama

```bash
feature/add-login-coverage
fix/improve-user-schema-validation
docs/update-karate-readme
chore/refactor-test-data-assets
```

---

## 5. Expectativas para un Pull Request

Un buen pull request debería explicar:

- qué cambió
- por qué cambió
- endpoints o flujos impactados
- cómo se validó
- si se actualizó documentación

---

## 6. Responsabilidades de documentación

Actualiza los archivos relevantes cuando corresponda:

- `README.md` / `README.es.md`
- `docs/COMMANDS*.md`
- `docs/ENVIRONMENT*.md`
- `docs/ARCHITECTURE*.md`
- `CHANGELOG*.md`

---

## 7. Guías de estilo de automatización

Prácticas recomendadas:

- mantener los features legibles y enfocados
- mantener los schemas reutilizables y externalizados
- mantener las respuestas esperadas separadas de la lógica del feature cuando aporte claridad
- usar helpers y activos de datos para reducir duplicación
- preservar claridad entre runners (estándar vs paralelo)
- mantener los tags consistentes y significativos

---

## 8. Nota final

Las mejores contribuciones mejoran el framework sin volver más difícil la ejecución, validación o mantenibilidad con el tiempo.
