UA_INTERNATIONAL.D_DATE
CREATE TABLE UA_INTERNATIONAL.D_DATE
    AS
        SELECT
            *
        FROM
            STAGE.D_DATE;
UA_INTERNATIONAL.D_STATE
CREATE TABLE UA_INTERNATIONAL.D_STATE
    AS
        SELECT
            *
        FROM
            STAGE.D_STATE;
UA_INTERNATIONAL. D_TERM
CREATE TABLE UA_INTERNATIONAL.D_TERM
    AS
        SELECT
            *
        FROM
            STAGE.D_TERM;
UA_INTERNATIONAL. D_TRANSFER_UNIVERSITY
CREATE TABLE UA_INTERNATIONAL.D_TRANSFER_UNIVERSITY
    AS
        SELECT
            *
        FROM
            STAGE.D_TRANSFER_UNIVERSITY;
=================================================
UA_INTERNATIONAL. D_RELATION
CREATE TABLE ua_international.d_relation
    AS
        SELECT
            ua_intl_id_seq.NEXTVAL AS relation_id,
            relation
        FROM
            (
                SELECT DISTINCT
                    relation   AS relation
                FROM
                    cleandata.studentemergencycontact_c
            );
UA_INTERNATIONAL. D_REASONFORVISIT
CREATE TABLE ua_international.d_reasonforvisit
    AS
        SELECT
            ua_intl_id_seq.NEXTVAL AS reasonforvisit_id,
            reasonforvisit
        FROM
            (
                SELECT DISTINCT
                    reasonforvisit   AS reasonforvisit
                FROM
                    cleandata.studentcheckindatabyyear_c
            );
UA_INTERNATIONAL. D_ SUB_STATUS
CREATE TABLE ua_international.d_sub_status
    AS
        SELECT
            ua_intl_id_seq.NEXTVAL AS sub_status_id,
            sub_status
        FROM
            (
                SELECT DISTINCT
                    sub_status   AS sub_status
                FROM
                    cleandata.studentenrollmentdata_c
            );
UA_INTERNATIONAL. D_STATUS
CREATE TABLE ua_international.d_status
    AS
        SELECT
            ua_intl_id_seq.NEXTVAL AS status_id,
            status
        FROM
            (
                SELECT DISTINCT
                    a.status   AS status
                FROM
                    cleandata.studentenrollmentdata_c a
            );
UA_INTERNATIONAL.D_LOCATION
CREATE TABLE ua_international.d_location
    AS
        SELECT
            ua_intl_id_seq.NEXTVAL AS location_id,
            location
        FROM
            (
                SELECT DISTINCT
                    location   AS location
                FROM
                    cleandata.studentattendencedata_c
            );
UA_INTERNATIONAL.D_CHECKIN
CREATE TABLE ua_international.d_checkin
    AS
        SELECT
            ua_intl_id_seq.NEXTVAL AS checkin_id,
            idnumber,
            checkedin_date,
            reasonforvisit_id
        FROM
            (
                SELECT DISTINCT
                    a.idnumber   AS idnumber, 
                    a.datecheckedin   AS checkedin_date,
                    b.reasonforvisit_id
                FROM
                    cleandata.studentcheckindatabyyear_c a
                    INNER JOIN ua_international.d_reasonforvisit b ON a.reasonforvisit = b.reasonforvisit
            );
UA_INTERNATIONAL.D_TRANSFER_UNI_SEVIS
CREATE TABLE ua_international.d_transfer_uni_sevis
    AS
        SELECT
            ua_intl_id_seq.NEXTVAL AS transfer_uni_sevis_id,
            idnumber,
            sevis_release_date,
            university_id
        FROM
            (
                SELECT DISTINCT
                    a.idnumber             AS idnumber,
                    a.sevis_release_date   AS sevis_release_date,
                    b.university_id
                FROM
                    cleandata.studenttransferdata_c a
                    INNER JOIN ua_international.d_transfer_university b ON a.institution = b.university_name
            );
