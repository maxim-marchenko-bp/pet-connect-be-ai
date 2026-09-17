# ARCHITECTURE.md

## Pattern: Layered Architecture

The codebase is organized into four layers, each in its own folder under
`src/`:

- **domain** — entities, value objects, and domain logic. Pure
  TypeScript, no framework or infrastructure dependencies.
- **application** — use cases that orchestrate domain logic, and ports
  (interfaces) describing what the application needs from the outside
  world (e.g. a repository, an email sender).
- **infrastructure** — adapters implementing application ports:
  database repositories, external API clients, file storage, etc.
- **presentation** — HTTP entry points: NestJS controllers, DTOs,
  request/response mapping, validation.

## Dependency rule

Dependencies only point inward, toward `domain`:

```
presentation ─┐
               ├──▶ application ──▶ domain
infrastructure ┘
```

- `domain` depends on nothing.
- `application` depends only on `domain`.
- `infrastructure` depends on `application` (to implement its ports) and
  `domain`.
- `presentation` depends on `application` and `domain`, and is wired to
  `infrastructure` only through NestJS dependency injection (interface
  tokens), never through direct imports.

This keeps business rules (`domain`, `application`) independent of
frameworks and technical details, so they can be tested and evolved
without touching HTTP or persistence code.
