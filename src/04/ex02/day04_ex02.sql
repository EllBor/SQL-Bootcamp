CREATE VIEW v_generated_dates AS
SELECT '2022-01-01'::DATE + i AS generated_date
FROM generate_series(0, 30) AS i
ORDER BY generated_date;