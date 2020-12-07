drop table if exists patient cascade;
drop table if exists doctor cascade;
drop table if exists prescription cascade;
drop table if exists contracts cascade;
drop table if exists pharmacy cascade;
drop table if exists company cascade;
drop table if exists drug cascade;
drop table if exists pharmacy_prices  cascade;
drop table if exists doctor_patients cascade;

create table doctor (
    id_doctor integer primary key auto_increment,
    ssn_doctor integer not null,
    name_doc varchar(65) not null,
    specialty varchar(65) not null,
    experience_years integer not null
);

create table patient (
    id_patient integer primary key auto_increment,
    ssn_patient integer not null,
    name_patient varchar(65) not null,
    age integer not null,
    address varchar(65) not null
);

create table pharmacy (
    id_pharmacy integer primary key auto_increment,
    name_pharmacy varchar(65) not null,
    address varchar(65) not null,
    phone varchar(22) not null
);

create table company (
    id_company integer primary key auto_increment,
    name_company varchar(65),
    phone varchar(22)
);

create table contracts (
    supervisor varchar(65) not null,
    id_company integer not null,
    id_pharmacy integer not null,
    start_date date not null,
    end_date date not null,
    contract varchar(500) not null,
    foreign key (id_company) references company(id_company),
    foreign key (id_pharmacy) references pharmacy(id_pharmacy)
);

create table drug (
    id_drug integer primary key auto_increment,
    name_trade varchar(65)  not null,
    formula varchar(65) not null,
    id_company integer not null,
    foreign key (id_company) references company(id_company)
);

create table prescription (
    id_prescription integer primary key auto_increment,
    expiration date,
    prescribed_date date not null,
    id_doctor integer not null,
    id_patient integer not null,
    filled boolean,
    date_filled date,
    id_pharmacy integer,
    id_drug integer,
    foreign key (id_drug) references drug(id_drug),
    foreign key (id_doctor) references doctor(id_doctor),
    foreign key (id_patient) references patient(id_patient),
    foreign key (id_pharmacy) references pharmacy(id_pharmacy)
);

create table pharmacy_prices (
    id_pharmacy integer not null,
    id_drug integer,
    price float not null,
    foreign key (id_drug) references drug(id_drug),
    foreign key (id_pharmacy) references pharmacy(id_pharmacy)
);

create table doctor_patients (
    id_doctor integer,
    id_patient integer,
    primary_doc boolean,
    foreign key (id_doctor) references Doctor(id_doctor),
    foreign key (id_patient) references Patient(id_patient)
);

-- Inserting doctor data

insert into doctor(ssn_doctor, name_doc, specialty, experience_years) values (1000000, 'Peter', 'Physician', 9);
insert into doctor(ssn_doctor, name_doc, specialty, experience_years) values (1000001, 'Robert', 'Optometrists', 21);
insert into doctor(ssn_doctor, name_doc, specialty, experience_years) values (1000002, 'Jennifer', 'Surgeon', 15);
insert into doctor(ssn_doctor, name_doc, specialty, experience_years) values (1000003, 'Kimberly', 'Cardiologist', 7);
insert into doctor(ssn_doctor, name_doc, specialty, experience_years) values (1000004, 'Lily', 'Physician', 17);
insert into doctor(ssn_doctor, name_doc, specialty, experience_years) values (1000005, 'Carlos', 'Pulmonologist', 12);
insert into doctor(ssn_doctor, name_doc, specialty, experience_years) values (1100000, 'Peter', 'Physician', 16);
insert into doctor(ssn_doctor, name_doc, specialty, experience_years) values (1100001, 'Carlos', 'Cardiologist', 22);

-- inserting patient data

insert into patient(ssn_patient, name_patient, age, address) values (1000006, 'Michelle', 34, '0000 This Street st.');
insert into patient(ssn_patient, name_patient, age, address) values (1000007, 'Michael', 25, '0001 This Street st.');
insert into patient(ssn_patient, name_patient, age, address) values (1000008, 'Monty', 54, '0002 This Street st.');
insert into patient(ssn_patient, name_patient, age, address) values (1000009, 'Myles', 42, '0003 This Street st.');
insert into patient(ssn_patient, name_patient, age, address) values (1000010, 'Maya', 32, '0004 This Street st.');
insert into patient(ssn_patient, name_patient, age, address) values (1000011, 'Milo', 22, '0005 This Street st.');
insert into patient(ssn_patient, name_patient, age, address) values (1000012, 'Mike', 54, '0006 This Street st.');
insert into patient(ssn_patient, name_patient, age, address) values (1000013, 'Matthew', 43, '0007 This Street st.');

