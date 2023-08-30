CREATE OR REPLACE VIEW p_and_c.all_wc_ldf_lookup
AS SELECT a.state,
    a.months,
    round(a.ldf, 3) AS ldf
   FROM ( SELECT all_wc_ldf.state,
            '0'::text AS months,
            all_wc_ldf."6_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '1'::text AS months,
            all_wc_ldf."6_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '2'::text AS months,
            all_wc_ldf."6_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '3'::text AS months,
            all_wc_ldf."6_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '4'::text AS months,
            all_wc_ldf."6_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '5'::text AS months,
            all_wc_ldf."6_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '6'::text AS months,
            all_wc_ldf."6_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '7'::text AS months,
            all_wc_ldf."7_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '8'::text AS months,
            all_wc_ldf."8_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '9'::text AS months,
            all_wc_ldf."9_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '10'::text AS months,
            all_wc_ldf."10_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '11'::text AS months,
            all_wc_ldf."11_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '12'::text AS months,
            all_wc_ldf."12_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '13'::text AS months,
            all_wc_ldf."13_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '14'::text AS months,
            all_wc_ldf."14_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '15'::text AS months,
            all_wc_ldf."15_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '16'::text AS months,
            all_wc_ldf."16_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '17'::text AS months,
            all_wc_ldf."17_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '18'::text AS months,
            all_wc_ldf."18_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '19'::text AS months,
            all_wc_ldf."19_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '20'::text AS months,
            all_wc_ldf."20_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '21'::text AS months,
            all_wc_ldf."21_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '22'::text AS months,
            all_wc_ldf."22_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '23'::text AS months,
            all_wc_ldf."23_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '24'::text AS months,
            all_wc_ldf."24_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '25'::text AS months,
            all_wc_ldf."25_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '26'::text AS months,
            all_wc_ldf."26_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '27'::text AS months,
            all_wc_ldf."27_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '28'::text AS months,
            all_wc_ldf."28_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '29'::text AS months,
            all_wc_ldf."29_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '30'::text AS months,
            all_wc_ldf."30_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '31'::text AS months,
            all_wc_ldf."31_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '32'::text AS months,
            all_wc_ldf."32_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '33'::text AS months,
            all_wc_ldf."33_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '34'::text AS months,
            all_wc_ldf."34_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '35'::text AS months,
            all_wc_ldf."35_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '36'::text AS months,
            all_wc_ldf."36_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '37'::text AS months,
            all_wc_ldf."37_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '38'::text AS months,
            all_wc_ldf."38_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '39'::text AS months,
            all_wc_ldf."39_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '40'::text AS months,
            all_wc_ldf."40_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '41'::text AS months,
            all_wc_ldf."41_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '42'::text AS months,
            all_wc_ldf."42_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '43'::text AS months,
            all_wc_ldf."43_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '44'::text AS months,
            all_wc_ldf."44_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '45'::text AS months,
            all_wc_ldf."45_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '46'::text AS months,
            all_wc_ldf."46_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '47'::text AS months,
            all_wc_ldf."47_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '48'::text AS months,
            all_wc_ldf."48_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '49'::text AS months,
            all_wc_ldf."49_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '50'::text AS months,
            all_wc_ldf."50_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '51'::text AS months,
            all_wc_ldf."51_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '52'::text AS months,
            all_wc_ldf."52_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '53'::text AS months,
            all_wc_ldf."53_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '54'::text AS months,
            all_wc_ldf."54_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '55'::text AS months,
            all_wc_ldf."55_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '56'::text AS months,
            all_wc_ldf."56_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '57'::text AS months,
            all_wc_ldf."57_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '58'::text AS months,
            all_wc_ldf."58_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '59'::text AS months,
            all_wc_ldf."59_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '60'::text AS months,
            all_wc_ldf."60_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '61'::text AS months,
            all_wc_ldf."61_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '62'::text AS months,
            all_wc_ldf."62_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '63'::text AS months,
            all_wc_ldf."63_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '64'::text AS months,
            all_wc_ldf."64_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '65'::text AS months,
            all_wc_ldf."65_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '66'::text AS months,
            all_wc_ldf."66_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '67'::text AS months,
            all_wc_ldf."67_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '68'::text AS months,
            all_wc_ldf."68_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '69'::text AS months,
            all_wc_ldf."69_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '70'::text AS months,
            all_wc_ldf."70_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '71'::text AS months,
            all_wc_ldf."71_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '72'::text AS months,
            all_wc_ldf."72_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '73'::text AS months,
            all_wc_ldf."73_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '74'::text AS months,
            all_wc_ldf."74_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '75'::text AS months,
            all_wc_ldf."75_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '76'::text AS months,
            all_wc_ldf."76_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '77'::text AS months,
            all_wc_ldf."77_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '78'::text AS months,
            all_wc_ldf."78_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '79'::text AS months,
            all_wc_ldf."79_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '80'::text AS months,
            all_wc_ldf."80_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '81'::text AS months,
            all_wc_ldf."81_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '82'::text AS months,
            all_wc_ldf."82_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '83'::text AS months,
            all_wc_ldf."83_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '84'::text AS months,
            all_wc_ldf."84_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '85'::text AS months,
            all_wc_ldf."85_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '86'::text AS months,
            all_wc_ldf."86_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '87'::text AS months,
            all_wc_ldf."87_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '88'::text AS months,
            all_wc_ldf."88_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '89'::text AS months,
            all_wc_ldf."89_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '90'::text AS months,
            all_wc_ldf."90_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '91'::text AS months,
            all_wc_ldf."91_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '92'::text AS months,
            all_wc_ldf."92_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '93'::text AS months,
            all_wc_ldf."93_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '94'::text AS months,
            all_wc_ldf."94_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '95'::text AS months,
            all_wc_ldf."95_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '96'::text AS months,
            all_wc_ldf."96_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '97'::text AS months,
            all_wc_ldf."97_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '98'::text AS months,
            all_wc_ldf."98_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '99'::text AS months,
            all_wc_ldf."99_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '100'::text AS months,
            all_wc_ldf."100_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '101'::text AS months,
            all_wc_ldf."101_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '102'::text AS months,
            all_wc_ldf."102_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '103'::text AS months,
            all_wc_ldf."103_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '104'::text AS months,
            all_wc_ldf."104_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '105'::text AS months,
            all_wc_ldf."105_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '106'::text AS months,
            all_wc_ldf."106_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '107'::text AS months,
            all_wc_ldf."107_months" AS ldf
           FROM p_and_c.all_wc_ldf
        UNION ALL
         SELECT all_wc_ldf.state,
            '108'::text AS months,
            all_wc_ldf."108_months" AS ldf
           FROM p_and_c.all_wc_ldf) a;
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.all_wc_ldf_lookup OWNER TO mj_admin;
GO

Grant select on table p_and_c.all_wc_ldf_lookup to rl_pc_data_analyst;
GO

Grant select on table p_and_c.all_wc_ldf_lookup to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.all_wc_ldf_lookup to rpauser;
GO
GRANT SELECT ON p_and_c.all_wc_ldf_lookup to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.all_wc_ldf_lookup to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.all_wc_ldf_lookup to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.all_wc_ldf_lookup to rl_p_and_c_d;
GO