CREATE TABLE if not exists eb_ref.mj_provider(
    npi                         numeric     NULL,
    ein                         numeric     NULL,
    organization_name           text        NULL,
    organization_business_name  text        NULL,
    provider_last_name          text        NULL,
    provider_first_name         text        NULL,
    provider_middle_name        text        NULL,
    provider_gender             text        NULL,
    provider_credential         text        NULL,
    address_1                   text        NULL,
    address_2                   text        NULL,
    zip_code                    text        NULL,
    phone                       text        NULL,
    taxonomy_code               text        NULL,
    taxonomy_license            text        NULL,
    taxonomy_state              text        NULL,
    creation_date               timestamp 	NOT NULL 	DEFAULT timezone('utc'::TEXT, clock_timestamp()),
    last_update_date            timestamp   NULL,
    CONSTRAINT mj_provider_pk PRIMARY KEY (npi)
);
GO;

ALTER TABLE eb_ref.mj_provider OWNER TO mj_admin;
GO;

GRANT SELECT ON eb_ref.mj_provider TO rl_eb_ref_r;
GO;

GRANT INSERT ON eb_ref.mj_provider TO rl_eb_ref_a;
GO;

GRANT UPDATE ON eb_ref.mj_provider TO rl_eb_ref_w;
GO;

CREATE TRIGGER log_table_change AFTER
INSERT
    OR
DELETE
    OR 
UPDATE
    ON eb_ref.mj_provider FOR EACH ROW EXECUTE PROCEDURE eb.tr_log_table_change();
GO;