-- inserting pharmacy data

insert into pharmacy(name_pharmacy, address, phone) values ('Chain Name at City1 by That Street', '0000 That Street st.', '(001)000-0001');
insert into pharmacy(name_pharmacy, address, phone) values ('Chain Name Rx at City1 by That Street', '0001 That Street st.', '(001)000-0002');
insert into pharmacy(name_pharmacy, address, phone) values ('Chain Name Phar. at City1 by That Street', '0002 That Street st.', '(001)000-0003');
insert into pharmacy(name_pharmacy, address, phone) values ('Chain Name by That Street', '0003 That Street st.', '(001)000-0004');
insert into pharmacy(name_pharmacy, address, phone) values ('Chain Name local to That Street', '0004 That Street st.', '(001)000-0005');
insert into pharmacy(name_pharmacy, address, phone) values ('City1"s Chain Name', '0005 That Street st.', '(001)000-0006');

-- inserting company data

insert into company(name_company, phone) values ('Company1', '(100)000-0001');
insert into company(name_company, phone) values ('Company2', '(100)000-0002');
insert into company(name_company, phone) values ('Company3', '(100)000-0003');
insert into company(name_company, phone) values ('Company4', '(100)000-0004');
insert into company(name_company, phone) values ('Company5', '(100)000-0005');
insert into company(name_company, phone) values ('Company6', '(100)000-0006');

-- inserting contracts data

insert into contracts values ('Thomas', 1, 2, TO_DATE('17/12/2015', 'DD/MM/YYYY'), TO_DATE('17/12/2016', 'DD/MM/YYYY'), 'Selling bulk quantities of the company"s drug at half price.');
insert into contracts values ('Alexander', 2, 1, TO_DATE('11/02/2017', 'DD/MM/YYYY'), TO_DATE('17/06/2019', 'DD/MM/YYYY'), 'Trial run of drug to see market. REDUCED PRICE');
insert into contracts values ('Albert M.', 3, 1, TO_DATE('01/03/2018', 'DD/MM/YYYY'), TO_DATE('19/07/2020', 'DD/MM/YYYY'), 'Drug replacement of brand A for brand B');
insert into contracts values ('Jesus P.', 1, 2, TO_DATE('10/03/2019', 'DD/MM/YYYY'), TO_DATE('12/09/2021', 'DD/MM/YYYY'), 'Drug purchase on bulk. Decreasing price after amount x.');
insert into contracts values ('Martha E.', 1, 3, TO_DATE('04/10/2016', 'DD/MM/YYYY'), TO_DATE('04/11/2016', 'DD/MM/YYYY'), 'Sample run of drug. No cost.');
insert into contracts values ('Angle McMack', 2, 3, TO_DATE('12/12/2019', 'DD/MM/YYYY'), TO_DATE('10/07/2022', 'DD/MM/YYYY'), 'Bulk selling of drug P. Standard pricing.');
insert into contracts values ('Mike P.', 4, 1, TO_DATE('12/12/2019', 'DD/MM/YYYY'), TO_DATE('10/07/2028', 'DD/MM/YYYY'), 'Trial run.');

-- inserting drug data

insert into drug(name_trade, formula, id_company) values ('drug1', 'formula1', 1);
insert into drug(name_trade, formula, id_company) values ('drug2', 'formula2', 2);
insert into drug(name_trade, formula, id_company) values ('drug3', 'formula3', 3);
insert into drug(name_trade, formula, id_company) values ('drug4', 'formula4', 2);
insert into drug(name_trade, formula, id_company) values ('drug5', 'formula5', 1);
insert into drug(name_trade, formula, id_company) values ('drug6', 'formula6', 1);
insert into drug(name_trade, formula, id_company) values ('drug7', 'formula7', 4);

-- inserting prescription data

