/*****************************************************************************************************************************************************/
alter table sagitta.ac_coverages
     drop constraint IF EXISTS ac_coverages_pkey
    ,DROP CONSTRAINT IF EXISTS ac_coverages_sagitem_uq
    ,add CONSTRAINT ac_coverages_sagitem_uq  unique (sagitem)
    ,add column IF NOT EXISTS id  bigint  not null    generated always as identity    primary key;
GO 
   
DROP TRIGGER IF EXISTS audit_d ON sagitta.ac_coverages;
GO 
DROP TRIGGER IF EXISTS audit_i ON sagitta.ac_coverages;
GO 
DROP TRIGGER IF EXISTS audit_u ON sagitta.ac_coverages;
GO 

DROP TRIGGER IF EXISTS log_change_iud ON sagitta.ac_coverages;
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.ac_coverages FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change();
GO 

INSERT INTO audit.sagitta_log (audit_time,audit_user,audit_client,operation,table_name,table_key,new_record)
    SELECT 	 audit.audit_timestamp 	AS audit_time
            ,audit.audit_user 		AS audit_user
            ,'0.0.0.0'::inet		AS audit_client 
            ,CASE 
                WHEN audit.audit_action = 'D' THEN 'DELETE'
                WHEN audit.audit_action = 'I' THEN 'INSERT'
                WHEN audit.audit_action = 'U' THEN 'UPDATE'
            END 					AS operation
            ,'ac_coverages' 		AS table_name
            ,core.id 					AS table_key
            ,(
                SELECT 	 row_to_json(_)
                FROM (
                    SELECT 	 audit.sagitem
                            ,audit.new_audit_staff_cd     			            as audit_staff_cd
                            ,audit.new_audit_entry_dt     			            as audit_entry_dt
                            ,audit.new_audit_time     				            as audit_time
                            ,audit.new_audit_cd   					            as audit_cd
                            ,audit.new_audit_history_record_number              as audit_history_record_number
                            ,audit.new_audit_program  				            as audit_program
                            ,audit.new_audit_effective_dt     		            as audit_effective_dt
                            ,audit.new_audit_change_agency_id     	            as audit_change_agency_id
                            ,audit.new_policy_agency_id   			            as policy_agency_id
                            ,audit.new_state_prov_cd  				            as state_prov_cd
                            ,audit.new_named_customer_name    		            as named_customer_name
                            ,audit.new_reporting  					            as reporting
                            ,audit.new_non_reporting  				            as non_reporting
                            ,audit.new_accts_rec_dep_premium_amt  	            as accts_rec_dep_premium_amt
                            ,audit.new_accts_rec_min_premium_amt  	            as accts_rec_min_premium_amt
                            ,audit.new_accts_rec_reporting_period               as accts_rec_reporting_period
                            ,audit.new_accts_rec_prem_adjustment_period_desc    as accts_rec_prem_adjustment_period_desc
                            ,audit.new_accts_rec_first_rate                     as accts_rec_first_rate
                            ,audit.new_accts_re_second_rate                     as accts_re_second_rate
                            ,audit.new_accts_rec_rate_premium_amt               as accts_rec_rate_premium_amt
                            ,audit.new_not_at_your_premises                     as not_at_your_premises
                            ,audit.new_all_covered_prop_all_location            as all_covered_prop_all_location
                            ,audit.new_accts_rec_in_transit_limit               as accts_rec_in_transit_limit
                            ,audit.new_accts_rec_collapse                       as accts_rec_collapse
                            ,audit.new_accts_rec_removal                        as accts_rec_removal
                            ,audit.new_libraries_endorsment_applies             as libraries_endorsment_applies
                            ,audit.new_val_papers_lmt_away_from_premises        as val_papers_lmt_away_from_premises
                            ,audit.new_val_papers_blanket                       as val_papers_blanket
                            ,audit.new_val_papers_blanket_amt                   as val_papers_blanket_amt
                            ,audit.new_val_papers_specified                     as val_papers_specified
                            ,audit.new_val_papers_specified_amt                 as val_papers_specified_amt
                            ,audit.new_val_papers_collapse                      as val_papers_collapse
                            ,audit.new_val_papers_occurence_ded_amt             as val_papers_occurence_ded_amt
                            ,audit.new_val_papers_removal                       as val_papers_removal
                            ,audit.new_val_papers_removal_limit                 as val_papers_removal_limit
                            ,audit.new_off_dt                                   as off_dt
                            ,audit.new_accts_rec_reporting_period_cd            as accts_rec_reporting_period_cd
                ) 	AS _
            ) 							AS new_record
    FROM sagitta.audit_ac_coverages 	AS audit
        INNER JOIN 	sagitta.ac_coverages 	AS core 
            ON core.sagitem = audit.sagitem;
GO 

