CREATE OR REPLACE VIEW pc_ops.contact_cleanup_all AS 
with a as (
select a.sagitem as contact_id,a.client_id,d.client_cd,d.client_name,a.given_name,a.surname,
c1.email_address as email1,c2.email_address as email2,c3.email_address as email3,
b.phone_number,b.mobile_number,a.title,
case when d.servicer_1_cd in ('DMO','JRS','HMIL') then
   case when e.client_exec is null and (d.servicer_2_cd is null or d.servicer_2_cd = 'RAR' or d.servicer_2_cd = 'SMW1') 
   then 'GROUPCHAT'
      else coalesce(e.client_exec,d.servicer_2_cd)
         end
            else d.servicer_1_cd end as servicer
from sagitta.contacts a
LEFT JOIN  sagitta.contacts_phone_group  as b
  ON  a.sagitem = b.sagitem
  AND b.lis > 1
LEFT JOIN   sagitta.contacts_email_group  as c1
  ON  c1.sagitem = a.sagitem
  AND c1.lis = 1
LEFT JOIN   sagitta.contacts_email_group  as c2
  ON  c2.sagitem = a.sagitem
  AND c2.lis = 2
LEFT JOIN   sagitta.contacts_email_group  as c3
  ON  c3.sagitem = a.sagitem
  AND c3.lis = 3
inner join sagitta.clients d on a.client_id = d.sagitem
left join sagitta.clients_addlinfo e on d.sagitem = e.sagitem 
WHERE EXISTS 
(SELECT 1 FROM sagitta.policies e
left join sagitta.coverages f on e.coverage_cd = f.sagitem 
WHERE e.client_cd = d.sagitem 
AND e.policy_number not ilike '%app%'
and e.insurer_name != '610'
and '12-31-1967'::date+e.policy_expiration_dt::int > current_date
and e.division_cd='1'
AND e.department_cd ~~ ANY('{01%,21%,07%}'::text[])
and f.major_lob_cd not in ('PER','IEB','LIF','PNC','PRO')
and f.coverage_cd != 'FID'
)
and a.contact_type_cd not in ('INS','CLU')
and d.servicer_1_cd not in ('KDM','CDG','SBOUT','PATAM','SIY','DLH'))
select 'SAGITTA' as source,
a.contact_id,
a.client_id,
a.client_name,
a.given_name as first_name,
a.surname as last_name,
a.servicer,
case when a.servicer = 'GROUPCHAT' then 'GROUPCHAT' else b.staff_name end as staff_name,
'PC' as dept
from a
left join sagitta.staff b on a.servicer = b.sagitem
left join pc_ops.contact_cleanup_cards_log c on a.contact_id = c.source_key 
union 
select distinct 'BENEFITPOINT' as source,
a.contact_id,
c.account_id as client_id,
d.account_name as client_name,
b.first_name,
b.last_name,
f.user_id::text as servicer,
concat(f.first_name,' ',f.last_name) as staff_name,
'EB' as dept
from benefitpoint.account_contact a 
inner join benefitpoint.contact b on a.contact_id = b.contact_id
inner join benefitpoint.account c on a.account_id = c.account_id
inner join benefitpoint.group_account_info d on c.account_id = d.account_id
left join (select source_key,concat(area_code,number) as phone from benefitpoint.phone where type='Work') e1 on a.contact_id = e1.source_key
left join (select source_key,concat(area_code,number) as phone from benefitpoint.phone where type='Mobile') e2 on a.contact_id = e2.source_key
left join (select source_key,concat(area_code,number) as phone from benefitpoint.phone where type='Fax') e3 on a.contact_id = e3.source_key
left join (select source_key,concat(area_code,number) as phone from benefitpoint.phone where type not in ('Work','Mobile','Fax')) e4 on a.contact_id = e4.source_key
left join benefitpoint.user f on c.administrator_user_id = f.user_id
left join pc_ops.contact_cleanup_cards_log g on a.contact_id = g.source_key 
where c.active = 't'
and c.account_classification = 'Group';
GO

/*** PERMISSIONS ***/
ALTER VIEW pc_ops.contact_cleanup_all OWNER TO mj_admin;
GO

Grant select on table pc_ops.contact_cleanup_all to rl_pc_data_analyst;
GO

Grant select on table pc_ops.contact_cleanup_all to rl_pc_rpa_developer;
GO

Grant select on table pc_ops.contact_cleanup_all to rpauser;
GO
GRANT SELECT ON pc_ops.contact_cleanup_all to rl_pc_ops_r;
GO

GRANT INSERT ON pc_ops.contact_cleanup_all to rl_pc_ops_a;
GO

GRANT UPDATE ON pc_ops.contact_cleanup_all to rl_pc_ops_w;
GO

GRANT DELETE ON pc_ops.contact_cleanup_all to rl_pc_ops_d;
GO