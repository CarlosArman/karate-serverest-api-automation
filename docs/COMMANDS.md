# Commands Reference

<p align="center">
  <a href="../README.md">⬅ Back to README (English)</a> •
  <a href="../README.es.md">⬅ Ir al README en Español</a> •
  <a href="./COMMANDS.es.md">🇪🇸 Ver esta guía en Español</a>
</p>

This document contains the command catalog currently documented for the Karate ServeRest API automation project.

---

## 1. General Execution

### Run the full suite

```bash
mvn test
```

Runs the complete test suite.

---

## 2. Runner-Based Execution

### Standard runner

```bash
mvn test -Dtest=RunnerTest
```

Runs the suite tagged with `@users` using the standard Karate JUnit 5 runner.

### Parallel runner

```bash
mvn test -Dtest=RunnerTestParallel
```

Runs the same suite in parallel using the configured parallel runner.

> If your Maven setup requires the fully qualified class name, you can also try:
>
> ```bash
> mvn test -Dtest=runner.RunnerTest
> mvn test -Dtest=runner.RunnerTestParallel
> ```

---

## 3. Tag-Based Execution

### Run positive scenarios

```bash
mvn test -Dtest=RunnerTest -Dkarate.options="--tags @positive"
```

### Run negative scenarios

```bash
mvn test -Dtest=RunnerTest -Dkarate.options="--tags @negative"
```

### Run create-user scenarios

```bash
mvn test -Dtest=RunnerTest -Dkarate.options="--tags @create-user"
```

---

## 4. Feature-Based Execution

### Run a specific feature

```bash
mvn test -Dtest=RunnerTest -Dkarate.options="classpath:features/users/CreateUser.feature"
```

Runs a single feature directly.

---

## 5. Recommended Main Commands for `README.md`

To keep the main README clean, expose only these commands there:

```bash
mvn test
mvn test -Dtest=RunnerTest
mvn test -Dtest=RunnerTestParallel
mvn test -Dtest=RunnerTest -Dkarate.options="--tags @positive"
mvn test -Dtest=RunnerTest -Dkarate.options="classpath:features/users/CreateUser.feature"
```

---

## 6. Suggested Typical Flows

### Execute everything

```bash
mvn test
```

### Execute the standard tagged suite

```bash
mvn test -Dtest=RunnerTest
```

### Execute in parallel

```bash
mvn test -Dtest=RunnerTestParallel
```

### Execute only positive scenarios

```bash
mvn test -Dtest=RunnerTest -Dkarate.options="--tags @positive"
```
