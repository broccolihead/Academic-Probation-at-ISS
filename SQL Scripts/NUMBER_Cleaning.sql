NULL to 0
SELECT DISTINCT
    'UPDATE CLEANDATA.'
    || table_name
    || '  SET '
    || column_name
    || ' = '
    || '0'
    || ' WHERE '
     || column_name
      || ' IS NULL;'
FROM
    all_tab_columns
WHERE
    owner = 'CLEANDATA'
    AND data_type = 'NUMBER';
