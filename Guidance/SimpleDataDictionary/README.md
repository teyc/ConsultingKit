# Simple Data Dictionary Validator

I sometimes come across large databases where consistency is gone, and it doesn't take much. Sometimes,
one new engineer may use "last_modified" when the pattern is "last_modified_date" for their set of tables,
and soon enough there'd be confusion which is the correct form.

Another one may be casing, "FirstName" vs `first_name`, or even terms like `surname` vs `lastname`. One
organisation I worked had deprecated `surname` in favour of `lastname` but old code remains,
and when new engineers onboard, there's naturally confusion.

Many of these problems are addressed through proper governance and tools. There are treasure[^1] troves[^2] of[^3]
guidance around naming conventions.

However, for agile projects, I propose a `linter` to inspect the data.

# Basic metadata tables

## _glosssary

The glossary table contains a list of valid words and invalid words in the system. This prevents new words being introduced for existing concepts.

e.g.

| term      | is_valid | synonyms | abbr | notes
|-----------|----------|----------|------|---------
| last_name | Y        | surname, family_name |
| surname   | N        |          |      | use last_name instead

## _abbreviation

Abbreviations may have to be used to when there are character limitations
A good standard would identify how abbreviation rules are applied. For instance
`customer_birth_city_last_modified` may be abbreviation as `customer_birth_city_lm`

| abbr | full
|------|----------------
| lm   |  last_modified

# Reference data tables

Reference data table should have the following rules

1. effective_from column

2. effective_until column


[^1]: [Naming conventions - Panoply](https://blog.panoply.io/data-warehouse-naming-conventions)

[^2]: [DataLake Warehouse Naming Convention](https://gbanhudo.medium.com/data-lakehouse-warehouse-naming-conventions-d5adef6fbbe2)

[^3]: [What's in a name? - Kimball](https://www.kimballgroup.com/2014/07/design-tip-168-whats-name/)
