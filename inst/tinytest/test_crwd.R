library(tinytest)

# load_all("bfett.processes"); test_bfett("crwd")

# Error in FUN(X[[i]], ...) : more sold than bought, isin=US22788C1053
# Calls: <Anonymous> ... lapply -> FUN -> transform -> do.call -> lapply -> FUN

# 

dat <- read.table(header=TRUE, sep="\t", text="
isin	name	date	size	amount	type	portfolio	broker
US8740391003	TSMC	2025-07-10	6	3.16	other	nert	tr
IL0010811243	Elbit Systems	2025-07-07	1	0.38	other	nert	tr
DE000BASF111	BASF	2025-07-07	12	500.08	buy	nert	tr
DK0062498333	Novo Nordisk	2025-07-07	8	480.36	buy	nert	tr
LU1681045024	MSCI EM Latin America EUR (Acc)	2025-07-07	7.110352	108.58	sell	nert	tr
US9842451000	YPF (ADR)	2025-07-07	3	79.4	sell	nert	tr
US6976602077	Pampa Energia (GDR)	2025-07-07	1	60.5	sell	nert	tr
US54150E1047	Loma Negra (ADR)	2025-07-07	10	94.5	sell	nert	tr
US6668071029	Northrop Grumman	2025-07-07	0.208637	88.88	sell	nert	tr
US5398301094	Lockheed Martin	2025-07-07	0.226321	88.54	sell	nert	tr
IL0010811243	Elbit Systems	2025-07-07	1	378	sell	nert	tr
US22788C1053	Crowdstrike Holdings (A)	2025-07-07	1	428.6	sell	nert	tr
NO0013536151	Kongsberg Gruppen	2025-07-07	15	461.9	sell	nert	tr
XS2115336336	Responsibly Sourced Physical Gold USD (Acc)	2025-07-04	4	113.2	buy	elvis	tr
		2025-07-03		113.2	deposit	elvis	tr
	Interest	2025-07-01	16661.98	28.47	other	nert	tr
DK0062498333	Novo Nordisk	2025-06-30	9	533.08	buy	nert	tr
DK0062498333	Novo Nordisk	2025-06-30	8	475.96	buy	nert	tr
DE000BAY0017	Bayer	2025-06-30	19	506.59	buy	nert	tr
DE000BASF111	BASF	2025-06-30	12	512.68	buy	nert	tr
	Tax credit	2025-06-28		21.1	other	nert	tr
US5398301094	Lockheed Martin	2025-06-27	0.226321	0.55	other	nert	tr
US7475251036	Qualcomm	2025-06-26	4	2.61	other	nert	tr
US91324P1021	UnitedHealth Group	2025-06-24	5	8.18	other	nert	tr
DE000BASF111	BASF	2025-06-24	26	1105.74	buy	nert	tr
US21036P1084	Constellation Brands	2025-06-24	3	426.25	buy	nert	tr
US02079K3059	Alphabet (A)	2025-06-24	3	434.98	buy	nert	tr
US6668071029	Northrop Grumman	2025-06-18	0.208637	0.35	other	nert	tr
US0378331005	Apple	2025-06-16	2	342.04	sell	nert	tr
US21036P1084	Constellation Brands	2025-06-16	3	431.5	buy	nert	tr
US18915M1071	Cloudflare (A)	2025-06-16	4	595.4	sell	nert	tr
US4385161066	Honeywell	2025-06-16	1	192.84	sell	nert	tr
US5949181045	Microsoft	2025-06-16	0.270728	110.2	sell	nert	tr
DE000BAY0017	Bayer	2025-06-16	18	498.52	buy	nert	tr
US8740391003	TSMC	2025-06-16	3	551.8	buy	nert	tr
US02079K3059	Alphabet (A)	2025-06-16	3	455.92	buy	nert	tr
DK0062498333	Novo Nordisk	2025-06-16	8	543	buy	nert	tr
US02079K3059	Alphabet (A)	2025-06-16	8	1.24	other	nert	tr
DE000BAY0017	Bayer	2025-06-13	19	519.51	buy	nert	tr
US5949181045	Microsoft	2025-06-12	0.270728	0.16	other	nert	tr
US98980G1022	Zscaler	2025-06-12	3	770	sell	nert	tr
ES0173516115	Repsol	2025-06-10	43	523.17	sell	nert	tr
NO0010096985	Equinor	2025-06-09	24	514.04	sell	nert	tr
IE00BWBXM492	S&P U.S. Energy Select Sector	2025-06-09	18	513.71	sell	nert	tr
US6745991058	Occidental Petroleum	2025-06-09	13	490.32	buy	nert	tr
US8740391003	TSMC	2025-06-09	3	544.6	buy	nert	tr
US0079031078	AMD	2025-06-09	5	520.6	buy	nert	tr
US91324P1021	UnitedHealth Group	2025-06-09	2	537.4	buy	nert	tr
DK0062498333	Novo Nordisk	2025-06-09	8	531.96	buy	nert	tr
US4385161066	Honeywell	2025-06-06	1	0.84	other	nert	tr
		2025-06-05		10000	deposit	nert	tr
NO0013536151	Kongsberg Gruppen	2025-06-04	15	388.45	buy	nert	tr
NO0003043309	Kongsberg Gruppen	2025-06-04	3	388.45	sell	nert	tr
CA8536061010	Standard Lithium	2025-06-04	364	501.14	buy	nert	tr
DE000VK427B5	Short BTC	2025-06-03	7	479.52	buy	nert	tr
DK0062498333	Novo Nordisk	2025-06-02	8	501.96	buy	nert	tr
US88160R1014	Tesla	2025-06-02	1	297.5	sell	nert	tr
US91324P1021	UnitedHealth Group	2025-06-02	2	534.8	buy	nert	tr
GB0002634946	BAE Systems	2025-06-02	5	1.22	other	nert	tr
US67066G1040	NVIDIA	2025-06-02	2	234.48	sell	nert	tr
	Interest	2025-06-01	12557.6	24	other	nert	tr
NO0010096985	Equinor	2025-05-28	24	5.87	other	nert	tr
ES0173516115	Repsol	2025-05-27	43	508.55	buy	nert	tr
IE00BWBXM492	S&P U.S. Energy Select Sector	2025-05-27	18	510.85	buy	nert	tr
NO0003043309	Kongsberg Gruppen	2025-05-27	3	1.96	other	nert	tr
US0378331005	Apple	2025-05-15		0.39	other	nert	tr
US81762P1021	ServiceNow	2025-05-12	0.583771	522.53	sell	nert	tr
US0846707026	Berkshire Hathaway (B)	2025-05-05	1	466.35	buy	nert	tr
NO0010096985	Equinor	2025-02-12	24	509.32	buy	nert	tr
US91324P1021	UnitedHealth Group	2025-02-12	1	343.3	buy	nert	tr
DK0062498333	Novo Nordisk	2025-05-05	9	501.31	buy	nert	tr
DE000SX80WH0	Short @203.18 $ Palantir Best Turbo	2025-05-05	70	522.6	sell	nert	tr
US0320951017	Amphenol	2025-05-05	2	141.02	sell	nert	tr
IL0010811243	Elbit Systems	2025-05-05	1	0.44	other	nert	tr
DE000SX80WH0	Short @203.18 $ Palantir Best Turbo	2025-05-05	70	499.4	buy	nert	tr
US0846707026	Berkshire Hathaway (B)	2025-05-05	1	465.15	buy	nert	tr
US8725901040	T-Mobile US	2025-05-05	1	217.65	sell	nert	tr
DK0062498333	Novo Nordisk	2025-05-05	8	499.64	buy	nert	tr
US6745991058	Occidental Petroleum	2025-05-05	13	459.97	buy	nert	tr
US21036P1084	Constellation Brands	2025-05-05	3	494.95	buy	nert	tr
	Tax credit	2025-05-02		65.62	other	nert	tr
	Interest	2025-05-01	16076.29	32.18	other	nert	tr
XS2115336336	Responsibly Sourced Physical Gold USD (Acc)	2025-04-30	2	58.08	buy	elvis	tr
		2025-04-30		58.08	deposit	elvis	tr
US36847Q1031	Geely Auto (ADR)	2025-04-28	3	109.6	buy	nert	tr
US98422D1054	Xpeng (ADR)	2025-04-28	6	106.3	buy	nert	tr
GB0002634946	BAE Systems	2025-04-28	5	92.3	sell	nert	tr
DE000HAG0005	Hensoldt	2025-04-28	1	56.57	sell	nert	tr
FR0000121329	Thales	2025-04-28	1	213.1	sell	nert	tr
US6745991058	Occidental Petroleum	2025-04-28	13	461.07	buy	nert	tr
US4385161066	Honeywell	2025-04-28	1	177.08	buy	nert	tr
US8725901040	T-Mobile US	2025-04-28	1	205.6	buy	nert	tr
JP3497400006	Daifuku	2025-04-28	5	116	buy	nert	tr
US6745991058	Occidental Petroleum	2025-04-22	13	449.5	buy	nert	tr
		2025-04-10		55.36	deposit	elvis	tr
NO0003043309	Kongsberg Gruppen	2025-04-14	3	388.45	buy	nert	tr
US8740391003	TSMC	2025-04-10	3	1.16	other	nert	tr
US0320951017	Amphenol	2025-04-09	2	0.23	other	nert	tr
XS2115336336	Responsibly Sourced Physical Gold USD (Acc)	2025-04-07	2	55.36	buy	elvis	tr
US67066G1040	NVIDIA	2025-04-02	2	0.01	other	nert	tr
	Interest	2025-04-01	18223.55	29.65	other	nert	tr
US5398301094	Lockheed Martin	2025-03-28	0.226321	0.51	other	nert	tr
US7475251036	Qualcomm	2025-03-27	4	2.34	other	nert	tr
US76954A1034	Rivian Automotive	2025-03-25	9	101.8	buy	nert	tr
CNE100000296	BYD	2025-03-24	2	100	buy	nert	tr
KYG9830T1067	Xiaomi	2025-03-24	75	483.93	buy	nert	tr
US62914V1061	Nio (ADR)	2025-03-24	25	103.75	buy	nert	tr
US7960508882	Samsung	2025-03-24	1	945.62	sell	nert	tr
US6668071029	Northrop Grumman	2025-03-19	0.208637	0.29	other	nert	tr
LU2023679090	Future Mobility USD (Acc)	2025-03-17	30	508.9	buy	nert	tr
US88160R1014	Tesla	2025-03-17	1	226.1	buy	nert	tr
US22788C1053	Crowdstrike Holdings (A)	2025-03-17	1	324.75	buy	nert	tr
US02079K3059	Alphabet (A)	2025-03-17	8	1.09	other	nert	tr
US98980G1022	Zscaler	2025-03-17	3	544.54	buy	nert	tr
US0231351067	Amazon.com	2025-03-17	2	363.12	buy	nert	tr
US5949181045	Microsoft	2025-03-13	0.270728	0.14	other	nert	tr
US67066G1040	NVIDIA	2025-03-10	2	203	buy	nert	tr
US0231351067	Amazon.com	2025-03-10	2	363.04	buy	nert	tr
DE000SY7X727	Short @1.65 $ EUR/USD Best Turbo	2025-03-10	8	425.16	buy	nert	tr
US8740391003	TSMC	2025-03-10	3	487	buy	nert	tr
US0378331005	Apple	2025-03-10	2	438	buy	nert	tr
US0079031078	AMD	2025-03-07	6	544.06	buy	nert	tr
US81762P1021	ServiceNow	2025-03-05	0.583771	501	buy	nert	tr
US7475251036	Qualcomm	2025-03-04	4	587	buy	nert	tr
US0231351067	Amazon.com	2025-03-04	2	386.48	buy	nert	tr
	Interest	2025-03-01	13676.9	21.7	other	nert	tr
KYG9830T1067	Xiaomi	2025-02-27	100	704.26	sell	nert	tr
US05961W1053	Banco Macro	2025-02-25	1	78.5	sell	nert	tr
US69608A1088	Palantir Technologies	2025-02-25	2	167.56	sell	nert	tr
	Tax credit	2025-02-25		15.08	other	nert	tr
US18915M1071	Cloudflare (A)	2025-02-24	4	584.44	buy	nert	tr
US0231351067	Amazon.com	2025-02-24	10	2073.5	buy	nert	tr
US2435371073	Deckers Outdoor	2025-02-24	4	563.6	buy	nert	tr
US8522341036	Block	2025-02-24	9	596.44	buy	nert	tr
DE000VC8R2Y5	BTC Short 143,010 $	2025-02-24	6	423.14	sell	nert	tr
XS2971936948	HU Anleihe Jun 2034	2025-02-24	1	1000.38	sell	nert	tr
XS2586944147	PL Anleihe Feb 2043	2025-02-24	1	4794.11	sell	nert	tr
IT0005534141	IT Anleihe Okt 2053	2025-02-24	1	4872.69	sell	nert	tr
FR0010171975	FR Anleihe Apr 2055	2025-02-24	1	4883	sell	nert	tr
US02079K3059	Alphabet (A)	2025-02-21	5	884.7	buy	nert	tr
GB00B1XH2C03	Ferrexpo	2025-02-20	90	83.6	sell	nert	tr
US08975B1098	BigBear.ai	2025-02-19	15	105.38	sell	nert	tr
XS2586944147	PL Anleihe Feb 2043	2025-02-14	1	181.52	other	nert	tr
US52661A1088	Leonardo DRS	2025-02-14	2	56.26	sell	nert	tr
US02079K3059	Alphabet (A)	2025-02-11	3	540.1	buy	nert	tr
GB00B1XH2C03	Ferrexpo	2025-02-11	90	99.1	buy	nert	tr
US08975B1098	BigBear.ai	2025-02-11	15	125.47	buy	nert	tr
	Tax credit	2025-02-06		34.01	other	nert	tr
KYG9830T1067	Xiaomi	2025-02-05	100	494.2	buy	nert	tr
XS2971936948	HU Anleihe Jun 2034	2025-02-05	1	1001.38	buy	nert	tr
XS2586944147	PL Anleihe Feb 2043	2025-02-05	1	5000.99	buy	nert	tr
IT0005534141	IT Anleihe Okt 2053	2025-02-05	1	5001	buy	nert	tr
IE00B4ND3602	Physical Gold USD (Acc)	2025-02-03	9.376465	501	buy	nert	tr
DE000VC8R2Y5	BTC Short 143,010 $	2025-02-03	6	443.38	buy	nert	tr
BTC	BTC	2025-02-02	0.00485	462.51	sell	nert	tr
	Interest	2025-02-01	24143.35	45.29	other	nert	tr
IL0010811243	Elbit Systems	2025-01-29	1	293	buy	nert	tr
US5398301094	Lockheed Martin	2025-01-29	0.226321	101	buy	nert	tr
LU1681045024	MSCI EM Latin America EUR (Acc)	2025-01-27	7.110352	101	buy	nert	tr
US9842451000	YPF (ADR)	2025-01-27	3	113.2	buy	nert	tr
US6976602077	Pampa Energia (GDR)	2025-01-27	1	79.5	buy	nert	tr
US54150E1047	Loma Negra (ADR)	2025-01-27	10	109	buy	nert	tr
US05961W1053	Banco Macro	2025-01-27	1	93.5	buy	nert	tr
US69608A1088	Palantir Technologies	2025-01-27	2	141.02	buy	nert	tr
US6668071029	Northrop Grumman	2025-01-27	0.208637	101	buy	nert	tr
GB0002634946	BAE Systems	2025-01-27	5	74.98	buy	nert	tr
US52661A1088	Leonardo DRS	2025-01-27	2	67.42	buy	nert	tr
DE000HAG0005	Hensoldt	2025-01-27	1	38.6	buy	nert	tr
FR0000121329	Thales	2025-01-27	1	154.66	buy	nert	tr
US5949181045	Microsoft	2025-01-27	0.245128	100.99	buy	nert	tr
US0320951017	Amphenol	2025-01-27	2	135.22	buy	nert	tr
BTC	BTC	2025-01-19	0.00485	500.93	buy	nert	tr
US7960508882	Samsung (GDR)	2025-01-07	1	925	buy	nert	tr
	Interest	2025-01-01	25297.58	49.63	other	nert	tr
US5949181045	Microsoft	2024-12-12	0.0256	0.01	other	nert	tr
	Interest	2024-12-01	25249.5	49.68	other	nert	tr
	Interest	2024-11-01	28878.97	62.04	other	nert	tr
	Tax credit	2024-10-25		24.41	other	nert	tr
FR0010171975	FR Anleihe Apr 2055	2024-10-24	1	5000.99	buy	nert	tr
	Interest	2024-10-01	24044.85	53	other	nert	tr
		2024-09-19		10000	deposit	nert	tr
US5949181045	Microsoft	2024-09-12	0.0256	0.01	other	nert	tr
US22788C1053	Crowdstrike Holdings (A)	2024-09-06	1.769285	397.09	sell	nert	tr
	Interest	2024-09-01	19667.18	46.76	other	nert	tr
	Interest	2024-08-01	19910.9	47.34	other	nert	tr
US22788C1053	Crowdstrike Holdings (A)	2024-07-19	1.769285	501.27	buy	nert	tr
	Interest	2024-07-01	20073.79	47.31	other	nert	tr
US5949181045	Microsoft	2024-06-13	0.0256	0.01	other	nert	tr
	Interest	2024-06-01	11209.6	28.43	other	nert	tr
IE0031442068	Core S&P 500 USD (Dist)	2024-05-31	146.443514	7046.95	sell	nert	tr
		2024-05-06		12500	deposit	nert	tr
	Interest	2024-05-01	498	0.41	other	nert	tr
IE0031442068	Core S&P 500 USD (Dist)	2024-04-08	146.443514	7001.29	buy	nert	tr
IE00B4ND3602	Physical Gold USD (Acc)	2024-04-08	178.274304	7501.71	buy	nert	tr
US5949181045	Microsoft	2024-04-04	0.0256	0	buy	nert	tr
		2024-04-04		15000	deposit	nert	tr
		2024-04-03		1	deposit	nert	tr
")

tmp_dir <- tempdir()
expect_error(process_transactions(dat, seeds = tmp_dir, verbose=TRUE))

unlink(tmp_dir)

#browser()
