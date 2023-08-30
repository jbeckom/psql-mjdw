CREATE OR REPLACE FUNCTION eb.tr_log_table_change()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER
AS $function$
       BEGIN
         IF TG_OP = 'INSERT'
         THEN INSERT INTO eb.table_history (
                table_name, schema_name, operation, new_table_record
              ) VALUES (
                TG_RELNAME, TG_TABLE_SCHEMA, TG_OP, row_to_json(NEW)
              );
           RETURN NEW;
         ELSIF  TG_OP = 'UPDATE'
         THEN
           INSERT INTO eb.table_history (
             table_name, schema_name, operation, old_table_record, new_table_record
           )
			VALUES (TG_RELNAME, TG_TABLE_SCHEMA, TG_OP, row_to_json(OLD), row_to_json(NEW));
        	RETURN NEW;
         ELSIF TG_OP = 'DELETE'
         THEN
           INSERT INTO eb.table_history
             (table_name, schema_name, operation, old_table_record)
             VALUES (
               TG_RELNAME, TG_TABLE_SCHEMA, TG_OP, row_to_json(OLD)
             );
             RETURN OLD;
         END IF;
       END;
$function$;
GO;

ALTER FUNCTION eb.tr_log_table_change() OWNER TO mj_admin;
GO;