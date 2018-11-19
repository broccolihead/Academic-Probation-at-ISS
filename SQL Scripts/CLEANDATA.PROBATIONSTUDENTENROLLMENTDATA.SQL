CREATE TABLE CLEANDATA.PROBATIONSTUDENTENROLLMENTDATA AS 
SELECT
    idnumber,
    term_start,
    CAST(credits AS NUMBER) AS credits,
    status,
    sub_status
FROM
    rawdata.probationstudentenrollmentdata;
