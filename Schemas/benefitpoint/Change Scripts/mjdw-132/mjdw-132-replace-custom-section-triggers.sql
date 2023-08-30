CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_custom_section_d()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_custom_section ( 
		 customization_area 
		,"label"
		,old_sort_order
		,old_active
		,old_account_customization_categories
		,audit_action
	)
	SELECT 	 OLD.customization_area
			,OLD."label"
			,OLD.sort_order
			,OLD.active
			,OLD.account_customization_categories 
			,'D';
	RETURN OLD;
END;
$$;
GO 

CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_custom_section_i()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_custom_section (
		 customization_area
		,"label"
		,new_sort_order
		,new_active
		,new_account_customization_categories
		,audit_action
	)
	SELECT 	 NEW.customization_area
			,NEW."label"
			,NEW.sort_order
			,NEW.active
			,NEW.account_customization_categories 
			,'I';
	RETURN NEW;
END;
$$;
GO 

CREATE OR REPLACE FUNCTION benefitpoint.tr_audit_custom_section_u()
RETURNS TRIGGER 
LANGUAGE plpgsql 
AS $$

BEGIN 
	INSERT INTO benefitpoint.audit_custom_section (
		 customization_area 
		,"label"
		,old_sort_order
		,new_sort_order
		,old_active
		,new_active
		,old_account_customization_categories
		,new_account_customization_categories 
		,audit_action
	)
	SELECT 	 OLD.customization_area
			,NEW.customization_area
			,OLD."label"
			,OLD.sort_order
			,NEW.sort_order
			,OLD.active
			,NEW.active
			,OLD.account_customization_categories 
			,NEW.account_customization_categories 
			,'U';
	RETURN OLD;
END;
$$;
GO 

