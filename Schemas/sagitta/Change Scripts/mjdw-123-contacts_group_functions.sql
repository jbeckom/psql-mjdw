ALTER FUNCTION sagitta.sp_contacts_address_group_upsert(int, int, text) RENAME TO sp_contacts_address_group_insert;
GO 

ALTER FUNCTION sagitta.sp_contacts_category_group_upsert(int, int, text) RENAME TO sp_contacts_category_group_insert;
GO 

ALTER FUNCTION sagitta.sp_contacts_email_group_upsert(int, int, text) RENAME TO sp_contacts_email_group_insert;
GO 

ALTER FUNCTION sagitta.sp_contacts_phone_group_upsert(int, int, text) RENAME TO sp_contacts_phone_group_insert;
GO 

ALTER FUNCTION sagitta.sp_contacts_website_group_upsert(int, int, text) RENAME TO sp_contacts_website_group_insert;
GO 
