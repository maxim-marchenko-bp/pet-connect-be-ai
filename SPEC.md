# SPEC.md — pet-connect-be-ai

## Goals

- Provide a REST API for managing pets, owners, and their connections.
- Enforce a layered architecture with a clear dependency rule between
  domain, application, infrastructure, and presentation.
- Keep the codebase testable in isolation, layer by layer.

## Non-goals

- No real-time features (WebSockets, push notifications) in the initial
  scope.
- No multi-tenancy or third-party integrations yet.

## Technical decisions

- Framework: NestJS.
- Architecture pattern: Layered (domain / application / infrastructure /
  presentation), dependencies point inward.
- Persistence and other technical concerns are isolated in
  `infrastructure`, behind ports defined in `application`.

## Acceptance criteria

- Project skeleton follows the `domain/application/infrastructure/presentation`
  folder structure.
- No cross-layer import violates the dependency rule described in
  [CLAUDE.md](CLAUDE.md).
- `make dev`, `make test`, and `make migrate` are defined and runnable
  once the NestJS app is scaffolded.
