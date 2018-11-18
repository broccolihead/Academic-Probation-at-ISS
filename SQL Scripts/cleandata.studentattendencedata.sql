CREATE TABLE cleandata.studentattendencedata
    AS
        SELECT
            CAST(idnumber AS VARCHAR2(30)) AS idnumber,
            eventname,
            eventdate,
            location,
            notes,
            attended
        FROM
            rawdata.studentattendencedata;