/*****************************************************************************************************************************************************/
alter table sagitta.ac_coverages_arcli
     drop constraint IF EXISTS ac_coverages_arcli_pkey
    ,DROP CONSTRAINT IF EXISTS ac_coverages_arcli_sagitem_uq
    ,add CONSTRAINT ac_coverages_arcli_sagitem_lis_uq  unique (sagitem,lis)
    ,add column IF NOT EXISTS id  bigint  not null    generated always as identity    primary key;
GO 
   
DROP TRIGGER IF EXISTS audit_d ON sagitta.ac_coverages_arcli;
GO 
DROP TRIGGER IF EXISTS audit_i ON sagitta.ac_coverages_arcli;
GO 
DROP TRIGGER IF EXISTS audit_u ON sagitta.ac_coverages_arcli;
GO 

DROP TRIGGER IF EXISTS log_change_iud ON sagitta.ac_coverages_arcli;
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.ac_coverages_arcli FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change();
GO 

INSERT INTO audit.sagitta_log (audit_time,audit_user,audit_client,operation,table_name,table_key,new_record)
    SELECT 	 audit.audit_timestamp 	AS audit_time
            ,audit.audit_user 		AS audit_user
            ,'0.0.0.0'::inet		AS audit_client 
            ,CASE 
                WHEN audit.audit_action = 'D' THEN 'DELETE'
                WHEN audit.audit_action = 'I' THEN 'INSERT'
                WHEN audit.audit_action = 'U' THEN 'UPDATE'
            END 					AS operation
            ,'ac_coverages_arcli'	AS table_name
            ,core.id 					AS table_key
            ,(
                SELECT 	 row_to_json(_)
                FROM (
                    SELECT 	 audit.sagitem
                            ,audit.lis
                            ,audit.new_accts_rec_location_id          as accts_rec_location_id
                            ,audit.new_accts_rec_sub                  as accts_rec_sub
                            ,audit.new_accts_rec_cov_sub              as accts_rec_cov_sub
                            ,audit.new_accts_rec_your_premises_limit  as accts_rec_your_premises_limit
                ) 	AS _
            ) 							AS new_record
    FROM sagitta.audit_ac_coverages_arcli 	AS audit
        INNER JOIN 	sagitta.ac_coverages_arcli 	AS core 
            ON core.sagitem = audit.sagitem;
GO

/*****************************************************************************************************************************************************/
alter table sagitta.ac_coverages_vpcli
     drop constraint IF EXISTS ac_coverages_vpcli_pkey
    ,DROP CONSTRAINT IF EXISTS ac_coverages_vpcli_sagitem_uq
    ,add CONSTRAINT ac_coverages_vpcli_sagitem_lis_uq  unique (sagitem,lis)
    ,add column IF NOT EXISTS id  bigint  not null    generated always as identity    primary key;
GO 
   
DROP TRIGGER IF EXISTS audit_d ON sagitta.ac_coverages_vpcli;
GO 
DROP TRIGGER IF EXISTS audit_i ON sagitta.ac_coverages_vpcli;
GO 
DROP TRIGGER IF EXISTS audit_u ON sagitta.ac_coverages_vpcli;
GO 

DROP TRIGGER IF EXISTS log_change_iud ON sagitta.ac_coverages_vpcli;
GO 
CREATE TRIGGER log_change_iud AFTER INSERT OR UPDATE OR DELETE ON sagitta.ac_coverages_vpcli FOR EACH ROW EXECUTE FUNCTION audit.tr_sagitta_log_change();
GO 

INSERT INTO audit.sagitta_log (audit_time,audit_user,audit_client,operation,table_name,table_key,new_record)
    SELECT   audit.audit_timestamp 	AS audit_time
            ,audit.audit_user 		AS audit_user
            ,'0.0.0.0'::inet		AS audit_client 
            ,CASE 
                WHEN audit.audit_action = 'D' THEN 'DELETE'
                WHEN audit.audit_action = 'I' THEN 'INSERT'
                WHEN audit.audit_action = 'U' THEN 'UPDATE'
            END 					AS operation
            ,'ac_coverages_vpcli' 	AS table_name
            ,core.id 					AS table_key
            ,(
                SELECT 	 row_to_json(_)
                FROM (
                    SELECT 	 audit.sagitem
                            ,audit.lis
                            ,audit.new_val_papers_location_id        as val_papers_location_id
                            ,audit.new_val_papers_sub                as val_papers_sub
                            ,audit.new_val_papers_your_premises_amt  as val_papers_your_premises_amt
                ) 	AS _
            ) 							AS new_record
    FROM sagitta.audit_ac_coverages_vpcli 	AS audit
        INNER JOIN 	sagitta.ac_coverages_arcli 	AS core 
            ON core.sagitem = audit.sagitem;
GO