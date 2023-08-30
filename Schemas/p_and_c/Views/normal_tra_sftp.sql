CREATE OR REPLACE VIEW p_and_c.normal_tra_sftp
AS SELECT DISTINCT concat('TRA_SFTP', '-', a.clm_nbr)::character varying(256) AS claim_number,
    a.clm_nbr AS occurrence_number,
    a.clmt_nbr AS claimant_number,
    a.pd_uncap_expn_amt AS paid_expense,
    a.cse_uncap_expn_amt AS reserve_expense,
    a.pd_uncap_indm_amt AS paid_indemnity,
    a.pd_uncap_med_amt AS paid_medical,
    a.cse_uncap_indm_amt AS reserve_indemnity,
    a.cse_uncap_med_amt AS reserve_medical,
    a.subro_pd_uncap_tot_ime_amt AS subrogation,
    a.slvg_pd_uncap_tot_ime_amt AS reimbursed,
        CASE
            WHEN a.cmi_clm_sts_cd::text = 'CLOSED'::text THEN 'Closed'::character varying(256)
            ELSE
            CASE
                WHEN a.cmi_clm_sts_cd::text = 'OPEN'::text THEN 'Open'::character varying(256)
                ELSE a.cmi_clm_sts_cd
            END
        END AS claim_status,
    a.ls_desc_lng_txt AS description_text,
    ''::character varying(256) AS claim_address_1,
    ''::character varying(256) AS claim_address_2,
    a.acc_city_cd AS claim_city,
    a.acc_st_cd AS claim_state,
    ''::character varying(256) AS claim_zip,
    concat(a.acc_city_cd, ', ', a.acc_st_cd)::character varying(256) AS claim_site,
    a.ben_st_cd AS benefit_state,
    ''::character varying(256) AS garage_state,
    a.ocp_desc AS occupation,
    a.wc_job_clss_cd AS class_code,
    replace(regexp_replace(a.clmt_nm, '\s+', ' ', 'g')::text, '/'::text, ''::text)::character varying(256) AS claimant_name,
        CASE
            WHEN a.clmt_nm::text ~~* '%policy%'::text THEN ''::character varying(256)
            WHEN a.clmt_nm::text ~~* '% inc%'::text THEN ''::character varying(256)
            WHEN a.clmt_nm::text ~~* '%blvd%'::text THEN ''::character varying(256)
            ELSE split_part(replace(a.clmt_nm::text, '/'::text, ''::text), ' '::text, 1)::character varying(256)
        END AS claimant_first,
        CASE
            WHEN a.clmt_nm::text ~~* '%policy%'::text THEN ''::character varying(256)
            WHEN a.clmt_nm::text ~~* '% inc%'::text THEN ''::character varying(256)
            WHEN a.clmt_nm::text ~~* '%blvd%'::text THEN ''::character varying(256)
            WHEN regexp_replace(a.clmt_nm, '\s+', ' ', 'g')::text ~~ '% % %'::text THEN split_part(regexp_replace(a.clmt_nm, '\s+', ' ', 'g')::text, ' '::text, 2)::character varying(256)
            ELSE ''::character varying(256)
        END AS claimant_middle,
        CASE
            WHEN a.clmt_nm::text ~~* '%policy%'::text THEN ''::character varying(256)
            WHEN a.clmt_nm::text ~~* '% inc%'::text THEN ''::character varying(256)
            WHEN a.clmt_nm::text ~~* '%blvd%'::text THEN ''::character varying(256)
            WHEN regexp_replace(a.clmt_nm, '\s+', ' ', 'g')::text ~~ '% % %'::text THEN split_part(a.clmt_nm::text, ' '::text, 3)::character varying(256)
            ELSE split_part(regexp_replace(a.clmt_nm, '\s+', ' ', 'g')::text, ' '::text, 2)::character varying(256)
        END AS claimant_last,
    split_part(a.insd_veh_drvr_nm::text, ' '::text, 1)::character varying(256) AS driver_first,
        CASE
            WHEN a.insd_veh_drvr_nm::text ~~ '% % %'::text THEN split_part(a.insd_veh_drvr_nm::text, ' '::text, 2)::character varying(256)
            ELSE ''::character varying(256)
        END AS driver_middle,
        CASE
            WHEN a.insd_veh_drvr_nm::text ~~ '% % %'::text THEN split_part(a.insd_veh_drvr_nm::text, ' '::text, 3)::character varying(256)
            ELSE split_part(a.insd_veh_drvr_nm::text, ' '::text, 2)::character varying(256)
        END AS driver_last,
    a.ls_incrd_dt AS loss_date,
    a.acc_tm AS loss_time,
    a.ntc_of_loss_dt AS report_date,
    a.clm_clos_lt_dt AS closed_date,
    a.clm_ropen_dt AS reopen_date,
        CASE
            WHEN a.atty_invlv_ind::text = 'Y'::text THEN 'Yes'::character varying(256)
            ELSE 'No'::character varying(256)
        END AS litigation,
        CASE
            WHEN a.wc_ee_hir_dt::text = ''::text THEN ''::character varying(256)
            ELSE ((a.ls_incrd_dt::date - a.wc_ee_hir_dt::date))::character varying(256)
        END AS days_employed,
        CASE
            WHEN a.gdr_cd::text = 'M'::text THEN 'Male'::character varying(256)
            ELSE
            CASE
                WHEN a.gdr_cd::text = 'F'::text THEN 'Female'::character varying(256)
                ELSE
                CASE
                    WHEN a.gdr_cd::text = 'Male'::text THEN 'Male'::character varying(256)
                    ELSE
                    CASE
                        WHEN a.gdr_cd::text = 'Female'::text THEN 'Female'::character varying(256)
                        ELSE ''::character varying(256)
                    END
                END
            END
        END AS claimant_gender,
        CASE
            WHEN a.clmt_age::text <> '0'::text THEN a.clmt_age
            ELSE ''::character varying(256)
        END AS claimant_age,
    ''::character varying(256) AS claimant_shift,
    ''::character varying(256) AS claimant_supervisor,
    a.bdy_part_cd AS carrier_body_part,
    a.caus_of_inj_cd AS carrier_cause,
    concat('TRA_SFTP', ' - ', a.rpt_ml_cd, ' - ', a.cov_knd_cd)::character varying(256) AS carrier_coverage_type,
    a.natr_of_inj_cd AS carrier_nature,
        CASE
            WHEN a.rpt_ml_cd::text = 'WC'::text THEN
            CASE
                WHEN a.incur_uncap_indm_amt::numeric > 0::numeric THEN '5'::character varying(256)
                ELSE '6'::character varying(256)
            END
            ELSE ''::character varying(256)
        END AS carrier_injury_code,
    concat('TRA_SFTP', ' - ', a.rpt_ml_cd, ' - ', a.pol_eff_dt, ' - ', a.sai_nm, ' - ', a.pol_nbr)::character varying(256) AS carrier_policy_number,
    'raw_tra_sftp'::character varying(256) AS source_table,
    a.uploaded_at
   FROM p_and_c.raw_tra_sftp a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.normal_tra_sftp OWNER TO mj_admin;
GO

Grant select on table p_and_c.normal_tra_sftp to rl_pc_data_analyst;
GO

Grant select on table p_and_c.normal_tra_sftp to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.normal_tra_sftp to rpauser;
GO
GRANT SELECT ON p_and_c.normal_tra_sftp to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.normal_tra_sftp to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.normal_tra_sftp to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.normal_tra_sftp to rl_p_and_c_d;
GO