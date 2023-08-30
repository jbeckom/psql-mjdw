CREATE OR REPLACE VIEW p_and_c.all_auto_ldf
AS SELECT a."12_months" AS "6_months",
    a."12_months" AS "7_months",
    a."12_months" AS "8_months",
    a."12_months" AS "9_months",
    a."12_months" AS "10_months",
    a."12_months" AS "11_months",
    a."12_months",
    1::numeric * ((a."18_months" - a."12_months") / 6::numeric) + a."12_months" AS "13_months",
    2::numeric * ((a."18_months" - a."12_months") / 6::numeric) + a."12_months" AS "14_months",
    3::numeric * ((a."18_months" - a."12_months") / 6::numeric) + a."12_months" AS "15_months",
    4::numeric * ((a."18_months" - a."12_months") / 6::numeric) + a."12_months" AS "16_months",
    5::numeric * ((a."18_months" - a."12_months") / 6::numeric) + a."12_months" AS "17_months",
    a."18_months",
    1::numeric * ((a."24_months" - a."18_months") / 6::numeric) + a."18_months" AS "19_months",
    2::numeric * ((a."24_months" - a."18_months") / 6::numeric) + a."18_months" AS "20_months",
    3::numeric * ((a."24_months" - a."18_months") / 6::numeric) + a."18_months" AS "21_months",
    4::numeric * ((a."24_months" - a."18_months") / 6::numeric) + a."18_months" AS "22_months",
    5::numeric * ((a."24_months" - a."18_months") / 6::numeric) + a."18_months" AS "23_months",
    a."24_months",
    1::numeric * ((a."30_months" - a."24_months") / 6::numeric) + a."24_months" AS "25_months",
    2::numeric * ((a."30_months" - a."24_months") / 6::numeric) + a."24_months" AS "26_months",
    3::numeric * ((a."30_months" - a."24_months") / 6::numeric) + a."24_months" AS "27_months",
    4::numeric * ((a."30_months" - a."24_months") / 6::numeric) + a."24_months" AS "28_months",
    5::numeric * ((a."30_months" - a."24_months") / 6::numeric) + a."24_months" AS "29_months",
    a."30_months",
    1::numeric * ((a."36_months" - a."30_months") / 6::numeric) + a."30_months" AS "31_months",
    2::numeric * ((a."36_months" - a."30_months") / 6::numeric) + a."30_months" AS "32_months",
    3::numeric * ((a."36_months" - a."30_months") / 6::numeric) + a."30_months" AS "33_months",
    4::numeric * ((a."36_months" - a."30_months") / 6::numeric) + a."30_months" AS "34_months",
    5::numeric * ((a."36_months" - a."30_months") / 6::numeric) + a."30_months" AS "35_months",
    a."36_months",
    1::numeric * ((a."42_months" - a."36_months") / 6::numeric) + a."36_months" AS "37_months",
    2::numeric * ((a."42_months" - a."36_months") / 6::numeric) + a."36_months" AS "38_months",
    3::numeric * ((a."42_months" - a."36_months") / 6::numeric) + a."36_months" AS "39_months",
    4::numeric * ((a."42_months" - a."36_months") / 6::numeric) + a."36_months" AS "40_months",
    5::numeric * ((a."42_months" - a."36_months") / 6::numeric) + a."36_months" AS "41_months",
    a."42_months",
    1::numeric * ((a."48_months" - a."42_months") / 6::numeric) + a."42_months" AS "43_months",
    2::numeric * ((a."48_months" - a."42_months") / 6::numeric) + a."42_months" AS "44_months",
    3::numeric * ((a."48_months" - a."42_months") / 6::numeric) + a."42_months" AS "45_months",
    4::numeric * ((a."48_months" - a."42_months") / 6::numeric) + a."42_months" AS "46_months",
    5::numeric * ((a."48_months" - a."42_months") / 6::numeric) + a."42_months" AS "47_months",
    a."48_months",
    1::numeric * ((a."54_months" - a."48_months") / 6::numeric) + a."48_months" AS "49_months",
    2::numeric * ((a."54_months" - a."48_months") / 6::numeric) + a."48_months" AS "50_months",
    3::numeric * ((a."54_months" - a."48_months") / 6::numeric) + a."48_months" AS "51_months",
    4::numeric * ((a."54_months" - a."48_months") / 6::numeric) + a."48_months" AS "52_months",
    5::numeric * ((a."54_months" - a."48_months") / 6::numeric) + a."48_months" AS "53_months",
    a."54_months",
    1::numeric * ((a."60_months" - a."54_months") / 6::numeric) + a."54_months" AS "55_months",
    2::numeric * ((a."60_months" - a."54_months") / 6::numeric) + a."54_months" AS "56_months",
    3::numeric * ((a."60_months" - a."54_months") / 6::numeric) + a."54_months" AS "57_months",
    4::numeric * ((a."60_months" - a."54_months") / 6::numeric) + a."54_months" AS "58_months",
    5::numeric * ((a."60_months" - a."54_months") / 6::numeric) + a."54_months" AS "59_months",
    a."60_months",
    1::numeric * ((a."66_months" - a."60_months") / 6::numeric) + a."60_months" AS "61_months",
    2::numeric * ((a."66_months" - a."60_months") / 6::numeric) + a."60_months" AS "62_months",
    3::numeric * ((a."66_months" - a."60_months") / 6::numeric) + a."60_months" AS "63_months",
    4::numeric * ((a."66_months" - a."60_months") / 6::numeric) + a."60_months" AS "64_months",
    5::numeric * ((a."66_months" - a."60_months") / 6::numeric) + a."60_months" AS "65_months",
    a."66_months",
    1::numeric * ((a."72_months" - a."66_months") / 6::numeric) + a."66_months" AS "67_months",
    2::numeric * ((a."72_months" - a."66_months") / 6::numeric) + a."66_months" AS "68_months",
    3::numeric * ((a."72_months" - a."66_months") / 6::numeric) + a."66_months" AS "69_months",
    4::numeric * ((a."72_months" - a."66_months") / 6::numeric) + a."66_months" AS "70_months",
    5::numeric * ((a."72_months" - a."66_months") / 6::numeric) + a."66_months" AS "71_months",
    a."72_months",
    1::numeric * ((a."78_months" - a."72_months") / 6::numeric) + a."72_months" AS "73_months",
    2::numeric * ((a."78_months" - a."72_months") / 6::numeric) + a."72_months" AS "74_months",
    3::numeric * ((a."78_months" - a."72_months") / 6::numeric) + a."72_months" AS "75_months",
    4::numeric * ((a."78_months" - a."72_months") / 6::numeric) + a."72_months" AS "76_months",
    5::numeric * ((a."78_months" - a."72_months") / 6::numeric) + a."72_months" AS "77_months",
    a."78_months",
    1::numeric * ((a."84_months" - a."78_months") / 6::numeric) + a."78_months" AS "79_months",
    2::numeric * ((a."84_months" - a."78_months") / 6::numeric) + a."78_months" AS "80_months",
    3::numeric * ((a."84_months" - a."78_months") / 6::numeric) + a."78_months" AS "81_months",
    4::numeric * ((a."84_months" - a."78_months") / 6::numeric) + a."78_months" AS "82_months",
    5::numeric * ((a."84_months" - a."78_months") / 6::numeric) + a."78_months" AS "83_months",
    a."84_months",
    1::numeric * ((a."90_months" - a."84_months") / 6::numeric) + a."84_months" AS "85_months",
    2::numeric * ((a."90_months" - a."84_months") / 6::numeric) + a."84_months" AS "86_months",
    3::numeric * ((a."90_months" - a."84_months") / 6::numeric) + a."84_months" AS "87_months",
    4::numeric * ((a."90_months" - a."84_months") / 6::numeric) + a."84_months" AS "88_months",
    5::numeric * ((a."90_months" - a."84_months") / 6::numeric) + a."84_months" AS "89_months",
    a."90_months",
    1::numeric * ((a."96_months" - a."90_months") / 6::numeric) + a."90_months" AS "91_months",
    2::numeric * ((a."96_months" - a."90_months") / 6::numeric) + a."90_months" AS "92_months",
    3::numeric * ((a."96_months" - a."90_months") / 6::numeric) + a."90_months" AS "93_months",
    4::numeric * ((a."96_months" - a."90_months") / 6::numeric) + a."90_months" AS "94_months",
    5::numeric * ((a."96_months" - a."90_months") / 6::numeric) + a."90_months" AS "95_months",
    a."96_months",
    1::numeric * ((a."102_months" - a."96_months") / 6::numeric) + a."96_months" AS "97_months",
    2::numeric * ((a."102_months" - a."96_months") / 6::numeric) + a."96_months" AS "98_months",
    3::numeric * ((a."102_months" - a."96_months") / 6::numeric) + a."96_months" AS "99_months",
    4::numeric * ((a."102_months" - a."96_months") / 6::numeric) + a."96_months" AS "100_months",
    5::numeric * ((a."102_months" - a."96_months") / 6::numeric) + a."96_months" AS "101_months",
    a."102_months",
    1::numeric * ((a."108_months" - a."102_months") / 6::numeric) + a."102_months" AS "103_months",
    2::numeric * ((a."108_months" - a."102_months") / 6::numeric) + a."102_months" AS "104_months",
    3::numeric * ((a."108_months" - a."102_months") / 6::numeric) + a."102_months" AS "105_months",
    4::numeric * ((a."108_months" - a."102_months") / 6::numeric) + a."102_months" AS "106_months",
    5::numeric * ((a."108_months" - a."102_months") / 6::numeric) + a."102_months" AS "107_months",
    a."108_months"
   FROM p_and_c.auto_ldf a
  WHERE a.uploaded_at = (( SELECT max(auto_ldf.uploaded_at) AS max
           FROM p_and_c.auto_ldf));
GO

/*** PERMISSIONS ***/
ALTER VIEW p_and_c.all_auto_ldf OWNER TO mj_admin;
GO

Grant select on table p_and_c.all_auto_ldf to rl_pc_data_analyst;
GO

Grant select on table p_and_c.all_auto_ldf to rl_pc_rpa_developer;
GO

Grant select on table p_and_c.all_auto_ldf to rpauser;
GO
GRANT SELECT ON p_and_c.all_auto_ldf to rl_p_and_c_r;
GO

GRANT INSERT ON p_and_c.all_auto_ldf to rl_p_and_c_a;
GO

GRANT UPDATE ON p_and_c.all_auto_ldf to rl_p_and_c_w;
GO

GRANT DELETE ON p_and_c.all_auto_ldf to rl_p_and_c_d;
GO