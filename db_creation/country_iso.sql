-- ============================================================
-- country_iso : ISO 3166-1 country reference table
-- Referenced by: customer_registry (FK on country_code)
-- Primary key: country_code (natural key, ISO alpha-2 code)
-- ============================================================

CREATE SCHEMA IF NOT EXISTS nov26_experiments.nov26_main
COMMENT 'nov26_toolbox project default schema.';

CREATE OR REPLACE TABLE nov26_experiments.nov26_main.country_iso (
  country_code   CHAR(2) COMMENT 'ISO 3166-1 alpha-2 country code (natural primary key)',
  country_alpha3 CHAR(3) COMMENT 'ISO 3166-1 alpha-3 country code',
  country_name   STRING  COMMENT 'ISO 3166-1 English short country name',
  -- PRIMARY KEY already implies uniqueness (Databricks rejects a separate UNIQUE on the same column set)
  CONSTRAINT country_iso_pk  PRIMARY KEY (country_code)
)
COMMENT 'ISO 3166-1 country reference data referenced by nov26_toolbox tables.';

INSERT INTO nov26_experiments.nov26_main.country_iso (country_code, country_alpha3, country_name) VALUES
  ('IT','ITA','Italy'),          ('US','USA','United States'),
  ('DE','DEU','Germany'),       ('FR','FRA','France'),
  ('ES','ESP','Spain'),         ('GB','GBR','United Kingdom'),
  ('NL','NLD','Netherlands'),    ('CH','CHE','Switzerland'),
  ('AT','AUT','Austria'),       ('SE','SWE','Sweden'),
  ('NO','NOR','Norway'),        ('DK','DNK','Denmark'),
  ('FI','FIN','Finland'),       ('PL','POL','Poland'),
  ('PT','PRT','Portugal'),      ('IE','IRL','Ireland'),
  ('BE','BEL','Belgium'),       ('CA','CAN','Canada'),
  ('BR','BRA','Brazil'),        ('AU','AUS','Australia'),
  ('JP','JPN','Japan'),         ('CN','CHN','China'),
  ('IN','IND','India'),         ('GR','GRC','Greece');