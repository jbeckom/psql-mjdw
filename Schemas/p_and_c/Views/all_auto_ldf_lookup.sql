CREATE OR REPLACE VIEW p_and_c.all_auto_ldf_lookup
AS SELECT a.months,
    round(a.ldf, 3) AS ldf
   FROM ( SELECT '0'::text AS months,
            all_auto_ldf."6_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '1'::text AS months,
            all_auto_ldf."6_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '2'::text AS months,
            all_auto_ldf."6_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '3'::text AS months,
            all_auto_ldf."6_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '4'::text AS months,
            all_auto_ldf."6_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '5'::text AS months,
            all_auto_ldf."6_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '6'::text AS months,
            all_auto_ldf."6_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '7'::text AS months,
            all_auto_ldf."7_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '8'::text AS months,
            all_auto_ldf."8_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '9'::text AS months,
            all_auto_ldf."9_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '10'::text AS months,
            all_auto_ldf."10_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '11'::text AS months,
            all_auto_ldf."11_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '12'::text AS months,
            all_auto_ldf."12_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '13'::text AS months,
            all_auto_ldf."13_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '14'::text AS months,
            all_auto_ldf."14_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '15'::text AS months,
            all_auto_ldf."15_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '16'::text AS months,
            all_auto_ldf."16_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '17'::text AS months,
            all_auto_ldf."17_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '18'::text AS months,
            all_auto_ldf."18_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '19'::text AS months,
            all_auto_ldf."19_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '20'::text AS months,
            all_auto_ldf."20_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '21'::text AS months,
            all_auto_ldf."21_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '22'::text AS months,
            all_auto_ldf."22_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '23'::text AS months,
            all_auto_ldf."23_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '24'::text AS months,
            all_auto_ldf."24_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '25'::text AS months,
            all_auto_ldf."25_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '26'::text AS months,
            all_auto_ldf."26_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '27'::text AS months,
            all_auto_ldf."27_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '28'::text AS months,
            all_auto_ldf."28_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '29'::text AS months,
            all_auto_ldf."29_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '30'::text AS months,
            all_auto_ldf."30_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '31'::text AS months,
            all_auto_ldf."31_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '32'::text AS months,
            all_auto_ldf."32_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '33'::text AS months,
            all_auto_ldf."33_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '34'::text AS months,
            all_auto_ldf."34_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '35'::text AS months,
            all_auto_ldf."35_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '36'::text AS months,
            all_auto_ldf."36_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '37'::text AS months,
            all_auto_ldf."37_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '38'::text AS months,
            all_auto_ldf."38_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '39'::text AS months,
            all_auto_ldf."39_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '40'::text AS months,
            all_auto_ldf."40_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '41'::text AS months,
            all_auto_ldf."41_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '42'::text AS months,
            all_auto_ldf."42_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '43'::text AS months,
            all_auto_ldf."43_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '44'::text AS months,
            all_auto_ldf."44_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '45'::text AS months,
            all_auto_ldf."45_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '46'::text AS months,
            all_auto_ldf."46_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '47'::text AS months,
            all_auto_ldf."47_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '48'::text AS months,
            all_auto_ldf."48_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '49'::text AS months,
            all_auto_ldf."49_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '50'::text AS months,
            all_auto_ldf."50_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '51'::text AS months,
            all_auto_ldf."51_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '52'::text AS months,
            all_auto_ldf."52_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '53'::text AS months,
            all_auto_ldf."53_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '54'::text AS months,
            all_auto_ldf."54_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '55'::text AS months,
            all_auto_ldf."55_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '56'::text AS months,
            all_auto_ldf."56_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '57'::text AS months,
            all_auto_ldf."57_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '58'::text AS months,
            all_auto_ldf."58_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '59'::text AS months,
            all_auto_ldf."59_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '60'::text AS months,
            all_auto_ldf."60_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '61'::text AS months,
            all_auto_ldf."61_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '62'::text AS months,
            all_auto_ldf."62_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '63'::text AS months,
            all_auto_ldf."63_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '64'::text AS months,
            all_auto_ldf."64_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '65'::text AS months,
            all_auto_ldf."65_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '66'::text AS months,
            all_auto_ldf."66_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '67'::text AS months,
            all_auto_ldf."67_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '68'::text AS months,
            all_auto_ldf."68_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '69'::text AS months,
            all_auto_ldf."69_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '70'::text AS months,
            all_auto_ldf."70_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '71'::text AS months,
            all_auto_ldf."71_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '72'::text AS months,
            all_auto_ldf."72_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '73'::text AS months,
            all_auto_ldf."73_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '74'::text AS months,
            all_auto_ldf."74_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '75'::text AS months,
            all_auto_ldf."75_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '76'::text AS months,
            all_auto_ldf."76_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '77'::text AS months,
            all_auto_ldf."77_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '78'::text AS months,
            all_auto_ldf."78_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '79'::text AS months,
            all_auto_ldf."79_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '80'::text AS months,
            all_auto_ldf."80_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '81'::text AS months,
            all_auto_ldf."81_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '82'::text AS months,
            all_auto_ldf."82_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '83'::text AS months,
            all_auto_ldf."83_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '84'::text AS months,
            all_auto_ldf."84_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '85'::text AS months,
            all_auto_ldf."85_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '86'::text AS months,
            all_auto_ldf."86_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '87'::text AS months,
            all_auto_ldf."87_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '88'::text AS months,
            all_auto_ldf."88_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '89'::text AS months,
            all_auto_ldf."89_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '90'::text AS months,
            all_auto_ldf."90_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '91'::text AS months,
            all_auto_ldf."91_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '92'::text AS months,
            all_auto_ldf."92_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '93'::text AS months,
            all_auto_ldf."93_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '94'::text AS months,
            all_auto_ldf."94_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '95'::text AS months,
            all_auto_ldf."95_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '96'::text AS months,
            all_auto_ldf."96_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '97'::text AS months,
            all_auto_ldf."97_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '98'::text AS months,
            all_auto_ldf."98_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '99'::text AS months,
            all_auto_ldf."99_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '100'::text AS months,
            all_auto_ldf."100_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '101'::text AS months,
            all_auto_ldf."101_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '102'::text AS months,
            all_auto_ldf."102_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '103'::text AS months,
            all_auto_ldf."103_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '104'::text AS months,
            all_auto_ldf."104_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '105'::text AS months,
            all_auto_ldf."105_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '106'::text AS months,
            all_auto_ldf."106_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '107'::text AS months,
            all_auto_ldf."107_months" AS ldf
           FROM p_and_c.all_auto_ldf
        UNION ALL
         SELECT '108'::text AS months,
            all_auto_ldf."108_months" AS ldf
           FROM p_and_c.all_auto_ldf) a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.all_auto_ldf_lookup OWNER TO mj_admin;
GO

Grant select on table p_and_c.all_auto_ldf_lookup to rl_pc_data_analyst;
GO

Grant select on table p_and_c.all_auto_ldf_lookup to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.all_auto_ldf_lookup to rpauser;
GO
GRANT SELECT ON p_and_c.all_auto_ldf_lookup to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.all_auto_ldf_lookup to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.all_auto_ldf_lookup to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.all_auto_ldf_lookup to rl_p_and_c_d;
GO