UA_INTERNATIONAL.D_EMERGENCY_CONTACT
CREATE TABLE ua_international.d_emergency_contact
    AS
        SELECT
            ua_intl_id_seq.NEXTVAL AS emergency_contact_id,
            idnumber,
            type,
            relation_id,
            state_cd
        FROM
            (
                SELECT DISTINCT
                    a.idnumber   AS idnumber,
                    a.type       AS type,
                    b.relation_id,
                    c.state_cd
                FROM
                    cleandata.studentemergencycontact_c a
                    INNER JOIN ua_international.d_relation b ON a.relation = b.relation
                    INNER JOIN ua_international.d_state c ON a.state = c.state_cd
            );
UA_INTERNATIONAL.D_EVENT
CREATE TABLE ua_international.d_event
    AS
        SELECT
            ua_intl_id_seq.NEXTVAL AS event_id,
            idnumber,
            eventname,
            CAST(eventdate AS DATE) eventdate ,
            notes,
            attended,
            location_id
        FROM
            (
                SELECT DISTINCT
                    a.idnumber AS idnumber,
                    a.eventname AS eventname,
                    TO_DATE(a.eventdate,'MM/DD/YYYY') AS eventdate,
                    a.notes,
                    a.attended,
                    b.location_id
                FROM
                    cleandata.studentattendencedata_c a
                    INNER JOIN ua_international.d_location b ON a.location = b.location
            );

            UA_INTERNATIONAL.STUDENT_ID
CREATE TABLE ua_international.student_id
    AS
        SELECT DISTINCT
            idnumber
        FROM
            cleandata.studentattendencedata_c
        UNION
        SELECT DISTINCT
            idnumber
        FROM
            cleandata.studentcheckindatabyyear_c
        UNION
        SELECT DISTINCT
            idnumber
        FROM
            cleandata.studentemergencycontact_c
        UNION
        SELECT DISTINCT
            idnumber
        FROM
            cleandata.studentenrollmentdata_c
        UNION
        SELECT DISTINCT
            idnumber
        FROM
            cleandata.studenttransferdata_c;


Fact: ua_international.f_student
CREATE TABLE ua_international.f_student
    AS
        SELECT DISTINCT
            nvl(AA.idnumber,999999999) AS idnumber,
            nvl(b.term_cd,999999999) AS term_cd,
            nvl(c.status_id,999999999) AS status_id,
            nvl(d.sub_status_id,999999999) AS sub_status_id,
            nvl(e.checkin_id,999999999) AS checkin_id,
            nvl(h.emergency_contact_id,999999999) AS emergency_contact_id,
            nvl(m.event_id,999999999) AS event_id,
            nvl(p.transfer_uni_sevis_id,999999999) AS transfer_uni_sevis_id,
            nvl(a.credits,0) AS credits
        FROM
            ua_international.student_id AA
             LEFT JOIN cleandata.studentenrollmentdata_c a ON AA.idnumber = a.idnumber
            LEFT JOIN ua_international.d_term b ON a.term = b.term_ld
            LEFT JOIN ua_international.d_status c ON a.status = c.status
            LEFT JOIN ua_international.d_sub_status d ON a.sub_status = d.sub_status
            LEFT JOIN ua_international.d_checkin e ON AA.idnumber = e.idnumber
            LEFT JOIN cleandata.studentcheckindatabyyear_c f ON e.checkedin_date = f.datecheckedin
            LEFT JOIN ua_international.d_reasonforvisit g ON e.reasonforvisit_id = g.reasonforvisit_id
            LEFT JOIN ua_international.d_emergency_contact h ON AA.idnumber = h.idnumber
            LEFT JOIN ua_international.d_relation j ON h.relation_id = j.relation_id
            LEFT JOIN ua_international.d_state k ON h.state_cd = k.state_cd
            LEFT JOIN ua_international.d_event m ON AA.idnumber = m.idnumber
            LEFT JOIN cleandata.studentattendencedata_c n ON m.eventdate = n.eventdate
            LEFT JOIN ua_international.d_location o ON m.location_id = o.location_id
            LEFT JOIN ua_international.d_transfer_uni_sevis p ON AA.idnumber = p.idnumber
            LEFT JOIN cleandata.studenttransferdata_c q ON p.sevis_release_date = q.sevis_release_date
            LEFT JOIN ua_international.d_transfer_university r ON r.university_id = p.university_id
        ORDER BY
            idnumber,
            term_cd,
            status_id,
            sub_status_id,
            checkin_id,
            emergency_contact_id,
            event_id,
            transfer_uni_sevis_id,
            credits;
