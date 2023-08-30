DROP TABLE p_and_c.amb_ratings;
GO

CREATE TABLE p_and_c.amb_ratings(
   "Company"                                                              VARCHAR(256) NOT NULL
  ,"Year"                                                                 INTEGER  NOT NULL
  ,"Administrative City"                                                  VARCHAR(256) NOT NULL
  ,"Administrative Country"                                               VARCHAR(256) NOT NULL
  ,"Administrative Postal Code"                                           VARCHAR(256) NOT NULL
  ,"Administrative State"                                                 VARCHAR(256) NOT NULL
  ,"Administrative Street Address 1"                                      VARCHAR(256) NOT NULL
  ,"Administrative Street Address 2"                                      VARCHAR(256) NOT NULL
  ,"Administrative Street Address 3"                                      VARCHAR(256) NOT NULL
  ,"Alien Insurer ID Number"                                              VARCHAR(256) NOT NULL
  ,"AMB Company Name"                                                     VARCHAR(256) NOT NULL
  ,"AMB Company Name (Communications)"                                    VARCHAR(256) NOT NULL
  ,"AMB Company Name (Full)"                                              VARCHAR(256) NOT NULL
  ,"AMB Credit Report Type"                                               VARCHAR(256) NOT NULL
  ,"AMB Entity Name"                                                      VARCHAR(256) NOT NULL
  ,"AMB Entity Number"                                                    INTEGER  NOT NULL
  ,"AMB Group Lead Company Indicator"                                     VARCHAR(256) NOT NULL
  ,"AMB Group Lead Company Number"                                        INTEGER  NOT NULL
  ,"AMB Group Name"                                                       VARCHAR(256) NOT NULL
  ,"AMB Group Number"                                                     INTEGER  NOT NULL
  ,"AMB Lead Rating Unit Indicator"                                       VARCHAR(256) NOT NULL
  ,"AMB Lead Rating Unit Name"                                            VARCHAR(256) NOT NULL
  ,"AMB Lead Rating Unit Number"                                          INTEGER  NOT NULL
  ,"AMB Number"                                                           INTEGER  NOT NULL
  ,"AMB Parent Name"                                                      VARCHAR(256) NOT NULL
  ,"AMB Parent Number"                                                    INTEGER  NOT NULL
  ,"AMB Rating Unit Indicator"                                            VARCHAR(256) NOT NULL
  ,"AMB Rating Unit Name"                                                 VARCHAR(256) NOT NULL
  ,"AMB Rating Unit Number"                                               INTEGER  NOT NULL
  ,"AMB Trade Name"                                                       VARCHAR(256) NOT NULL
  ,"AMB Ultimate Parent Country"                                          VARCHAR(256) NOT NULL
  ,"AMB Ultimate Parent Name"                                             VARCHAR(256) NOT NULL
  ,"AMB Ultimate Parent Number"                                           INTEGER  NOT NULL
  ,"Analyst Name"                                                         VARCHAR(256) NOT NULL
  ,"Analyst Title"                                                        VARCHAR(256) NOT NULL
  ,"Auditor"                                                              VARCHAR(256) NOT NULL
  ,"BCAR/Assessment Effective Date"                                       VARCHAR(256) NOT NULL
  ,"Best's Capital Adequacy Ratio"                                        INTEGER  NOT NULL
  ,"Best's Capital Adequacy Ratio (VaR 95%)"                              NUMERIC(5,2) NOT NULL
  ,"Best's Capital Adequacy Ratio (VaR 99%)"                              NUMERIC(5,2) NOT NULL
  ,"Best's Capital Adequacy Ratio (VaR 99.5%)"                            NUMERIC(6,2) NOT NULL
  ,"Best's Capital Adequacy Ratio (VaR 99.6%)"                            NUMERIC(6,2) NOT NULL
  ,"Best's Financial Strength Rating - Current"                           VARCHAR(256) NOT NULL
  ,"Best's Financial Strength Rating - Current (without modifier)"        VARCHAR(256) NOT NULL
  ,"Best's Financial Strength Rating - Previous"                          VARCHAR(256) NOT NULL
  ,"Best's Financial Strength Rating - Previous (without modifier)"       VARCHAR(256) NOT NULL
  ,"Best's Financial Strength Rating Action - Current"                    VARCHAR(256) NOT NULL
  ,"Best's Financial Strength Rating Affiliation Code - Current"          VARCHAR(256) NOT NULL
  ,"Best's Financial Strength Rating Affiliation Code - Previous"         VARCHAR(256) NOT NULL
  ,"Best's Financial Strength Rating Category - Current"                  VARCHAR(256) NOT NULL
  ,"Best's Financial Strength Rating Category - Previous"                 VARCHAR(256) NOT NULL
  ,"Best's Financial Strength Rating Code - Current"                      INTEGER  NOT NULL
  ,"Best's Financial Strength Rating Code - Previous"                     INTEGER  NOT NULL
  ,"Best's Financial Strength Rating Effective Date - Current"            VARCHAR(256) NOT NULL
  ,"Best's Financial Strength Rating Effective Date - Previous"           VARCHAR(256) NOT NULL
  ,"Best's Financial Strength Rating Modifier - Current"                  VARCHAR(256) NOT NULL
  ,"Best's Financial Strength Rating Modifier - Previous"                 VARCHAR(256) NOT NULL
  ,"Best's Financial Strength Rating Outlook/Implication - Current"       VARCHAR(256) NOT NULL
  ,"Best's Long-Term Issuer Credit Rating - Current"                      VARCHAR(256) NOT NULL
  ,"Best's Long-Term Issuer Credit Rating - Current (without modifier)"   VARCHAR(256) NOT NULL
  ,"Best's Long-Term Issuer Credit Rating - Previous"                     VARCHAR(256) NOT NULL
  ,"Best's Long-Term Issuer Credit Rating - Previous (without modifier)"  VARCHAR(256) NOT NULL
  ,"Best's Long-Term Issuer Credit Rating Action - Current"               VARCHAR(256)
  ,"Best's Long-Term Issuer Credit Rating Code - Current"                 INTEGER  NOT NULL
  ,"Best's Long-Term Issuer Credit Rating Code - Previous"                INTEGER  NOT NULL
  ,"Best's Long-Term Issuer Credit Rating Effective Date - Current"       VARCHAR(256) NOT NULL
  ,"Best's Long-Term Issuer Credit Rating Effective Date - Previous"      VARCHAR(256) NOT NULL
  ,"Best's Long-Term Issuer Credit Rating Modifier - Current"             VARCHAR(256) NOT NULL
  ,"Best's Long-Term Issuer Credit Rating Modifier - Previous"            VARCHAR(256) NOT NULL
  ,"Best's Long-Term Issuer Credit Rating Outlook/Implication - Current"  VARCHAR(256) NOT NULL
  ,"Best's National Scale Rating"                                         VARCHAR(256) NOT NULL
  ,"Best's National Scale Rating Action Code"                             VARCHAR(256) NOT NULL
  ,"Best's National Scale Rating Action Display"                          VARCHAR(256) NOT NULL
  ,"Best's National Scale Rating Effective Date"                          VARCHAR(256) NOT NULL
  ,"Best's National Scale Rating Outlook"                                 VARCHAR(256) NOT NULL
  ,"Best's National Scale Rating Under Review"                            VARCHAR(256) NOT NULL
  ,"Best's Short Term Issuer Credit Rating - Current"                     VARCHAR(256) NOT NULL
  ,"Best's Short Term Issuer Credit Rating - Previous"                    VARCHAR(256) NOT NULL
  ,"Best's Short Term Issuer Credit Rating Action - Current"              VARCHAR(256)
  ,"Best's Short Term Issuer Credit Rating Code - Current"                INTEGER  NOT NULL
  ,"Best's Short Term Issuer Credit Rating Code - Previous"               INTEGER  NOT NULL
  ,"Best's Short Term Issuer Credit Rating Effective Date - Current"      VARCHAR(256) NOT NULL
  ,"Best's Short Term Issuer Credit Rating Effective Date - Previous"     VARCHAR(256) NOT NULL
  ,"Best's Short Term Issuer Credit Rating Modifier - Current"            VARCHAR(256) NOT NULL
  ,"Best's Short Term Issuer Credit Rating Outlook/Implication - Current" VARCHAR(256) NOT NULL
  ,"Best's Short Term Issuer Credit Rating Under Review - Current"        VARCHAR(256) NOT NULL
  ,"Best's Short Term Issuer Credit Rating Under Review - Previous"       VARCHAR(256) NOT NULL
  ,"Business Status"                                                      VARCHAR(256) NOT NULL
  ,"Business Status Reason"                                               VARCHAR(256) NOT NULL
  ,"Business Type"                                                        VARCHAR(256) NOT NULL
  ,"Business Type Descriptor"                                             VARCHAR(256) NOT NULL
  ,"City"                                                                 VARCHAR(256) NOT NULL
  ,"Consolidation Type"                                                   VARCHAR(256) NOT NULL
  ,"Country"                                                              VARCHAR(256) NOT NULL
  ,"Country of Domicile"                                                  VARCHAR(256) NOT NULL
  ,"Data Source"                                                          VARCHAR(256) NOT NULL
  ,"Director of State Rate Filings – Name"                                VARCHAR(256) NOT NULL
  ,"Director of State Rate Filings – Title"                               VARCHAR(256) NOT NULL
  ,"Domiciliary City"                                                     VARCHAR(256) NOT NULL
  ,"Domiciliary Country"                                                  VARCHAR(256) NOT NULL
  ,"Domiciliary Postal Code"                                              VARCHAR(256) NOT NULL
  ,"Domiciliary State"                                                    VARCHAR(256) NOT NULL
  ,"Domiciliary Street Address 1"                                         VARCHAR(256) NOT NULL
  ,"Domiciliary Street Address 2"                                         VARCHAR(256) NOT NULL
  ,"Domiciliary Street Address 3"                                         VARCHAR(256) NOT NULL
  ,"Email Address"                                                        VARCHAR(256) NOT NULL
  ,"Entity Type"                                                          VARCHAR(256) NOT NULL
  ,"Fax Number"                                                           VARCHAR(256) NOT NULL
  ,"Federal Employer ID Number"                                           INTEGER  NOT NULL
  ,"Financial Size Category"                                              VARCHAR(256) NOT NULL
  ,"Financial Size Category Code"                                         INTEGER  NOT NULL
  ,"Industry Composites"                                                  VARCHAR(256) NOT NULL
  ,"Industry Type"                                                        VARCHAR(256) NOT NULL
  ,"Issue Ratings Available"                                              VARCHAR(256) NOT NULL
  ,"Legal Entity Identifier"                                              VARCHAR(256) NOT NULL
  ,"Mailing City"                                                         VARCHAR(256) NOT NULL
  ,"Mailing Country"                                                      VARCHAR(256) NOT NULL
  ,"Mailing Postal Code"                                                  VARCHAR(256) NOT NULL
  ,"Mailing State"                                                        VARCHAR(256) NOT NULL
  ,"Mailing Street Address 1"                                             VARCHAR(256) NOT NULL
  ,"Mailing Street Address 2"                                             VARCHAR(256) NOT NULL
  ,"Mailing Street Address 3"                                             VARCHAR(256) NOT NULL
  ,"Marketing Type"                                                       VARCHAR(256)
  ,"NAIC Company Number"                                                  INTEGER  NOT NULL
  ,"NAIC Group Number"                                                    INTEGER  NOT NULL
  ,"Operating Company Type"                                               VARCHAR(256) NOT NULL
  ,"Organization Structure"                                               VARCHAR(256) NOT NULL
  ,"Organization Type"                                                    VARCHAR(256) NOT NULL
  ,"Organization Type Descriptor"                                         VARCHAR(256) NOT NULL
  ,"Parent Company (Percent Owned)"                                       NUMERIC(5,2) NOT NULL
  ,"Postal Code"                                                          VARCHAR(256) NOT NULL
  ,"Principal Law Firm"                                                   VARCHAR(256) NOT NULL
  ,"Publicly Traded Corporation"                                          VARCHAR(256) NOT NULL
  ,"Rating Endorsement"                                                   VARCHAR(256) NOT NULL
  ,"Rating Office (Anaylst Location)"                                     VARCHAR(256) NOT NULL
  ,"State"                                                                VARCHAR(256) NOT NULL
  ,"State of Domicile"                                                    VARCHAR(256) NOT NULL
  ,"Statement PDF Availability"                                           VARCHAR(256) NOT NULL
  ,"Stock Exchange"                                                       VARCHAR(256) NOT NULL
  ,"Stock Exchange - 2nd"                                                 VARCHAR(256) NOT NULL
  ,"Stock Exchange - 3rd"                                                 VARCHAR(256) NOT NULL
  ,"Stock Exchange Name"                                                  VARCHAR(256) NOT NULL
  ,"Stock Exchange Name - 2nd"                                            VARCHAR(256) NOT NULL
  ,"Stock Exchange Name - 3rd"                                            VARCHAR(256) NOT NULL
  ,"Stock Ticker Symbol"                                                  VARCHAR(256) NOT NULL
  ,"Stock Ticker Symbol - 2nd"                                            VARCHAR(256) NOT NULL
  ,"Stock Ticker Symbol - 3rd"                                            VARCHAR(256) NOT NULL
  ,"Street Address 1"                                                     VARCHAR(256) NOT NULL
  ,"Street Address 2"                                                     VARCHAR(256) NOT NULL
  ,"Street Address 3"                                                     VARCHAR(256) NOT NULL
  ,"Team Leader Location"                                                 VARCHAR(256) NOT NULL
  ,"Team Leader Name"                                                     VARCHAR(256) NOT NULL
  ,"Team Leader Title"                                                    VARCHAR(256) NOT NULL
  ,"Telephone Number"                                                     VARCHAR(256) NOT NULL
  ,"Top Officer"                                                          VARCHAR(256) NOT NULL
  ,"Top Officer's Title"                                                  VARCHAR(256) NOT NULL
  ,"Web Site"                                                             VARCHAR(256) NOT NULL
  ,"Year Commenced Business"                                              INTEGER  NOT NULL
  ,"Year of Incorporation"                                                INTEGER  NOT NULL
  ,"uploaded_at"                                                          TIMESTAMP
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.amb_ratings OWNER TO mj_admin;
GO

Grant select on table p_and_c.amb_ratings to rl_pc_data_analyst;
GO

Grant update, insert, select on table p_and_c.amb_ratings to rl_pc_rpa_developer;
GO

Grant select,update,insert on table p_and_c.amb_ratings to rpauser;
GO

GRANT SELECT ON p_and_c.amb_ratings to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.amb_ratings to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.amb_ratings to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.amb_ratings to rl_p_and_c_d;
GO