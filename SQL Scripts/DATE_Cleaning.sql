DATE
NULL to ’01-JAN-1900’
SELECT DISTINCT
    'UPDATE CLEANDATA.'
    || table_name
    || '  SET '
    || column_name
    || ' = '
    || '''01-JAN-1900'''
    || ' WHERE '
     || column_name
      || ' IS NULL;'
FROM
    all_tab_columns
WHERE
    owner = 'CLEANDATA'
    AND data_type = 'DATE';