insert into prescription(expiration, id_doctor, id_patient, filled, prescribed_date,date_filled, id_pharmacy, id_drug) values (TO_DATE('12/08/2021', 'DD/MM/YYYY'), 2, 3, TRUE, TO_DATE('12/08/2020', 'DD/MM/YYYY'),TO_DATE('13/08/2020', 'DD/MM/YYYY'), 2, 2);
insert into prescription(expiration, id_doctor, id_patient, filled, prescribed_date, date_filled, id_pharmacy, id_drug) values (TO_DATE('12/09/2020', 'DD/MM/YYYY'), 3, 3, TRUE, TO_DATE('12/09/2020', 'DD/MM/YYYY'), TO_DATE('13/09/2019', 'DD/MM/YYYY'), 3, 1);
insert into prescription(expiration, id_doctor, id_patient, filled, prescribed_date, date_filled, id_pharmacy, id_drug) values (NULL, 1, 2, FALSE,TO_DATE('10/06/2019', 'DD/MM/YYYY'), NULL, NULL, 3);
insert into prescription(expiration, id_doctor, id_patient, filled, prescribed_date, date_filled, id_pharmacy, id_drug) values (TO_DATE('12/09/2019', 'DD/MM/YYYY'), 2, 4, TRUE,TO_DATE('20/11/2019', 'DD/MM/YYYY'), TO_DATE('13/12/2019', 'DD/MM/YYYY'), 3, 1);
insert into prescription(expiration, id_doctor, id_patient, filled, prescribed_date, date_filled, id_pharmacy, id_drug) values (TO_DATE('06/05/2022', 'DD/MM/YYYY'), 4, 3, TRUE, TO_DATE('10/10/2019', 'DD/MM/YYYY'), TO_DATE('11/10/2019', 'DD/MM/YYYY'), 1, 3);
insert into prescription(expiration, id_doctor, id_patient, filled, prescribed_date, date_filled, id_pharmacy, id_drug) values (TO_DATE('12/09/2020', 'DD/MM/YYYY'), 3, 4, TRUE,TO_DATE('12/09/2019', 'DD/MM/YYYY'), TO_DATE('17/09/2019', 'DD/MM/YYYY'), 1, 2);
insert into prescription(expiration, id_doctor, id_patient, filled, prescribed_date, date_filled, id_pharmacy, id_drug) values (TO_DATE('12/10/2020', 'DD/MM/YYYY'), 4, 5, TRUE,TO_DATE('15/12/2019', 'DD/MM/YYYY'), TO_DATE('15/12/2019', 'DD/MM/YYYY'), 3, 3);
insert into prescription(expiration, id_doctor, id_patient, filled, prescribed_date, date_filled, id_pharmacy, id_drug) values (TO_DATE('12/09/2020', 'DD/MM/YYYY'), 1, 2, TRUE,TO_DATE('12/09/2019', 'DD/MM/YYYY'), TO_DATE('17/09/2019', 'DD/MM/YYYY'), 2, 4);

-- inserting pharmacy_prices data

insert into pharmacy_prices values (2, 2, 11.22);
insert into pharmacy_prices values (1, 2, 13.42);
insert into pharmacy_prices values (1, 3, 54.33);
insert into pharmacy_prices values (2, 4, 8.93);
insert into pharmacy_prices values (3, 1, 19.22);
insert into pharmacy_prices values (3, 2, 8.99);
insert into pharmacy_prices values (1, 6, 8.99);
insert into pharmacy_prices values (4, 3, 44.50);

-- inserting doctor_patients data

insert into doctor_patients values (2, 3, TRUE);
insert into doctor_patients values (3, 3, FALSE);
insert into doctor_patients values (1, 2, TRUE);
insert into doctor_patients values (2, 4, TRUE);
insert into doctor_patients values (4, 3, TRUE);
insert into doctor_patients values (3, 4, FALSE);


-- SQL Queries:

-- 1. The chain wants to know if drug costs influence drug sales. 
-- (We would query the prescription table to join with the pharmacy prices)

