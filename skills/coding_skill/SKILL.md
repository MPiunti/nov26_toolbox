---
name: coding_skill
description: PySpark and data engineering coding conventions and reusable patterns for the nov26_toolbox project. Read this skill when writing, reviewing, or debugging PySpark code, utilities, or notebooks in this repo.
---

# Coding Skill (PySpark / Data Engineering)

Guidance for writing and reviewing code in the **nov26_toolbox** repo. For database schema work (tables, views, keys, constraints), read the `database_skill` instead.

## When to use

* Writing or editing any PySpark code, utilities, or notebooks in this repo.
* Reviewing or debugging code added to this toolbox.
* Adding a new reusable helper or pattern.

## Core principles

1. **Prefer Spark-native operations.** Use DataFrame transformations and built-in `pyspark.sql.functions` over pandas conversions, Python UDFs, or `rdd` APIs unless there is a measured reason.
2. **Keep transformations small and composable.** Each function takes a DataFrame in, returns a DataFrame out, and does one thing. Chain helpers instead of writing monolithic pipelines.
3. **No hidden I/O inside transformation helpers.** Separate read → transform → write; helpers should be pure.
4. **Explicit schemas.** When reading data without a reliable inferred schema, define one (`StructType`) or use `schema` hints instead of relying on `inferSchema`.
5. **Python orchestrates, SQL transforms.** For query logic prefer declarative SQL (see `database_skill`); use Python to orchestrate steps, never to loop over rows.

## Conventions

* Python 3, PEP 8 naming (`snake_case` functions, no camelCase).
* Type-hint helper signatures (`def clean(df: DataFrame) -> DataFrame:`).
* One utility per module; module name matches its purpose (`dedup.py`, `io_helpers.py`, ...).
* Docstrings on every public helper: one line on what it does, one on return shape/assumptions.
* Log key steps with `logging`, never `print`.

## Reusable patterns

As the toolbox grows, add short, concrete snippets under `coding_skill/patterns/` and link them here, e.g.:

* `patterns/dedup.md` — drop duplicates by key keeping latest row
* `patterns/incremental-load.md` — incremental read with partition filters

(Pattern files are optional; create them only when a pattern is actually needed.)

## Checklist before committing code

* [ ] Runs without errors on a small sample of real data.
* [ ] No `print`, no pandas round-trips, no `.collect()` on large data.
* [ ] Helpers are typed, documented, and free of I/O.
* [ ] New patterns are captured as a linked pattern file.