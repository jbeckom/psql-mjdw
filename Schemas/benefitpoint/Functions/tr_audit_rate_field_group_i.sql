create or replace function benefitpoint.tr_audit_rate_field_group_i() 
returns trigger  
language plpgsql 
as $$ 

begin 
	insert into benefitpoint.audit_rate_field_group (
		 rate_field_group_id 
		,new_description 
		,new_max_values_allowed 
		,new_rate_field_group_type 
		,audit_action 
	)
	select 	 new.rate_field_group_id 
			,new.description 
			,new.max_values_allowed 
			,new.rate_field_group_type 
			,'I'; 
	return new; 
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.tr_audit_rate_field_group_i() owner to mj_admin;
go 

grant execute on function benefitpoint.tr_audit_rate_field_group_i() to rl_benefitpoint_x;
go 