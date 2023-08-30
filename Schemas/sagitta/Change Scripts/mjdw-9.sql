drop table if exists sagitta.clients;
go 

drop table if exists sagitta.audit_clients;
go 

drop function if exists sagitta.tr_audit_clients_d();
go 

drop function if exists sagitta.tr_audit_clients_i();
go 

drop function if exists sagitta.tr_audit_clients_u();
go 

drop function if exists sagitta.sp_clients_upsert();
go 