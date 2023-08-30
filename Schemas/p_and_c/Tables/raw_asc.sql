CREATE TABLE p_and_c.raw_asc (
	"Policy" varchar(256) NULL,
	"Claim #" varchar(256) NULL,
	"Claimant Name" varchar(256) NULL,
	"Claim Status" varchar(256) NULL,
	"Date of Loss" varchar(256) NULL,
	"Claim Close Date" varchar(256) NULL,
	"Incurred Amount" varchar(256) NULL,
	"Adjuster" varchar(256) NULL,
	"Accident Description" varchar(4096) NULL,
	"Accident State Code" varchar(256) NULL,
	"Accident Year" varchar(256) NULL,
	"Account Holder" varchar(256) NULL,
	"Agency" varchar(256) NULL,
	"Auto Coverage Type" varchar(256) NULL,
	"Benefit State Code" varchar(256) NULL,
	"Body Part" varchar(256) NULL,
	"Cause of Loss" varchar(256) NULL,
	"CD Indicator" varchar(256) NULL,
	"Claim Count" varchar(256) NULL,
	"Claim Received Date" varchar(256) NULL,
	"Claim Received Month" varchar(256) NULL,
	"Claim Received Year" varchar(256) NULL,
	"Claimant Age Range" varchar(256) NULL,
	"Claimant Gender" varchar(256) NULL,
	"Class Code" varchar(256) NULL,
	"Closed Outcome" varchar(256) NULL,
	"Coverage Major Group" varchar(256) NULL,
	"Coverage Minor Group" varchar(256) NULL,
	"Coverage Peril" varchar(256) NULL,
	"Coverage Type" varchar(256) NULL,
	"Date of Hire" varchar(256) NULL,
	"Deductible Recovery Amount" varchar(256) NULL,
	"Driver" varchar(256) NULL,
	"Expense Paid Amount" varchar(256) NULL,
	"Expense Paid Legal Amt" varchar(256) NULL,
	"Expense Paid Other Amt" varchar(256) NULL,
	"Expense Recovery Amount" varchar(256) NULL,
	"Exposure" varchar(256) NULL,
	"External Reference Number" varchar(256) NULL,
	"Garaging Location Addr1" varchar(256) NULL,
	"Garaging Location Addr2" varchar(256) NULL,
	"Garaging Location City" varchar(256) NULL,
	"Garaging Location State" varchar(256) NULL,
	"Garaging Location Zip Code" varchar(256) NULL,
	"Incurred Net Amount" varchar(256) NULL,
	"Injury Cause" varchar(256) NULL,
	"Injury Description" varchar(4096) NULL,
	"Injury Type" varchar(256) NULL,
	"Insured Name" varchar(256) NULL,
	"Litigation" varchar(256) NULL,
	"Location Address 1" varchar(256) NULL,
	"Location Address 2" varchar(256) NULL,
	"Location City" varchar(256) NULL,
	"Location Description" varchar(256) NULL,
	"Location Detail 1" varchar(256) NULL,
	"Location Detail 2" varchar(256) NULL,
	"Location Detail 3" varchar(256) NULL,
	"Location Name" varchar(256) NULL,
	"Location No" varchar(256) NULL,
	"Location State" varchar(256) NULL,
	"Location Zip Code" varchar(256) NULL,
	"Loss Incurred Amount" varchar(256) NULL,
	"Loss Incurred Indemnity Amount" varchar(256) NULL,
	"Loss Incurred Medical Amount" varchar(256) NULL,
	"Loss Payment Amount" varchar(256) NULL,
	"Loss Payment Indemnity Amount" varchar(256) NULL,
	"Loss Payment Medical Amount" varchar(256) NULL,
	"Loss Recovery Amount" varchar(256) NULL,
	"Loss Reserve Amount" varchar(256) NULL,
	"Loss Reserve Indemnity Amount" varchar(256) NULL,
	"Loss Reserve Medical Amount" varchar(256) NULL,
	"Loss Type" varchar(256) NULL,
	"Notice Only Ind" varchar(256) NULL,
	"Notification Date" varchar(256) NULL,
	"Occupation" varchar(256) NULL,
	"Policy Effective Date" varchar(256) NULL,
	"Policy Expiration Date" varchar(256) NULL,
	"Policy Line" varchar(256) NULL,
	"Policy Year" varchar(256) NULL,
	"Re-open Date" varchar(256) NULL,
	"Subrogation Amount" varchar(256) NULL,
	"Time of Loss" varchar(256) NULL,
	"WC Claim Group" varchar(256) NULL,
	"WC Claim Type" varchar(256) NULL,
	file_name varchar(256) NULL,
	uploaded_at varchar(256) NULL,
	"CA Risk Location" varchar(256) NULL
);
GO

/*** PERMISSIONS ***/
ALTER TABLE p_and_c.raw_asc OWNER TO mj_admin;
GO

Grant select on table p_and_c.raw_asc to rl_pc_data_analyst;
GO

Grant select on table p_and_c.raw_asc to rl_pc_rpa_developer;
GO

Grant delete, update, insert, select on table p_and_c.raw_asc to rpauser;
GO
GRANT SELECT ON p_and_c.raw_asc to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.raw_asc to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.raw_asc to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.raw_asc to rl_p_and_c_d;
GO