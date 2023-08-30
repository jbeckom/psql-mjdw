DROP VIEW IF EXISTS p_and_c.benchmarking_occ_dist_clean;
GO

create or replace view p_and_c.benchmarking_occ_dist_clean as
select o.id,
o.client_id,
o.occ_type, 
case 
       when o.occ_value like '%.%' then replace(replace(replace(replace(o.occ_value,'M','00000'),'K','00'),' ',''),'.','')
       else replace(replace(replace(o.occ_value,'M','000000'),'K','000'),' ','')
end as occ_value,
o.lob,
o.percent_below,
case 
       when o.program_count like '%.%' then replace(replace(replace(replace(o.program_count,'M','00000'),'K','00'),' ',''),'.','')
       else replace(replace(replace(o.program_count,'M','000000'),'K','000'),' ','')
end as program_count,
o.table_id,
o.processed_date
from p_and_c.benchmarking_occ_dist o
where o.lob is not null;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.benchmarking_occ_dist_clean OWNER TO mj_admin;
GO

Grant select on table p_and_c.benchmarking_occ_dist_clean to rl_pc_data_analyst;
GO

Grant select on table p_and_c.benchmarking_occ_dist_clean to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.benchmarking_occ_dist_clean to rpauser;
GO

GRANT SELECT ON p_and_c.benchmarking_occ_dist_clean to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.benchmarking_occ_dist_clean to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.benchmarking_occ_dist_clean to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.benchmarking_occ_dist_clean to rl_p_and_c_d;
GO