select * from PRESCRIPTION join PHARMACY_PRICES on (
PRESCRIPTION.ID_DRUG=PHARMACY_PRICES.ID_DRUG  
AND
PRESCRIPTION.ID_PHARMACY=PHARMACY_PRICES.ID_PHARMACY )
OR (
PRESCRIPTION.FILLED=FALSE
AND
PHARMACY_PRICES.ID_DRUG = PRESCRIPTION.ID_DRUG)
order by PRICE;

--> 8	2020-09-12	2019-09-12	1	2	TRUE	2019-09-17	2	4	2	4	8.93
--> 1	2021-08-12	2020-08-12	2	3	TRUE	2020-08-13	2	2	2	2	11.22
--> 6	2020-09-12	2019-09-12	3	4	TRUE	2019-09-17	1	2	1	2	13.42
--> 2	2020-09-12	2020-09-12	3	3	TRUE	2019-09-13	3	1	3	1	19.22
--> 4	2019-09-12	2019-11-20	2	4	TRUE	2019-12-13	3	1	3	1	19.22
--> 3	null	    2019-06-10	1	2	FALSE	null	  null	3	4	3	44.5
--> 3	null	    2019-06-10	1	2	FALSE	null	  null	3	1	3	54.33
--> 5	2022-05-06	2019-10-10	4	3	TRUE	2019-10-11	1	3	1	3	54.33
;

-- 2. The chain wants to know who is their primary customer demographic in terms of age.
-- (We would join the Prescription and Patient table, and then count the number of prescriptions per age (group by age and count(*)))

select AGE, COUNT(*) as NUMBER_OF_PRESCRIPTION, SUM(PAYING_CUSTOMERS.PRICE) from
(select * from PRESCRIPTION natural join PHARMACY_PRICES) as PAYING_CUSTOMERS natural join PATIENT group by AGE;

--> 25	1	8.93
--> 42	2	32.64
--> 54	3	84.77
;

-- 3. The companies want to know if their advertising is working for their drugs.
-- (We would join the prescription and drug tables to do a count for the number of prescriptions, probably sort by the date)

select COM_ID, count(*) as DRUG_SELLS_COUNT from(
select COM_DRUGS.COM_ID, COM_DRUGS.DRUG_ID, PRESCRIPTION.PRESCRIBED_DATE from
(select COMPANY.ID_COMPANY as COM_ID, DRUG.ID_DRUG as DRUG_ID, DRUG.NAME_TRADE as DRUG_NAME from COMPANY natural join DRUG) as COM_DRUGS
inner join PRESCRIPTION on COM_DRUGS.DRUG_ID=PRESCRIPTION.ID_DRUG where PRESCRIPTION.FILLED=TRUE
) where PRESCRIBED_DATE < TO_DATE('08/12/2020', 'DD/MM/YYYY') AND PRESCRIBED_DATE > TO_DATE('10/10/2019', 'DD/MM/YYYY') group by COM_ID;

--> 1	2
--> 2	1
--> 3	1
;

-- 4. The chain wants to know their best performing pharmacies in terms of sales.
-- (We would query Pharmacy, Prescription and pharmacy_prices. We would get all the prescriptions from individual pharmacies, then get the dollar amount.)

select PHARMACY.ID_PHARMACY, sum(PRICE) as SALES_PRICE, count(*) as NUMBER_OF_SALES from (select * from PRESCRIPTION natural join PHARMACY_PRICES) as SALES
natural join PHARMACY group by PHARMACY.ID_PHARMACY ORDER BY sum(PRICE) DESC;

--> 1	67.75	2
--> 3	38.44	2
--> 2	20.15	2
;

-- 5. Research wants to be done in patient-doctor relations as a measure of skills
-- (We would query the patient-doctor table and see the count of primary doctors per individual doctors, group by doctor and count when primary doctor)

select EXPERIENCE_YEARS, count(*) as NUMBER_OF_COMPLETED_PRESCRIPTIONS from
(select EXPERIENCE_YEARS, PRIMARY_DOC, DOCTOR_PATIENTS.ID_DOCTOR, DOCTOR_PATIENTS.ID_PATIENT from DOCTOR_PATIENTS natural join DOCTOR)
natural join PRESCRIPTION WHERE FILLED=TRUE group by EXPERIENCE_YEARS ORDER BY count(*) DESC;

--> 21	2
--> 15	2
--> 7	1
--> 9	1
;