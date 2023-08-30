alter table powerapps.prospect 
     add column prospect_business_unit          text                        null 
    ,add column producer_1_share                double precision            null 
    ,add column producer_2_share                double precision            null 
    ,add column cross_sell                      text                        null; 
go 