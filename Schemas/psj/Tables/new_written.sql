drop table if exists psj.new_written;
go 

create table if not exists psj.new_written (
     fiscal_year                int             not null 
    ,producer                   text            not null 
    ,construction               int             null 
    ,transportation             int             null 
    ,manufacturing              int             null 
    ,small_commercial           int             null 
    ,indiana_eb                 int             null 
    ,surety                     int             null 
    ,arizona_eb                 int             null 
    ,arizona_pc                 int             null 
    ,energy                     int             null 
    ,indy_pl                    int             null 
    ,az_pl                      int             null 
    ,co_eb                      int             null 
    ,co_pc                      int             null 
    ,procourse                  int             null 
    ,id                         bigint          not null            generated always as identity            primary key 
    ,constraint new_written_fiscal_year_producer_uq     unique (fiscal_year,producer) 
);
go 

/*** PERMISSIONS ***/
alter table psj.new_written owner to mj_admin;
go 

grant select on psj.new_written to rl_psj_r;
go 

grant insert on psj.new_written to rl_psj_a;
go 

grant update on psj.new_written to rl_psj_w;
go 

/*** TRIGGERS ***/
create trigger log_change_iud after insert or update or delete on psj.new_written for each row execute function audit.tr_psj_log_change();
go 