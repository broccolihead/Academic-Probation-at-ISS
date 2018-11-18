LTRIM and RTRIM
SELECT DISTINCT
    'UPDATE CLEANDATA.'
    || table_name
    || '  SET '
    || column_name
    || ' = '
    || 'LTRIM(RTRIM('
    || column_name
    || '))'
    || ';'
FROM
    all_tab_columns
WHERE
    owner = 'CLEANDATA'
    AND data_type = 'VARCHAR2';
O/p:
UPDATE cleandata.probationstatusfall2012prsnt_c
SET
    acadstandingstatus = ltrim(rtrim(acadstandingstatus) );

NULL Handling NULL to ‘-’
SELECT DISTINCT
    'UPDATE CLEANDATA.'
    || table_name
    || '  SET '
    || column_name
    || ' = '
    || '''-'''
    || ' WHERE '
     || column_name
      || ' IS NULL;'
FROM
    all_tab_columns
WHERE
    owner = 'CLEANDATA'
    AND data_type = 'VARCHAR2';
