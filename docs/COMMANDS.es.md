# Referencia de comandos

<p align="center">
  <a href="../README.es.md">⬅ Volver al README (Español)</a> •
  <a href="../README.md">⬅ Go to README in English</a> •
  <a href="./COMMANDS.md">🇺🇸 View this guide in English</a>
</p>

Este documento contiene el catálogo de comandos actualmente documentado para el proyecto Karate ServeRest API Automation.

---

## 1. Ejecución general

### Ejecutar toda la suite

```bash
mvn test
```

Ejecuta toda la suite de pruebas.

---

## 2. Ejecución por runner

### Runner estándar

```bash
mvn test -Dtest=RunnerTest
```

Ejecuta la suite etiquetada con `@users` usando el runner estándar de Karate con JUnit 5.

### Runner paralelo

```bash
mvn test -Dtest=RunnerTestParallel
```

Ejecuta la misma suite en paralelo usando el runner configurado.

> Si tu configuración de Maven requiere el nombre completo de la clase, también puedes probar:
>
> ```bash
> mvn test -Dtest=runner.RunnerTest
> mvn test -Dtest=runner.RunnerTestParallel
> ```

---

## 3. Ejecución por tags

### Ejecutar escenarios positivos

```bash
mvn test -Dtest=RunnerTest -Dkarate.options="--tags @positive"
```

### Ejecutar escenarios negativos

```bash
mvn test -Dtest=RunnerTest -Dkarate.options="--tags @negative"
```

### Ejecutar escenarios de creación de usuario

```bash
mvn test -Dtest=RunnerTest -Dkarate.options="--tags @create-user"
```

---

## 4. Ejecución por feature

### Ejecutar un feature específico

```bash
mvn test -Dtest=RunnerTest -Dkarate.options="classpath:features/users/CreateUser.feature"
```

Ejecuta directamente un único feature.

---

## 5. Comandos recomendados para `README.md`

Para mantener limpio el README principal, muestra solo estos comandos allí:

```bash
mvn test
mvn test -Dtest=RunnerTest
mvn test -Dtest=RunnerTestParallel
mvn test -Dtest=RunnerTest -Dkarate.options="--tags @positive"
mvn test -Dtest=RunnerTest -Dkarate.options="classpath:features/users/CreateUser.feature"
```

---

## 6. Flujos típicos sugeridos

### Ejecutar todo

```bash
mvn test
```

### Ejecutar la suite estándar etiquetada

```bash
mvn test -Dtest=RunnerTest
```

### Ejecutar en paralelo

```bash
mvn test -Dtest=RunnerTestParallel
```

### Ejecutar solo escenarios positivos

```bash
mvn test -Dtest=RunnerTest -Dkarate.options="--tags @positive"
```
