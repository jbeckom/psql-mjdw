create or replace function benefitpoint.sp_carrier_appointment_upsert() 
returns int 
language plpgsql 
as $$ 

declare rc int; 

begin 
	insert into benefitpoint.carrier_appointment (
		 carrier_source 
		,source_key 
		,carrier_appointment_id 
		,carrier_id 
		,appointment_on 
		,appointment_number 
		,states
		,active 
	)
	select 	 carrier_source 
			,source_key 
			,carrier_appointment_id 
			,carrier_id 
			,appointment_on::timestamp 
			,appointment_number 
			,states
			,active::bool 
	from 	benefitpoint.stg_carrier_appointments 
	on conflict (carrier_source, source_key, carrier_appointment_id) do update 
	set 	 carrier_id 			= excluded.carrier_id 
			,appointment_on 		= excluded.appointment_on 
			,appointment_number 	= excluded.appointment_number 
			,states					= excluded.states
			,active 				= excluded.active 
	where 	(carrier_appointment.carrier_id,carrier_appointment.appointment_on,carrier_appointment.appointment_number,carrier_appointment.state,carrier_appointment.active)
		is distinct from 	(excluded.carrier_id,excluded.appointment_on,excluded.appointment_number,excluded.state,excluded.active); 

	get diagnostics rc = row_count;

	return rc;
end; 
$$; 
go 

/*** PERMISSIONS ***/
alter function benefitpoint.sp_carrier_appointment_upsert() owner to mj_admin;
go 

grant execute on function benefitpoint.sp_carrier_appointment_upsert() to rl_benefitpoint_x;
go 