-- Unit test: customer_registry key integrity
-- Verifies uniqueness and NOT NULL of the natural primary key customer_id,
-- and that no FK value is orphaned (country_code not present in country_iso).
-- Expected result: PASS on every row.

SELECT 'customer_registry.pk_unique'   AS test_name,
       CASE WHEN count(*) = count(DISTINCT customer_id)
            THEN 'PASS' ELSE 'FAIL' END AS result
FROM nov26_experiments.nov26_main.customer_registry
UNION ALL
SELECT 'customer_registry.pk_not_null' AS test_name,
       CASE WHEN count(*) = count(customer_id)
            THEN 'PASS' ELSE 'FAIL' END AS result
FROM nov26_experiments.nov26_main.customer_registry
UNION ALL
SELECT 'customer_registry.fk_no_orphans' AS test_name,
       CASE WHEN count(*) = 0
            THEN 'PASS' ELSE 'FAIL' END AS result
FROM nov26_experiments.nov26_main.customer_registry c
LEFT JOIN nov26_experiments.nov26_main.country_iso n ON c.country_code = n.country_code
WHERE n.country_code IS NULL;
