create or replace function benefitpoint.tr_audit_rate_field_group_u() 
returns trigger 
language plpgsql 
as $$ 

begin 
	insert into benefitpoint.audit_rate_field_group (
		 rate_field_group_id 
		,old_description 
		,new_description 
		,old_max_values_allowed 
		,new_max_values_allowed 
		,old_rate_field_group_type 
		,new_rate_field_group_type 
		,audit_action 
	)
	select 	 old.rate_field_group_id 
			,old.description 
			,new.description 
			,old.max_values_allowed 
			,new.max_values_allowed 
			,old.rate_field_group_type 
			,new.rate_field_group_type 
			,'U'; 
	return old; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_rate_field_group_u() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_rate_field_group_u() to rl_benefitpoint_x;
go 