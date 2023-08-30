ALTER TABLE sagitta.audit_policies RENAME COLUMN old_prevoius_policy_id TO old_previous_policy_id;
go 

ALTER TABLE sagitta.audit_policies RENAME COLUMN new_prevoius_policy_id TO new_previous_policy_id;
go 