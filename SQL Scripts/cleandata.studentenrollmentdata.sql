CREATE TABLE cleandata.studentenrollmentdata
    AS
        SELECT
            idnumber,
            term,
            CAST(credits AS NUMBER) AS credits,
            status,
            sub_status
        FROM
            rawdata.studentenrollmentdata;
