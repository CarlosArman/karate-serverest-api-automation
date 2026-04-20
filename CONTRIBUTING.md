# Contributing Guide

<p align="center">
  <a href="./README.md">⬅ Back to README (English)</a> •
  <a href="./README.es.md">⬅ Ir al README en Español</a> •
  <a href="./CONTRIBUTING.es.md">🇪🇸 Ver esta guía en Español</a>
</p>

Thank you for your interest in contributing.

This project aims to preserve a modular, maintainable, and readable API automation architecture with Karate.

---

## 1. Contribution Principles

Please keep contributions aligned with these principles:

- readability first
- maintainability over shortcuts
- reusable validation assets over duplication
- clear separation between runners, features, data, schemas, and helpers
- documentation updates when execution behavior changes

---

## 2. Useful Contribution Types

- new API scenarios
- stronger schema coverage
- reusable helper improvements
- richer response/data abstractions
- documentation improvements
- runner or execution strategy improvements
- CI/CD-oriented enhancements

---

## 3. Suggested Workflow

1. Fork the repository
2. Create a dedicated branch
3. Implement the change with a clear scope
4. Update documentation if needed
5. Validate locally with the appropriate runner
6. Open a pull request with a clear explanation

---

## 4. Branch Naming Suggestions

```bash
feature/add-login-coverage
fix/improve-user-schema-validation
docs/update-karate-readme
chore/refactor-test-data-assets
```

---

## 5. Pull Request Expectations

A good pull request should explain:

- what changed
- why it changed
- impacted endpoints or flows
- how it was validated
- whether documentation was updated

---

## 6. Documentation Responsibilities

Update the relevant files when appropriate:

- `README.md` / `README.es.md`
- `docs/COMMANDS*.md`
- `docs/ENVIRONMENT*.md`
- `docs/ARCHITECTURE*.md`
- `CHANGELOG*.md`

---

## 7. Automation Style Guidelines

Recommended practices:

- keep feature files business-readable and focused
- keep schemas reusable and externalized
- keep expected responses separated from feature logic when useful
- use helpers and data assets to reduce duplication
- preserve runner clarity (standard vs parallel)
- keep tags consistent and meaningful

---

## 8. Final Note

The best contributions improve the framework without making execution, validation, or maintenance harder over time.
