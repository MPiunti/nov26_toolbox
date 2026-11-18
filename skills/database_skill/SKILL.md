---
name: database_skill
description: Database schema conventions for the nov26_toolbox project — creating and modifying tables and views, declarative SQL, natural keys, explicit constraints, and key-integrity unit tests. Read this skill whenever a DB table or view is created or modified, or keys/constraints are declared.
---

# Database Skill (nov26_toolbox)

Guidance for database schema work (tables & views) in the **nov26_toolbox** repo.

## When to use

* Creating or modifying a database table or view.
* Writing basic DB operations (filtering, joins, aggregation, simple writes).
* Declaring primary/foreign keys, constraints, or their unit tests.

## Default catalog and schema

* The project's default catalog is **nov26_experiments**; the default schema is **nov26_experiments.nov26_main**. Create all project tables/views there unless the user explicitly requests another location.
* At session start, set them with `USE CATALOG nov26_experiments;` then `USE nov26_experiments.nov26_main;` (SQL session defaults are per-session, so re-apply them every session).
* **Mandatory disclosure:** as soon as this project is in the agent context, explicitly tell the user that these defaults are in effect — name the catalog and the schema — before creating or modifying any table or view.

## Core principles

1. **Declarative SQL first.** For basic DB operations (filtering, joins, aggregation, simple writes), write declarative SQL (Spark SQL / `spark.sql`) instead of DataFrame API chains or Python loops. Reach for PySpark DataFrames only when the transformation is genuinely step-by-step and too complex to express cleanly in SQL.
2. **Explicit schemas.** When reading data without a reliable inferred schema, define one (`StructType`) or use `schema` hints instead of relying on `inferSchema`.
3. **Keep SQL readable.** Put non-trivial SQL in readable string constants or `.sql` files, never inline-fragmented across many f-strings.

## DB schema workflow (tables & views)

Steps to follow whenever a table or view is created or modified:

1. **Script location.** Store all DB creation scripts in the `db_creation/` folder of the repo — one script per table/view, named after it.
2. **Comment every field.** Create each table with a comment on every column (and on the table itself), so the schema is self-documenting.
3. **Natural primary key.** Each table has a natural primary key, declared explicitly as a PRIMARY KEY constraint, plus a UNIQUE constraint enforcing its uniqueness.
4. **Foreign keys reference natural PKs.** When a table references another table, its foreign key columns are named exactly as the primary key columns of the referenced table, and the FK is declared explicitly as a FOREIGN KEY constraint (no implicit/undocumented joins on renaming).
5. **No surrogate keys by default.** Use natural keys unless surrogate keys are explicitly requested.
6. **Key integrity is unit-tested.** For every primary key, create unit tests (aside, in the `test/` folder) that verify uniqueness and NOT NULLability of the key columns; run them whenever a table or its load logic changes.

## Checklist for schema changes

* [ ] Script lives in `db_creation/` and is named after the table/view.
* [ ] Every column and the table itself carry comments.
* [ ] Natural PK declared explicitly with PRIMARY KEY + UNIQUE constraints; no surrogate key unless explicitly requested.
* [ ] FK columns named exactly as the referenced table's PK and declared as explicit FOREIGN KEY constraints.
* [ ] PK uniqueness and NOT NULL unit tests exist in `test/` and were run after the change.