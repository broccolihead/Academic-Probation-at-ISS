Remove DUPLICATES in Data
Use SELECT DISTINCT And recreate tables with suffix “_C”
CREATE TABLE cleandata.probationstatusfall2012prsnt_C
AS SELECT
DISTINCT
    idnumber,
    termdescription,
    acadstandingaction,
    acadstandingstatus,
    acadstandingdate
FROM
    cleandata.probationstatusfall2012prsnt_C;
