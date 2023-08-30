create or replace function benefitpoint.tr_audit_rate_field_group_d() 
returns trigger 
language plpgsql 
as $$ 

begin 
	insert into benefitpoint.audit_rate_field_group (
		 rate_field_group_id 
		,old_description 
		,old_max_values_allowed 
		,old_rate_field_group_type 
		,audit_action 
	)
	select 	 old.rate_field_group_id 
			,old.description 
			,old.max_values_allowed 
			,old.rate_field_group_type 
			,'D'; 
	return old; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_rate_field_group_d() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_rate_field_group_d() to rl_benefitpoint_x;
go 