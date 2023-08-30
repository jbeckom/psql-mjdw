create or replace view elilill_sif as
select distinct date_time_incident::date as "Event_Date",
business_unit as "Organization", 
concat(collision_code,' - ',collision_type) as "Incident_Type", 
life_near_miss_criteria as "Damage", 
element_description as "Description" 
from p_and_c.elilill_mv_collision_tracker 
where life_near_miss ilike '%yes%';
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.elilill_sif OWNER TO mj_admin;
GO

Grant select on table p_and_c.elilill_sif to rl_pc_data_analyst;
GO

Grant select on table p_and_c.elilill_sif to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.elilill_sif to rpauser;
GO

GRANT SELECT ON p_and_c.elilill_sif to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.elilill_sif to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.elilill_sif to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.elilill_sif to rl_p_and_c_d;
GO