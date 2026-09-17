# CLAUDE.md — pet-connect-be-ai

REST API for managing PetConnect. Stack: NestJS. Architecture: Layered
(`domain` / `application` / `infrastructure` / `presentation`).

## Dependency rule

Dependencies point inward only, toward `domain`. A layer may import from
itself and from layers strictly below it in this order:

```
presentation → application → domain
infrastructure → application → domain
```

- `domain`: no imports from any other layer. No NestJS, no ORM, no HTTP.
- `application`: may import `domain`. Defines use cases and ports
  (interfaces) that `infrastructure` implements. Must not import
  `infrastructure` or `presentation`.
- `infrastructure`: may import `application` and `domain` (to implement
  ports). Must not import `presentation`.
- `presentation`: may import `application` and `domain`. Must not import
  `infrastructure` directly — only through DI tokens wired in modules.

If a change requires breaking this rule, stop and raise it instead of
importing across the boundary.

## Conventions

- One feature per module; each module keeps its own
  `domain/application/infrastructure/presentation` subfolders once code
  is added.
- Ports (interfaces) live in `application`; adapters implementing them
  live in `infrastructure`.
- DTOs and validation live in `presentation`; domain entities/value
  objects never leak HTTP or ORM concerns.
- File naming: `*.entity.ts` (domain), `*.use-case.ts` / `*.port.ts`
  (application), `*.repository.ts` / `*.adapter.ts` (infrastructure),
  `*.controller.ts` / `*.dto.ts` (presentation).

## Commands

```
make dev       # start the app in watch mode
make test      # run the test suite
make migrate   # run database migrations
```
