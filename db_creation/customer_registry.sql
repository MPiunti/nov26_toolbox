-- ============================================================
-- customer_registry : synthetic customer registry
-- References: country_iso (FK country_code -> country_iso.country_code)
-- Primary key: customer_id (natural key, synthetic CUST-##### format)
-- ============================================================

CREATE OR REPLACE TABLE nov26_experiments.nov26_main.customer_registry (
  customer_id  STRING  COMMENT 'Natural customer identifier, synthetic data, format CUST-#####',
  first_name   STRING  COMMENT 'Customer first name (synthetic data)',
  last_name    STRING  COMMENT 'Customer last name (synthetic data)',
  email        STRING  COMMENT 'Customer email (synthetic data, example-test.com domain)',
  phone_number STRING  COMMENT 'Customer phone number (synthetic data, E.164-like format)',
  birth_date   DATE    COMMENT 'Customer date of birth (synthetic data)',
  country_code CHAR(2) COMMENT 'Foreign key to country_iso.country_code (ISO 3166-1 alpha-2)',
  -- PRIMARY KEY already implies uniqueness (Databricks rejects a separate UNIQUE on the same column set)
  CONSTRAINT customer_registry_pk        PRIMARY KEY (customer_id),
  CONSTRAINT customer_registry_country_fk FOREIGN KEY (country_code)
    REFERENCES nov26_experiments.nov26_main.country_iso (country_code)
)
COMMENT 'Synthetic customer registry for testing the nov26_toolbox skills setup.';

INSERT INTO nov26_experiments.nov26_main.customer_registry
  (customer_id, first_name, last_name, email, phone_number, birth_date, country_code) VALUES
  ('CUST-00001','Alex','Moreni','alex.moreni@example-test.com','+39-340-1110001','1988-04-12','IT'),
  ('CUST-00002','Betina','Falossi','betina.falossi@example-test.com','+39-340-1110002','1992-09-03','IT'),
  ('CUST-00003','Jhon','Doelmann','jhon.doelmann@example-test.com','+1-202-555-0103','1979-01-25','US'),
  ('CUST-00004','Sarah','Willowby','sarah.willowby@example-test.com','+1-202-555-0104','1985-07-14','US'),
  ('CUST-00005','Max','Sturmhardt','max.sturmhardt@example-test.com','+49-170-5550105','1990-11-30','DE'),
  ('CUST-00006','Lea','Fontanelle','lea.fontanelle@example-test.com','+33-6-12-34-0106','1983-03-08','FR'),
  ('CUST-00007','Carmen','Dieguez','carmen.dieguez@example-test.com','+34-600-111007','1995-05-21','ES'),
  ('CUST-00008','Oliver','Bramblewood','oliver.bramblewood@example-test.com','+44-7700-900108','1987-02-17','GB'),
  ('CUST-00009','Sanne','Vandermeer','sanne.vandermeer@example-test.com','+31-6-12341009','1991-12-05','NL'),
  ('CUST-00010','Luca','Bianchetti','luca.bianchetti@example-test.com','+41-79-123-1010','1986-06-27','CH'),
  ('CUST-00011','Anna','Strolz','anna.strolz@example-test.com','+43-664-1231011','1994-10-02','AT'),
  ('CUST-00012','Erik','Lundkvist','erik.lundkvist@example-test.com','+46-70-123-1012','1980-08-19','SE'),
  ('CUST-00013','Ingrid','Bakkemo','ingrid.bakkemo@example-test.com','+47-902-12-1013','1989-09-09','NO'),
  ('CUST-00014','Mette','Koldby','mette.koldby@example-test.com','+45-20-123-1014','1993-04-23','DK'),
  ('CUST-00015','Aino','Virtala','aino.virtala@example-test.com','+358-40-123-1015','1982-01-16','FI'),
  ('CUST-00016','Piotr','Zielinskyy','piotr.zielinskyy@example-test.com','+48-601-123-1016','1977-05-11','PL'),
  ('CUST-00017','Joana','Sequeira','joana.sequeira@example-test.com','+351-91-123-1017','1996-07-07','PT'),
  ('CUST-00018','Declan','Farrelly','declan.farrelly@example-test.com','+353-85-123-1018','1984-11-28','IE'),
  ('CUST-00019','Camille','Duboisson','camille.duboisson@example-test.com','+32-470-12-1019','1992-02-14','BE'),
  ('CUST-00020','Marie','Tremblayy','marie.tremblayy@example-test.com','+1-514-555-0120','1981-12-03','CA'),
  ('CUST-00021','Rafael','Oliveiraa','rafael.oliveiraa@example-test.com','+55-11-95555-0121','1990-06-15','BR'),
  ('CUST-00022','Bruce','Kingstonn','bruce.kingstonn@example-test.com','+61-410-123-122','1975-03-29','AU'),
  ('CUST-00023','Haruto','Sakanoue','haruto.sakanoue@example-test.com','+81-90-1234-1023','1988-08-08','JP'),
  ('CUST-00024','Wei','Zhangsan','wei.zhangsan@example-test.com','+86-138-1234-1024','1993-10-10','CN'),
  ('CUST-00025','Priya','Ramanath','priya.ramanath@example-test.com','+91-98-1234-1025','1991-01-19','IN'),
  ('CUST-00026','Nikos','Papazoglou','nikos.papazoglou@example-test.com','+30-69-1234-1026','1986-05-05','GR');