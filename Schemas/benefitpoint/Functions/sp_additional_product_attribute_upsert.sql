create or replace function benefitpoint.sp_additional_product_attribute_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int;

begin 
	insert into benefitpoint.additional_product_attribute(
		 product_id 
		,account_id 
		,attribute_id 
		,name 
		,field_value_type 
		,value_num 
		,value_text 
		,value_date 
		,option_value_id 
	)
	select 	 product_id 
			,account_id 
			,attribute_id 
			,name 
			,field_value_type 
			,value_num::double precision 
			,value_text 
			,value_date::timestamp 
			,option_value_id::int 
	FROM 	benefitpoint.stg_additional_product_attribute
	on conflict (product_id, account_id, attribute_id) do update 
	set 	 name 				= excluded.name 
			,field_value_type 	= excluded.field_value_type 
			,value_num 			= excluded.value_num 
			,value_text 		= excluded.value_text 
			,value_date 		= excluded.value_date 
			,option_value_id 	= excluded.option_value_id 
	where 	(additional_product_attribute.name,additional_product_attribute.field_value_type,additional_product_attribute.value_num,additional_product_attribute.value_text,additional_product_attribute.value_date,additional_product_attribute.option_value_id) 
		is distinct from 	(excluded.name,excluded.field_value_type,excluded.value_num,excluded.value_text,excluded.value_date,excluded.option_value_id); 
	
	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_additional_product_attribute_upsert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_additional_product_attribute_upsert() to rl_benefitpoint_x;
go 
