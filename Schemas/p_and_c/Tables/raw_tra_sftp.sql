CREATE TABLE p_and_c.raw_tra_sftp (
	val_dt varchar(256) NULL,
	carr_grp_cd varchar(256) NULL,
	agcy_cd varchar(256) NULL,
	sai_nbr varchar(256) NULL,
	sai_nm varchar(256) NULL,
	pol_fm_cd varchar(256) NULL,
	pol_nbr varchar(256) NULL,
	pol_eff_dt varchar(256) NULL,
	pol_expir_dt varchar(256) NULL,
	pol_eff_yr varchar(256) NULL,
	rpt_ml_cd varchar(256) NULL,
	cov_knd_cd varchar(256) NULL,
	clm_desg_cd varchar(256) NULL,
	incd_only_ind varchar(256) NULL,
	clm_nbr varchar(256) NULL,
	cmi_clm_sts_cd varchar(256) NULL,
	clm_clos_orig_dt varchar(256) NULL,
	clm_clos_lt_dt varchar(256) NULL,
	clm_ropen_dt varchar(256) NULL,
	clmt_clos_lt_dt varchar(256) NULL,
	cmi_cov_sts_cd varchar(256) NULL,
	ls_desc_shrt_txt varchar(256) NULL,
	ls_desc_lng_txt varchar(256) NULL,
	ls_incrd_dt varchar(256) NULL,
	acc_yr varchar(256) NULL,
	ntc_of_loss_dt varchar(256) NULL,
	rkst_cd varchar(256) NULL,
	acc_st_cd varchar(256) NULL,
	acc_city_cd varchar(256) NULL,
	acc_tm varchar(256) NULL,
	gdr_cd varchar(256) NULL,
	clmt_nm varchar(256) NULL,
	clmt_nbr varchar(256) NULL,
	cmi_clmt_sts_cd varchar(256) NULL,
	clmt_age varchar(256) NULL,
	insd_fst_cntc_dt varchar(256) NULL,
	adj_ofc_cd varchar(256) NULL,
	adj_nm varchar(256) NULL,
	atty_invlv_ind varchar(256) NULL,
	clmt_ftl_ind varchar(256) NULL,
	auto_driv_age varchar(256) NULL,
	insd_veh_drvr_nm varchar(256) NULL,
	vin varchar(256) NULL,
	insd_vin varchar(256) NULL,
	ben_st_cd varchar(256) NULL,
	wc_ee_hir_dt varchar(256) NULL,
	wc_job_clss_cd varchar(256) NULL,
	ocp_desc varchar(256) NULL,
	litg_pd_uncap_expn_amt varchar(256) NULL,
	wc_clm_comp_rt_amt varchar(256) NULL,
	wc_wk_avg_wg_amt varchar(256) NULL,
	wc_rtn_to_wrk_dt varchar(256) NULL,
	bdy_part_cd varchar(256) NULL,
	caus_of_inj_cd varchar(256) NULL,
	natr_of_inj_cd varchar(256) NULL,
	wc_cntv_clm_cd varchar(256) NULL,
	crncy_typ_cd varchar(256) NULL,
	incur_uncap_indm_amt varchar(256) NULL,
	incur_uncap_med_amt varchar(256) NULL,
	incur_uncap_expn_amt varchar(256) NULL,
	cse_uncap_indm_amt varchar(256) NULL,
	cse_uncap_med_amt varchar(256) NULL,
	cse_uncap_expn_amt varchar(256) NULL,
	pd_uncap_indm_amt varchar(256) NULL,
	pd_uncap_med_amt varchar(256) NULL,
	pd_uncap_expn_amt varchar(256) NULL,
	slvg_pd_uncap_indm_amt varchar(256) NULL,
	slvg_pd_uncap_med_amt varchar(256) NULL,
	slvg_pd_uncap_expn_amt varchar(256) NULL,
	subro_pd_uncap_indm_amt varchar(256) NULL,
	subro_pd_uncap_med_amt varchar(256) NULL,
	subro_pd_uncap_expn_amt varchar(256) NULL,
	incur_uncap_tot_ime_amt varchar(256) NULL,
	cse_uncap_tot_ime_amt varchar(256) NULL,
	pd_uncap_tot_ime_amt varchar(256) NULL,
	slvg_pd_uncap_tot_ime_amt varchar(256) NULL,
	subro_pd_uncap_tot_ime_amt varchar(256) NULL,
	agcy_nm varchar(256) NULL,
	insd_nm varchar(256) NULL,
	sic_cd varchar(256) NULL,
	naics_cd varchar(256) NULL,
	fst_loss_formal_ntc_rcvd_dt varchar(256) NULL,
	filename varchar(256) NULL,
	uploaded_at varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_tra_sftp OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_tra_sftp to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_tra_sftp to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_tra_sftp to rpauser;
GO
GRANT SELECT ON p_and_c.raw_tra_sftp to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_tra_sftp to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_tra_sftp to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_tra_sftp to rl_p_and_c_d;
GO