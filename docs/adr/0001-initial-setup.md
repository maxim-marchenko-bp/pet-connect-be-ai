# ADR 0001: Initial setup — NestJS with layered architecture

## Status

Accepted

## Context

We are starting a REST API for PetConnect. We need a project structure
that separates business rules from framework and infrastructure
concerns, so the codebase stays testable and maintainable as it grows.

## Decision

- Use NestJS as the application framework.
- Organize the codebase as a layered architecture with four layers:
  `domain`, `application`, `infrastructure`, `presentation`.
- Enforce a strict dependency rule: dependencies point inward, toward
  `domain`; `infrastructure` and `presentation` never depend on each
  other directly.

## Consequences

- Business logic in `domain`/`application` can be unit-tested without
  NestJS, a database, or HTTP.
- Swapping infrastructure (e.g. database, external services) requires
  changes only in `infrastructure`, behind existing ports.
- Slightly more upfront structure than a flat NestJS module layout, in
  exchange for clearer boundaries as the project grows.
