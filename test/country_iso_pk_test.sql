-- Unit test: country_iso primary key integrity
-- Verifies uniqueness and NOT NULL of the natural primary key country_code.
-- Expected result: PASS on every row.

SELECT 'country_iso.pk_unique'      AS test_name,
       CASE WHEN count(*) = count(DISTINCT country_code)
            THEN 'PASS' ELSE 'FAIL' END AS result
FROM nov26_experiments.nov26_main.country_iso
UNION ALL
SELECT 'country_iso.pk_not_null'   AS test_name,
       CASE WHEN count(*) = count(country_code)
            THEN 'PASS' ELSE 'FAIL' END AS result
FROM nov26_experiments.nov26_main.country_iso;
