--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.4
-- Dumped by pg_dump version 9.4.4
-- Started on 2018-11-10 15:04:53

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 7 (class 2615 OID 36384)
-- Name: breeder_farmer; Type: SCHEMA; Schema: -; Owner: fh
--

CREATE SCHEMA breeder_farmer;


ALTER SCHEMA breeder_farmer OWNER TO fh;

--
-- TOC entry 197 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2138 (class 0 OID 0)
-- Dependencies: 197
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = breeder_farmer, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 195 (class 1259 OID 36387)
-- Name: farmer_eggs; Type: TABLE; Schema: breeder_farmer; Owner: fh; Tablespace: 
--

CREATE TABLE farmer_eggs (
    farmer_eggs_id integer NOT NULL,
    flock_id integer,
    farmer_eggs_date date,
    farmer_eggs_amount numeric(5,0),
    user_added character varying(12),
    date_added timestamp without time zone DEFAULT now(),
    recorded character varying(1),
    recorded_date timestamp without time zone,
    recorded_by character varying(12)
);


ALTER TABLE farmer_eggs OWNER TO fh;

--
-- TOC entry 194 (class 1259 OID 36385)
-- Name: farmer_eggs_farmer_eggs_id_seq; Type: SEQUENCE; Schema: breeder_farmer; Owner: fh
--

CREATE SEQUENCE farmer_eggs_farmer_eggs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE farmer_eggs_farmer_eggs_id_seq OWNER TO fh;

--
-- TOC entry 2139 (class 0 OID 0)
-- Dependencies: 194
-- Name: farmer_eggs_farmer_eggs_id_seq; Type: SEQUENCE OWNED BY; Schema: breeder_farmer; Owner: fh
--

ALTER SEQUENCE farmer_eggs_farmer_eggs_id_seq OWNED BY farmer_eggs.farmer_eggs_id;


--
-- TOC entry 196 (class 1259 OID 36398)
-- Name: farmer_users; Type: TABLE; Schema: breeder_farmer; Owner: fh; Tablespace: 
--

CREATE TABLE farmer_users (
    user_login character varying(12) NOT NULL,
    farm_id integer,
    user_name character varying(20),
    user_password character varying(40),
    user_status character(1),
    user_added character varying(12),
    date_added timestamp without time zone DEFAULT now()
);


ALTER TABLE farmer_users OWNER TO fh;

SET search_path = public, pg_catalog;

--
-- TOC entry 173 (class 1259 OID 36288)
-- Name: breed; Type: TABLE; Schema: public; Owner: fh; Tablespace: 
--

CREATE TABLE breed (
    breed_id integer NOT NULL,
    breed_name character varying(30),
    poultry_type_id integer,
    user_added character(12),
    date_added time without time zone DEFAULT now()
);


ALTER TABLE breed OWNER TO fh;

--
-- TOC entry 174 (class 1259 OID 36292)
-- Name: breed_breed_id_seq; Type: SEQUENCE; Schema: public; Owner: fh
--

CREATE SEQUENCE breed_breed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE breed_breed_id_seq OWNER TO fh;

--
-- TOC entry 2140 (class 0 OID 0)
-- Dependencies: 174
-- Name: breed_breed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fh
--

ALTER SEQUENCE breed_breed_id_seq OWNED BY breed.breed_id;


--
-- TOC entry 175 (class 1259 OID 36294)
-- Name: eggs_age; Type: TABLE; Schema: public; Owner: fh; Tablespace: 
--

CREATE TABLE eggs_age (
    eggs_age_id integer NOT NULL,
    eggs_age_week integer,
    eggs_age_qty numeric(8,6),
    eggs_age_date date
);


ALTER TABLE eggs_age OWNER TO fh;

--
-- TOC entry 176 (class 1259 OID 36297)
-- Name: eggs_age_eggs_age_id_seq; Type: SEQUENCE; Schema: public; Owner: fh
--

CREATE SEQUENCE eggs_age_eggs_age_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE eggs_age_eggs_age_id_seq OWNER TO fh;

--
-- TOC entry 2141 (class 0 OID 0)
-- Dependencies: 176
-- Name: eggs_age_eggs_age_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fh
--

ALTER SEQUENCE eggs_age_eggs_age_id_seq OWNED BY eggs_age.eggs_age_id;


--
-- TOC entry 177 (class 1259 OID 36299)
-- Name: farm; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE farm (
    farm_id integer NOT NULL,
    farm_name character varying(30),
    farm_contract numeric(5,0),
    farm_owner character varying(30),
    farm_address character varying(60),
    farm_email character varying(30),
    farm_phone character varying(15),
    user_added character varying(12),
    date_added timestamp without time zone DEFAULT now(),
    farm_code character varying(5),
    farm_import character varying(1) NOT NULL,
    poultry_type_id integer,
    farm_initials character varying(3)
);


ALTER TABLE farm OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 36303)
-- Name: farm_farm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE farm_farm_id_seq
    START WITH 101
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE farm_farm_id_seq OWNER TO postgres;

--
-- TOC entry 2142 (class 0 OID 0)
-- Dependencies: 178
-- Name: farm_farm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE farm_farm_id_seq OWNED BY farm.farm_id;


--
-- TOC entry 179 (class 1259 OID 36305)
-- Name: flock; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE flock (
    flock_id integer NOT NULL,
    farm_id integer,
    flock_dob date,
    flock_contract numeric(5,0),
    flock_quantity numeric(5,0),
    flock_proj_start date,
    flock_act_start date,
    flock_proj_end date,
    flock_act_end date,
    flock_status character(1),
    flock_code character varying(5),
    flock_memo character varying(60),
    user_added character varying(12),
    date_added timestamp without time zone DEFAULT now(),
    breed_id integer
);


ALTER TABLE flock OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 36309)
-- Name: flock_eggs; Type: TABLE; Schema: public; Owner: fh; Tablespace: 
--

CREATE TABLE flock_eggs (
    flock_eggs_id integer NOT NULL,
    flock_id integer,
    flock_eggs_date date,
    flock_eggs_amount numeric(5,0),
    user_added character varying(12),
    date_added timestamp without time zone DEFAULT now(),
    memo character varying(30)
);


ALTER TABLE flock_eggs OWNER TO fh;

--
-- TOC entry 181 (class 1259 OID 36313)
-- Name: flock_eggs_flock_eggs_id_seq; Type: SEQUENCE; Schema: public; Owner: fh
--

CREATE SEQUENCE flock_eggs_flock_eggs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE flock_eggs_flock_eggs_id_seq OWNER TO fh;

--
-- TOC entry 2143 (class 0 OID 0)
-- Dependencies: 181
-- Name: flock_eggs_flock_eggs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fh
--

ALTER SEQUENCE flock_eggs_flock_eggs_id_seq OWNED BY flock_eggs.flock_eggs_id;


--
-- TOC entry 182 (class 1259 OID 36315)
-- Name: flock_flock_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE flock_flock_id_seq
    START WITH 1001
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE flock_flock_id_seq OWNER TO postgres;

--
-- TOC entry 2144 (class 0 OID 0)
-- Dependencies: 182
-- Name: flock_flock_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE flock_flock_id_seq OWNED BY flock.flock_id;


--
-- TOC entry 183 (class 1259 OID 36317)
-- Name: login_log; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE login_log (
    log_id integer NOT NULL,
    log_string character varying(40),
    log_token character varying(100),
    user_added character varying(12),
    date_added timestamp without time zone DEFAULT now()
);


ALTER TABLE login_log OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 36321)
-- Name: login_log_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE login_log_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE login_log_log_id_seq OWNER TO postgres;

--
-- TOC entry 2145 (class 0 OID 0)
-- Dependencies: 184
-- Name: login_log_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE login_log_log_id_seq OWNED BY login_log.log_id;


--
-- TOC entry 185 (class 1259 OID 36323)
-- Name: lot; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE lot (
    lot_id integer NOT NULL,
    flock_id integer,
    lot_del_date date,
    lot_del_qty integer,
    lot_stay_home integer,
    lot_del_pm integer,
    lot_flock_age integer,
    lot_rec_by character varying(12),
    lot_del_by character varying(25),
    lot_receive_memo character varying(60),
    lot_import_flock character varying(10),
    lot_receive_user character varying(12),
    lot_set_date date,
    lot_sort_date date,
    lot_saleable_qty integer,
    lot_reject_qty integer,
    lot_popper_qty integer,
    lot_sort_by character varying(12),
    lot_sort_by2 character varying(12),
    lot_sort_memo character varying(60),
    lot_sort_user character varying(12),
    lot_pay_price numeric(2,2),
    user_added character varying(12),
    date_added timestamp without time zone DEFAULT now(),
    breed_id integer,
    lot_hatched_qty integer,
    lot_cockerel_qty integer,
    poultry_type_id integer
);


ALTER TABLE lot OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 36327)
-- Name: lot_lot_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE lot_lot_id_seq
    START WITH 50001
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lot_lot_id_seq OWNER TO postgres;

--
-- TOC entry 2146 (class 0 OID 0)
-- Dependencies: 186
-- Name: lot_lot_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE lot_lot_id_seq OWNED BY lot.lot_id;


--
-- TOC entry 187 (class 1259 OID 36329)
-- Name: poultry_type; Type: TABLE; Schema: public; Owner: fh; Tablespace: 
--

CREATE TABLE poultry_type (
    poultry_type_id integer NOT NULL,
    poultry_type_name character varying(30),
    poultry_type_incubation_time integer,
    user_added character(12),
    ddate_added timestamp without time zone DEFAULT now()
);


ALTER TABLE poultry_type OWNER TO fh;

--
-- TOC entry 188 (class 1259 OID 36333)
-- Name: poultry_type_poultry_type_id_seq; Type: SEQUENCE; Schema: public; Owner: fh
--

CREATE SEQUENCE poultry_type_poultry_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE poultry_type_poultry_type_id_seq OWNER TO fh;

--
-- TOC entry 2147 (class 0 OID 0)
-- Dependencies: 188
-- Name: poultry_type_poultry_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fh
--

ALTER SEQUENCE poultry_type_poultry_type_id_seq OWNED BY poultry_type.poultry_type_id;


--
-- TOC entry 189 (class 1259 OID 36335)
-- Name: price; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE price (
    price_id integer NOT NULL,
    price_pay numeric(2,2),
    user_added character varying(12),
    date_added timestamp without time zone DEFAULT now(),
    breed_id integer
);


ALTER TABLE price OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 36339)
-- Name: price_price_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE price_price_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE price_price_id_seq OWNER TO postgres;

--
-- TOC entry 2148 (class 0 OID 0)
-- Dependencies: 190
-- Name: price_price_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE price_price_id_seq OWNED BY price.price_id;


--
-- TOC entry 191 (class 1259 OID 36341)
-- Name: seasonal_percent; Type: TABLE; Schema: public; Owner: fh; Tablespace: 
--

CREATE TABLE seasonal_percent (
    seasonal_percent_id integer NOT NULL,
    seasonal_percent_week integer,
    seasonal_percent numeric(8,6),
    seasonal_percent_date date
);


ALTER TABLE seasonal_percent OWNER TO fh;

--
-- TOC entry 192 (class 1259 OID 36344)
-- Name: seasonal_percent_seasonal_percent_id_seq; Type: SEQUENCE; Schema: public; Owner: fh
--

CREATE SEQUENCE seasonal_percent_seasonal_percent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seasonal_percent_seasonal_percent_id_seq OWNER TO fh;

--
-- TOC entry 2149 (class 0 OID 0)
-- Dependencies: 192
-- Name: seasonal_percent_seasonal_percent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fh
--

ALTER SEQUENCE seasonal_percent_seasonal_percent_id_seq OWNED BY seasonal_percent.seasonal_percent_id;


--
-- TOC entry 193 (class 1259 OID 36346)
-- Name: users; Type: TABLE; Schema: public; Owner: fh; Tablespace: 
--

CREATE TABLE users (
    user_login character varying(12) NOT NULL,
    user_name character varying(20),
    user_password character varying(40),
    user_status character(1),
    user_added character varying(12),
    date_added timestamp without time zone DEFAULT now()
);


ALTER TABLE users OWNER TO fh;

SET search_path = breeder_farmer, pg_catalog;

--
-- TOC entry 1969 (class 2604 OID 36390)
-- Name: farmer_eggs_id; Type: DEFAULT; Schema: breeder_farmer; Owner: fh
--

ALTER TABLE ONLY farmer_eggs ALTER COLUMN farmer_eggs_id SET DEFAULT nextval('farmer_eggs_farmer_eggs_id_seq'::regclass);


SET search_path = public, pg_catalog;

--
-- TOC entry 1951 (class 2604 OID 36350)
-- Name: breed_id; Type: DEFAULT; Schema: public; Owner: fh
--

ALTER TABLE ONLY breed ALTER COLUMN breed_id SET DEFAULT nextval('breed_breed_id_seq'::regclass);


--
-- TOC entry 1952 (class 2604 OID 36351)
-- Name: eggs_age_id; Type: DEFAULT; Schema: public; Owner: fh
--

ALTER TABLE ONLY eggs_age ALTER COLUMN eggs_age_id SET DEFAULT nextval('eggs_age_eggs_age_id_seq'::regclass);


--
-- TOC entry 1954 (class 2604 OID 36352)
-- Name: farm_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY farm ALTER COLUMN farm_id SET DEFAULT nextval('farm_farm_id_seq'::regclass);


--
-- TOC entry 1956 (class 2604 OID 36353)
-- Name: flock_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY flock ALTER COLUMN flock_id SET DEFAULT nextval('flock_flock_id_seq'::regclass);


--
-- TOC entry 1958 (class 2604 OID 36354)
-- Name: flock_eggs_id; Type: DEFAULT; Schema: public; Owner: fh
--

ALTER TABLE ONLY flock_eggs ALTER COLUMN flock_eggs_id SET DEFAULT nextval('flock_eggs_flock_eggs_id_seq'::regclass);


--
-- TOC entry 1960 (class 2604 OID 36355)
-- Name: log_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY login_log ALTER COLUMN log_id SET DEFAULT nextval('login_log_log_id_seq'::regclass);


--
-- TOC entry 1962 (class 2604 OID 36356)
-- Name: lot_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lot ALTER COLUMN lot_id SET DEFAULT nextval('lot_lot_id_seq'::regclass);


--
-- TOC entry 1964 (class 2604 OID 36357)
-- Name: poultry_type_id; Type: DEFAULT; Schema: public; Owner: fh
--

ALTER TABLE ONLY poultry_type ALTER COLUMN poultry_type_id SET DEFAULT nextval('poultry_type_poultry_type_id_seq'::regclass);


--
-- TOC entry 1966 (class 2604 OID 36358)
-- Name: price_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY price ALTER COLUMN price_id SET DEFAULT nextval('price_price_id_seq'::regclass);


--
-- TOC entry 1967 (class 2604 OID 36359)
-- Name: seasonal_percent_id; Type: DEFAULT; Schema: public; Owner: fh
--

ALTER TABLE ONLY seasonal_percent ALTER COLUMN seasonal_percent_id SET DEFAULT nextval('seasonal_percent_seasonal_percent_id_seq'::regclass);


SET search_path = breeder_farmer, pg_catalog;

--
-- TOC entry 2129 (class 0 OID 36387)
-- Dependencies: 195
-- Data for Name: farmer_eggs; Type: TABLE DATA; Schema: breeder_farmer; Owner: fh
--

COPY farmer_eggs (farmer_eggs_id, flock_id, farmer_eggs_date, farmer_eggs_amount, user_added, date_added, recorded, recorded_date, recorded_by) FROM stdin;
\.


--
-- TOC entry 2150 (class 0 OID 0)
-- Dependencies: 194
-- Name: farmer_eggs_farmer_eggs_id_seq; Type: SEQUENCE SET; Schema: breeder_farmer; Owner: fh
--

SELECT pg_catalog.setval('farmer_eggs_farmer_eggs_id_seq', 1, false);


--
-- TOC entry 2130 (class 0 OID 36398)
-- Dependencies: 196
-- Data for Name: farmer_users; Type: TABLE DATA; Schema: breeder_farmer; Owner: fh
--

COPY farmer_users (user_login, farm_id, user_name, user_password, user_status, user_added, date_added) FROM stdin;
mfriesen	104	John Doe	202cb962ac59075b964b07152d234b70	A	mfriesen	2018-04-25 06:32:47.529
\.


SET search_path = public, pg_catalog;

--
-- TOC entry 2107 (class 0 OID 36288)
-- Dependencies: 173
-- Data for Name: breed; Type: TABLE DATA; Schema: public; Owner: fh
--

COPY breed (breed_id, breed_name, poultry_type_id, user_added, date_added) FROM stdin;
1	Hubbard	1	admin       	12:01:17.254
3	Cobb	1	admin       	12:01:30.997
4	Generic	1	admin       	14:07:10.65
2	Ross	1	admin       	12:01:24.972
5	Novogen	2	admin       	15:22:40.891
6	Hyline	2	admin       	15:22:47.058
7	Arbor Acres	1	admin       	15:38:07.015
8	Tetra	2	admin       	15:49:35.234
\.


--
-- TOC entry 2151 (class 0 OID 0)
-- Dependencies: 174
-- Name: breed_breed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fh
--

SELECT pg_catalog.setval('breed_breed_id_seq', 8, true);


--
-- TOC entry 2109 (class 0 OID 36294)
-- Dependencies: 175
-- Data for Name: eggs_age; Type: TABLE DATA; Schema: public; Owner: fh
--

COPY eggs_age (eggs_age_id, eggs_age_week, eggs_age_qty, eggs_age_date) FROM stdin;
1	26	0.700500	2000-01-01
2	27	1.399500	2000-01-01
3	28	2.100000	2000-01-01
4	29	2.800500	2000-01-01
5	30	3.499500	2000-01-01
6	31	4.200000	2000-01-01
7	32	4.900500	2000-01-01
8	33	4.900500	2000-01-01
9	34	4.900500	2000-01-01
10	35	4.900500	2000-01-01
11	36	4.900500	2000-01-01
12	37	4.830000	2000-01-01
13	38	4.759500	2000-01-01
14	39	4.690500	2000-01-01
15	40	4.620000	2000-01-01
16	41	4.549500	2000-01-01
17	42	4.480500	2000-01-01
18	43	4.410000	2000-01-01
19	44	4.339500	2000-01-01
20	45	4.270500	2000-01-01
21	46	4.200000	2000-01-01
22	47	4.129500	2000-01-01
23	48	4.060500	2000-01-01
24	49	3.990000	2000-01-01
25	50	3.919500	2000-01-01
26	51	3.850500	2000-01-01
27	52	3.780000	2000-01-01
28	53	3.709500	2000-01-01
29	54	3.640500	2000-01-01
30	55	3.570000	2000-01-01
31	56	3.499500	2000-01-01
32	57	3.430500	2000-01-01
33	58	3.360000	2000-01-01
34	59	3.289500	2000-01-01
35	60	3.220500	2000-01-01
36	61	3.150000	2000-01-01
37	62	3.079500	2000-01-01
38	63	3.010500	2000-01-01
39	64	2.940000	2000-01-01
40	65	2.869500	2000-01-01
41	66	0.000000	2000-01-01
\.


--
-- TOC entry 2152 (class 0 OID 0)
-- Dependencies: 176
-- Name: eggs_age_eggs_age_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fh
--

SELECT pg_catalog.setval('eggs_age_eggs_age_id_seq', 41, true);


--
-- TOC entry 2111 (class 0 OID 36299)
-- Dependencies: 177
-- Data for Name: farm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY farm (farm_id, farm_name, farm_contract, farm_owner, farm_address, farm_email, farm_phone, user_added, date_added, farm_code, farm_import, poultry_type_id, farm_initials) FROM stdin;
121	Keith Smith	\N	Keith Smith	\N	\N	\N	admin	2015-06-02 13:52:30.483	\N	I	1	\N
118	CWT Farms Int	\N	CWT Farms Int	\N	\N	\N	admin	2015-04-08 17:43:35.171	\N	I	1	\N
120	Wincorp Int	\N	Wincorp International	\N	\N	\N	admin	2015-05-05 16:41:23.193	\N	I	1	\N
117	JGT - Galen	5200	Jake G Thiessen	P.O. Box 543	jthiessen@spanishlookout.bz	675-0156	admin	2015-03-18 13:23:37.71	04-18		1	\N
119	JGT - Layers	2900	Jake G Thiessen	P.O. Box 543	jthiessen@spanishlookout.bz	675-0156	admin	2015-05-05 15:50:28.083	\N		2	\N
125	Wincorp Layers	\N	Wincorp Layers	\N	\N	\N	admin	2016-05-16 15:47:55.015	\N	I	2	\N
123	Morris Hatchery	\N	Morris Hatchery	\N	\N	\N	admin	2016-04-15 11:05:42.044	\N	I	2	\N
101	Thiessen Breeders	6500	Joe K Thiessen	P.O. Box 527	joetina58@gmail.com	610-5791	admin	2015-03-18 09:53:47.972	04-03		1	tb
102	Milton P Kornelsen	2500	Milton P Kornelsen	P.O. Box 281	milton@btl.net	670-6643	admin	2015-03-18 09:53:47.972	04-15		1	mp
103	Edward K Reimer	2800	Edward K Reimer	P.O. Box 439	comebinedrivers@yahoo.com	660-1944	admin	2015-03-18 09:53:47.972	04-16		1	er
104	Abram P Reimer	4000	Abram P Reimer	P.O. Box 424	abemargreimer@gmail.com	677-3400	admin	2015-03-18 09:53:47.972	04-06		1	gb
105	Greenland Breeders	6200	Otto Penner	P.O. Box 372	ottopenner@gmail.com	670-7999	admin	2015-03-18 09:53:47.972	04-04		1	pl
106	Peter Loewen	3000	Allan Loewen	P.O. Box 321	allanliesbeth@gmail.com	668-0092	admin	2015-03-18 09:53:47.972	04-09		1	wr
107	White Rooster	2500	Anton Reimer	P.O. Box 440	antontinareimer@gmail.com	671-9688	admin	2015-03-18 09:53:47.972	04-02		1	at
108	Abe K Thiessen	8000	Abe K Thiessen	P.O. Box 528	abetty87@gmail.com	610-3787	admin	2015-03-18 09:53:47.972	04-10		1	md
109	Menno L Dueck	4700	Menno L Dueck	P.O. Box 172	leodueck@gmail.com	670-2018	admin	2015-03-18 09:53:47.972	04-11		1	al
110	Allan Loewen	4000	Allan Loewen	P.O. Box 321	allanliesbeth@gmail.com	668-0092	admin	2015-03-18 09:53:47.972	04-17		1	srf
111	Shady Rock Farm	4700	Paul Penner	P.O. Box 375	paulpenner72@gmail.com	662-5950	admin	2015-03-18 09:53:47.972	04-05		1	ld
112	Leo R Dueck	5200	Leo R Dueck	P.O. Box 176	leodueck@gmail.com	670-2018	admin	2015-03-18 09:53:47.972	04-01		1	ptb
113	Pro Tec Breeders	5000	Kenton Plett	P.O. Box 398	kentonrplett@gmail.com	674-3626	admin	2015-03-18 09:53:47.972	04-12		1	ll
114	Leonard Loewen	3200	Leonard Loewen	P.O. Box 320	leonard@excelconstruction.bz	610-4678	admin	2015-03-18 09:53:47.972	04-13		1	rp
115	Richard Penner	4500	Richard Penner	P.O. Box 679	richjamespenner@gmail.com	670-7997	admin	2015-03-18 09:53:47.972	04-19		1	jt
116	Jake Thiessen	2600	Jake G Thiessen	P.O. Box 543	jthiessen@spanishlookout.bz	675-0156	admin	2015-03-18 09:53:47.972	04-07		1	jg
\.


--
-- TOC entry 2153 (class 0 OID 0)
-- Dependencies: 178
-- Name: farm_farm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('farm_farm_id_seq', 125, true);


--
-- TOC entry 2113 (class 0 OID 36305)
-- Dependencies: 179
-- Data for Name: flock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY flock (flock_id, farm_id, flock_dob, flock_contract, flock_quantity, flock_proj_start, flock_act_start, flock_proj_end, flock_act_end, flock_status, flock_code, flock_memo, user_added, date_added, breed_id) FROM stdin;
1026	119	2014-08-19	2900	2900	2015-01-20	2015-01-19	2015-11-17	2016-03-17	E			admin	2015-05-05 16:58:43.865	6
1014	113	2014-09-02	5000	5000	2015-03-03	\N	2015-12-01	2015-12-10	E			admin	2015-03-18 13:42:03.71	4
1036	123	\N	\N	\N	\N	\N	\N	\N	A	\N	\N	admin	2016-04-15 11:09:04.513	5
1037	125	\N	\N	\N	\N	\N	\N	\N	A	\N	\N	admin	2016-05-16 15:49:42.828	8
1038	105	2016-02-02	6200	6200	2016-08-02	2016-07-28	2017-05-02	2017-04-27	E	4-093		ereimer	2016-07-28 09:44:58.222	7
1012	111	2014-07-01	4700	4700	2014-12-30	\N	2015-09-29	2015-10-22	E			admin	2015-03-18 13:40:42.413	4
1039	108	2016-03-01	7000	7000	2016-08-30	2016-09-08	2017-05-30	2017-05-25	E			ereimer	2016-09-08 08:33:15.765	7
1027	121	2016-09-22	0	\N	2016-09-22	\N	2017-09-22	\N	A	\N	\N	admin	2015-06-02 13:52:48.373	4
1049	105	2017-02-06	6200	6200	2017-08-08	2017-07-27	2018-05-08	\N	A	4-103		dthiessen	2016-12-19 11:02:00.647	2
1025	120	2015-06-08	0	90000	2015-06-08	\N	2016-06-30	\N	E	IMP		admin	2015-05-05 16:44:24.724	4
1041	116	2016-05-31	5200	5200	2016-11-29	2016-11-28	2017-08-29	\N	E			dthiessen	2016-09-12 08:05:57.937	7
1043	115	2016-08-09	6200	6200	2017-02-07	2017-01-30	2017-11-07	\N	E			dthiessen	2016-09-12 08:08:46.046	7
1051	114	2017-05-15	3200	3200	2017-11-13	\N	2018-08-13	\N	A			dthiessen	2017-03-07 08:49:45.167	2
1053	103	2017-05-15	2500	2500	2017-11-13	\N	2018-08-13	\N	A			dthiessen	2017-03-07 08:51:32.011	2
1056	112	2017-07-03	5200	5000	2018-01-02	\N	2018-10-02	\N	A			dthiessen	2017-05-30 11:27:16.984	3
1064	110	2018-01-09	6000	6000	2018-07-10	\N	2019-04-09	\N	P	115		edueck	2018-01-18 11:02:13	2
1047	104	2016-11-01	6500	6500	2017-05-02	2017-04-20	2018-01-30	\N	E			dthiessen	2016-12-19 11:00:48.1	2
1054	119	2016-08-30	3100	3100	2017-02-28	2017-01-23	2017-11-28	2018-02-02	E			ereimer	2017-03-17 16:25:55.308	6
1058	119	2017-08-29	2700	2700	2018-02-27	2018-02-07	2018-11-27	\N	A	111		dthiessen	2017-05-30 11:28:14.843	6
1062	104	2017-11-07	6500	6500	2018-05-08	\N	2019-02-05	\N	A			edueck	2017-11-20 08:40:29.393	2
1001	101	2013-09-03	6500	6500	2014-03-04	\N	2014-12-02	\N	E	\N	\N	admin	2015-03-18 10:17:24.394	4
1002	102	2013-10-01	2500	2500	2014-04-01	\N	2014-12-30	\N	E	\N	\N	admin	2015-03-18 10:19:28.707	4
1003	103	2013-11-05	2800	2800	2014-05-06	\N	2015-02-03	\N	E	\N	\N	admin	2015-03-18 10:20:20.3	4
1024	118	\N	\N	\N	\N	\N	\N	\N	A	\N	\N	admin	2015-04-08 17:45:51.613	4
1018	114	2015-01-06	3200	3200	2015-07-07	\N	2016-04-05	2015-04-25	E	\N	\N	admin	2015-03-22 08:19:34.69	4
1022	102	2015-04-14	3200	3200	2015-10-13	\N	2016-07-13	2015-04-14	E	\N	\N	admin	2015-03-22 08:23:13.534	4
1023	103	2015-05-19	2800	2800	2015-10-14	\N	2016-07-13	2015-05-19	E	\N	\N	admin	2015-03-22 09:12:21.081	4
1004	104	2013-11-12	4000	4000	2014-05-13	\N	2015-02-10	2015-03-20	E	\N	\N	admin	2015-03-18 10:23:38.425	4
1005	105	2013-12-03	6200	6200	2014-06-03	\N	2015-03-06	2015-03-17	E	\N	\N	admin	2015-03-18 10:24:18.566	4
1006	106	2014-01-28	3000	3000	2014-07-29	\N	2015-04-28	2015-04-14	E	\N	\N	admin	2015-03-18 12:41:34.804	4
1008	108	2014-03-04	8000	8000	2014-09-02	\N	2015-06-02	2015-03-06	E	\N	\N	admin	2015-03-18 12:42:55.069	4
1009	109	2014-04-15	4700	4700	2014-10-14	\N	2015-07-14	2015-03-06	E	\N	\N	admin	2015-03-18 12:43:37.866	4
1011	110	2014-06-10	4000	4000	2014-12-09	\N	2015-09-08	2015-04-28	E	\N	\N	admin	2015-03-18 13:40:03.101	4
1013	112	2014-08-12	5200	5200	2015-02-10	\N	2015-11-10	2015-04-28	E	\N	\N	admin	2015-03-18 13:41:25.398	4
1015	101	2014-10-07	6500	6500	2015-04-07	\N	2016-01-05	2015-04-28	E	\N	\N	admin	2015-03-18 13:42:48.023	4
1010	116	2014-05-06	2600	2600	2014-11-04	\N	2015-08-04	2015-07-20	E	\N	\N	admin	2015-03-18 13:39:14.851	4
1007	107	2014-01-28	2500	2500	2014-07-29	\N	2015-04-28	2015-06-08	E	\N	\N	admin	2015-03-18 12:42:17.616	4
1034	112	2016-01-05	5200	5200	2016-07-05	2016-07-04	2017-04-04	2017-04-10	E	4-093		ereimer	2016-02-02 15:54:12.656	1
1016	104	2014-11-04	4500	4500	2015-05-05	2015-05-04	2016-02-02	2016-02-15	E	4-076		admin	2015-03-18 13:43:25.398	4
1050	108	2017-03-06	2600	2600	2017-09-05	2017-09-14	2018-06-05	\N	A			dthiessen	2016-12-19 11:02:35.85	2
1040	113	2016-04-12	5500	5500	2016-10-11	2016-10-17	2017-07-11	\N	E			dthiessen	2016-09-12 08:04:09.062	1
1042	110	2016-07-05	4000	4000	2017-01-03	2017-01-12	2017-10-03	\N	E			dthiessen	2016-09-12 08:06:39.218	7
1052	113	2017-05-15	6500	6500	2017-11-13	\N	2018-08-13	\N	A			dthiessen	2017-03-07 08:50:52.996	3
1055	111	2017-06-12	4700	4700	2017-12-05	\N	2018-09-04	\N	A			dthiessen	2017-05-30 11:26:46.297	2
1057	115	2017-07-17	6200	5800	2018-01-16	\N	2018-10-16	\N	A			dthiessen	2017-05-30 11:27:47.281	2
1044	101	2016-09-20	6500	6500	2017-03-21	2017-03-20	2017-12-19	\N	E			dthiessen	2016-09-12 08:09:21.515	7
1063	117	2017-12-05	5700	5700	2018-06-05	\N	2019-03-05	\N	P	114		edueck	2018-01-18 10:59:48.964	2
1019	106	2015-01-20	3000	3000	2015-07-21	2015-08-03	2016-04-19	2016-05-12	E	4-078		admin	2015-03-22 08:20:27.534	4
1017	117	2014-12-09	5200	5200	2015-06-09	2015-06-08	2016-03-08	2016-04-18	E	4-077		admin	2015-03-22 08:17:51.831	4
1065	105	2018-02-06	6200	6200	2018-08-07	\N	2019-05-07	\N	F	116		edueck	2018-01-18 11:03:24.167	2
1061	101	2017-09-19	6300	6300	2018-03-20	\N	2018-12-18	\N	A		200 hens less to start to reduce production	edueck	2017-11-20 08:38:10.799	2
1021	108	2015-04-01	8000	8000	2015-09-30	2015-10-01	2016-06-29	2016-06-27	E	4-081		admin	2015-03-22 08:22:24.831	4
1048	107	2016-12-06	2500	2500	2017-06-06	2017-06-01	2018-03-06	2018-02-26	E	4102	removed early to reduce egg stock	dthiessen	2016-12-19 11:01:21.881	1
1020	105	2015-02-03	6200	6200	2015-08-04	2015-08-03	2016-05-03	2016-06-02	E	4-080		admin	2015-03-22 08:21:33.237	4
1028	107	2015-07-07	2500	2500	2016-01-05	2016-01-07	2016-10-04	2016-10-13	E	4-085		dthiessen	2016-01-08 07:53:20.277	2
1029	115	2015-08-04	6200	6200	2016-02-02	2016-01-21	2016-11-01	2016-11-10	E	4-086		dthiessen	2016-01-21 09:18:15.703	2
1030	101	2015-10-13	6500	6500	2016-04-12	2016-04-04	2017-01-10	2016-12-22	E	4-088		ereimer	2016-02-02 15:40:42.296	7
1031	104	2015-11-03	4500	4500	2016-05-03	\N	2017-01-31	2017-02-16	E	4-090		ereimer	2016-02-02 15:43:53.875	7
1032	103	2015-12-01	2500	2500	2016-05-31	2016-05-19	2017-02-28	2017-02-23	E	4-091		ereimer	2016-02-02 15:49:19.89	7
1033	111	2015-12-15	4700	4700	2016-06-14	2016-05-30	2017-03-14	2017-03-16	E	4-092		ereimer	2016-02-02 15:51:23.015	7
\.


--
-- TOC entry 2114 (class 0 OID 36309)
-- Dependencies: 180
-- Data for Name: flock_eggs; Type: TABLE DATA; Schema: public; Owner: fh
--

COPY flock_eggs (flock_eggs_id, flock_id, flock_eggs_date, flock_eggs_amount, user_added, date_added, memo) FROM stdin;
2	1044	2017-06-23	4931	dthiessen	2017-06-26 14:46:38.577	
4	1044	2017-06-25	4615	dthiessen	2017-06-26 14:47:18.718	
1	1044	2017-06-22	0	dthiessen	2017-06-26 14:46:21.39	
3	1044	2017-06-24	4572	dthiessen	2017-06-26 14:47:09.499	
5	1042	2017-06-22	2000	dthiessen	2017-06-26 16:14:30.989	
6	1042	2017-06-23	1934	dthiessen	2017-06-26 16:14:37.943	
7	1042	2017-06-25	1983	dthiessen	2017-06-26 16:15:12.646	
8	1042	2017-06-24	2001	dthiessen	2017-06-26 16:15:34.224	
9	1040	2017-05-25	2978	dthiessen	2017-06-26 16:19:55.312	
10	1040	2017-05-26	2862	dthiessen	2017-06-26 16:20:09.952	
11	1040	2017-05-27	3245	dthiessen	2017-06-26 16:20:18.312	
12	1040	2017-05-28	3097	dthiessen	2017-06-26 16:20:27.39	
13	1040	2017-05-29	3140	dthiessen	2017-06-26 16:20:36.046	
14	1040	2017-05-30	3113	dthiessen	2017-06-26 16:20:41.609	
15	1040	2017-05-31	3104	dthiessen	2017-06-26 16:20:50.937	
17	1040	2017-06-01	3118	dthiessen	2017-06-26 16:24:17.687	
16	1040	2017-06-02	3025	dthiessen	2017-06-26 16:22:29.843	
18	1040	2017-06-03	3047	dthiessen	2017-06-26 16:24:33.562	
19	1040	2017-06-04	3098	dthiessen	2017-06-26 16:26:57.78	
20	1040	2017-06-05	3201	dthiessen	2017-06-26 16:32:45.405	
21	1040	2017-06-06	3028	dthiessen	2017-06-26 16:33:02.655	
22	1040	2017-06-07	2984	dthiessen	2017-06-26 16:33:19.859	
23	1040	2017-06-08	3030	dthiessen	2017-06-26 16:33:48.015	
24	1040	2017-06-09	2789	dthiessen	2017-06-26 16:34:04.14	
25	1040	2017-06-10	3347	dthiessen	2017-06-26 16:34:29.905	
26	1040	2017-06-11	3097	dthiessen	2017-06-26 16:34:51.593	
27	1040	2017-06-19	2990	dthiessen	2017-06-26 16:35:44.484	
28	1040	2017-06-20	3039	dthiessen	2017-06-26 16:35:58.89	
29	1040	2017-06-21	3192	dthiessen	2017-06-26 16:36:12.937	
30	1040	2017-06-12	2981	dthiessen	2017-06-27 13:23:47.827	
31	1040	2017-06-13	3039	dthiessen	2017-06-27 13:24:11.718	
32	1040	2017-06-14	3135	dthiessen	2017-06-27 13:24:24.405	
33	1040	2017-06-15	3039	dthiessen	2017-06-27 13:25:04.843	
34	1040	2017-06-16	2931	dthiessen	2017-06-27 13:25:24.109	
35	1040	2017-06-17	2865	dthiessen	2017-06-27 13:25:35.905	
36	1040	2017-06-18	3113	dthiessen	2017-06-27 13:25:52.468	
37	1040	2017-06-22	3010	dthiessen	2017-06-27 13:26:43.14	
38	1040	2017-06-23	3012	dthiessen	2017-06-27 13:26:57.546	
39	1040	2017-06-24	3132	dthiessen	2017-06-27 13:27:13.468	
40	1040	2017-06-25	2862	dthiessen	2017-06-27 13:27:38.109	
41	1041	2017-05-22	3170	dthiessen	2017-06-27 13:29:23.718	
42	1041	2017-05-23	3224	dthiessen	2017-06-27 13:29:36.327	
43	1041	2017-05-24	3126	dthiessen	2017-06-27 13:29:38.562	
44	1041	2017-05-25	3068	dthiessen	2017-06-27 13:29:46.499	
45	1041	2017-05-26	2992	dthiessen	2017-06-27 13:29:47.984	
46	1041	2017-05-27	3123	dthiessen	2017-06-27 13:29:51.859	
47	1041	2017-05-28	3146	dthiessen	2017-06-27 13:29:55.124	
48	1041	2017-05-29	3144	dthiessen	2017-06-27 13:29:56.499	
49	1041	2017-05-30	3136	dthiessen	2017-06-27 13:30:02.077	
50	1041	2017-05-31	3244	dthiessen	2017-06-27 13:30:04.515	
51	1041	2017-06-01	3060	dthiessen	2017-06-27 13:30:10.499	
52	1041	2017-06-02	2942	dthiessen	2017-06-27 13:30:14.39	
53	1041	2017-06-03	2997	dthiessen	2017-06-27 13:30:18.89	
54	1041	2017-06-04	2968	dthiessen	2017-06-27 13:30:33.655	
55	1041	2017-06-05	3087	dthiessen	2017-06-27 13:30:35.749	
56	1041	2017-06-06	3010	dthiessen	2017-06-27 13:30:37.499	
57	1041	2017-06-07	3056	dthiessen	2017-06-27 13:30:40.952	
58	1041	2017-06-08	3024	dthiessen	2017-06-27 13:30:50.89	
59	1041	2017-06-09	3000	dthiessen	2017-06-27 13:30:52.109	
60	1041	2017-06-10	3112	dthiessen	2017-06-27 13:30:53.405	
61	1041	2017-06-11	3138	dthiessen	2017-06-27 13:30:56.327	
62	1041	2017-06-12	2880	dthiessen	2017-06-27 13:30:57.905	
63	1041	2017-06-13	3000	dthiessen	2017-06-27 13:31:00.921	
64	1041	2017-06-14	3009	dthiessen	2017-06-27 13:31:02.577	
65	1041	2017-06-15	3030	dthiessen	2017-06-27 13:31:04.421	
66	1041	2017-06-16	3034	dthiessen	2017-06-27 13:31:14.171	
67	1041	2017-06-17	2985	dthiessen	2017-06-27 13:31:15.812	
68	1041	2017-06-18	3038	dthiessen	2017-06-27 13:31:23.64	
69	1041	2017-06-19	2997	dthiessen	2017-06-27 13:31:28.702	
70	1041	2017-06-20	2940	dthiessen	2017-06-27 13:31:30.812	
71	1041	2017-06-21	2959	dthiessen	2017-06-27 13:31:33.655	
72	1041	2017-06-22	3031	dthiessen	2017-06-27 13:31:36.562	
73	1041	2017-06-23	2903	dthiessen	2017-06-27 13:31:40.046	
74	1041	2017-06-24	3005	dthiessen	2017-06-27 13:31:41.343	
75	1041	2017-06-25	2842	dthiessen	2017-06-27 13:31:46.984	
76	1042	2017-05-22	2038	dthiessen	2017-06-27 13:34:42.484	
77	1042	2017-05-23	2081	dthiessen	2017-06-27 13:34:44.593	
78	1042	2017-05-24	2135	dthiessen	2017-06-27 13:34:48.859	
79	1042	2017-05-25	2067	dthiessen	2017-06-27 13:34:53.171	
80	1042	2017-05-26	1949	dthiessen	2017-06-27 13:35:52.405	
81	1042	2017-05-27	2109	dthiessen	2017-06-27 13:35:55.171	
82	1042	2017-05-28	1921	dthiessen	2017-06-27 13:36:00.015	
83	1042	2017-05-29	2103	dthiessen	2017-06-27 13:36:06.687	
84	1042	2017-05-30	2033	dthiessen	2017-06-27 13:36:08.327	
85	1042	2017-05-31	2035	dthiessen	2017-06-27 13:36:14.609	
86	1042	2017-06-01	2020	dthiessen	2017-06-27 13:36:19.14	
87	1042	2017-06-02	1912	dthiessen	2017-06-27 13:36:21.28	
88	1042	2017-06-03	1942	dthiessen	2017-06-27 13:36:23.53	
89	1042	2017-06-04	1976	dthiessen	2017-06-27 13:36:31.64	
90	1042	2017-06-05	2018	dthiessen	2017-06-27 13:36:34.515	
91	1042	2017-06-06	2006	dthiessen	2017-06-27 13:36:36.234	
92	1042	2017-06-07	2057	dthiessen	2017-06-27 13:36:40.827	
93	1042	2017-06-19	2024	dthiessen	2017-06-27 13:36:55.952	
94	1042	2017-06-20	2149	dthiessen	2017-06-27 13:37:01.202	
95	1042	2017-06-21	2043	dthiessen	2017-06-27 13:37:04.515	
96	1042	2017-06-22	2000	dthiessen	2017-06-27 13:37:07.062	
97	1042	2017-06-23	1934	dthiessen	2017-06-27 13:37:08.843	
98	1042	2017-06-24	2001	dthiessen	2017-06-27 13:37:10.499	
99	1042	2017-06-25	1983	dthiessen	2017-06-27 13:37:12.562	
100	1043	2017-05-10	4970	dthiessen	2017-06-27 13:40:04.046	
101	1043	2017-05-11	4941	dthiessen	2017-06-27 13:40:06.593	
102	1043	2017-05-12	4805	dthiessen	2017-06-27 13:40:09.234	
103	1043	2017-05-13	4878	dthiessen	2017-06-27 13:40:13.124	
104	1043	2017-05-14	4953	dthiessen	2017-06-27 13:40:15.655	
105	1043	2017-05-15	4848	dthiessen	2017-06-27 13:40:52.218	
106	1043	2017-05-16	4902	dthiessen	2017-06-27 13:40:56.14	
107	1043	2017-05-17	4889	dthiessen	2017-06-27 13:40:58.796	
108	1043	2017-05-18	4926	dthiessen	2017-06-27 13:41:00.577	
109	1043	2017-05-19	4729	dthiessen	2017-06-27 13:41:06.124	
110	1043	2017-05-20	4816	dthiessen	2017-06-27 13:41:09.421	
111	1043	2017-05-21	4702	dthiessen	2017-06-27 13:41:11.593	
112	1043	2017-05-22	4814	dthiessen	2017-06-27 13:41:13.546	
113	1043	2017-05-23	4798	dthiessen	2017-06-27 13:41:16.843	
114	1043	2017-05-24	4802	dthiessen	2017-06-27 13:41:19.905	
115	1043	2017-05-25	4486	dthiessen	2017-06-27 13:41:23.905	
116	1043	2017-05-26	4578	dthiessen	2017-06-27 13:43:45.64	
117	1043	2017-05-27	4832	dthiessen	2017-06-27 13:43:50.171	
118	1043	2017-05-28	4750	dthiessen	2017-06-27 13:43:52.562	
119	1043	2017-05-29	4689	dthiessen	2017-06-27 13:44:00.874	
120	1043	2017-05-30	4662	dthiessen	2017-06-27 13:44:03.624	
121	1043	2017-05-31	4777	dthiessen	2017-06-27 13:44:09.562	
122	1043	2017-06-01	4655	dthiessen	2017-06-27 13:44:14.874	
123	1043	2017-06-02	4770	dthiessen	2017-06-27 13:44:16.343	
124	1043	2017-06-03	4500	dthiessen	2017-06-27 13:44:17.484	
125	1043	2017-06-04	4674	dthiessen	2017-06-27 13:44:21.046	
173	1044	2017-06-24	0	dthiessen	2017-06-27 14:02:46.218	
127	1043	2017-06-05	4641	dthiessen	2017-06-27 13:44:36.921	
128	1043	2017-06-06	4580	dthiessen	2017-06-27 13:44:39.234	
129	1043	2017-06-07	4631	dthiessen	2017-06-27 13:44:40.859	
130	1043	2017-06-08	4598	dthiessen	2017-06-27 13:44:42.655	
131	1043	2017-06-09	4377	dthiessen	2017-06-27 13:44:44.89	
132	1043	2017-06-10	4910	dthiessen	2017-06-27 13:44:47.187	
133	1043	2017-06-11	4447	dthiessen	2017-06-27 13:47:32.202	
134	1043	2017-06-12	4462	dthiessen	2017-06-27 13:48:25.265	
126	1043	2017-06-13	4511	dthiessen	2017-06-27 13:44:35.062	
135	1043	2017-06-14	4520	dthiessen	2017-06-27 13:50:05.452	
136	1043	2017-06-15	4571	dthiessen	2017-06-27 13:50:07.343	
137	1043	2017-06-16	4617	dthiessen	2017-06-27 13:50:08.952	
138	1043	2017-06-17	4489	dthiessen	2017-06-27 13:50:12.374	
139	1043	2017-06-18	4645	dthiessen	2017-06-27 13:50:16.14	
140	1043	2017-06-19	4323	dthiessen	2017-06-27 13:50:24.124	
141	1043	2017-06-20	4461	dthiessen	2017-06-27 13:50:25.327	
142	1043	2017-06-21	4481	dthiessen	2017-06-27 13:50:27.405	
143	1044	2017-05-25	4625	dthiessen	2017-06-27 14:00:30.421	
144	1044	2017-05-26	4677	dthiessen	2017-06-27 14:00:33.687	
145	1044	2017-05-27	4669	dthiessen	2017-06-27 14:00:35.952	
146	1044	2017-05-28	4826	dthiessen	2017-06-27 14:00:43.78	
147	1044	2017-05-29	4951	dthiessen	2017-06-27 14:00:47.546	
148	1044	2017-05-30	4835	dthiessen	2017-06-27 14:00:55.14	
149	1044	2017-05-31	4819	dthiessen	2017-06-27 14:00:58.249	
150	1044	2017-06-01	4800	dthiessen	2017-06-27 14:01:04.499	
151	1044	2017-06-02	4818	dthiessen	2017-06-27 14:01:06.624	
152	1044	2017-06-03	4777	dthiessen	2017-06-27 14:01:09.28	
153	1044	2017-06-04	4669	dthiessen	2017-06-27 14:01:11.515	
154	1044	2017-06-05	5035	dthiessen	2017-06-27 14:01:17.265	
155	1044	2017-06-06	4832	dthiessen	2017-06-27 14:01:19.249	
156	1044	2017-06-07	4958	dthiessen	2017-06-27 14:01:26.03	
157	1044	2017-06-08	4744	dthiessen	2017-06-27 14:01:29.499	
158	1044	2017-06-09	4597	dthiessen	2017-06-27 14:01:34.187	
159	1044	2017-06-10	4982	dthiessen	2017-06-27 14:01:36.124	
160	1044	2017-06-11	4772	dthiessen	2017-06-27 14:01:39.984	
161	1044	2017-06-12	4689	dthiessen	2017-06-27 14:01:44.749	
162	1044	2017-06-13	4677	dthiessen	2017-06-27 14:01:49.671	
163	1044	2017-06-14	4718	dthiessen	2017-06-27 14:01:55.874	
164	1044	2017-06-15	4578	dthiessen	2017-06-27 14:01:59.89	
165	1044	2017-06-16	4754	dthiessen	2017-06-27 14:02:01.796	
166	1044	2017-06-17	4683	dthiessen	2017-06-27 14:02:05.124	
167	1044	2017-06-18	4789	dthiessen	2017-06-27 14:02:09.796	
168	1044	2017-06-19	4757	dthiessen	2017-06-27 14:02:13.921	
169	1044	2017-06-20	4574	dthiessen	2017-06-27 14:02:16.609	
170	1044	2017-06-21	4872	dthiessen	2017-06-27 14:02:24.984	
171	1044	2017-06-22	4664	dthiessen	2017-06-27 14:02:40.03	
172	1044	2017-06-23	0	dthiessen	2017-06-27 14:02:41.78	
174	1044	2017-06-25	0	dthiessen	2017-06-27 14:02:49.655	
175	1047	2017-05-01	4260	dthiessen	2017-06-27 16:02:10.843	
176	1047	2017-05-02	4275	dthiessen	2017-06-27 16:02:23.499	
177	1047	2017-05-03	4680	dthiessen	2017-06-27 16:02:39.984	
178	1047	2017-05-04	4680	dthiessen	2017-06-27 16:02:50.265	
179	1047	2017-05-05	4515	dthiessen	2017-06-27 16:02:53.859	
180	1044	2017-06-26	4637	dthiessen	2017-06-29 08:23:11.249	
181	1044	2017-06-27	4930	dthiessen	2017-06-29 08:23:13.046	
182	1044	2017-06-28	4668	dthiessen	2017-06-29 08:23:16.655	
183	1042	2017-06-12	1945	dthiessen	2017-06-29 08:24:14.499	
184	1042	2017-06-13	2047	dthiessen	2017-06-29 08:24:17.874	
185	1042	2017-06-14	2030	dthiessen	2017-06-29 08:24:21.28	
186	1042	2017-06-15	2067	dthiessen	2017-06-29 08:24:24.359	
187	1042	2017-06-16	1997	dthiessen	2017-06-29 08:24:27.515	
188	1042	2017-06-17	2044	dthiessen	2017-06-29 08:24:31.093	
189	1042	2017-06-18	1942	dthiessen	2017-06-29 08:24:34.796	
190	1042	2017-06-26	1925	dthiessen	2017-06-29 08:25:40.859	
191	1042	2017-06-27	1963	dthiessen	2017-06-29 08:25:44.874	
192	1042	2017-06-28	2112	dthiessen	2017-06-29 08:25:48.452	
193	1043	2017-06-22	4613	dthiessen	2017-06-29 09:14:18.359	
194	1043	2017-06-23	4381	dthiessen	2017-06-29 09:14:23.109	
195	1043	2017-06-24	4472	dthiessen	2017-06-29 09:14:25.359	
196	1043	2017-06-25	4183	dthiessen	2017-06-29 09:14:29.28	
197	1043	2017-06-26	4314	dthiessen	2017-06-29 09:14:32.093	
198	1043	2017-06-27	4416	dthiessen	2017-06-29 09:14:58.671	
199	1043	2017-06-28	4508	dthiessen	2017-06-29 09:15:21.546	
200	1047	2017-05-06	4710	tneufeld	2017-07-03 15:45:46.515	
201	1047	2017-05-07	4905	tneufeld	2017-07-03 15:46:00.327	
202	1047	2017-05-08	4950	tneufeld	2017-07-03 15:46:05.78	
203	1047	2017-05-09	5085	tneufeld	2017-07-03 15:46:13.077	
204	1047	2017-05-10	5145	tneufeld	2017-07-03 15:46:24.327	
205	1047	2017-05-11	4995	tneufeld	2017-07-03 15:46:31.374	
206	1047	2017-05-12	5070	tneufeld	2017-07-03 15:46:36.984	
207	1047	2017-05-13	5130	tneufeld	2017-07-03 15:46:44.64	
208	1047	2017-05-14	5145	tneufeld	2017-07-03 15:46:50.155	
209	1047	2017-05-15	5085	tneufeld	2017-07-03 15:46:57.312	
210	1047	2017-05-16	5115	tneufeld	2017-07-03 15:47:02.827	
211	1047	2017-05-17	5205	tneufeld	2017-07-03 15:47:07.484	
212	1047	2017-05-18	5055	tneufeld	2017-07-03 15:47:13.249	
213	1047	2017-05-19	5130	tneufeld	2017-07-03 15:47:23.859	
214	1047	2017-05-20	5190	tneufeld	2017-07-03 15:47:28.499	
215	1047	2017-05-21	5070	tneufeld	2017-07-03 15:47:33.905	
216	1047	2017-05-22	5100	tneufeld	2017-07-03 15:47:39.437	
217	1047	2017-05-23	5070	tneufeld	2017-07-03 15:47:48.218	
218	1047	2017-05-24	5010	tneufeld	2017-07-03 15:47:54.827	
219	1047	2017-05-25	5010	tneufeld	2017-07-03 15:47:58.734	
220	1047	2017-05-26	4920	tneufeld	2017-07-03 15:48:05.609	
221	1047	2017-05-27	5010	tneufeld	2017-07-03 15:50:08.155	
222	1047	2017-05-28	5100	tneufeld	2017-07-03 15:50:15.812	
223	1047	2017-05-29	5070	tneufeld	2017-07-03 15:50:20.734	
224	1047	2017-05-30	5070	tneufeld	2017-07-03 15:50:26.218	
225	1047	2017-05-31	5070	tneufeld	2017-07-03 15:50:30.734	
226	1047	2017-06-01	5040	tneufeld	2017-07-03 15:50:36.187	
227	1047	2017-06-02	5100	tneufeld	2017-07-03 15:50:40.421	
228	1047	2017-06-03	5070	tneufeld	2017-07-03 15:50:45.796	
229	1047	2017-06-04	5100	tneufeld	2017-07-03 15:50:50.546	
230	1047	2017-06-05	5160	tneufeld	2017-07-03 15:50:56.827	
231	1047	2017-06-06	4980	tneufeld	2017-07-03 15:52:18.077	
232	1047	2017-06-07	5130	tneufeld	2017-07-03 15:52:24.046	
233	1047	2017-06-08	5100	tneufeld	2017-07-03 15:52:29.249	
234	1047	2017-06-09	4905	tneufeld	2017-07-03 15:52:34.109	
235	1047	2017-06-10	5205	tneufeld	2017-07-03 15:52:39.859	
236	1047	2017-06-11	5115	tneufeld	2017-07-03 15:52:44.577	
237	1047	2017-06-12	5100	tneufeld	2017-07-03 15:52:48.859	
238	1047	2017-06-13	5025	tneufeld	2017-07-03 15:53:04.405	
239	1047	2017-06-14	5040	tneufeld	2017-07-03 15:53:10.78	
240	1047	2017-06-15	4995	tneufeld	2017-07-03 15:53:31.062	
241	1047	2017-06-16	5010	tneufeld	2017-07-03 15:53:37.296	
242	1047	2017-06-17	4920	tneufeld	2017-07-03 15:53:50.124	
243	1047	2017-06-18	4890	tneufeld	2017-07-03 15:53:55.874	
244	1047	2017-06-19	4860	tneufeld	2017-07-03 15:54:01.624	
245	1047	2017-06-20	4890	tneufeld	2017-07-03 15:54:26.171	
246	1047	2017-06-21	4890	tneufeld	2017-07-03 15:54:32.155	
247	1047	2017-06-22	4875	tneufeld	2017-07-03 15:54:41.546	
248	1047	2017-06-23	4875	tneufeld	2017-07-03 15:54:47.468	
249	1047	2017-06-24	4950	tneufeld	2017-07-03 15:54:52.155	
250	1047	2017-06-25	4800	tneufeld	2017-07-03 15:54:55.968	
251	1047	2017-06-26	4740	tneufeld	2017-07-03 15:55:08.077	
252	1047	2017-06-27	4830	tneufeld	2017-07-03 15:55:13.952	
253	1047	2017-06-28	4965	tneufeld	2017-07-03 15:55:18.484	
254	1047	2017-06-29	4890	tneufeld	2017-07-03 15:55:24.499	
255	1047	2017-06-30	4890	tneufeld	2017-07-03 15:55:30.171	
256	1047	2017-07-01	4860	tneufeld	2017-07-03 15:55:35.437	
257	1047	2017-07-02	4920	tneufeld	2017-07-03 15:55:39.89	
258	1040	2017-06-26	2815	tneufeld	2017-07-06 10:14:46.265	
259	1040	2017-06-27	2975	tneufeld	2017-07-06 10:15:20.718	
260	1040	2017-06-28	2978	tneufeld	2017-07-06 10:15:43.202	
261	1040	2017-06-29	2894	tneufeld	2017-07-06 10:16:20.187	
262	1040	2017-06-30	2842	tneufeld	2017-07-06 10:16:37.812	
263	1040	2017-07-01	3005	tneufeld	2017-07-06 10:17:06.749	
264	1040	2017-07-02	2750	tneufeld	2017-07-06 10:23:56.077	
265	1040	2017-07-03	2843	tneufeld	2017-07-06 10:24:21.984	
266	1040	2017-07-04	2911	tneufeld	2017-07-06 10:26:18.843	
267	1040	2017-07-05	2896	tneufeld	2017-07-06 10:26:47.749	
268	1044	2017-06-29	4655	tneufeld	2017-07-06 10:37:17.359	
269	1044	2017-06-30	4735	tneufeld	2017-07-06 10:37:22.921	
270	1044	2017-07-01	4732	tneufeld	2017-07-06 10:37:28.405	
271	1044	2017-07-02	4639	tneufeld	2017-07-06 10:37:33.687	
272	1044	2017-07-03	4641	tneufeld	2017-07-06 10:37:39.077	
273	1041	2017-06-26	2827	dthiessen	2017-07-06 10:37:50.421	
274	1041	2017-06-27	3022	dthiessen	2017-07-06 10:37:51.749	
275	1041	2017-06-28	2917	dthiessen	2017-07-06 10:37:53.734	
276	1041	2017-06-29	2901	dthiessen	2017-07-06 10:37:55.577	
277	1041	2017-06-30	2906	dthiessen	2017-07-06 10:37:57.609	
278	1041	2017-07-01	2908	dthiessen	2017-07-06 10:37:59.89	
279	1041	2017-07-02	2905	dthiessen	2017-07-06 10:38:01.734	
280	1041	2017-07-03	2821	dthiessen	2017-07-06 10:38:05.749	
281	1044	2017-07-04	4651	tneufeld	2017-07-06 10:38:27.577	
282	1042	2017-06-29	1903	dthiessen	2017-07-06 10:38:30.359	
283	1042	2017-06-30	1922	dthiessen	2017-07-06 10:38:31.702	
284	1044	2017-07-05	4649	tneufeld	2017-07-06 10:38:33.421	
285	1042	2017-07-01	1925	dthiessen	2017-07-06 10:38:36.937	
286	1042	2017-07-02	1857	dthiessen	2017-07-06 10:38:41.405	
287	1042	2017-07-03	2045	dthiessen	2017-07-06 10:38:46.655	
288	1042	2017-07-04	1940	dthiessen	2017-07-06 10:38:48.499	
289	1042	2017-07-05	1910	dthiessen	2017-07-06 10:38:52.124	
290	1043	2017-06-29	4285	dthiessen	2017-07-06 10:45:58.327	
291	1043	2017-06-30	4232	dthiessen	2017-07-06 10:46:00.921	
292	1043	2017-07-01	4258	dthiessen	2017-07-06 10:46:06.843	
293	1043	2017-07-02	4345	dthiessen	2017-07-06 10:46:09.78	
294	1047	2017-07-03	4680	dthiessen	2017-07-06 10:46:45.265	
295	1047	2017-07-04	4830	dthiessen	2017-07-06 10:46:50.515	
296	1047	2017-07-05	4800	dthiessen	2017-07-06 10:46:57.921	
297	1044	2017-07-06	4726	tneufeld	2017-07-10 08:13:17.734	
298	1044	2017-07-07	4661	tneufeld	2017-07-10 08:13:22.546	
299	1044	2017-07-08	4753	tneufeld	2017-07-10 08:13:27.593	
300	1044	2017-07-09	4700	tneufeld	2017-07-10 08:13:33.749	
301	1040	2017-05-22	3123	dthiessen	2017-07-10 08:14:29.64	
302	1040	2017-05-23	3299	dthiessen	2017-07-10 08:14:32.452	
303	1040	2017-05-24	3142	dthiessen	2017-07-10 08:14:35.624	
304	1044	2017-07-10	4474	tneufeld	2017-07-13 13:10:52.28	
305	1044	2017-07-11	4687	tneufeld	2017-07-13 13:10:57.249	
306	1044	2017-07-12	4468	tneufeld	2017-07-13 13:11:00.984	
307	1044	2017-07-13	4659	tneufeld	2017-07-13 13:11:09.749	
308	1044	2017-07-14	4666	tneufeld	2017-07-17 08:22:36.227	
309	1044	2017-07-15	4718	tneufeld	2017-07-17 08:22:52.352	
310	1044	2017-07-16	4570	tneufeld	2017-07-17 08:22:57.196	
\.


--
-- TOC entry 2154 (class 0 OID 0)
-- Dependencies: 181
-- Name: flock_eggs_flock_eggs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fh
--

SELECT pg_catalog.setval('flock_eggs_flock_eggs_id_seq', 310, true);


--
-- TOC entry 2155 (class 0 OID 0)
-- Dependencies: 182
-- Name: flock_flock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('flock_flock_id_seq', 1065, true);


--
-- TOC entry 2117 (class 0 OID 36317)
-- Dependencies: 183
-- Data for Name: login_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY login_log (log_id, log_string, log_token, user_added, date_added) FROM stdin;
1	20150505232432-server	6b01655100b6ef7210c03f50cd7812d2	admin	2015-05-05 15:24:32.74
2	20150506043132-server	904e07b5d3d8990d8730aeb0eecc3a42	admin	2015-05-05 20:31:32.108
3	20150506160956-server	f9cd896d1a63b2db5f94090011d15440	admin	2015-05-06 08:09:56.429
4	20150506160956-server	f9cd896d1a63b2db5f94090011d15440	admin	2015-05-06 08:09:56.46
5	20150506161000-server	b01938b8a85503721dcc0c0e0dad8318	admin	2015-05-06 08:10:00.897
6	20150506183506-server	05ad6a4298ad3978aee2d12b08eb516a	dthiessen	2015-05-06 10:35:06.408
7	20150513000512-server	4807bd2adc8cfdaa70cdb04651f665e1	admin	2015-05-12 16:05:12.344
8	20150513011207-martin-mobile	550afd426721c7c3dcb59b405f449303	admin	2015-05-12 17:12:07.861
9	20150513064518-server	f89a61ec104a7bed983b615d090ce645	admin	2015-05-12 22:45:18.013
10	20150519155307-server	38d9a4a48eed0da76ec6c5ad2c3c03ab	dthiessen	2015-05-19 07:53:07.259
11	20150519191644-server	08c6956a515726fc1490637119f2fd67	admin	2015-05-19 11:16:44.454
12	20150520001401-server	b8e35e92c6ed734fcbc90edf2365cc7b	admin	2015-05-19 16:14:01.659
13	20150520004733-March 2, 2015	46e01f1716dc240ad45d2376279f7b7b	admin	2015-05-19 16:47:33.266
14	20150521172013-server	0423107fc65f2642edd74d1e593a53d3	dthiessen	2015-05-21 09:20:13.531
15	20150522221827-server	acfce07ab5255a37bfd2ec6ab28ba15b	admin	2015-05-22 14:18:27.343
16	20150526174345-server	ecad1072332ed0970efb8700ef38dde0	dthiessen	2015-05-26 09:43:45.657
17	20150529170051-server	ddb3fb5fc02ec96bb4209d419a634068	dthiessen	2015-05-29 09:00:51.786
18	20150608174613-server	8fc3859473379d1370740969e497d1d4	dthiessen	2015-06-08 09:46:13.034
19	20150615193216-server	921eac5694357ab24373cd09b28dcd07	admin	2015-06-15 11:32:16.51
20	20150616185328-server	95545dd00b8820ccdaea10d94fa2e233	admin	2015-06-16 10:53:28.181
21	20150713221631-server	6a523bf09bc971728362e79b1c260644	dthiessen	2015-07-13 14:16:31.518
22	20150723181719-server	bf7a7b98315760beed763523124d490b	dthiessen	2015-07-23 10:17:19.225
23	20150730170855-server	cc495dcb674e1811f59919e8ab4bb6b5	dthiessen	2015-07-30 09:08:55.563
24	20150814175913-server	b23b3bfb1df71a6ae4f17d8d075035cb	dthiessen	2015-08-14 09:59:13.737
25	20150818230301-server	0f2788f32f813c2952209c3c0b0e201f	dthiessen	2015-08-18 15:03:01.778
26	20150820180554-server	49f0069ce6b8729cb7778b49ad114584	dthiessen	2015-08-20 10:05:54.442
27	20150820180554-server	49f0069ce6b8729cb7778b49ad114584	dthiessen	2015-08-20 10:05:54.583
28	20150820181924-server	18c34f36e7ce2c338098e85ae958e5c1	dthiessen	2015-08-20 10:19:24.13
29	20150820183651-server	5efcc14a21c0e51f5bb76c906de4e62d	dthiessen	2015-08-20 10:36:51.442
30	20150820183651-server	5efcc14a21c0e51f5bb76c906de4e62d	dthiessen	2015-08-20 10:36:51.567
31	20150820220711-server	b30e8fce40f42f95e70d9655d9f07c6b	dthiessen	2015-08-20 14:07:11.677
32	20150821211549-server	b06adf4e5366d26d5c16b7a82022a7d0	dthiessen	2015-08-21 13:15:49.382
33	20150821211549-server	b06adf4e5366d26d5c16b7a82022a7d0	dthiessen	2015-08-21 13:15:49.413
34	20150824160656-server	d622671efc04722bc1b4072bba1eabbc	dthiessen	2015-08-24 08:06:56.904
35	20150825155951-server	263ce0854de53ea42a0da18c9a80b750	dthiessen	2015-08-25 07:59:51.77
36	20150827153822-server	775e258f707ff9853358b6a42cf2c77e	dthiessen	2015-08-27 07:38:22.211
37	20150827214925-server	cef47d5aad55829f6f599a3f56395f2a	dthiessen	2015-08-27 13:49:25.327
38	20150828014612-server	77ddb4fde62e0e3bae008cce5687b00f	dthiessen	2015-08-27 17:46:12.14
39	20150831164206-server	7c469ef9780ed94eae131845331122d7	dthiessen	2015-08-31 08:42:06.055
40	20150903154731-server	aacfc3044f65d56d74a29ee3ea9c6de2	dthiessen	2015-09-03 07:47:31.981
41	20150910225831-server	adf02aace698ca30b8a575da3aeb542e	dthiessen	2015-09-10 14:58:31.631
42	20150917163552-server	f82203117bb79179d2a1369b450f2643	dthiessen	2015-09-17 08:35:52.329
43	20150924215628-server	02278ea7ca511e44afbe6d36a65ad89e	dthiessen	2015-09-24 13:56:28.882
44	20150928155955-server	fb7ca76e9e1dee7ef325058e6e122b7c	dthiessen	2015-09-28 07:59:55.726
45	20150929163527-server	67c6fa68336dc42f9ba1cfb56f68dc83	dthiessen	2015-09-29 08:35:27.007
46	20150929163527-server	67c6fa68336dc42f9ba1cfb56f68dc83	dthiessen	2015-09-29 08:35:27.101
47	20151001155911-server	63c7ca5c992b2c1c4293e38dff26af40	dthiessen	2015-10-01 07:59:11.441
48	20151001160030-server	2b99616def4234f0c7a3a8829d101587	dthiessen	2015-10-01 08:00:30.785
49	20151005153355-server	7595dc6246bebabe03c764f69d7cae9b	dthiessen	2015-10-05 07:33:55.3
50	20151005220233-server	df42f854c1a519af2f18b1b58dbca427	dthiessen	2015-10-05 14:02:33.55
51	20151005220233-server	df42f854c1a519af2f18b1b58dbca427	dthiessen	2015-10-05 14:02:33.675
52	20151006213744-server	6e108696301d51dbe58da3641d94d907	dthiessen	2015-10-06 13:37:44.129
53	20151006232452-server	df63cd601f26d5b2fa548c41e8f05a57	dthiessen	2015-10-06 15:24:52.16
54	20151008152654-server	eab59db1e8feb67502c164ff401469af	dthiessen	2015-10-08 07:26:54.207
55	20151008172015-server	3bf8a5a30b17193f2b67de3dcf349d49	dthiessen	2015-10-08 09:20:15.738
56	20151008172015-server	3bf8a5a30b17193f2b67de3dcf349d49	dthiessen	2015-10-08 09:20:15.816
57	20151009160557-server	a3431957fe6ad3d69b06397af2621fd3	dthiessen	2015-10-09 08:05:57.707
58	20151009160557-server	a3431957fe6ad3d69b06397af2621fd3	dthiessen	2015-10-09 08:05:57.816
59	20151009210810-server	48011bb8d8392d0869182cafbd9e6679	dthiessen	2015-10-09 13:08:10.004
60	20151010003330-server	9cc439af63ad55c6d25c94f0bf5e30ce	dthiessen	2015-10-09 16:33:30.254
61	20151013180352-server	1e7e6d42344b0660682fb6bbc3616804	dthiessen	2015-10-13 10:03:52.146
62	20151013183446-server	756683dbad4e4e3d4ddf6fbef6cfdc53	dthiessen	2015-10-13 10:34:46.865
63	20151013183446-server	756683dbad4e4e3d4ddf6fbef6cfdc53	dthiessen	2015-10-13 10:34:46.99
64	20151013184612-server	cc5529a7101e7def3d1553677f022f82	dthiessen	2015-10-13 10:46:12.161
65	20151015161351-server	feefb639f0fb43ab62ea2a8db91f31db	dthiessen	2015-10-15 08:13:51.755
66	20151016162411-September 14, 2015	91e000a6aa2987d5d22a63825220a892	dthiessen	2015-10-16 08:24:11.085
67	20151016162411-September 14, 2015	91e000a6aa2987d5d22a63825220a892	dthiessen	2015-10-16 08:24:11.21
68	20151019154913-server	16cd45b22279c88756d3da334653079b	dthiessen	2015-10-19 07:49:13.053
69	20151021002947-server	4ae10155285f42283c2f1b251990dd58	dthiessen	2015-10-20 16:29:47.553
70	20151022164829-server	e8cf3ffd6824adc1d1ad1704b7f51e6a	dthiessen	2015-10-22 08:48:29.445
71	20151022215128-server	7985c03da3dd949b24dd4f735c89bda3	dthiessen	2015-10-22 13:51:28.977
72	20151022215129-server	7d5f3e4b55769d3a61d9be6e77c61f70	dthiessen	2015-10-22 13:51:29.102
73	20151023212257-server	0875e7131f2ef06a56040f0628ee4743	dthiessen	2015-10-23 13:22:57.242
74	20151026150853-server	ea3c6922ea89f68edeeedb64c89fda35	dthiessen	2015-10-26 08:08:53.915
75	20151027172055-server	be5522c5c7586ef047c1098e6902591a	dthiessen	2015-10-27 10:20:55.714
76	20151029155453-server	6823aabf7ffbf1986d1419789e252238	dthiessen	2015-10-29 08:54:53.76
77	20151029221446-server	24da45d4389cd30200b23cc38c1a28fe	dthiessen	2015-10-29 15:14:46.245
78	20151029221446-server	24da45d4389cd30200b23cc38c1a28fe	dthiessen	2015-10-29 15:14:46.385
79	20151030183143-server	bfd6043e163406e07c9b2bb2e0c01981	dthiessen	2015-10-30 11:31:43.885
80	20151102145440-server	a4ef7161a12be1591efeb996e2cf55ed	dthiessen	2015-11-02 07:54:40.838
81	20151105151034-server	d6aebdebd2ebdb3dab4350d02c10023f	dthiessen	2015-11-05 08:10:34.217
82	20151105151127-server	98d02109d8f6904b9d9e4290ebb1590c	dthiessen	2015-11-05 08:11:27.263
83	20151109175028-server	fb9adea266e5670a397ecd33edef31f1	dthiessen	2015-11-09 10:50:28.671
84	20151109214939-server	faa92cad0e59458037ffbbf73fa70fd6	dthiessen	2015-11-09 14:49:39.375
85	20151109215352-server	f24cfad7dcacc9762eedad39bc0e78aa	dthiessen	2015-11-09 14:53:52.25
86	20151109215352-server	f24cfad7dcacc9762eedad39bc0e78aa	dthiessen	2015-11-09 14:53:52.375
87	20151112155628-server	58ec3128c7170f7c7428ff861cf8b1ae	dthiessen	2015-11-12 08:56:28.87
88	20151113020525-server	41a7f265b081e2711120493b17c41837	admin	2015-11-12 19:05:25.276
89	20151113203840-server	6faf4adc1619fb6afa5465a4e3cac170	dthiessen	2015-11-13 13:38:40.886
90	20151113213305-server	1e1aad922c83fa597bd06d756fb1b748	dthiessen	2015-11-13 14:33:05.667
91	20151116164533-server	f027d8e763ed8fe6dee8a1a765d70fdb	dthiessen	2015-11-16 09:45:33.246
92	20151119155244-server	e8f3a4142f14a2a39f51ce3d37a7aa8c	dthiessen	2015-11-19 08:52:44.576
93	20151119160617-server	f3b6d059df5685b343f8160adaf3ea6e	dthiessen	2015-11-19 09:06:17.06
94	20151119163737-server	00b7abb2b81b4c8d09d1dc0dc82aaf4c	dthiessen	2015-11-19 09:37:37.904
95	20151123144326-server	d7f0a4935eff65fa9d69a79a97f77dde	dthiessen	2015-11-23 07:43:26.977
96	20151126144514-server	129cc2e055ad99361a21ecad29b7fd73	dthiessen	2015-11-26 07:45:14.055
97	20151128174131-server	b6404f72ca31fb77f3ab4efa294ea279	admin	2015-11-28 10:41:31.942
98	20151128181735-server	c01a9f2d5bef8cb57f4f9bf0dea2695d	admin	2015-11-28 11:17:35.558
99	20151128181735-server	c01a9f2d5bef8cb57f4f9bf0dea2695d	admin	2015-11-28 11:17:35.766
100	20151128182158-server	552384553f5817f1db5bc5a702e53cc9	admin	2015-11-28 11:21:58.935
101	20151128182224-server	a6d81af760f5b6b621a3bb15d3868a97	admin	2015-11-28 11:22:24.54
102	20151128190847-server	8e5d4e665d8abe166a224bdcec570632	admin	2015-11-28 12:08:47.695
103	20151128190848-server	ef148c029542d3b6538740eb867e34d8	admin	2015-11-28 12:08:48.089
104	20151128194640-server	ea1ad34ac1fd5b14ea9cf4f8a2652381	admin	2015-11-28 12:46:40.559
105	20151130152332-server	185ea060a3cccc399277df2061895bda	dthiessen	2015-11-30 08:23:32.487
106	20151202205857-server	7994de127389592adda5cb1197f852a5	dthiessen	2015-12-02 13:58:57.357
107	20151203004659-server	08a00110e585a542f1d8b3706537d8ec	admin	2015-12-02 17:46:59.72
108	20151203154012-server	12f1f833e9a870852961d8ebe31c0f1e	dthiessen	2015-12-03 08:40:12.322
109	20151203161922-server	7b57b2b8a5202116a54f846b88c1ddb4	dthiessen	2015-12-03 09:19:22.338
110	20151207155458-server	77c7106cf17e7e223085f1662ffda7fd	dthiessen	2015-12-07 08:54:58.921
111	20151208222202-server	68279e1c30514793f1e27034d63f5bc1	dthiessen	2015-12-08 15:22:02.643
112	20151209062022-server	dc9ba3252adb7de84826cc0becacbd58	admin	2015-12-08 23:20:22.146
113	20151209155139-server	e48c34b2709de100f6f25b8bbf11deac	admin	2015-12-09 08:51:39.64
114	20151210204228-server	7663f14a089a2941cf60efd81c7847da	dthiessen	2015-12-10 13:42:28.573
115	20151210210638-server	3bb7cd7f409237d3f5bec16c445ccfef	dthiessen	2015-12-10 14:06:38.718
116	20151210214758-server	d6796d53550f42b4d49e790a884c979c	dthiessen	2015-12-10 14:47:58.601
117	20151211220944-server	c33162375fb5ae6189cac33d4f4a37c5	dthiessen	2015-12-11 15:09:44.278
118	20151214152934-server	4be5203738a20753845783a5777350c4	dthiessen	2015-12-14 08:29:34.124
119	20151215212416-server	a292f75d79497aa037cbb02ca06775ce	dthiessen	2015-12-15 14:24:16.758
120	20151217143419-server	03203fd4d086475e38dc561b6593d308	dthiessen	2015-12-17 07:34:19.152
121	20151217145438-server	14268ba2d442e05753a4a3ef4d016cae	dthiessen	2015-12-17 07:54:38.181
122	20151217162333-server	456f21ed0cb479ae37c79b044c3b7488	dthiessen	2015-12-17 09:23:33.942
123	20151221155510-server	f5027f1e85d2a16a34c249cab904396a	dthiessen	2015-12-21 08:55:10.593
124	20151221204503-server	76aa4e1fa3004add6d2e4b70b360b57c	dthiessen	2015-12-21 13:45:03.5
125	20151221210626-server	acfcfe1a6df5c7cfecd8542543169f8e	dthiessen	2015-12-21 14:06:26.734
126	20151222152858-server	72664bfd07ba7dad2f83535b8d4be0e8	dthiessen	2015-12-22 08:28:58.14
127	20151222213252-server	7ea20c4b2f9936459d488f84eaa0a1f8	dthiessen	2015-12-22 14:32:52.515
128	20151228142350-server	3d3398eb4aa9c26bede33c42050cb672	dthiessen	2015-12-28 07:23:50.39
129	20151229214952-server	f669b0c1147ed5a7ebf80b43ef34f943	dthiessen	2015-12-29 14:49:52.453
130	20151231145427-server	122fccc6760fe4af5cfbf94a24ba7edc	dthiessen	2015-12-31 07:54:27.01
131	20160104155525-server	cdea9eec4050d46e30f9ba1f82c98680	dthiessen	2016-01-04 08:55:25.84
132	20160104174404-server	0d434b1b72e7cb9ce34ec09fdcb2b43d	dthiessen	2016-01-04 10:44:04.153
133	20160107151827-server	4a880291573c6efe36b06354a01fc9ee	dthiessen	2016-01-07 08:18:27.512
134	20160107175631-server	ac707803be551798dea68d7fbf5e0160	dthiessen	2016-01-07 10:56:31.997
135	20160107235849-server	6d64200ca91daaee0addaba84194d0ed	dthiessen	2016-01-07 16:58:49.262
136	20160111150134-server	b703867b70925af813b4f70c092cfa01	dthiessen	2016-01-11 08:01:34.953
137	20160114145520-server	fcb341f8c48e32e831e6b5ec07e78594	dthiessen	2016-01-14 07:55:20.406
138	20160114152914-January 11, 2016	f84dd2af136fb6616bfa50c2d8876032	dthiessen	2016-01-14 08:29:14.375
139	20160114160527-server	7e7f22d922e0f6e414c233466b5ec871	dthiessen	2016-01-14 09:05:27.796
140	20160114171512-server	4d17f69d6428db4dd5b3cb1bcce0e14e	dthiessen	2016-01-14 10:15:12.703
141	20160114173201-server	47f8a1b881cd6c0042ebe78d4b938a13	dthiessen	2016-01-14 10:32:01.484
142	20160114180451-server	ee585e6ffa4bccfc597af2a0a68788e1	admin	2016-01-14 11:04:51.203
143	20160115150248-server	0b373231943b3806fce12ebc561b3cac	dthiessen	2016-01-15 08:02:48.609
144	20160115170551-server	34e569cd750426c578a4000640d9daae	ereimer	2016-01-15 10:05:51
145	20160115170600-server	0f63676fc8701ca0b5159630bea310b2	admin	2016-01-15 10:06:00.843
146	20160115203806-January 11, 2016	39dbc903210ddedbad8b9dd4f130521a	dthiessen	2016-01-15 13:38:06.093
147	20160115204541-server	584c2c2cc124ad95d66b3b46ebb6f01f	ereimer	2016-01-15 13:45:41.5
148	20160118153910-server	1b05c020a904728d5b06d4ca0668f675	ereimer	2016-01-18 08:39:10.375
149	20160118212136-server	e9af88583650235ec49b0bb697d1850d	ereimer	2016-01-18 14:21:36.812
150	20160119163810-server	60cd7e400da3c379c8630f695887b8d0	dthiessen	2016-01-19 09:38:10.468
151	20160121150156-server	d2f6be64e07ae3d00a854f06a6d8e329	ereimer	2016-01-21 08:01:56.812
152	20160121154712-server	5a51d6a45ce3312d6856a8a0d74f67bd	dthiessen	2016-01-21 08:47:12.359
153	20160121161736-server	5c79a33592b83f542e676478f8d28ab5	ereimer	2016-01-21 09:17:36.937
154	20160121161930-server	fc05fa03883e214072d2ff886a708f1e	ereimer	2016-01-21 09:19:30.093
155	20160125143700-server	c984ecf2bcf7e2bb29745089bd520d9c	ereimer	2016-01-25 07:37:00.5
156	20160126175937-server	10fe2fdbeea1cfe27fb3111958a0ca81	ereimer	2016-01-26 10:59:37.921
157	20160126175952-server	8e216614884800fbf178c819ae0b966e	ereimer	2016-01-26 10:59:52.531
158	20160128153035-server	6172bef5561115ead966a68350404487	ereimer	2016-01-28 08:30:35.89
159	20160129164644-server	0fcbe3e2186da2c50c3d4d9987facb1a	ereimer	2016-01-29 09:46:44.109
160	20160201141058-server	992d43b5dbfa7dfefefeabe2c845057e	ereimer	2016-02-01 07:10:58.546
161	20160201151938-server	1a97c63aac73301915cc548a497e4013	ereimer	2016-02-01 08:19:38.14
162	20160201230234-server	8245e508380593ba90b9444ee45189e9	ereimer	2016-02-01 16:02:34.312
163	20160202172244-server	f751581501c92214baf41291ea8a5769	dthiessen	2016-02-02 10:22:44.437
164	20160202213905-server	eb76424036eb6b61ebcc9cbdf0b479ad	admin	2016-02-02 14:39:05.937
165	20160202220243-server	5e974562a3b908de8a3d074d7f8f5c3d	ereimer	2016-02-02 15:02:43.281
166	20160204144911-server	3858ff46b35ef52fc68083309b8ce5e7	ereimer	2016-02-04 07:49:11.406
167	20160205224232-server	d76ba8bd30b2dfa49481d8ab450f5d15	ereimer	2016-02-05 15:42:32.453
168	20160208144836-server	0db7a121fbc147f0bf0e1953bbde456d	ereimer	2016-02-08 07:48:36.203
169	20160208153919-server	51b6c597fbdcd168a83585715e9f8f9a	admin	2016-02-08 08:39:19.579
170	20160208161712-server	78eef4f992ef02a65b9f4dfde08d3986	ereimer	2016-02-08 09:17:12.082
171	20160209205921-server	dccd08c0136f408931bf774717792848	ereimer	2016-02-09 13:59:21.731
172	20160211142502-server	a544f3c5f5772ab164e32812f9f41611	ereimer	2016-02-11 07:25:02.041
173	20160212213354-server	28aeafcba294ef347cd5df76cceea478	ereimer	2016-02-12 14:33:54.923
174	20160215143427-server	3f9cbde630075107fcb5d24f897102bc	ereimer	2016-02-15 07:34:27.601
175	20160215172349-server	d5829b66f805ecc3720b7afb5f51d23a	dthiessen	2016-02-15 10:23:49.276
176	20160217160223-server	443e3fd9a3e84a56e3bac78dd6f6a87f	admin	2016-02-17 09:02:23.748
177	20160217163138-server	a2d5c4bc22825801b793aa663ba25d1e	admin	2016-02-17 09:31:38.648
178	20160217220438-server	6c0d3daebfd924e365459eacbfbf2b0d	admin	2016-02-17 15:04:38.395
179	20160218145643-server	593699ee5ebbe5627e88ac9de1faf1bc	ereimer	2016-02-18 07:56:43.599
180	20160219162310-server	44a937d72b1745d882a080875ec1fdaa	admin	2016-02-19 09:23:10.928
181	20160219214806-server	d0b4d6f6b910b4f333384d3cf4f4be52	admin	2016-02-19 14:48:06.559
182	20160219215424-server	decf8f60a1ccd6c4aa7b3f130cb26811	ereimer	2016-02-19 14:54:24.423
183	20160222143123-server	450a1588ccec1080558bc441c0debd6d	dthiessen	2016-02-22 07:31:23.934
184	20160225172224-server	e47593acdd44ed2cf49069bf82f0cb4f	ereimer	2016-02-25 10:22:24.266
185	20160229152315-server	e4a75cb5f9cac11e690c6660a78f2a32	ereimer	2016-02-29 08:23:15.766
186	20160303160559-server	6ade8793cbf81baa6c7709f894e12daf	dthiessen	2016-03-03 09:05:59.779
187	20160304155248-server	4eea1230c21f107afebbd818b9abcbb2	dthiessen	2016-03-04 08:52:48.345
188	20160307142822-server	dcb93526ea1bd461ae1c2b46f6c86352	dthiessen	2016-03-07 07:28:22.722
189	20160309171740-March 7, 2016	e9f5899583093d1344d91c2f59efec1d	dthiessen	2016-03-09 10:17:40.997
190	20160310152609-server	f54a646bc83219350d7b7f595a183405	ereimer	2016-03-10 08:26:09.968
191	20160310155557-server	7c2b60989a300c5ea9721b55446b50c3	ereimer	2016-03-10 08:55:57.341
192	20160310202427-server	aadda17c63a579304e270e54736233af	ereimer	2016-03-10 13:24:27.017
193	20160311222108-server	c7941e3ca4463080634a3a5851615d87	ereimer	2016-03-11 15:21:08.773
194	20160314153626-server	6974f327041638f5eff93b2a96a48547	ereimer	2016-03-14 08:36:26.917
195	20160314175241-server	60d3537a8a51ff9a545043b72368bad4	ereimer	2016-03-14 10:52:41.208
196	20160314231501-server	bd57a20d2bb2d19a0186a4e665a905e0	ereimer	2016-03-14 16:15:01.101
197	20160314233353-server	1fd79a71f588110726a6d47cdd0d6070	ereimer	2016-03-14 16:33:53.795
198	20160315180231-server	6b756d90cb4688f33e5e100326914eaf	ereimer	2016-03-15 11:02:31.277
199	20160315231248-server	39f8dc3062f49409ebdfa22c50c1f3eb	ereimer	2016-03-15 16:12:48.769
200	20160317150854-server	ab6ae74327af3cfe2782946bc268195b	ereimer	2016-03-17 08:08:54.041
201	20160321153453-server	933671bb87ccea0ec1d6b1dbadbbd769	ereimer	2016-03-21 08:34:53.301
202	20160322212022-server	930cfad6e6465eee9d589db177657e3b	ereimer	2016-03-22 14:20:22.801
203	20160324145743-server	903b7472fa93d896405c534025affa6e	ereimer	2016-03-24 07:57:43.203
204	20160325161741-server	041a716be958c9775300d3319df67697	ereimer	2016-03-25 09:17:41.125
205	20160329190409-server	5ca1de073901ee30161070d8448f16f3	dthiessen	2016-03-29 11:04:09.156
206	20160331161146-server	7896387b191cee0fc37b08f177578fe1	dthiessen	2016-03-31 08:11:46.812
207	20160331224836-server	10f280050a48c9ade7641d7a1d42129c	dthiessen	2016-03-31 14:48:36.421
208	20160331232426-server	72cea9f8c80b00af110ccf0691a0a1c6	dthiessen	2016-03-31 15:24:26.312
209	20160401231840-March 28, 2016	b23201c249195659f409d6f41beed5b0	dthiessen	2016-04-01 15:18:40.453
210	20160404153950-server	12166839c9c406af729cec1536065bb8	dthiessen	2016-04-04 07:39:50.468
211	20160404170624-server	dd2b7940216ab16e577aa92acad4a774	dthiessen	2016-04-04 09:06:24.578
212	20160404171454-server	15e49eb70ea1e3c35c52905becf581f2	dthiessen	2016-04-04 09:14:54
213	20160404172548-server	ce0bee710c995fc35e3545ff596822f3	dthiessen	2016-04-04 09:25:48.468
214	20160404174048-server	6dda214fb8af67b4c21864be3fb93b33	dthiessen	2016-04-04 09:40:48.468
215	20160404194530-server	4d8ec535d3158914e961d5d69b71f634	dthiessen	2016-04-04 11:45:30.75
216	20160404212214-server	ff8ccf7f800c48fc1745a4a07a46bb4c	ereimer	2016-04-04 13:22:14.593
217	20160407165221-server	d22db4b9e95fac53edc33e8c6af5659a	dthiessen	2016-04-07 08:52:21.328
218	20160411161026-server	36c18e68e01f2e0868aad0ea4f2c3e05	dthiessen	2016-04-11 08:10:26.015
219	20160411184649-server	c968c8e64e88179620126e3b7646423b	dthiessen	2016-04-11 10:46:49.234
220	20160414155337-server	4080c2862e63607808bded5589cefe9f	ereimer	2016-04-14 07:53:37.39
221	20160414223839-server	899dbfc7e6d53d870a1c98a589169eec	admin	2016-04-14 14:38:39.352
222	20160415174953-server	a9d6639dbee13d3041ee2ac79cf2f4c0	ereimer	2016-04-15 09:49:53.765
223	20160415183855-server	ee087d2e863cee7b422f672887e27600	admin	2016-04-15 10:38:55.982
224	20160418161720-server	bf57986cfce69fc9fb0368b405f59ef3	ereimer	2016-04-18 08:17:20.466
225	20160419163725-server	33e820a0a03041212d751bc18272f07c	ereimer	2016-04-19 08:37:25.451
226	20160422175102-server	4b1ef4443a94ada64db07d8591a6cced	ereimer	2016-04-22 09:51:02.779
227	20160425164126-server	9b128c2c183e7b15c7e5893fe8c8fedf	ereimer	2016-04-25 08:41:26.544
228	20160426171558-server	132959f1faaa05187b41f6571584b08f	ereimer	2016-04-26 09:15:58.919
229	20160428153841-server	0617a4273ea4202046b1e480be7a4ca8	ereimer	2016-04-28 07:38:41.998
230	20160428215958-server	4e8cf3841da076647bd1d847c3858793	ereimer	2016-04-28 13:59:58.419
231	20160429174648-server	85481d5bcacccaf1e81cfb00149c60f2	ereimer	2016-04-29 09:46:48.232
232	20160502154557-server	1bdfc293580b59d9a1462743c7701b44	ereimer	2016-05-02 07:45:57.56
233	20160503155542-server	29f1d56b4551df4a5e50fb0bb12801e3	ereimer	2016-05-03 07:55:42.279
234	20160503183900-server	d915a357ad2b611375b10b84b71e1e44	ereimer	2016-05-03 10:39:00.701
235	20160505153318-server	26aff7b17fc13e69cca10190f7fbf58c	dthiessen	2016-05-05 07:33:18.435
236	20160506230518-server	ed521a6367fc8f3051047f908b3724ff	ereimer	2016-05-06 15:05:18.859
237	20160509153544-server	2c45e0ba21554947f81b302bab0190cf	dthiessen	2016-05-09 07:35:44.531
238	20160509153942-December 7, 2015	4082d14f42cb8154b2ed0063538edb6c	dthiessen	2016-05-09 07:39:42.593
239	20160509162856-server	9912e1a5fc14f7cebf1e906b73623b7b	ereimer	2016-05-09 08:28:56.156
240	20160512154056-server	5e6a38df09fc7cc55a711902648c286a	ereimer	2016-05-12 07:40:56.75
241	20160513170000-server	4d45dd08050c069d09813bcda8fa76cf	ereimer	2016-05-13 09:00:00.515
242	20160513183940-server	bd6d455e339157bdcd76bd8a20500a79	ereimer	2016-05-13 10:39:40.656
243	20160513215844-server	c848682539d281b269f88686bf8e61a1	ereimer	2016-05-13 13:58:44.406
244	20160513225555-server	abaaaeff6f7ead1307f9b42294cec464	ereimer	2016-05-13 14:55:55.468
245	20160516154735-server	9c8b0409a44a67b3cf691aebb2489eb5	ereimer	2016-05-16 07:47:35.343
246	20160519155044-server	36d56005a889820efe907cb0f41aec3d	ereimer	2016-05-19 07:50:44
247	20160520003001-server	f52bcf01be5928688646daa9abee4c5e	dthiessen	2016-05-19 16:30:01.286
248	20160520211628-server	ae08e81b57002f6dcb2a0437d6ae8922	ereimer	2016-05-20 13:16:28.767
249	20160520234122-server	9f1741f3915d864208d21078a6948c92	ereimer	2016-05-20 15:41:22.006
250	20160523162955-server	51f9fdb6cfc3e1364580099548d8139c	ereimer	2016-05-23 08:29:55.75
251	20160527182411-server	4c16e186f8d303c10a9c7edc6fc10ec6	edueck	2016-05-27 10:24:11.156
252	20160527232543-server	c140dabe5914130d98855ece04923967	ereimer	2016-05-27 15:25:43.578
253	20160530154825-server	40855ff923801e78351fbc4c6f0a5521	ereimer	2016-05-30 07:48:25.64
254	20160530213013-server	b6f245120637fbe843de6f49e3c5d231	ereimer	2016-05-30 13:30:13.421
255	20160531221424-server	f1af13e0a0ec7dfbfad8b5e998724922	rthiessen	2016-05-31 14:14:24.984
256	20160531223508-server	859fd65ee82190e7db5c8a5b71f14cfd	rthiessen	2016-05-31 14:35:08.953
257	20160601002430-server	b26157ac57c4346889486387032018af	rthiessen	2016-05-31 16:24:30.406
258	20160602143149-server	f0a1ae6c2c681bc2110eb621caf38256	rthiessen	2016-06-02 06:31:49.265
259	20160602154009-server	a7e32a4919390beae15a715bfb9bf545	dthiessen	2016-06-02 07:40:09.093
260	20160602182048-server	3804288bd62f95119cd13860b3d28120	dthiessen	2016-06-02 10:20:48.532
261	20160604213055-server	b0324376a886df65434c11e0573396bf	rthiessen	2016-06-04 13:30:55.907
262	20160606155425-server	82f74c78db67aa512b25b25ab6e8d92e	ereimer	2016-06-06 07:54:25.079
263	20160607163152-server	625f2ca57918dff076ed058eca0b7600	ereimer	2016-06-07 08:31:52.938
264	20160609155636-server	895fbb1ba37676d2248f3ab142bdff92	ereimer	2016-06-09 07:56:36.25
265	20160613154637-server	41d02e02c66b1f7782a4f10c1e57e1aa	ereimer	2016-06-13 07:46:37.171
266	20160614164122-server	11b5a376e95ce905f649ce793fcb7f59	ereimer	2016-06-14 08:41:22.365
267	20160616155358-server	fb3ec2678867c336ed6718d5ef069813	ereimer	2016-06-16 07:53:58.412
268	20160617185316-server	aa93adc0a0517139c5e874b9c914427b	ereimer	2016-06-17 10:53:16.115
269	20160620152507-server	b9357a0a3882743a6590f31198ba0995	ereimer	2016-06-20 07:25:07.349
270	20160620165213-server	84ad86d34ed939a2db2c0b2d8b58bae8	dthiessen	2016-06-20 08:52:13.505
271	20160621164431-server	8582efd43cefd8751a75a8819601a6ba	ereimer	2016-06-21 08:44:31.287
272	20160623160904-server	7381a4b3a9e2b381513bf4cc3137ed2d	ereimer	2016-06-23 08:09:04.281
273	20160624175458-server	c5b697944b65d8c5ff97c4dfd6298a07	ereimer	2016-06-24 09:54:58.718
274	20160624211922-server	af776c5a4f570cb831f62b073fa2bb1d	ereimer	2016-06-24 13:19:22.734
275	20160627154617-server	75076d2f3b6a2e5437148afc6db1936d	ereimer	2016-06-27 07:46:17.781
276	20160630162015-server	cbc5b7dee3ed8bd053bc0494536f2a6c	ereimer	2016-06-30 08:20:15.988
277	20160701161130-server	cf795efe0c7209d9c1d850624d25b53a	ereimer	2016-07-01 08:11:30.957
278	20160704153512-server	0fc7fc06ce0f73f550bd564f2a6ec104	ereimer	2016-07-04 07:35:12.738
279	20160705213709-server	d0d6de13b9967c90c2d887938f8ac404	dthiessen	2016-07-05 13:37:09.128
280	20160707155056-server	7648d4e1dcb1ff8ad787fe63df7880be	ereimer	2016-07-07 07:50:56.675
281	20160708180841-server	c6b150e648202fda7826a9f1f7fdd76a	ereimer	2016-07-08 10:08:41.347
282	20160708222832-server	9739b7dfd951db26b092248f1faf480a	ereimer	2016-07-08 14:28:32.847
283	20160711155017-server	1fde78d1695e0894beec4c0209aa02f6	ereimer	2016-07-11 07:50:17.972
284	20160714153137-server	476e668a7b40c0a49be2411fa58c5335	ereimer	2016-07-14 07:31:37.675
285	20160715185419-server	3c22a982a837f1a8f1d180eb186f729e	ereimer	2016-07-15 10:54:19.503
286	20160715220219-server	cd35b05cb2de22aefeb9e9d7a984bef7	ereimer	2016-07-15 14:02:19.91
287	20160718153624-server	2888eb544b76d4963dae19d005009611	ereimer	2016-07-18 07:36:24.66
288	20160721153535-server	fc8c76322d29d588199a0bf5ae1574a6	ereimer	2016-07-21 07:35:35.722
289	20160722215750-server	0364e1325491fd72552ab216f996756f	ereimer	2016-07-22 13:57:50.285
290	20160725153032-server	426a85da3fd521d3976576e1b2b8a9c2	ereimer	2016-07-25 07:30:32.878
291	20160728152445-server	4db35119a98b23df7dd3b3b238147ae9	ereimer	2016-07-28 07:24:45.097
292	20160729161406-server	4c32fdb4f6a148b5d913e539674d1321	ereimer	2016-07-29 08:14:06.613
293	20160801154001-server	605e3bb12f8bc553e7a8f0d5be77f3de	ereimer	2016-08-01 07:40:01.191
294	20160805170307-server	9dbb11885d154a23338d999486daad44	ereimer	2016-08-05 09:03:07.5
295	20160805212049-server	8177cf3dc52169b642e072c9aea76222	dthiessen	2016-08-05 13:20:49.125
296	20160808161355-server	c2d6a01bf63f4a41cb0a5e492cdd4e5e	ereimer	2016-08-08 08:13:55.234
297	20160811152731-server	92f6d0ff12212dec4bd3f45d44a1e5d8	ereimer	2016-08-11 07:27:31.125
298	20160812163431-server	ef73dde628f5fb71036c065791bc9967	ereimer	2016-08-12 08:34:31.281
299	20160815155430-server	7b2e2bd3cdda6b569b0825c2ec28208c	ereimer	2016-08-15 07:54:30.312
300	20160818153543-server	e704277d2651f2404686f008874df219	ereimer	2016-08-18 07:35:43.593
301	20160820010027-server	88e0994c6ebc6f4e4fef6774b47d39dc	edueck	2016-08-19 17:00:27.75
302	20160822154819-server	ffb228d5de9bc7e9d185b3be11141410	ereimer	2016-08-22 07:48:19.578
303	20160822173815-August 15, 2016	cd401c1160cdba3f5ea2fbc7228ed949	dthiessen	2016-08-22 09:38:15.718
304	20160823164312-server	bf7b6e4397ad3c9b3de9d132c057345d	ereimer	2016-08-23 08:43:12.031
305	20160825155836-server	b29ae75b3ea7947c371693312dea8e93	ereimer	2016-08-25 07:58:36.5
306	20160826182414-server	0f98c87cb389592a9ffa0b7c4731b6de	ereimer	2016-08-26 10:24:14.187
307	20160829165041-server	208a16ed9fa8924b983ae8da273ed948	ereimer	2016-08-29 08:50:41.531
308	20160829174246-server	dec1737f0628ef561c7ef1d25eb87a23	ereimer	2016-08-29 09:42:46.343
309	20160829175029-server	48c8f29d641be8d82f114df9d6ea8383	ereimer	2016-08-29 09:50:29.89
310	20160830154730-server	1a6301566683bf4fa96127effd7f2d0b	ereimer	2016-08-30 07:47:30.203
311	20160830195809-server	dbd27869af9045780c2bd1c89abec7c4	ereimer	2016-08-30 11:58:09.312
312	20160901154355-server	0a8874ba64402116c366a80314b24611	ereimer	2016-09-01 07:43:55.281
313	20160902180346-server	151f7aa3d3e6bdb8c1feead5d50f7971	ereimer	2016-09-02 10:03:46.515
314	20160902214930-server	4d08c830cdc38fec4fd3287acf301700	dthiessen	2016-09-02 13:49:30.75
315	20160903011109-server	0f209d8bff117d395e26f64c431d1785	ereimer	2016-09-02 17:11:09.468
316	20160905154126-server	d218d415458cc8eabec0f5fb70631dd9	ereimer	2016-09-05 07:41:26.218
317	20160907002151-server	f35ec9788ebf9918d8d572e6a5704ce8	dthiessen	2016-09-06 16:21:51.531
318	20160908154138-server	5dd286c3d87b621fad886f4d66827aad	ereimer	2016-09-08 07:41:38.703
319	20160912155137-server	0415a0b492fc8b938274386bcdc7d4a1	ereimer	2016-09-12 07:51:37.234
320	20160912155629-September 5, 2016	fb288eb0d97bd84256526f6a61b82687	dthiessen	2016-09-12 07:56:29.859
321	20160915155001-server	f055030576cd7f62531c91c79667e04d	ereimer	2016-09-15 07:50:01.046
322	20160916173759-server	58c520ba331191c0acb9ef3c9bfbaf35	ereimer	2016-09-16 09:37:59.39
323	20160916200155-server	7498f8e92323c93a12e78bf44da05664	ereimer	2016-09-16 12:01:55.937
324	20160919161136-server	4f78606a7ef55f3702df1e4f5724e195	ereimer	2016-09-19 08:11:36.765
325	20160921015154-server	cc18e7b63ccd478aeb1244668ba0c3e4	dthiessen	2016-09-20 17:51:54.343
326	20160922160041-server	891354b948882ca17bfb7123938cf943	ereimer	2016-09-22 08:00:41.406
327	20160923172546-server	94d8a26dec8c96339074f59acacbcc6a	ereimer	2016-09-23 09:25:46.218
328	20160926160622-server	c472df8bd27561d7fb057135004498ba	ereimer	2016-09-26 08:06:22.656
329	20160929153336-server	2a10efc68416ba8aeee8e81b465a74cc	ereimer	2016-09-29 07:33:36.187
330	20160930161823-server	bb9c9e4a9d828eed97ef81c004bec3c5	ereimer	2016-09-30 08:18:23.406
331	20161003162802-server	b9edf91771996af31760ac50a4a4d3cf	ereimer	2016-10-03 08:28:02.015
332	20161006161222-server	c8456ecfee1b0c465eff4fb2777b680e	ereimer	2016-10-06 08:12:22.765
333	20161010161118-server	c9bfa83bdfc46fa7d5164b7397925b8a	ereimer	2016-10-10 08:11:18.703
334	20161010211622-server	64d3168f7a0db0270a061708b6760002	edueck	2016-10-10 13:16:22.546
335	20161013153221-server	e16e1096342fe25812cac30a0f888214	dthiessen	2016-10-13 07:32:21.109
336	20161013162038-server	864651352f26da231c65749a261ecf55	dthiessen	2016-10-13 08:20:38.218
337	20161013162339-server	f409ee861f2b6dcedad5b1a54cd67fe0	dthiessen	2016-10-13 08:23:39.89
338	20161013174205-server	2107614bd16084d41bf82efe050f0bf4	dthiessen	2016-10-13 09:42:05.734
339	20161013175422-server	306c16c5f0cbea8909f55c5c983f3fc7	dthiessen	2016-10-13 09:54:22.546
340	20161013180534-server	20ddebc3a43b419296647bc85b444b10	dthiessen	2016-10-13 10:05:34.859
341	20161013181154-server	c4e98cfe1fd0450f8ff0f233f659ca79	dthiessen	2016-10-13 10:11:54.984
342	20161013231859-server	2c727dc827033b06c27e44c641cff90b	dthiessen	2016-10-13 15:18:59.703
343	20161014175524-server	fe3cea0a3ed79f17b71d0b35b249ac00	ereimer	2016-10-14 09:55:24.687
344	20161017160939-server	004fde061a09bb9d017be746ec5e8fb8	ereimer	2016-10-17 08:09:39
345	20161018173951-October 10, 2016	6a17254f3dc0625ef77f6af52eec4e98	dthiessen	2016-10-18 09:39:51.203
346	20161020161512-server	f452c60a969d6d4493460eed35ee1798	ereimer	2016-10-20 08:15:12.406
347	20161021161532-server	c2542cc7400128c5030533ee10a6b65f	ereimer	2016-10-21 08:15:32.375
348	20161024155000-server	6f8be110596e035744d128c9d5ddde27	ereimer	2016-10-24 07:50:00.093
349	20161027155300-server	680f612d0fc7fcf4d09b8e0808f313be	ereimer	2016-10-27 07:53:00.375
350	20161028183441-server	eb938d0fa3516c2d5beb9acf677bfbd7	ereimer	2016-10-28 10:34:41.625
351	20161031152105-server	11997db745f793912658feb78ad4b032	ereimer	2016-10-31 08:21:05.828
352	20161103144707-server	e8182b082d5f7fd38065fc6d0a748f14	ereimer	2016-11-03 07:47:07.281
353	20161103173030-server	1270d74ad2f7d64faf555bc219a76078	dthiessen	2016-11-03 10:30:30.187
354	20161104155701-server	656e53e6460901694341ed069218e459	ereimer	2016-11-04 08:57:01.718
355	20161104213614-server	10038d00effc80709f3fee976b8441c7	ereimer	2016-11-04 14:36:14.468
356	20161107145231-server	dd92aa37435e082e2e67e99a526f8c66	ereimer	2016-11-07 07:52:31.75
357	20161111154350-server	6e8209ddc83ef0b81a37b90ebc9dffcc	ereimer	2016-11-11 08:43:50.938
358	20161114143331-server	aeac0714f593bbeed871338a633cc9b3	ereimer	2016-11-14 07:33:31.246
359	20161117144007-server	ac594ee58011e3d6cdeeae2c224d4158	ereimer	2016-11-17 07:40:07.855
360	20161118172448-server	5e809778eeda121e2c0bd628d8197ce7	ereimer	2016-11-18 10:24:48.902
361	20161118212616-server	291a70457fb9b5f3f7b7d18c72124f33	ereimer	2016-11-18 14:26:16.574
362	20161121144757-server	32df9837dc1784ec060663fde4e935a6	ereimer	2016-11-21 07:47:57.183
363	20161124143250-server	a3f67d9cfa28dbea1c4b0d11e3b10eed	ereimer	2016-11-24 07:32:50.355
364	20161125154146-server	93d6bf349ffb204fcc1ed33e8b4c90b8	ereimer	2016-11-25 08:41:46.542
365	20161128142807-server	e2c226e57e83404b01d0693a21fcfd38	ereimer	2016-11-28 07:28:07.699
366	20161201151450-server	130c074deab7abc44ab97600f3623265	ereimer	2016-12-01 08:14:50.871
367	20161201173347-server	c343b62e311eebb06ed1dd637c9167fe	dthiessen	2016-12-01 10:33:47.402
368	20161201183446-server	7bfe225acc235a47ad00fe720d8f1c42	edueck	2016-12-01 11:34:46.214
369	20161201195924-server	7853c1d7d73ee377302f9bd2854d98f9	dthiessen	2016-12-01 12:59:24.496
370	20161205144831-server	7e136e366fc33de83c72a75cf828d8df	ereimer	2016-12-05 07:48:31.849
371	20161206203742-server	2d7d8f7f5dda66581794b0e90bb2b72a	dthiessen	2016-12-06 13:37:42.083
372	20161208152103-server	32039b4154bfa72fa282cbac230d37b8	dthiessen	2016-12-08 08:21:03.583
373	20161208235428-server	342dcb915162263f45c7bc381eb71207	dthiessen	2016-12-08 16:54:28.943
374	20161209151402-server	b8f4cb3e4150c2cca9fabee8dad6a685	dthiessen	2016-12-09 08:14:02.052
375	20161209181653-server	413fcac4a5b11f3c45078ced5e4d10fd	ereimer	2016-12-09 11:16:53.912
376	20161212143246-server	5695f15f94b8fb13a9eddf9a56ba863a	dthiessen	2016-12-12 07:32:46.646
377	20161212160427-server	6eb39564ccf69698c8a3bfc2fdae884d	dthiessen	2016-12-12 09:04:27.162
378	20161212162947-server	0f4618c0dce803e9d5617046cae6e3f8	dthiessen	2016-12-12 09:29:47.49
379	20161212171029-server	7c54f3fe9e5df07e84230e9a25c39577	dthiessen	2016-12-12 10:10:29.943
380	20161215144352-server	fc262c894578547eb2dce4269230d38f	dthiessen	2016-12-15 07:43:52.943
381	20161215163948-server	78331ccb5147e74d7bdaa2120e5e2ec9	dthiessen	2016-12-15 09:39:48.662
382	20161215172441-server	f7a8238e7a150f9632bccfdbfb7ae741	dthiessen	2016-12-15 10:24:41.865
383	20161215203112-server	3be6079316d85cfe91375ddc3408c3a1	dthiessen	2016-12-15 13:31:12.443
384	20161216145638-server	e51c534ea6f197ac6222b9eb48d8c1e3	ereimer	2016-12-16 07:56:38.928
385	20161219143618-server	e7438cfb678fd73d644a6e7408ae75dd	ereimer	2016-12-19 07:36:18.538
386	20161222144014-server	2a8c93bd43d8d755ecb9704fff0799f0	ereimer	2016-12-22 07:40:14.628
387	20161222174056-server	4c7301dc655842a42575c6701cff0089	ereimer	2016-12-22 10:40:56.175
388	20161222204535-server	0d3c0a82f314d7039671a5382a447d2b	edueck	2016-12-22 13:45:35.957
389	20161223154619-server	ae7ac16e50d1407daaf20f84cf55d6ef	ereimer	2016-12-23 08:46:19.097
390	20161229150439-server	d8e81eb65ac8bbe368a3fefddbf21059	ereimer	2016-12-29 08:04:39.472
391	20161229152110-server	18f114df9e5f9b92d8165eb7aea620ef	ereimer	2016-12-29 08:21:10.457
392	20161230152651-server	346016e939cb707c388cfbc5c17054b8	ereimer	2016-12-30 08:26:51.722
393	20170102152133-server	3f054eebac865859af13753e00c30c82	ereimer	2017-01-02 08:21:33.144
394	20170105144138-server	75ab0c18d2c4cd83cba52648840ada33	ereimer	2017-01-05 07:41:38.316
395	20170106165206-server	14c2b59480dc74e3feabd9310c468885	ereimer	2017-01-06 09:52:06.941
396	20170106214748-server	083f3a625514f41fb41fb0e94a55e663	edueck	2017-01-06 14:47:48.503
397	20170106223911-server	a49d30733cd9188f27892208b900d3e5	ereimer	2017-01-06 15:39:11.738
398	20170109144729-server	f5bcb939c1d0e16ef4499d677716107e	ereimer	2017-01-09 07:47:29.785
399	20170112143454-server	f46beb032ce90a8517638329fa31608b	ereimer	2017-01-12 07:34:54.722
400	20170112164900-server	2e3f44f79ea0fffb2d7a20c738eb7362	ereimer	2017-01-12 09:49:00.441
401	20170112183612-server	9f54d3b55927ad4f884919cbb90257ef	ereimer	2017-01-12 11:36:12.441
402	20170113154421-server	8fc76eeaad26237e6a79230c5ff56fee	ereimer	2017-01-13 08:44:21.038
403	20170116145519-server	f8bdfd20291ef766a70d782c77dd36fa	ereimer	2017-01-16 07:55:19.178
404	20170119144101-server	973ccc409a9d3427f4578c6549aeb5bc	ereimer	2017-01-19 07:41:01.741
405	20170119162844-server	88c2786451d22582681197034cdbf90c	dthiessen	2017-01-19 09:28:44.725
406	20170120150721-server	3f059d486f513a9aad1126ae56c81ee9	ereimer	2017-01-20 08:07:21.334
407	20170120162429-server	1f97fd2868422e99f395e7269cb34a21	edueck	2017-01-20 09:24:29.866
408	20170120183029-server	524eee5e55910a54dbf0e4b3f43f4ae9	edueck	2017-01-20 11:30:29.069
409	20170123145434-server	a6798fa9683ee2ff5b901ddf803dec8b	ereimer	2017-01-23 07:54:34.616
410	20170123154804-server	722d67b0c6bb840542b61676ee5caf32	ereimer	2017-01-23 08:48:04.319
411	20170126145418-server	112f870b62337f576dace47c3bed74c7	ereimer	2017-01-26 07:54:18.512
412	20170127153806-server	a259750de7832f1068792957c5c4b0a8	ereimer	2017-01-27 08:38:06.981
413	20170127175207-server	db506191c3f58e38a37d38c3cd43c5a6	ereimer	2017-01-27 10:52:07.997
414	20170127203714-server	c28e2618e11e65e84525589fdcd22cf3	ereimer	2017-01-27 13:37:14.059
415	20170130143647-server	271fad378dfa5656c050c5817350a926	ereimer	2017-01-30 07:36:47.918
416	20170202142529-server	fb4e445e49a48304ac355058b1e3f165	ereimer	2017-02-02 07:25:29.012
417	20170203172951-server	0322bff554cb04aad440cbf8bf1f0c11	ereimer	2017-02-03 10:29:51.372
418	20170203202326-server	c791a195dca9364164c541ac30d489b9	ereimer	2017-02-03 13:23:26.45
419	20170206145211-server	da7bf8d75cda9bb930e27d386893b76d	ereimer	2017-02-06 07:52:11.158
420	20170209144715-server	5eb9f2911ab7b1b327624e20d189e2d1	ereimer	2017-02-09 07:47:15.048
421	20170209195848-server	19efc6eaf3503240d5909cc4e0e43a48	ereimer	2017-02-09 12:58:48.845
422	20170209205807-server	1f678b9312f0879a913030534facce5c	ereimer	2017-02-09 13:58:07.314
423	20170213143545-server	9a77230900cf073f5b89eb36891d7a4c	ereimer	2017-02-13 07:35:45.058
424	20170214150133-server	173a00a8895ff66d8bb11aae50d7b835	ereimer	2017-02-14 08:01:33.371
425	20170216145904-server	e3ad79025051f1340621eae76c967c30	ereimer	2017-02-16 07:59:04.839
426	20170217155054-server	b3ade9da17be065b42443602a0afafa3	ereimer	2017-02-17 08:50:54.402
427	20170220150602-server	a07c6608cc8cc9c233987d07175ac9b1	dthiessen	2017-02-20 08:06:02.574
428	20170220151047-server	55885b99988cac8c79bfa1290b2af247	ereimer	2017-02-20 08:10:47.996
429	20170220153047-server	b37c4cd0aa560a698d519ecc35fe96ff	ereimer	2017-02-20 08:30:47.761
430	20170220154127-server	8533e09d319efa3b3df20127cb43d5ed	ereimer	2017-02-20 08:41:27.355
431	20170224222039-server	1895befe05d2c68b4193d06708c5b856	ereimer	2017-02-24 15:20:39.464
432	20170227150202-server	fecf27344148429b0463eca7895c6ea2	ereimer	2017-02-27 08:02:02.105
433	20170227174621-server	855a5d26829df923c08f1bf0cf123983	ereimer	2017-02-27 10:46:21.699
434	20170227213140-server	15732df407ceb1e393c497bd0d03beac	ereimer	2017-02-27 14:31:40.355
435	20170227223622-server	8035c50bb32cf70e1884604fc48b657f	ereimer	2017-02-27 15:36:22.761
436	20170302151705-server	e1dce6a194dc4eeed4cb0f3d4b31c3d4	ereimer	2017-03-02 08:17:05.98
437	20170302173259-server	20ad070f38d88d42f1a84a030a05889b	edueck	2017-03-02 10:32:59.292
438	20170303212810-server	0c230c96697cc3edc87888f3ebb9dfd0	ereimer	2017-03-03 14:28:10.324
439	20170306141231-server	815bb36eccf5987981fb5e14095210c6	ereimer	2017-03-06 07:12:31.589
440	20170306210456-server	d3297ab2a75c634939628ea2bf8fa6aa	ereimer	2017-03-06 14:04:56.808
441	20170309145558-server	5a4fff72c302845d1f1e1c114e5f6796	dthiessen	2017-03-09 07:55:58.152
442	20170309180324-server	1540786c079fa0be52fe4823f2efe8e5	dthiessen	2017-03-09 11:03:24.589
443	20170311001533-server	1d0c7cfb323bb60a0df7e0861a121c71	dthiessen	2017-03-10 17:15:33.855
444	20170313152124-server	46f5e0c8b23aedceed158a115727e4b7	dthiessen	2017-03-13 08:21:24.714
445	20170313164326-server	7f45db9133105ef15e70ebaa64937a76	ereimer	2017-03-13 09:43:26.839
446	20170316145054-server	2fa9910315b83d5a9a3055bf44d45e67	dthiessen	2017-03-16 07:50:54.855
447	20170317223836-server	a9a40e490e96eab632f5806e2bdc776e	ereimer	2017-03-17 15:38:36.402
448	20170320150133-server	ca9acd19fb4923336f070af8eb95fdef	dthiessen	2017-03-20 08:01:33.277
449	20170320152932-server	b03a32e3709d97bf9a7999f18fa5d193	dthiessen	2017-03-20 08:29:32.714
450	20170320231150-server	0f9ac42a3e48c42a2d51099a497fe388	dthiessen	2017-03-20 16:11:50.871
451	20170323143247-server	9984ed1f06a1fbaa9e876a549064b422	ereimer	2017-03-23 07:32:47.136
452	20170323234030-server	d221f399697c8ed3dd83444c988f8ae2	ereimer	2017-03-23 16:40:30.308
453	20170324183056-server	32f3b9cbc5a75af77de2f9f03a39699f	ereimer	2017-03-24 11:30:56.636
454	20170324183710-server	50f6b8a9897ee1baa0b546a6ecb6eee9	ereimer	2017-03-24 11:37:10.746
455	20170324223817-server	9c33e202eaf2058c2c814ab58214a26b	ereimer	2017-03-24 15:38:17.605
456	20170324233157-server	ef20525bd40a8f91630096bc7abd932c	ereimer	2017-03-24 16:31:57.261
457	20170325003935-server	22ac5e48f177aa333a1e5602b0ca5fff	ereimer	2017-03-24 17:39:35.699
458	20170327154852-server	31d4e949dd73dc58d919077faf4815b9	ereimer	2017-03-27 07:48:52.574
459	20170328183053-server	9e0c83a69763d8538dbd4ea430e16da6	ereimer	2017-03-28 10:30:53.542
460	20170330154225-server	53a177c6ba6275da0e4386a401e690a0	ereimer	2017-03-30 07:42:25.636
461	20170330194409-server	acdcb298e9919f1d4dbbf223df12277e	ereimer	2017-03-30 11:44:09.23
462	20170330210735-server	65b81622e54fe9ecfbd83292e96da65a	dthiessen	2017-03-30 13:07:35.292
463	20170331184931-server	f1677e6eb95df77a1db0e5e6a4ec50f5	ereimer	2017-03-31 10:49:31.855
464	20170403155418-server	250705c2d668625c45d76e32f13b5764	ereimer	2017-04-03 07:54:18.214
465	20170404003416-server	8e105a299381a450ae0cb752f67f2d98	admin	2017-04-03 16:34:16.261
466	20170404010741-server	60f7aa1f972430c0a75e7b78a6276427	dthiessen	2017-04-03 17:07:41.027
467	20170404011835-server	1ab1d836c2db4ef263d711476c85f01d	tneufeld	2017-04-03 17:18:35.808
468	20170404011930-server	a1be35ff345138ccecd21806996f02bf	dthiessen	2017-04-03 17:19:30.761
469	20170404165710-server	c35af007f84b970df1352ac63b823b0c	tneufeld	2017-04-04 08:57:10.542
470	20170404174450-server	831ed6d94f519ca30da2fc8f0dd0b87e	edueck	2017-04-04 09:44:50.23
471	20170404235126-server	642df8dd69a6e77f401856b75b1b689a	tneufeld	2017-04-04 15:51:26.292
472	20170406155358-server	e04a46a05fa26581d21965241b12b2e8	tneufeld	2017-04-06 07:53:58.386
473	20170407003135-server	a9f84388ea1441bbabd3b24c6dc76e4b	admin	2017-04-06 16:31:35.042
474	20170410155513-server	7a40818f62b24eb696ba6abdaa4a278b	tneufeld	2017-04-10 07:55:13.886
475	20170410233319-server	af946e58262be3195ba23b77364a7147	tneufeld	2017-04-10 15:33:19.98
476	20170411185900-server	c2bc7d7281394217da0a790f8400159c	ereimer	2017-04-11 10:59:00.917
477	20170418164805-server	01a93c4a8ae9412a3b294c1394d7cf72	tneufeld	2017-04-18 08:48:05.417
478	20170420160413-server	cea505faccb79508c2261a9a3e2827a1	tneufeld	2017-04-20 08:04:13.027
479	20170420224414-server	d8f7bedd4c79c10b27f0ffd592ffe19b	dthiessen	2017-04-20 14:44:14.996
480	20170421171413-server	19452c882e2c15863e56781c4c02ce72	tneufeld	2017-04-21 09:14:13.48
481	20170421194356-server	9dd64b057b1f18a771086184b27c1741	ereimer	2017-04-21 11:43:56.121
482	20170421213806-server	e75ed263be3c32c25516c0316011d72e	ereimer	2017-04-21 13:38:06.152
483	20170422002516-server	623669b706d2af6e3a6ab9a58fd7b65c	tneufeld	2017-04-21 16:25:16.527
484	20170424154434-server	1293c6f70026a17658751daba8f4a1c5	tneufeld	2017-04-24 07:44:34.214
485	20170425171600-server	82cee6bdf2593e92d7670def8046b083	tneufeld	2017-04-25 09:16:00.777
486	20170425173222-server	a3d1b6197f806f5276dd0bd109e72574	ereimer	2017-04-25 09:32:22.152
487	20170425180611-server	b4649bf5ee989149b292f2d6ea78e376	dthiessen	2017-04-25 10:06:11.371
488	20170427155818-server	d4fd496baf291dd8f0d294883be78321	tneufeld	2017-04-27 07:58:18.949
489	20170427214711-server	3568c35d2a22a159abdd00db09be2ac1	ereimer	2017-04-27 13:47:11.199
490	20170501154137-server	8d276353d6393039d6ce33755237ee78	tneufeld	2017-05-01 07:41:37.324
491	20170501155002-server	a2319dc76229d1d772b30b9977abb420	dthiessen	2017-05-01 07:50:02.73
492	20170501172850-server	04cf0675c77a7fca93babe3e140a1c05	tneufeld	2017-05-01 09:28:50.574
493	20170502172238-server	2abd8c05d288743b85e37f81c5594483	tneufeld	2017-05-02 09:22:38.277
494	20170505162513-server	3247b7cd098e79e33473f36fdf8897a8	ereimer	2017-05-05 08:25:13.98
495	20170515153340-server	cb7323fb8e7bc5c075165f0e4b46a297	dthiessen	2017-05-15 07:33:40.621
496	20170515160911-server	3af6a8dcd0a6bb9386d715a8d0ef9ea6	ereimer	2017-05-15 08:09:11.839
497	20170515162130-server	16af9217d6033eb20e496995dd6a77f2	dthiessen	2017-05-15 08:21:30.105
498	20170515163505-server	46d8a51699297fa271d097711ca79625	ereimer	2017-05-15 08:35:05.933
499	20170516192113-server	a227456b0cd08635fb8c8d1580df34d7	dthiessen	2017-05-16 11:21:13.371
500	20170516220414-server	de97495c831aaaa7f51c64fb7a2cbb02	dthiessen	2017-05-16 14:04:14.011
501	20170518153726-server	395a13d0909b54da941903e0815dcacd	tneufeld	2017-05-18 07:37:26.792
502	20170519192642-server	f837e9dd2d542c454bf7988abe0e20af	admin	2017-05-19 11:26:42.635
503	20170522170044-server	bbc7d9059253adc7b6097d02e070b0c2	ereimer	2017-05-22 09:00:44.87
504	20170522182457-server	0012dc12b52eb3dd90766a48e992b545	tneufeld	2017-05-22 10:24:57.416
505	20170523222339-server	faf01f9b82506c03c44966c7b7b51799	dthiessen	2017-05-23 14:23:39.932
506	20170529153946-server	f113890708264b872f6630e802310f1e	ereimer	2017-05-29 07:39:46.156
507	20170530190451-server	7bd5477adcf3d5755e54580332594e33	ereimer	2017-05-30 11:04:51.453
508	20170601155047-server	288b30406a1c50f629faeb5db8f2863d	tneufeld	2017-06-01 07:50:47.328
509	20170602230528-server	01b8d1390cc9b6bd11c3b03bebffa802	ereimer	2017-06-02 15:05:28.734
510	20170605153352-server	abecd58c9c7ed00ae39bcb9528348f81	tneufeld	2017-06-05 07:33:52.817
511	20170612175306-server	5382d98018b6ae983a05a0095b026a57	ereimer	2017-06-12 09:53:06.905
512	20170613171054-server	80d712093107260af8c34183041ffa38	ereimer	2017-06-13 09:10:54.343
513	20170615154859-server	da59177e05979ce25155551cf742d943	tneufeld	2017-06-15 07:48:59.124
514	20170620001213-server	dd5a296a7644eead5c87c57ce54200da	dthiessen	2017-06-19 16:12:13.155
515	20170620170532-server	0d7acf0d7993a5dce98c3edf58f67f3e	dthiessen	2017-06-20 09:05:32.937
516	20170626222500-server	9d1372408651ff67c4a2c377fcf6a0de	admin	2017-06-26 14:25:00.032
517	20170630172338-server	ef4c7162e30029706a2fe954ea0a04ae	dthiessen	2017-06-30 09:23:38.265
518	20170630230503-server	c04524a2bd0045848e52fd24e1128ed5	dthiessen	2017-06-30 15:05:03.577
519	20170630233612-server	0e1a652541ed81a7c6d17835946a203e	dthiessen	2017-06-30 15:36:12.327
520	20170704212038-server	3d546eb06caeeac1f240c1ea14223189	dthiessen	2017-07-04 13:20:38.921
521	20170706184733-server	055ee284bc0635ef62578663de0c9056	dthiessen	2017-07-06 10:47:33.374
522	20170708011427-server	e9b29d4abca88f276abbbf8c86948b35	dthiessen	2017-07-07 17:14:27.405
523	20170710161456-server	5f562e19aaff025ada8fac763f43aa18	dthiessen	2017-07-10 08:14:56.515
524	20170713154203-server	e7b670094fa73082af04b149dfd8870c	tneufeld	2017-07-13 07:42:03.593
525	20170718222347-server	0da6797864feb0560a1df468cd47f49f	tneufeld	2017-07-18 14:23:47.164
526	20170720172620-server	e4b9fdf30345eae918d14f8071214d29	dthiessen	2017-07-20 09:26:20.977
527	20170801005437-server	3902dac3cce41c4d1fdb396d4487819a	dthiessen	2017-07-31 16:54:37.335
528	20170801163221-server	743bb1bb69fe63b0b781c457456a374d	dthiessen	2017-08-01 08:32:21.117
529	20170808175447-server	11168081faa12042098112a0bd02fc83	dthiessen	2017-08-08 09:54:47.148
530	20170810161308-server	76e1d496631d594927ed92eb6b6e3bc3	dthiessen	2017-08-10 08:13:08.179
531	20170811231648-server	d771dc8b348efade2039b7883ba66594	dthiessen	2017-08-11 15:16:48.132
532	20170815184713-server	e693e82fac4c18b82d5cf915c82c9e21	dthiessen	2017-08-15 10:47:13.585
533	20170825000648-server	2ce8fd7b1a209e1a5741a0ee92c94e93	dthiessen	2017-08-24 16:06:48.788
534	20170825001247-server	1a415ed57e4a77e05c57f83a0590bf95	ereimer	2017-08-24 16:12:47.022
535	20170831193630-server	0553ed880412f50229f75115506c9be6	dthiessen	2017-08-31 11:36:30.053
536	20170911185025-server	d58b8dc46e262dcf675e009e3622985e	dthiessen	2017-09-11 10:50:25.728
537	20170911220500-server	5fd8ed51153f05327eb8f55ae8f0bc60	dthiessen	2017-09-11 14:05:00.525
538	20170912174833-server	0e681cdf555937911d209ef8bd198c44	dthiessen	2017-09-12 09:48:33.978
539	20170912214709-server	f45c99e31e5703c06d47e006a8bc8820	dthiessen	2017-09-12 13:47:09.275
540	20170915040200-server	e045b705a6796e8b55d4fb1d3ae66707	dthiessen	2017-09-14 20:02:00.275
541	20170915161904-server	298cb5f2bc61ab8000d6a909b3d53238	dthiessen	2017-09-15 08:19:04.103
542	20170915182257-server	6a3f1b55afcd53e2cd2c7012932c4a71	tneufeld	2017-09-15 10:22:57.884
543	20170918170114-server	652083ff8c67c30aa1a1a50f0c8122b5	dthiessen	2017-09-18 09:01:14.398
544	20170925192001-server	2514df903a38a1866364f334cdcff80a	dthiessen	2017-09-25 11:20:01.444
545	20170925214325-server	173f57054fb2b734565aae1db1515d97	dthiessen	2017-09-25 13:43:25.116
546	20170929172652-server	3bddd066174a3ddcd8bbb1b2493e5033	dthiessen	2017-09-29 09:26:52.804
547	20170929185647-server	549e1d343c9650bd22183d1ae0ddb205	dthiessen	2017-09-29 10:56:47.147
548	20171009161759-server	1f25c22e9d6dc48e42bb10eabacedeb8	dthiessen	2017-10-09 08:17:59.834
549	20171019154215-server	f42540636dfe8b10b9de23b2cd7e541d	tneufeld	2017-10-19 07:42:15.782
550	20171021004314-server	6c746d7e55b9be63f892ec0458f53eed	edueck	2017-10-20 16:43:14.625
551	20171023232839-server	3c47b3a135e00bd6c76200bd60ab2ae0	edueck	2017-10-23 15:28:39.284
552	20171030161036-server	e0da9d5d47c8d1e296d77aeecd79f9db	dthiessen	2017-10-30 09:10:36.018
553	20171030170309-server	35d84f3aba0102cbfb9ee9b2966b0137	dthiessen	2017-10-30 10:03:09.174
554	20171031152414-server	61074e99d69582d40698c029a774b5e9	tneufeld	2017-10-31 08:24:14.924
555	20171031235709-server	c396202d8f56b12895a7675cd77be8ce	dthiessen	2017-10-31 16:57:09.361
556	20171101000845-server	4118f530d083ae7627fd0e4e66d62190	dthiessen	2017-10-31 17:08:45.799
557	20171101145407-server	4601229b6c52c811b13f2aab30d1ca90	dthiessen	2017-11-01 07:54:07.533
558	20171106154847-server	d50b6c4a03b07f512742af8bda015ba0	dthiessen	2017-11-06 08:48:47.658
559	20171106161820-server	859ca0d3a93cece6051cdcf7afe4a04b	edueck	2017-11-06 09:18:20.018
560	20171107173330-server	6e42c90f6d302a56d9de23d65a64e07d	edueck	2017-11-07 10:33:30.908
561	20171109153422-server	8b9601cdd97c50389818fc1d35dfd08c	edueck	2017-11-09 08:34:22.783
562	20171110232514-server	09cbe96bf5181c2c2f7e6a231607df3d	edueck	2017-11-10 16:25:14.815
563	20171113143822-server	69d928bd3da719bd4b6f40626396238c	tneufeld	2017-11-13 07:38:22.158
564	20171113231535-server	bdd3f0639b755acddedcf7cf97696181	edueck	2017-11-13 16:15:35.846
565	20171115215438-server	431e7a825b8b95b898bc039a31077c46	dthiessen	2017-11-15 14:54:38.752
566	20171116144505-server	3847da948152b0fcf5c387f50974b07a	tneufeld	2017-11-16 07:45:05.127
567	20171117155719-server	f696b5f8f48a527ef8f448d6e3352a50	edueck	2017-11-17 08:57:19.986
568	20171120153535-server	43482d69e5c4240db66ffa8f2e22c034	edueck	2017-11-20 08:35:35.861
569	20171121153559-server	f623b3028ae236f4a9206bcb4e85f8ba	dthiessen	2017-11-21 08:35:59.268
570	20171124151139-server	4334ee78d40dce249b4efe13a9d22e92	tneufeld	2017-11-24 08:11:39.752
571	20171127180709-server	ef3549bf914467a399178dc8d1e3c3c2	dthiessen	2017-11-27 11:07:09.423
572	20171128200202-server	be571696c3c62e689357c8c047cbcf2e	tneufeld	2017-11-28 13:02:02.767
573	20171128225706-server	83522cc6bb205c7cfb57d38d632b295d	admin	2017-11-28 15:57:06.33
574	20171130203859-server	745156cc92dde9d24c328d3a1a231334	edueck	2017-11-30 13:38:59.971
575	20171201165434-server	1000072cc996ddf749926b3e23965c26	dthiessen	2017-12-01 09:54:34.987
576	20171207152121-server	981b86f1abcc80e7fbc5272294af6625	tneufeld	2017-12-07 08:21:21.724
577	20171207172627-server	de2ffdc880653835fae16af6de23dea2	tneufeld	2017-12-07 10:26:27.052
578	20171214143803-server	e83129fe1b14858651337018008cfb98	jfehr	2017-12-14 07:38:03.364
579	20171219152318-server	1e8564a8572c20fac5d6ec753c594c55	edueck	2017-12-19 08:23:18.067
580	20171221153803-server	8a9e1167024193a8b6f2370ccb245993	edueck	2017-12-21 08:38:03.536
581	20171221223559-server	42bc0582d77d74dc3080df2bbe9f2d2b	jfehr	2017-12-21 15:35:59.911
614	20171221234623-server	51b26457fc13bb277823065e5ad3a018	edueck	2017-12-21 16:46:23.312
615	20171222215131-server	93169b89f34b1822358467295d9d58a8	edueck	2017-12-22 14:51:31.796
616	20171225144312-server	1a285fb62cf5de340abdaf93254fa2e5	jfehr	2017-12-25 07:43:12.608
617	20171228235841-server	678aeae98f63b7075cd9044f82500e18	edueck	2017-12-28 16:58:41.827
618	20171229201314-server	0f4be807bf2a351ef488daa6bfdae255	tneufeld	2017-12-29 13:13:14.936
619	20180108183556-server	f073e186c1a30aa13b2407792f17ac1a	tneufeld	2018-01-08 11:35:56.667
620	20180115165510-server	b0cd05f5cb2b020d29a6528bfbdab49c	tneufeld	2018-01-15 09:55:10.252
621	20180119180016-server	5023dda11c2e504ead4ed875d35a71be	tneufeld	2018-01-19 11:00:16.028
622	20180122212439-server	885f33187cabcda2873aa79f985aa0b4	tneufeld	2018-01-22 14:24:39.278
623	20180122212648-server	73ed17e2d063f0d2b52a1d54f001459c	tneufeld	2018-01-22 14:26:48.564
624	20180125180749-server	d0cc484bef334ff5cfcdcc5f36d34b1d	tneufeld	2018-01-25 11:07:49.833
625	20180126161005-server	94f71738974a6f404e26808b8af76101	tneufeld	2018-01-26 09:10:05.887
626	20180129142432-server	6105f115aeb108713b71f80cdb193242	jfehr	2018-01-29 07:24:32.194
627	20180209221011-server	84fd0d499f4ee6c22cd250d9662bc056	edueck	2018-02-09 15:10:11.406
628	20180212155952-server	ae77da7019ecb88504dc59e49628e238	tneufeld	2018-02-12 08:59:52.638
629	20180219180513-server	13c863e3720411c683b876af5743cd0a	tneufeld	2018-02-19 11:05:13.669
630	20180222143809-server	63be184534d6451fe63581248c72a20e	jfehr	2018-02-22 07:38:09.926
631	20180223220143-server	b906cf17aa312e405ed905c3aa4ab056	edueck	2018-02-23 15:01:43.748
632	20180227143137-server	736dce2136aa2dc229af6afdeefe947e	tneufeld	2018-02-27 07:31:37.182
633	20180227175030-server	f1864b2e164e18352f7584abbedaa030	tneufeld	2018-02-27 10:50:30.68
634	20180301143615-server	32f877913d5bc1ce7b0b5d014f5a10b6	jfehr	2018-03-01 07:36:15.571
635	20180305221956-server	d1dfec8437d1f7e2e14bf2f46fc4f417	tneufeld	2018-03-05 15:19:56.163
636	20180309182257-server	86f34e9469902178458c9932ba5aa9c7	jfehr	2018-03-09 11:22:57.366
637	20180309212920-server	d79cbd6934a630991727b4b1db4eb92a	edueck	2018-03-09 14:29:20.987
638	20180312165406-server	9661b4077076f7c54470efe05372dbda	edueck	2018-03-12 09:54:06.789
639	20180319165502-server	38b159a466d205d6ae55f84332ec76bb	edueck	2018-03-19 09:55:02.346
640	20180319202444-server	1e4d980b335fb825596d921f6e8fd570	jfehr	2018-03-19 13:24:44.895
641	20180322165250-server	7b4ebd3e408de5de311aa4227c8709b2	tneufeld	2018-03-22 09:52:50.535
642	20180323150304-server	298e9cc450eac85b382d036bc5dcc842	jfehr	2018-03-23 08:03:04.296
643	20180323153354-server	de4f4252a0ef684a2fb498838db34ce0	edueck	2018-03-23 08:33:54.937
644	20180324011146-server	7b21adba9672ad5a7a3c217ceadf3074	edueck	2018-03-23 18:11:46.968
645	20180326181157-server	c66ee7ead51175c03e642619e00d4933	tneufeld	2018-03-26 10:11:57.233
646	20180329174539-server	ac2f0aeecd0e01991964e156f6ad1d4c	tneufeld	2018-03-29 09:45:39.53
647	20180406170150-server	7514750ef2912a824cbcc2baba89381b	tneufeld	2018-04-06 09:01:50.764
648	20180410154445-server	6b6b43c91b9747541e21352ae2c39574	jfehr	2018-04-10 07:44:45.545
649	20180411181241-server	6548badcf25aaca87651ff87aeb94d08	edueck	2018-04-11 10:12:41.404
650	20180417002600-server	62b92b8bf61df0133f9b58ef2f4fd293	jfehr	2018-04-16 16:26:00.873
651	20180417170119-server	dc156be384e692e4d05c2f4644c07dd2	jfehr	2018-04-17 09:01:19.091
652	20180419185255-server	c41fe7b71b6df2cad4a786b9abbfc516	tneufeld	2018-04-19 10:52:55.716
653	20180420001020-server	3721a09d07b9a68bcc16e0e49ee08799	tneufeld	2018-04-19 16:10:20.42
654	20180420002012-server	68c99f8c4851f05af277fd1426bd474f	tneufeld	2018-04-19 16:20:12.123
655	20180420160410-server	3ee9ded8309255f37e118ecf69dec3ad	jfehr	2018-04-20 08:04:11
656	20180423162518-server	3a3a3976d223d0867feac005a23f527d	edueck	2018-04-23 08:25:18.343
657	20180423170658-server	5ed09f7aa0e721a957622aa8cd0ff3ff	tneufeld	2018-04-23 09:06:58.453
658	20180423175750-server	f3fb5e12edfb6e8482f1af8649f3f0f9	tneufeld	2018-04-23 09:57:50.375
659	20180604195722-cocoa	aac72c70a92ce4afe87b3ab387ff2b21	admin	2018-06-04 11:57:22.287
660	20181110202622-cocoa	7cea337a86217505e2da90a93d2cbbed	admin	2018-11-10 13:26:22.547
\.


--
-- TOC entry 2156 (class 0 OID 0)
-- Dependencies: 184
-- Name: login_log_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('login_log_log_id_seq', 660, true);


--
-- TOC entry 2119 (class 0 OID 36323)
-- Dependencies: 185
-- Data for Name: lot; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY lot (lot_id, flock_id, lot_del_date, lot_del_qty, lot_stay_home, lot_del_pm, lot_flock_age, lot_rec_by, lot_del_by, lot_receive_memo, lot_import_flock, lot_receive_user, lot_set_date, lot_sort_date, lot_saleable_qty, lot_reject_qty, lot_popper_qty, lot_sort_by, lot_sort_by2, lot_sort_memo, lot_sort_user, lot_pay_price, user_added, date_added, breed_id, lot_hatched_qty, lot_cockerel_qty, poultry_type_id) FROM stdin;
50654	1019	2015-10-29	11160	0	0	41	admin	Peter			\N	2015-10-29	2015-11-19	9241	113	\N	jquewell	admin		\N	\N	dthiessen	2015-10-29 09:06:08.714	1	9241	0	1
50748	1025	2015-10-26	11520	0	0	30	admin	Ship		523-3	\N	2015-10-26	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2015-12-15 17:08:47.14	4	\N	\N	1
50941	1017	2016-01-21	0	7380	0	59	dthiessen	ME			\N	2016-01-21	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-02-19 08:53:02.809	4	\N	\N	1
50815	1025	2015-11-23	11160	0	0	58	ereimer	Ship		507-1	\N	2015-11-23	2015-12-14	7667	144	\N	nreimer	alopez		\N	\N	dthiessen	2016-01-15 10:58:00.609	4	7667	0	1
50706	1017	2015-12-03	9000	0	0	52	admin	Jake			\N	2015-12-03	2015-12-24	8004	30	\N	jquewell	kochao		\N	\N	dthiessen	2015-12-03 08:12:16.182	4	8004	0	1
50720	1020	2015-12-07	13320	0	0	44	admin	Otto			\N	2015-12-07	2015-12-28	11088	90	\N	admin	agongora		\N	\N	dthiessen	2015-12-07 10:32:39.374	4	11088	0	1
50735	1017	2015-12-07	12060	0	0	52	rthiessen	Jake			\N	2015-12-07	2015-12-28	10621	59	\N	kochao	alopez		\N	\N	dthiessen	2015-12-10 14:34:31.98	4	10621	0	1
50721	1017	2015-12-10	5760	0	0	53	admin	Jake			\N	2015-12-10	2015-12-31	4981	63	\N	admin	kochao		\N	\N	dthiessen	2015-12-10 13:43:07.606	4	4981	0	1
50829	1025	2015-12-14	6840	0	0	36	ereimer	Ship		516-2	\N	2015-12-14	2016-01-04	5313	35	\N	admin	grodriguez		\N	\N	dthiessen	2016-01-15 11:23:00.062	4	5313	0	1
50751	1016	2015-12-21	8640	0	0	59	admin	TIm			\N	2015-12-21	2016-01-11	6033	110	\N	alopez	kochao		\N	\N	dthiessen	2015-12-21 09:03:16.046	4	6033	0	1
50752	1020	2015-12-21	16920	0	0	46	admin	Otto			\N	2015-12-21	2016-01-11	13805	146	\N	alopez	cmanzanero		\N	\N	dthiessen	2015-12-21 13:47:55.062	4	13805	0	1
50801	1017	2015-12-24	19620	0	0	55	admin	Jake			\N	2015-12-24	2016-01-14	16587	118	\N	jquewell	alopez		\N	\N	dthiessen	2016-01-15 08:35:11.89	4	16587	0	1
50766	1025	2015-12-28	6480	0	0	34	admin	Ship		400-2	\N	2015-12-28	2016-01-18	5450	55	\N	grodriguez	nrecinos		\N	\N	dthiessen	2015-12-29 15:04:35.187	4	5450	0	1
50780	1021	2016-01-07	27720	0	0	41	admin	Abe			\N	2016-01-07	2016-01-28	24064	103	\N	cmanzanero	nrecinos		\N	\N	dthiessen	2016-01-07 09:19:11.965	4	24064	0	1
50794	1016	2016-01-11	13500	0	0	62	admin	Jerry			\N	2016-01-11	2016-02-01	8293	234	\N	kochao	alopez		\N	\N	dthiessen	2016-01-11 10:22:52.265	4	8293	0	1
50857	1017	2016-01-18	9900	0	0	58	ereimer	Jake			\N	2016-01-18	2016-02-08	8190	92	\N	nreimer	nrecinos		\N	\N	ereimer	2016-01-18 09:29:56.421	4	8190	0	1
50945	1017	2016-01-28	0	7560	0	60	dthiessen	ME			\N	2016-01-28	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-02-19 09:12:03.384	4	\N	\N	1
50871	1017	2016-01-25	17820	0	0	59	ereimer	Jake			\N	2016-01-25	2016-02-15	14359	193	\N	wcabb	jquewell		\N	\N	ereimer	2016-01-25 10:08:23.171	4	14359	0	1
50885	1021	2016-02-01	21960	0	0	44	ereimer	Abe			\N	2016-02-01	2016-02-22	18932	118	\N	alopez	admin		\N	\N	ereimer	2016-02-01 10:17:26.218	4	18932	0	1
50899	1020	2016-02-04	23940	0	0	53	ereimer	Nelson			\N	2016-02-04	2016-02-25	18776	422	\N	grodriguez	admin		\N	\N	ereimer	2016-02-04 09:58:24.906	4	18776	0	1
50913	1025	2016-02-04	5400	0	0	27	ereimer	Ship		402-3	\N	2016-02-04	2016-02-25	4512	43	\N	wcabb	alopez		\N	\N	ereimer	2016-02-04 17:37:34.734	4	4512	0	1
50967	1025	2016-02-11	4320	0	0	62	ereimer	Ship		406-1	\N	2016-02-11	2016-03-03	2514	24	\N	kochao	cmanzanero		\N	\N	ereimer	2016-02-19 15:03:59.279	4	2514	0	1
50927	1016	2016-02-15	540	0	0	67	ereimer	Abram			\N	2016-02-15	2016-03-07	306	13	\N	gcano	0		\N	\N	ereimer	2016-02-15 08:41:07.782	4	306	0	1
50982	1025	2016-02-18	6480	0	0	28	ereimer	Ship		507-2	\N	2016-02-18	2016-03-10	5417	47	\N	alopez	gcano		\N	\N	ereimer	2016-02-19 15:27:20.284	4	5417	0	1
50995	1025	2016-02-25	6840	0	0	40	ereimer	Ship		400-4	\N	2016-02-25	2016-03-17	5849	62	\N	wcabb	alopez		\N	\N	ereimer	2016-02-25 19:52:31.481	4	5849	0	1
51006	1028	2016-02-29	14760	0	0	34	ereimer	Tina			\N	2016-02-29	2016-03-21	12909	63	\N	kochao	agongora		\N	\N	ereimer	2016-02-29 11:20:48.132	2	12909	0	1
51019	1025	2016-03-03	7200	0	0	41	ereimer	Ship		523-5	\N	2016-03-03	2016-03-24	5521	50	\N	wcabb	alopez		\N	\N	ereimer	2016-03-10 09:16:50.649	4	5521	0	1
51031	1026	2016-03-10	5580	0	0	82	ereimer	Jake			\N	2016-03-10	2016-03-31	1508	0	\N	admin	0		\N	\N	ereimer	2016-03-10 14:27:02.459	6	2972	1464	2
51041	1025	2016-03-17	9000	0	0	50	ereimer	Ship		523-3	\N	2016-03-17	2016-04-07	6570	58	\N	zalegria	kochao		\N	\N	ereimer	2016-03-15 16:24:32.867	4	6570	0	1
51054	1020	2016-03-21	14580	0	0	59	ereimer	Otto			\N	2016-03-21	2016-04-11	11836	295	\N	jquewell	kochao		\N	\N	ereimer	2016-03-21 09:07:14.864	4	11836	0	1
51067	1025	2016-03-24	4680	0	0	40	ereimer	Ship		400-5	\N	2016-03-24	2016-04-14	4155	39	\N	zalegria	kochao		\N	\N	ereimer	2016-03-22 14:25:37.517	4	4155	0	1
51227	1036	2016-04-25	18000	0	0	37	admin	flight		TM	\N	2016-04-25	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-05-13 13:19:26.562	5	\N	\N	2
50843	1025	2016-01-11	5040	0	0	61	ereimer	Ship		521-1	\N	2016-01-11	2016-02-01	2959	90	\N	grodriguez	zalegria	fixed 2922	\N	\N	dthiessen	2016-01-15 13:29:25.281	4	2959	0	1
51158	1025	2016-04-21	8280	0	0	55	ereimer	Ship		523-3	\N	2016-04-21	2016-05-12	5278	95	\N	cmanzanero	kochao		\N	\N	ereimer	2016-04-22 10:33:20.919	4	5278	0	1
51084	1021	2016-03-31	10080	0	0	53	dthiessen	Abe			\N	2016-03-31	2016-04-21	8673	84	\N	agongora	nreimer		\N	\N	dthiessen	2016-03-31 13:36:10.312	4	8673	0	1
51097	1029	2016-04-04	15480	0	0	35	dthiessen	Richard			\N	2016-04-04	2016-04-25	13752	81	\N	agongora	zalegria		\N	\N	dthiessen	2016-04-04 09:14:08.312	2	13752	0	1
51114	1025	2016-04-07	5760	0	0	51	dthiessen	ship		401-3	\N	2016-04-07	2016-04-28	4750	30	\N	jquewell	agongora		\N	\N	dthiessen	2016-04-05 08:56:14.062	4	4750	0	1
51132	1028	2016-04-14	2160	0	0	41	ereimer	Anton			\N	2016-04-14	2016-05-05	1885	52	\N	nreimer	jquewell		\N	\N	ereimer	2016-04-14 08:20:22.828	2	1885	0	1
51145	1025	2016-04-14	7560	0	0	43	ereimer	Ship	fixed 5040	523-7	\N	2016-04-14	2016-05-05	6267	112	\N	jquewell	nreimer		\N	\N	ereimer	2016-04-14 16:24:03.62	4	6267	0	1
51214	1036	2016-01-28	18000	0	0	31	dthiessen	ship	fix 1800	MX	\N	2016-01-28	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-05-13 11:15:22.078	5	\N	\N	2
51171	1028	2016-04-25	13500	0	0	42	ereimer	Tina			\N	2016-04-25	2016-05-16	11794	32	\N	nreimer	kochao		\N	\N	ereimer	2016-04-25 10:09:47.529	2	11794	0	1
51184	1029	2016-05-02	23580	0	0	39	ereimer	Vangie			\N	2016-05-02	2016-05-23	20850	118	\N	nreimer	ealergria		\N	\N	ereimer	2016-05-02 10:42:33.013	2	20850	0	1
51199	1025	2016-05-05	11160	0	0	56	ereimer	Ship		401-1	\N	2016-05-05	2016-05-26	9092	136	\N	jquewell	kochao		\N	\N	ereimer	2016-05-10 10:42:14.671	4	9092	0	1
51248	1025	2016-05-19	10800	0	0	38	ereimer	Ship		402-1	\N	2016-05-19	2016-06-09	9602	50	\N	wcabb	admin		\N	\N	ereimer	2016-05-20 13:35:25.39	4	9602	0	1
51265	1025	2016-05-26	4680	0	0	64	ereimer	Ship		405-1	\N	2016-05-26	2016-06-16	3315	80	\N	wcabb	jquewell		\N	\N	ereimer	2016-05-27 16:05:52.765	4	3315	0	1
51282	1032	2016-05-30	5400	0	0	26	dthiessen	Edward			\N	2016-05-30	2016-06-20	4525	0	\N	grodriguez	ealergria		\N	\N	rthiessen	2016-05-31 14:16:43	7	4525	0	1
51284	1020	2016-06-02	720	0	0	69	dthiessen	Richard	fix 2016-05-30		\N	2016-06-02	2016-06-23	439	11	\N	grodriguez	ealergria		\N	\N	dthiessen	2016-06-02 07:54:38.812	4	439	0	1
51290	1031	2016-06-02	5580	0	0	31	dthiessen	Timmy			\N	2016-06-02	2016-06-23	4635	3	\N	admin	kochao		\N	\N	dthiessen	2016-06-02 10:28:42.907	7	4635	0	1
51303	1025	2016-06-02	3600	0	0	33	ereimer	Ship		403-1	\N	2016-06-02	2016-06-23	3027	14	\N	wcabb	0		\N	\N	ereimer	2016-06-06 14:39:18.985	4	3027	0	1
51328	1032	2016-06-13	8640	0	0	28	ereimer	Edward			\N	2016-06-13	2016-07-04	7261	10	\N	grodriguez	dmenendez		\N	\N	ereimer	2016-06-13 09:12:05.828	7	7261	0	1
51339	1025	2016-06-16	5760	0	0	63	ereimer	Ship		518-2	\N	2016-06-16	2016-07-07	4053	80	\N	dmenendez	admin		\N	\N	ereimer	2016-06-17 14:40:14.849	4	4053	0	1
51373	1033	2016-06-27	16380	0	0	28	ereimer	Paul			\N	2016-06-27	2016-07-18	14276	60	\N	jquewell	admin		\N	\N	ereimer	2016-06-27 08:45:43.703	7	14276	0	1
50656	1021	2015-10-29	32040	0	0	31	admin	Abe			\N	2015-10-29	2015-11-19	26680	110	\N	gcano	kochao		\N	\N	dthiessen	2015-10-29 09:52:57.448	1	26680	0	1
50816	1025	2015-11-23	10800	0	0	58	ereimer	Ship		507-2	\N	2015-11-23	2015-12-14	7808	205	\N	wcabb	alopez		\N	\N	dthiessen	2016-01-15 10:58:31.671	4	7808	0	1
50951	1019	2016-02-04	0	4140	0	55	dthiessen	ME			\N	2016-02-04	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-02-19 09:20:40.194	4	\N	\N	1
50707	1021	2015-12-03	13320	0	0	36	admin	Betty			\N	2015-12-03	2015-12-24	10920	74	\N	admin	grodriguez		\N	\N	dthiessen	2015-12-03 08:46:32.197	4	10920	0	1
50736	1019	2015-12-07	6120	0	0	46	rthiessen	Allan			\N	2015-12-07	2015-12-28	5093	69	\N	jquewell	admin		\N	\N	dthiessen	2015-12-10 14:34:51.548	4	5093	0	1
50722	1021	2015-12-10	9000	0	0	37	admin	Abe			\N	2015-12-10	2015-12-31	8212	27	\N	grodriguez	admin		\N	\N	dthiessen	2015-12-10 13:43:34.372	4	8212	0	1
50830	1025	2015-12-14	9000	0	0	29	ereimer	Ship		523-5	\N	2015-12-14	2016-01-04	3847	40	\N	nreimer	kochao		\N	\N	dthiessen	2016-01-15 11:23:38.546	4	3847	0	1
50749	1021	2015-12-17	25920	0	0	38	admin	Abe			\N	2015-12-17	2016-01-07	22224	205	\N	nreimer	alopez		\N	\N	dthiessen	2015-12-17 07:34:38.418	4	22224	0	1
50753	1020	2015-12-21	3420	0	3420	46	admin	Otto			\N	2015-12-21	2016-01-11	2790	29	\N	cmanzanero	alopez		\N	\N	dthiessen	2015-12-21 13:48:18.328	4	2790	0	1
50802	1019	2015-12-24	10080	0	0	49	admin	Allen			\N	2015-12-24	2016-01-14	8048	133	\N	nreimer	cmanzanero		\N	\N	dthiessen	2016-01-15 08:36:59.031	4	8048	0	1
50767	1025	2015-12-28	9000	0	0	28	admin	Ship		400-5	\N	2015-12-28	2016-01-18	7177	87	\N	zalegria	kochao		\N	\N	dthiessen	2015-12-29 15:04:57.906	4	7177	0	1
50781	1025	2016-01-04	5040	0	0	59	admin	Ship		#403-1	\N	2016-01-04	2016-01-25	4085	43	\N	nrecinos	nreimer		\N	\N	dthiessen	2016-01-07 10:43:40.809	4	4085	0	1
50795	1020	2016-01-11	28440	0	0	49	admin	Otto			\N	2016-01-11	2016-02-01	22417	251	\N	grodriguez	nrecinos		\N	\N	dthiessen	2016-01-11 11:00:52.359	4	22417	0	1
50844	1025	2016-01-11	11880	0	0	51	ereimer	Ship		527-1	\N	2016-01-11	2016-02-01	8243	82	\N	nreimer	cmanzanero		\N	\N	dthiessen	2016-01-15 13:29:48.203	4	8243	0	1
50858	1016	2016-01-18	12780	0	0	63	ereimer	Jerry			\N	2016-01-18	2016-02-08	8426	116	\N	agongora	gcano		\N	\N	ereimer	2016-01-18 09:49:05.375	4	8426	0	1
50942	1019	2016-01-21	0	4320	0	53	dthiessen	ME			\N	2016-01-21	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-02-19 08:53:37.377	4	\N	\N	1
50946	1019	2016-01-28	0	4320	0	54	dthiessen	ME			\N	2016-01-28	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-02-19 09:12:45.521	4	\N	\N	1
50872	1021	2016-01-25	2880	0	2880	43	ereimer	Laine			\N	2016-01-25	2016-02-15	2523	14	\N	wcabb	alopez		\N	\N	ereimer	2016-01-25 14:31:01.968	4	2523	0	1
50900	1025	2016-01-28	13320	0	0	41	ereimer	Ship		401-3	\N	2016-01-28	2016-02-18	11854	80	\N	nreimer	cmanzanero		\N	\N	ereimer	2016-02-04 13:29:34.171	4	11854	0	1
50968	1025	2016-02-11	4320	0	0	62	ereimer	Ship		406-2	\N	2016-02-11	2016-03-03	1741	84	\N	jquewell	admin		\N	\N	ereimer	2016-02-19 15:07:19.998	4	1741	0	1
50928	1017	2016-02-15	16560	0	0	62	ereimer	Helena			\N	2016-02-15	2016-03-07	11599	510	\N	zalegria	cmanzanero		\N	\N	ereimer	2016-02-15 09:16:26.993	4	11599	0	1
50983	1026	2016-02-22	5940	0	0	79	admin	jake			\N	2016-02-22	2016-03-14	1649	0	\N	nreimer	agongora		\N	\N	dthiessen	2016-02-22 07:32:39.827	6	3416	1767	2
50996	1025	2016-02-25	8280	0	0	39	ereimer	Ship		407-1	\N	2016-02-25	2016-03-17	6052	194	\N	jquewell	zalegria		\N	\N	ereimer	2016-02-25 19:52:49.625	4	6052	0	1
51007	1026	2016-03-03	4320	0	0	81	admin	Jake			\N	2016-03-03	2016-03-24	1363	0	\N	wcabb	0		\N	\N	dthiessen	2016-03-03 09:06:21.481	6	2702	1339	2
51020	1025	2016-03-03	6480	0	0	40	ereimer	Ship		400-3	\N	2016-03-03	2016-03-24	5388	30	\N	jquewell	nreimer		\N	\N	ereimer	2016-03-10 09:17:17.699	4	5388	0	1
51032	1020	2016-03-10	25560	0	0	58	admin	Nelson			\N	2016-03-10	2016-03-31	19722	322	\N	jquewell	zalegria		\N	\N	dthiessen	2016-03-11 13:36:57.731	4	19722	0	1
51042	1025	2016-03-17	9720	0	0	43	ereimer	Ship		523-5	\N	2016-03-17	2016-04-07	8509	73	\N	jquewell	alopez		\N	\N	ereimer	2016-03-15 16:24:56.547	4	8509	0	1
51055	1028	2016-03-21	10980	0	0	37	ereimer	Anton			\N	2016-03-21	2016-04-11	9898	57	\N	grodriguez	0		\N	\N	ereimer	2016-03-21 09:23:47.97	2	9898	0	1
51068	1025	2016-03-24	4680	0	0	40	ereimer	Ship		400-6	\N	2016-03-24	2016-04-14	3931	73	\N	zalegria	kochao		\N	\N	ereimer	2016-03-22 14:25:58.985	4	3931	0	1
51085	1021	2016-03-31	2340	0	2340	53	dthiessen	Abe			\N	2016-03-31	2016-04-21	2013	20	\N	agongora	nreimer		\N	\N	dthiessen	2016-03-31 13:36:40.687	4	2013	0	1
50886	1025	2016-01-21	10800	0	0	55	ereimer	Ship	fixed date	526-1	\N	2016-01-21	2016-02-11	7756	49	\N	grodriguez	admin		\N	\N	ereimer	2016-02-04 08:01:02.828	4	7756	0	1
51098	1017	2016-04-04	3780	0	0	69	admin	Galen			\N	2016-04-04	2016-04-25	2695	92	\N	grodriguez	admin		\N	\N	dthiessen	2016-04-04 09:41:02.593	4	2695	0	1
51133	1029	2016-04-14	5040	0	0	37	ereimer	Richard			\N	2016-04-14	2016-05-05	4572	23	\N	cmanzanero	zalegria		\N	\N	ereimer	2016-04-14 08:35:16.14	2	4572	0	1
51146	1025	2016-04-14	12240	0	0	40	ereimer	Ship		529-1	\N	2016-04-14	2016-05-05	9960	196	\N	grodriguez	kochao		\N	\N	ereimer	2016-04-14 16:24:21.651	4	9960	0	1
51215	1036	2016-02-11	18000	0	0	62	dthiessen	ship		354?	\N	2016-02-11	2016-03-03	4640	0	\N	admin	0		\N	\N	dthiessen	2016-05-13 11:36:54.359	5	9275	4635	2
51159	1025	2016-04-21	5760	0	0	54	ereimer	Ship		401-1	\N	2016-04-21	2016-05-12	4714	67	\N	grodriguez	agongora		\N	\N	ereimer	2016-04-22 10:33:39.794	4	4714	0	1
51172	1029	2016-04-25	34200	0	0	38	ereimer	Richard			\N	2016-04-25	2016-05-16	29475	207	\N	grodriguez	ealergria		\N	\N	ereimer	2016-04-25 11:05:14.466	2	29475	0	1
51185	1030	2016-05-02	23040	0	0	29	ereimer	Joe			\N	2016-05-02	2016-05-23	19527	77	\N	grodriguez	jquewell		\N	\N	ereimer	2016-05-02 10:53:00.748	7	19527	0	1
51200	1025	2016-05-05	10440	0	0	55	ereimer	Ship		401-4	\N	2016-05-05	2016-05-26	8327	85	\N	grodriguez	cmanzanero		\N	\N	ereimer	2016-05-10 10:42:51.265	4	8327	0	1
51291	1036	2016-06-02	18000	0	0	48	dthiessen	ship		GM	\N	2016-06-02	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-06-02 10:31:34.375	5	\N	\N	2
51228	1025	2016-05-12	3960	0	0	53	ereimer	Ship		400-1	\N	2016-05-12	2016-06-02	3263	81	\N	wcabb	nreimer		\N	\N	ereimer	2016-05-13 14:55:44.046	4	3263	0	1
51249	1025	2016-05-19	15480	0	0	38	ereimer	Ship		402-2	\N	2016-05-19	2016-06-09	13169	62	\N	wcabb	admin		\N	\N	ereimer	2016-05-20 13:36:10.388	4	13169	0	1
51266	1025	2016-05-26	4680	0	0	64	ereimer	Ship		405-2	\N	2016-05-26	2016-06-16	3249	131	\N	wcabb	nreimer		\N	\N	ereimer	2016-05-27 16:06:20.125	4	3249	0	1
51283	1029	2016-06-02	9000	0	0	43	dthiessen	Richard	fix 2016-05-30		\N	2016-06-02	2016-06-23	7444	128	\N	kochao	admin		\N	\N	dthiessen	2016-06-02 07:52:51.234	2	7444	0	1
51304	1025	2016-06-02	3960	0	0	33	ereimer	Ship		403-2	\N	2016-06-02	2016-06-23	3035	26	\N	wcabb	alopez		\N	\N	ereimer	2016-06-06 14:39:38.782	4	3035	0	1
51296	1032	2016-06-06	7200	0	0	27	ereimer	Edward			\N	2016-06-06	2016-06-27	5912	54	\N	nreimer	kochao		\N	\N	ereimer	2016-06-06 09:37:31	7	5912	0	1
51316	1025	2016-06-09	4680	0	0	61	ereimer	Ship		401-1	\N	2016-06-09	2016-06-30	3656	80	\N	nreimer	kochao		\N	\N	ereimer	2016-06-10 14:37:32.515	4	3656	0	1
51317	1025	2016-06-09	4320	0	0	61	ereimer	Ship		401-2	\N	2016-06-09	2016-06-30	3313	61	\N	nreimer	kochao		\N	\N	ereimer	2016-06-10 14:39:11.765	4	3313	0	1
51340	1025	2016-06-16	2520	0	0	62	ereimer	Ship		401-1	\N	2016-06-16	2016-07-07	1896	25	\N	dmenendez	admin		\N	\N	ereimer	2016-06-17 14:40:40.302	4	1896	0	1
51374	1029	2016-06-27	21240	0	0	47	ereimer	Richard			\N	2016-06-27	2016-07-18	17640	251	\N	grodriguez	ealergria		\N	\N	ereimer	2016-06-27 09:48:54.875	2	17640	0	1
51391	1030	2016-07-04	14400	0	0	38	ereimer	William			\N	2016-07-04	2016-07-25	11335	108	\N	grodriguez	jquewell		\N	\N	ereimer	2016-07-04 08:04:02.207	7	11335	0	1
51405	1030	2016-07-07	2520	0	2520	39	ereimer	William			\N	2016-07-07	2016-07-28	2090	9	\N	ealergria	admin		\N	\N	ereimer	2016-07-07 13:30:57.753	7	2090	0	1
50660	1014	2015-11-02	9360	0	0	61	admin	Charlie			\N	2015-11-02	2015-11-23	6032	153	\N	gcano	zalegria		\N	\N	dthiessen	2015-11-02 08:09:38.682	1	6032	0	1
50817	1025	2015-11-23	1800	0	0	53	ereimer	Ship		502-1	\N	2015-11-23	2015-12-14	1479	22	\N	kochao	cmanzanero		\N	\N	dthiessen	2016-01-15 10:59:03.75	4	1479	0	1
50708	1019	2015-12-03	4320	0	0	46	admin	Peter			\N	2015-12-03	2015-12-24	3336	36	\N	jquewell	kochao		\N	\N	dthiessen	2015-12-03 09:19:52.979	4	3336	0	1
50737	1021	2015-12-07	18540	0	0	36	rthiessen	Abe			\N	2015-12-07	2015-12-28	16809	48	\N	cmanzanero	alopez		\N	\N	dthiessen	2015-12-10 14:35:39.781	4	16809	0	1
50723	1020	2015-12-10	12600	0	0	45	admin	Otto			\N	2015-12-10	2015-12-31	10056	124	\N	wcabb	cmanzanero		\N	\N	dthiessen	2015-12-10 13:43:56.403	4	10056	0	1
50750	1016	2015-12-17	7020	0	0	59	admin	Abram			\N	2015-12-17	2016-01-07	5166	90	\N	agongora	alopez		\N	\N	dthiessen	2015-12-17 09:23:49.083	4	5166	0	1
50831	1017	2015-12-17	17460	0	0	54	ereimer	Jake			\N	2015-12-17	2016-01-07	14933	65	\N	admin	grodriguez		\N	\N	dthiessen	2016-01-15 11:26:10.015	4	14933	0	1
50754	1016	2015-12-21	1620	0	1620	59	admin	Tim			\N	2015-12-21	2016-01-11	1131	21	\N	alopez	kochao		\N	\N	dthiessen	2015-12-21 14:04:00.406	4	1131	0	1
50803	1021	2015-12-24	27540	0	0	39	admin	Abe			\N	2015-12-24	2016-01-14	23910	93	\N	grodriguez	admin		\N	\N	dthiessen	2016-01-15 08:37:22.546	4	23910	0	1
50768	1025	2015-12-28	9000	0	0	28	admin	Ship		400-6	\N	2015-12-28	2016-01-18	7007	63	\N	jquewell	nreimer		\N	\N	dthiessen	2015-12-29 15:05:31.14	4	7007	0	1
50782	1025	2016-01-04	5040	0	0	59	admin	Ship		403-2	\N	2016-01-04	2016-01-25	4127	24	\N	grodriguez	gcano		\N	\N	dthiessen	2016-01-07 10:44:13.606	4	4127	0	1
50845	1025	2016-01-11	9000	0	0	48	ereimer	Ship		523-1	\N	2016-01-11	2016-02-01	6834	88	\N	grodriguez	zalegria		\N	\N	dthiessen	2016-01-15 13:30:14.312	4	6834	0	1
50796	1019	2016-01-14	9720	0	0	52	admin	Allen			\N	2016-01-14	2016-02-04	7591	74	\N	nreimer	zalegria		\N	\N	dthiessen	2016-01-14 08:23:52.921	4	7591	0	1
50859	1021	2016-01-18	15480	0	0	42	ereimer	Abe			\N	2016-01-18	2016-02-08	13619	66	\N	nreimer	nrecinos		\N	\N	ereimer	2016-01-18 10:21:20.953	4	13619	0	1
50943	1021	2016-01-21	0	11520	0	43	dthiessen	ME			\N	2016-01-21	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-02-19 08:54:19.888	4	\N	\N	1
50947	1021	2016-01-28	0	11520	0	44	dthiessen	ME			\N	2016-01-28	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-02-19 09:13:13.52	4	\N	\N	1
50873	1017	2016-01-25	2340	0	2340	59	ereimer	Marlyn			\N	2016-01-25	2016-02-15	1885	25	\N	wcabb	jquewell		\N	\N	ereimer	2016-01-25 14:33:46.171	4	1885	0	1
50901	1025	2016-01-28	12960	0	0	41	ereimer	Ship		401-4	\N	2016-01-28	2016-02-18	11131	245	\N	zalegria	kochao		\N	\N	ereimer	2016-02-04 13:30:05.093	4	11131	0	1
50915	1019	2016-02-08	8820	0	0	55	ereimer	Allen			\N	2016-02-08	2016-02-29	6634	243	\N	nreimer	agongora		\N	\N		2016-02-08 09:16:31.464	4	6634	0	1
50969	1025	2016-02-11	11880	0	0	37	ereimer	Ship		407-1	\N	2016-02-11	2016-03-03	10224	82	\N	alopez	wcabb		\N	\N	ereimer	2016-02-19 15:07:59.394	4	10224	0	1
50926	1021	2016-02-15	23760	0	0	46	ereimer	Abe			\N	2016-02-15	2016-03-07	19490	342	\N	admin	0		\N	\N	ereimer	2016-02-15 08:37:51.039	4	19490	0	1
50929	1029	2016-02-15	31320	0	0	28	ereimer	Richard			\N	2016-02-15	2016-03-07	26434	188	\N	jquewell	admin		\N	\N	ereimer	2016-02-15 10:21:54.278	2	26434	0	1
50984	1019	2016-02-22	8820	0	0	57	ereimer	Allen			\N	2016-02-22	2016-03-14	7011	176	\N	jguenther	admin		\N	\N	dthiessen	2016-02-22 08:34:38.26	4	7011	0	1
50997	1025	2016-02-25	7920	0	0	39	ereimer	Ship		407-2	\N	2016-02-25	2016-03-17	6298	77	\N	wcabb	alopez		\N	\N	ereimer	2016-02-25 19:53:09.138	4	6298	0	1
51021	1025	2016-03-03	6480	0	0	40	ereimer	Ship		400-4	\N	2016-03-03	2016-03-24	5812	14	\N	alopez	dyoung		\N	\N	ereimer	2016-03-10 09:17:41.41	4	5812	0	1
51043	1025	2016-03-17	2880	0	0	39	ereimer	Ship		530-1	\N	2016-03-17	2016-04-07	2465	31	\N	jquewell	alopez		\N	\N	ereimer	2016-03-15 16:25:13.204	4	2465	0	1
51056	1017	2016-03-21	12420	0	0	67	ereimer	Lenda			\N	2016-03-21	2016-04-11	8972	255	\N	grodriguez	kochao		\N	\N	ereimer	2016-03-21 10:35:21.558	4	8972	0	1
51069	1025	2016-03-24	2520	0	0	28	ereimer	Ship		501	\N	2016-03-24	2016-04-14	2069	7	\N	wcabb	0		\N	\N	ereimer	2016-03-22 14:26:18.092	4	2069	0	1
51008	1020	2016-03-03	26280	0	0	57	admin	Otto	fixed 13320		\N	2016-03-03	2016-03-24	19995	599	\N	jquewell	admin		\N	\N	dthiessen	2016-03-04 08:53:33.323	4	19995	0	1
51086	1019	2016-03-31	3600	0	0	63	dthiessen	Allam			\N	2016-03-31	2016-04-21	2885	88	\N	cmanzanero	zalegria		\N	\N	dthiessen	2016-03-31 13:44:51.14	4	2885	0	1
50887	1025	2016-01-21	11160	0	0	55	ereimer	Ship	fixed date	526-2	\N	2016-01-21	2016-02-11	7301	193	\N	zalegria	0		\N	\N	ereimer	2016-02-04 08:01:34.859	4	7301	0	1
51099	1028	2016-04-04	7200	0	0	39	admin	Anton			\N	2016-04-04	2016-04-25	6092	54	\N	grodriguez	admin		\N	\N	dthiessen	2016-04-04 10:12:53.562	2	6092	0	1
51116	1025	2016-04-07	5760	0	0	51	dthiessen	ship		401-4	\N	2016-04-07	2016-04-28	4819	25	\N	cmanzanero	kochao		\N	\N	dthiessen	2016-04-05 08:57:46.25	4	4819	0	1
51134	1021	2016-04-14	3240	0	0	55	ereimer	Abe			\N	2016-04-14	2016-05-05	2584	87	\N	nreimer	jquewell		\N	\N	ereimer	2016-04-14 08:40:40.937	4	2584	0	1
51147	1025	2016-04-14	12240	0	0	38	ereimer	Ship		519-1	\N	2016-04-14	2016-05-05	10656	11	\N	wcabb	alopez		\N	\N	ereimer	2016-04-14 16:24:39.198	4	10656	0	1
51216	1036	2016-02-25	16200	0	0	35	admin	ship		GM	\N	2016-02-25	2016-03-17	6378	0	\N	admin	0		\N	\N	dthiessen	2016-05-13 13:04:22.968	5	12468	6090	2
51160	1025	2016-04-21	5760	0	0	54	ereimer	Ship		401-2	\N	2016-04-21	2016-05-12	4606	59	\N	wcabb	alopez		\N	\N	ereimer	2016-04-22 10:34:00.185	4	4606	0	1
51250	1025	2016-05-19	14760	0	0	36	ereimer	Ship		521-1	\N	2016-05-19	2016-06-09	11378	59	\N	cmanzanero	admin		\N	\N	ereimer	2016-05-20 13:36:31.031	4	11378	0	1
51173	1020	2016-04-25	24660	0	0	64	ereimer	Otto	fix 24480		\N	2016-04-25	2016-05-16	16498	483	\N	grodriguez	jquewell		\N	\N	ereimer	2016-04-25 11:35:01.669	4	16498	0	1
51186	1030	2016-05-05	9360	0	0	30	dthiessen	worker			\N	2016-05-05	2016-05-26	7691	22	\N	grodriguez	cmanzanero		\N	\N	dthiessen	2016-05-05 07:34:12.123	7	7691	0	1
51201	1025	2016-05-05	2880	0	0	49	ereimer	Ship		407-2	\N	2016-05-05	2016-05-26	2359	22	\N	grodriguez	cmanzanero		\N	\N	ereimer	2016-05-10 10:43:37.765	4	2359	0	1
51229	1025	2016-05-12	4680	0	0	33	ereimer	Ship		403-3	\N	2016-05-12	2016-06-02	3934	30	\N	kochao	ealergria		\N	\N	ereimer	2016-05-13 14:56:32.312	4	3934	0	1
51267	1025	2016-05-26	7200	0	0	56	ereimer	Ship		517-1	\N	2016-05-26	2016-06-16	4193	113	\N	cmanzanero	zalegria		\N	\N	ereimer	2016-05-27 16:06:42.703	4	4193	0	1
51305	1025	2016-06-02	1080	0	0	30	ereimer	Ship		403-5	\N	2016-06-02	2016-06-23	805	6	\N	grodriguez	ealergria		\N	\N	ereimer	2016-06-06 14:40:09	4	805	0	1
51292	1030	2016-06-06	18000	0	0	34	ereimer	Worker			\N	2016-06-06	2016-06-27	14906	133	\N	zalegria	dmenendez		\N	\N	ereimer	2016-06-06 08:05:06.954	7	14906	0	1
51318	1025	2016-06-09	6480	0	0	58	ereimer	Ship		517-1	\N	2016-06-09	2016-06-30	3032	70	\N	nreimer	kochao		\N	\N	ereimer	2016-06-10 14:39:31.406	4	3032	0	1
51324	1025	2016-06-09	11520	0	0	39	ereimer	Ship		521-2	\N	2016-06-09	2016-06-30	9643	43	\N	grodriguez	ealergria		\N	\N	ereimer	2016-06-10 14:41:36.218	4	9643	0	1
51341	1025	2016-06-16	2520	0	0	62	ereimer	Ship		401-2	\N	2016-06-16	2016-07-07	1846	40	\N	dmenendez	admin		\N	\N	ereimer	2016-06-17 14:41:07.224	4	1846	0	1
51362	1025	2016-06-23	5040	0	0	63	ereimer	Ship		401-2	\N	2016-06-23	2016-07-14	3745	47	\N	grodriguez	ealergria		\N	\N	ereimer	2016-06-24 13:21:39.921	4	3745	0	1
51375	1032	2016-06-27	9360	0	0	30	ereimer	Edward			\N	2016-06-27	2016-07-18	7852	88	\N	grodriguez	ealergria		\N	\N	ereimer	2016-06-27 09:56:39.062	7	7852	0	1
51399	1030	2016-07-07	10800	0	0	39	ereimer	William			\N	2016-07-07	2016-07-28	8958	41	\N	ealergria	admin		\N	\N	ereimer	2016-07-07 08:20:19.675	7	8958	0	1
50663	1016	2015-11-02	19080	0	0	52	admin	Abram			\N	2015-11-02	2015-11-23	14528	267	\N	kochao	alopez		\N	\N	dthiessen	2015-11-02 10:53:27.088	1	14528	0	1
50804	1025	2015-11-09	1800	0	0	42	ereimer	Ship		527-2	\N	2015-11-09	2015-11-30	1248	14	\N	admin	cmanzanero		\N	\N	dthiessen	2016-01-15 10:37:15.906	4	1248	0	1
50818	1025	2015-11-23	11160	0	0	53	ereimer	Ship		502-2	\N	2015-11-23	2015-12-14	8862	138	\N	admin	grodriguez		\N	\N	dthiessen	2016-01-15 10:59:53.39	4	8862	0	1
50709	1014	2015-12-03	5040	0	0	66	admin	Worker			\N	2015-12-03	2015-12-24	3044	99	\N	gcano	cmanzanero		\N	\N	dthiessen	2015-12-03 09:28:54.385	4	3044	0	1
50724	1016	2015-12-10	6840	0	0	58	admin	Abram			\N	2015-12-10	2015-12-31	5080	93	\N	admin	alopez		\N	\N	dthiessen	2015-12-10 13:44:19.29	4	5080	0	1
50738	1017	2015-12-10	2700	0	2700	53	admin	Jake			\N	2015-12-10	2015-12-31	2335	30	\N	admin	kochao		\N	\N	dthiessen	2015-12-10 14:44:48.859	4	2335	0	1
50832	1019	2015-12-17	9180	0	0	48	ereimer	Allen			\N	2015-12-17	2016-01-07	7753	25	\N	admin	grodriguez		\N	\N	dthiessen	2016-01-15 11:26:30.953	4	7753	0	1
50755	1026	2015-12-21	8640	720	0	70	admin	Jake			\N	2015-12-21	2016-01-11	2888	0	\N	wcabb	admin		\N	\N	dthiessen	2015-12-21 14:06:53.375	6	5935	3047	2
50769	1025	2015-12-28	7920	0	0	28	admin	Ship		523-7	\N	2015-12-28	2016-01-18	6193	27	\N	grodriguez	nrecinos		\N	\N	dthiessen	2015-12-29 15:05:58.531	4	6193	0	1
50783	1025	2016-01-04	4680	0	0	57	admin	Ship		406-1	\N	2016-01-04	2016-01-25	3319	53	\N	cmanzanero	alopez		\N	\N	dthiessen	2016-01-07 10:44:40.997	4	3319	0	1
50846	1025	2016-01-11	9000	0	0	41	ereimer	Ship		523-3	\N	2016-01-11	2016-02-01	7625	51	\N	kochao	agongora		\N	\N	dthiessen	2016-01-15 13:30:41.453	4	7625	0	1
50797	1026	2016-01-14	7560	2880	0	74	admin	Galen			\N	2016-01-14	2016-02-04	2525	11	\N	admin	0		\N	\N	dthiessen	2016-01-14 09:05:16.937	6	4851	2326	2
50860	1020	2016-01-18	27720	0	0	50	ereimer	Richard			\N	2016-01-18	2016-02-08	22377	239	\N	nreimer	nrecinos		\N	\N	ereimer	2016-01-18 11:16:50.312	4	22377	0	1
50944	1028	2016-01-21	0	3240	0	29	dthiessen	me			\N	2016-01-21	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-02-19 09:05:37.529	2	\N	\N	1
50948	1028	2016-01-28	0	4680	0	30	dthiessen	ME			\N	2016-01-28	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-02-19 09:17:00.837	2	\N	\N	1
50874	1028	2016-01-25	1620	0	1620	29	ereimer	Anton			\N	2016-01-25	2016-02-15	1353	5	\N	jquewell	kochao		\N	\N	ereimer	2016-01-25 14:43:44.093	2	1353	0	1
50902	1025	2016-01-28	5040	0	0	32	ereimer	Ship		400-6	\N	2016-01-28	2016-02-18	4390	26	\N	nreimer	cmanzanero		\N	\N	ereimer	2016-02-04 13:30:30.093	4	4390	0	1
50970	1025	2016-02-11	16560	0	0	37	ereimer	Ship		407-2	\N	2016-02-11	2016-03-03	13534	147	\N	cmanzanero	kochao		\N	\N	ereimer	2016-02-19 15:11:01.454	4	13534	0	1
50930	1028	2016-02-15	14760	0	0	32	ereimer	Tina			\N	2016-02-15	2016-03-07	12815	61	\N	zalegria	kochao		\N	\N	ereimer	2016-02-15 11:17:21.581	2	12815	0	1
50980	1025	2016-02-18	10800	0	0	32	ereimer	Ship		528	\N	2016-02-18	2016-03-10	8986	62	\N	alopez	grodriguez		\N	\N	ereimer	2016-02-19 15:23:59.613	4	8986	0	1
50985	1028	2016-02-22	14760	0	0	33	ereimer	Anton			\N	2016-02-22	2016-03-14	12973	56	\N	kochao	cmanzanero		\N	\N	dthiessen	2016-02-22 08:41:50.443	2	12973	0	1
50998	1025	2016-02-25	7920	0	0	37	ereimer	Ship		530-2	\N	2016-02-25	2016-03-17	6300	115	\N	jquewell	agongora		\N	\N	ereimer	2016-02-25 19:53:27.023	4	6300	0	1
51022	1025	2016-03-03	2160	0	0	40	ereimer	Ship		407-1	\N	2016-03-03	2016-03-24	1896	14	\N	cmanzanero	kochao		\N	\N	ereimer	2016-03-10 09:18:04.851	4	1896	0	1
51009	1019	2016-03-07	8820	0	0	59	ereimer	Allen			\N	2016-03-07	2016-03-28	7117	130	\N	kochao	cmanzanero		\N	\N	dthiessen	2016-03-07 08:54:39.213	4	7117	0	1
51044	1025	2016-03-17	12600	0	0	39	ereimer	Ship		523-7	\N	2016-03-17	2016-04-07	10582	97	\N	jquewell	alopez		\N	\N	ereimer	2016-03-15 16:25:29.99	4	10582	0	1
51057	1029	2016-03-21	30060	0	0	33	ereimer	Evangelyn			\N	2016-03-21	2016-04-11	27224	93	\N	jquewell	nreimer		\N	\N	ereimer	2016-03-21 11:06:55.772	2	27224	0	1
51070	1025	2016-03-24	5400	0	0	28	ereimer	Ship		521-2	\N	2016-03-24	2016-04-14	4165	27	\N	wcabb	alopez		\N	\N	ereimer	2016-03-22 14:26:37.123	4	4165	0	1
51087	1028	2016-03-31	6120	0	0	39	dthiessen	Tina			\N	2016-03-31	2016-04-21	5508	23	\N	zalegria	kochao		\N	\N	dthiessen	2016-03-31 13:45:26.062	2	5508	0	1
51100	1019	2016-04-04	900	0	900	63	dthiessen	Allan			\N	2016-04-04	2016-04-25	697	16	\N	agongora	0		\N	\N	ereimer	2016-04-04 13:35:37.968	4	697	0	1
50888	1025	2016-01-21	11160	0	0	52	ereimer	Ship	fixed date	527-1	\N	2016-01-21	2016-02-11	6867	86	\N	agongora	wcabb		\N	\N	ereimer	2016-02-04 08:01:57.187	4	6867	0	1
51117	1025	2016-04-07	6120	0	0	45	dthiessen	ship		400-3	\N	2016-04-07	2016-04-28	4934	19	\N	grodriguez	jquewell		\N	\N	dthiessen	2016-04-05 08:58:08.781	4	4934	0	1
51135	1020	2016-04-14	3600	0	0	63	ereimer	Charlie			\N	2016-04-14	2016-05-05	2619	37	\N	grodriguez	gcano		\N	\N	ereimer	2016-04-14 09:52:27.109	4	2619	0	1
51148	1025	2016-04-14	1440	0	0	29	ereimer	Ship		403-3	\N	2016-04-14	2016-05-05	1211	12	\N	nreimer	zalegria		\N	\N	ereimer	2016-04-14 16:25:02.557	4	1211	0	1
51161	1025	2016-04-21	5400	0	0	53	ereimer	Ship		401-3	\N	2016-04-21	2016-05-12	4653	46	\N	cmanzanero	kochao		\N	\N	ereimer	2016-04-22 10:34:20.279	4	4653	0	1
51174	1021	2016-04-28	6120	0	0	57	ereimer	Abe			\N	2016-04-28	2016-05-19	4904	102	\N	nreimer	zalegria		\N	\N	ereimer	2016-04-28 08:21:48.841	4	4904	0	1
51187	1028	2016-05-05	3960	0	0	44	ereimer	Son			\N	2016-05-05	2016-05-26	3454	47	\N	jquewell	kochao		\N	\N	dthiessen	2016-05-05 08:05:35.013	2	3454	0	1
51202	1025	2016-05-05	5040	0	0	46	ereimer	Ship		400-5	\N	2016-05-05	2016-05-26	4291	33	\N	grodriguez	cmanzanero		\N	\N	ereimer	2016-05-10 10:44:01.765	4	4291	0	1
51230	1025	2016-05-12	10800	0	0	33	ereimer	Ship		403-4	\N	2016-05-12	2016-06-02	9350	85	\N	jquewell	zalegria		\N	\N	ereimer	2016-05-13 14:56:57.578	4	9350	0	1
51251	1025	2016-05-19	15120	0	0	36	ereimer	Ship		521-2	\N	2016-05-19	2016-06-09	12229	52	\N	grodriguez	ealergria		\N	\N	ereimer	2016-05-20 13:36:51.009	4	12229	0	1
51268	1025	2016-05-26	6840	0	0	56	ereimer	Ship		517-2	\N	2016-05-26	2016-06-16	4924	67	\N	nreimer	admin		\N	\N	ereimer	2016-05-27 16:07:04.734	4	4924	0	1
51276	1021	2016-05-30	18180	0	0	61	ereimer	Son			\N	2016-05-30	2016-06-20	11757	141	\N	alopez	admin		\N	\N	ereimer	2016-05-30 09:24:40.781	4	11757	0	1
51306	1025	2016-06-02	720	0	0	30	ereimer	Ship		403-6	\N	2016-06-02	2016-06-23	627	3	\N	grodriguez	ealergria		\N	\N	ereimer	2016-06-06 14:41:06.063	4	627	0	1
51293	1021	2016-06-06	12420	0	0	62	ereimer	Son			\N	2016-06-06	2016-06-27	8634	270	\N	grodriguez	ealergria		\N	\N	ereimer	2016-06-06 08:40:51.36	4	8634	0	1
51319	1025	2016-06-09	6480	0	0	58	ereimer	Ship		517-2	\N	2016-06-09	2016-06-30	4162	37	\N	dmenendez	admin		\N	\N	ereimer	2016-06-10 14:39:51.031	4	4162	0	1
51331	1029	2016-06-13	21780	0	0	45	ereimer	Richard	fix 21600		\N	2016-06-13	2016-07-04	18151	111	\N	jquewell	ealergria		\N	\N	ereimer	2016-06-13 11:13:57.328	2	18151	0	1
51329	1031	2016-06-13	16560	0	0	32	ereimer	Tim			\N	2016-06-13	2016-07-04	14154	40	\N	jquewell	ealergria		\N	\N	ereimer	2016-06-13 09:44:31.015	7	14154	0	1
51380	1031	2016-06-30	10080	0	0	35	ereimer	Jerry			\N	2016-06-30	2016-07-21	9193	100	\N	kochao	cmartinez		\N	\N	ereimer	2016-06-30 08:37:06.582	7	9193	0	1
51384	1025	2016-06-30	3600	0	0	63	ereimer	Ship		401-3	\N	2016-06-30	2016-07-21	2797	78	\N	jquewell	kochao		\N	\N	ereimer	2016-07-01 14:21:04.238	4	2797	0	1
51393	1031	2016-07-04	13500	0	0	35	ereimer	Tim			\N	2016-07-04	2016-07-25	11721	100	\N	ealergria	admin		\N	\N	ereimer	2016-07-04 08:57:06.91	7	11721	0	1
51409	1032	2016-07-07	1800	0	1800	32	ereimer	Edward			\N	2016-07-07	2016-07-28	1578	15	\N	grodriguez	jquewell		\N	\N	ereimer	2016-07-07 14:31:44.285	7	1578	0	1
51400	1033	2016-07-07	9900	0	0	30	ereimer	Conway			\N	2016-07-07	2016-07-28	8953	75	\N	ealergria	admin		\N	\N	ereimer	2016-07-07 08:27:53.738	7	8953	0	1
50659	1017	2015-11-02	12420	0	0	47	admin	Helena			\N	2015-11-02	2015-11-23	10826	62	\N	grodriguez	admin		\N	\N	dthiessen	2015-11-02 07:55:12.807	1	10826	0	1
50805	1025	2015-11-09	14760	0	0	32	ereimer	Ship		518-1	\N	2015-11-09	2015-11-30	11850	107	\N	cmanzanero	kochao		\N	\N	dthiessen	2016-01-15 10:47:18.609	4	11850	0	1
50819	1025	2015-11-23	5400	0	0	47	ereimer	Ship		404-1	\N	2015-11-23	2015-12-14	4430	37	\N	nreimer	alopez		\N	\N	dthiessen	2016-01-15 11:00:22.343	4	4430	0	1
50710	1016	2015-12-03	6840	0	0	57	admin	Abram 			\N	2015-12-03	2015-12-24	5124	74	\N	grodriguez	admin		\N	\N	dthiessen	2015-12-03 09:44:32.213	4	5124	0	1
50725	1019	2015-12-10	3060	0	0	47	admin	Allen			\N	2015-12-10	2015-12-31	2387	36	\N	wcabb	cmanzanero		\N	\N	dthiessen	2015-12-10 13:47:01.361	4	2387	0	1
50739	1020	2015-12-10	3960	0	3960	45	admin	Nelson			\N	2015-12-10	2015-12-31	3159	39	\N	wcabb	cmanzanero		\N	\N	dthiessen	2015-12-10 14:48:16.837	4	3159	0	1
50833	1020	2015-12-17	12600	0	0	46	ereimer	Otto			\N	2015-12-17	2016-01-07	10205	119	\N	alopez	nreimer		\N	\N	dthiessen	2016-01-15 11:26:49.781	4	10205	0	1
50756	1026	2015-12-28	6840	0	0	71	admin	Jake			\N	2015-12-28	2016-01-18	2356	0	\N	nreimer	alopez		\N	\N	dthiessen	2015-12-28 07:24:17.875	6	4684	2328	2
50770	1026	2015-12-31	7920	540	0	72	admin	Jake			\N	2015-12-31	2016-01-21	2665	0	\N	wcabb	alopez		\N	\N	dthiessen	2015-12-31 07:55:05.198	6	5361	2696	2
50784	1025	2016-01-04	4680	0	0	57	admin	Ship		406-2	\N	2016-01-04	2016-01-25	3312	30	\N	nreimer	nrecinos		\N	\N	dthiessen	2016-01-07 10:45:08.372	4	3312	0	1
50847	1025	2016-01-11	3240	0	0	35	ereimer	Ship		523-5	\N	2016-01-11	2016-02-01	2717	17	\N	grodriguez	zalegria		\N	\N	dthiessen	2016-01-15 13:31:11.359	4	2717	0	1
50798	1017	2016-01-14	18180	0	0	58	admin	Galen			\N	2016-01-14	2016-02-04	14959	85	\N	wcabb	zalegria		\N	\N	dthiessen	2016-01-14 09:05:39.64	4	14959	0	1
50861	1016	2016-01-21	5220	0	0	64	ereimer	Tim			\N	2016-01-21	2016-02-11	3292	48	\N	grodriguez	nrecinos		\N	\N	ereimer	2016-01-21 08:02:13.484	4	3292	0	1
50949	1029	2016-01-28	0	720	0	26	dthiessen	ME			\N	2016-01-28	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-02-19 09:17:31.325	2	\N	\N	1
50875	1019	2016-01-25	720	0	720	53	admin	Lisbeth			\N	2016-01-25	2016-02-15	577	9	\N	jquewell	kochao		\N	\N	ereimer	2016-01-25 15:14:58.093	4	577	0	1
50903	1025	2016-01-28	9360	0	0	32	ereimer	Ship		523-7	\N	2016-01-28	2016-02-18	7305	76	\N	jquewell	agongora		\N	\N	ereimer	2016-02-04 13:30:55.921	4	7305	0	1
50971	1025	2016-02-11	7200	0	0	28	ereimer	Ship		402-3	\N	2016-02-11	2016-03-03	6019	31	\N	kochao	cmanzanero		\N	\N	ereimer	2016-02-19 15:12:12.577	4	6019	0	1
50981	1025	2016-02-18	6120	0	0	28	ereimer	Ship		507-1	\N	2016-02-18	2016-03-10	5265	16	\N	wcabb	alopez		\N	\N	ereimer	2016-02-19 15:26:53.525	4	5265	0	1
50986	1021	2016-02-22	24480	0	0	47	ereimer	Abe			\N	2016-02-22	2016-03-14	20092	196	\N	wcabb	alopez		\N	\N	dthiessen	2016-02-22 08:50:21.769	4	20092	0	1
50999	1025	2016-02-25	4680	0	0	36	ereimer	Ship		400-5	\N	2016-02-25	2016-03-17	4153	41	\N	wcabb	jquewell		\N	\N	ereimer	2016-02-25 19:53:49.185	4	4153	0	1
51010	1021	2016-03-07	24660	0	0	49	ereimer	Abe			\N	2016-03-07	2016-03-28	20585	333	\N	wcabb	0		\N	\N	dthiessen	2016-03-07 09:03:17.617	4	20585	0	1
51023	1025	2016-03-10	8640	0	0	63	ereimer	Ship		526-1	\N	2016-03-10	2016-03-31	5319	73	\N	kochao	grodriguez		\N	\N	ereimer	2016-03-10 09:19:52.644	4	5319	0	1
51058	1025	2016-03-24	3960	0	0	64	ereimer	Ship		404-1	\N	2016-03-24	2016-04-14	2667	102	\N	zalegria	kochao		\N	\N	ereimer	2016-03-22 14:21:46.089	4	2667	0	1
51118	1025	2016-04-07	9000	0	0	45	dthiessen	ship		400-4	\N	2016-04-07	2016-04-28	7539	38	\N	wcabb	alopez		\N	\N	dthiessen	2016-04-05 08:58:30.906	4	7539	0	1
51136	1019	2016-04-14	1260	0	0	65	ereimer	Anton			\N	2016-04-14	2016-05-05	932	14	\N	nreimer	jquewell		\N	\N	ereimer	2016-04-14 10:02:57.906	4	932	0	1
51149	1025	2016-04-14	1440	0	0	29	ereimer	Ship		403-4	\N	2016-04-14	2016-05-05	1239	0	\N	zalegria	0		\N	\N	ereimer	2016-04-14 16:25:19.62	4	1239	0	1
50889	1025	2016-01-21	360	0	0	31	ereimer	Ship	fixed date	400-6	\N	2016-01-21	2016-02-11	306	12	\N	agongora	wcabb		\N	\N	ereimer	2016-02-04 08:02:18.296	4	306	0	1
50931	1026	2016-02-18	10260	0	0	79	ereimer	Jake			\N	2016-02-18	2016-03-10	3181	0	\N	jquewell	admin		\N	\N	ereimer	2016-02-18 07:57:17.588	6	6271	3090	2
51045	1029	2016-03-17	5040	0	0	33	ereimer	Richard	fixed 5760		\N	2016-03-17	2016-04-07	4591	45	\N	cmanzanero	0		\N	\N	ereimer	2016-03-17 08:10:09.022	2	4591	0	1
51088	1029	2016-03-31	15480	0	0	35	admin	Vange			\N	2016-03-31	2016-04-21	13973	36	\N	wcabb	zalegria		\N	\N	dthiessen	2016-03-31 13:56:04.703	2	13973	0	1
51101	1021	2016-04-04	2340	0	2340	53	admin	Myra			\N	2016-04-04	2016-04-25	1881	25	\N	grodriguez	admin		\N	\N	ereimer	2016-04-04 13:43:30.812	4	1881	0	1
51218	1036	2016-03-10	8640	0	0	37	admin	ship		GM	\N	2016-03-10	2016-03-31	3178	0	\N	admin	0		\N	\N	dthiessen	2016-05-13 13:11:30.14	5	6210	3032	2
51162	1025	2016-04-21	5400	0	0	53	ereimer	Ship		401-4	\N	2016-04-21	2016-05-12	4554	63	\N	jquewell	nreimer		\N	\N	ereimer	2016-04-22 10:34:44.826	4	4554	0	1
51175	1019	2016-04-28	1620	0	0	67	ereimer	Peter			\N	2016-04-28	2016-05-19	1222	26	\N	nreimer	jquewell		\N	\N	ereimer	2016-04-28 08:24:56.529	4	1222	0	1
51188	1021	2016-05-05	5580	0	0	58	ereimer	Abe			\N	2016-05-05	2016-05-26	4200	38	\N	wcabb	alopez		\N	\N	dthiessen	2016-05-05 08:24:30.091	4	4200	0	1
51203	1025	2016-05-05	4320	0	0	46	ereimer	Ship		400-6	\N	2016-05-05	2016-05-26	3658	28	\N	jquewell	kochao		\N	\N	ereimer	2016-05-10 10:44:23.156	4	3658	0	1
51231	1025	2016-05-12	11160	0	0	30	ereimer	Ship		403-1	\N	2016-05-12	2016-06-02	9118	39	\N	zalegria	kochao		\N	\N	ereimer	2016-05-13 14:57:24.546	4	9118	0	1
51252	1025	2016-05-19	8280	0	0	34	ereimer	Ship		403-3	\N	2016-05-19	2016-06-09	6947	43	\N	alopez	jquewell		\N	\N	ereimer	2016-05-20 13:37:11.843	4	6947	0	1
51269	1025	2016-05-26	18720	0	0	53	ereimer	Ship		523-5	\N	2016-05-26	2016-06-16	11722	286	\N	nreimer	admin		\N	\N	ereimer	2016-05-27 16:07:26.734	4	11722	0	1
51275	1031	2016-05-30	14760	0	0	30	ereimer	Tim			\N	2016-05-30	2016-06-20	11910	16	\N	alopez	admin		\N	\N	ereimer	2016-05-30 09:16:14.75	7	11910	0	1
51307	1025	2016-06-02	3600	0	0	28	ereimer	Ship		404-1	\N	2016-06-02	2016-06-23	2871	11	\N	wcabb	alopez		\N	\N	ereimer	2016-06-06 14:41:32.594	4	2871	0	1
51294	1031	2016-06-06	15120	0	0	31	ereimer	Abram			\N	2016-06-06	2016-06-27	12404	97	\N	grodriguez	ealergria		\N	\N	ereimer	2016-06-06 08:56:12	7	12404	0	1
51320	1025	2016-06-09	5400	0	0	55	ealergria	Ship		523-5	\N	2016-06-09	2016-06-30	3251	28	\N	nreimer	kochao		\N	\N	ereimer	2016-06-10 14:40:08.625	4	3251	0	1
51327	1033	2016-06-13	11700	0	0	26	ereimer	Paul			\N	2016-06-13	2016-07-04	10105	17	\N	jquewell	ealergria		\N	\N	ereimer	2016-06-13 09:06:47.843	7	10105	0	1
51364	1025	2016-06-23	5040	0	0	59	ereimer	Ship		511	\N	2016-06-23	2016-07-14	3716	38	\N	nreimer	kochao		\N	\N	ereimer	2016-06-24 13:22:18.921	4	3716	0	1
51381	1029	2016-06-30	12960	0	0	48	ereimer	Richard			\N	2016-06-30	2016-07-21	10402	38	\N	ealergria	admin		\N	\N	ereimer	2016-06-30 08:50:22.847	2	10402	0	1
51394	1032	2016-07-04	7560	0	0	31	ereimer	Edward			\N	2016-07-04	2016-07-25	6024	76	\N	wcabb	nreimer		\N	\N	ereimer	2016-07-04 09:31:29.128	7	6024	0	1
51410	1031	2016-07-07	2520	0	2520	36	dthiessen	Timmy			\N	2016-07-07	2016-07-28	2306	2	\N	nreimer	kochao		\N	\N	dthiessen	2016-07-07 14:37:14.363	7	2306	0	1
51407	1029	2016-07-07	2880	0	2880	49	ereimer	Vange			\N	2016-07-07	2016-07-28	2405	20	\N	admin	ealergria		\N	\N	ereimer	2016-07-07 13:55:52.878	2	2405	0	1
51413	1025	2016-07-07	2880	0	0	61	ereimer	Ship		513-2	\N	2016-07-07	2016-07-28	2200	60	\N	grodriguez	zalegria		\N	\N	ereimer	2016-07-08 10:11:28.91	4	2200	0	1
51415	1025	2016-07-07	6840	0	0	45	ereimer	Ship		402-1	\N	2016-07-07	2016-07-28	6091	31	\N	nreimer	kochao		\N	\N	ereimer	2016-07-08 10:12:12.691	4	6091	0	1
51417	1025	2016-07-07	3960	0	0	33	ereimer	Ship		404-1	\N	2016-07-07	2016-07-28	3398	21	\N	grodriguez	jquewell		\N	\N	ereimer	2016-07-08 10:12:54.41	4	3398	0	1
50669	1026	2015-11-05	10440	4320	0	64	admin	Jake			\N	2015-11-05	2015-11-26	3726	155	\N	admin	0		\N	\N	dthiessen	2015-11-05 10:02:46.421	2	7416	3690	2
50806	1025	2015-11-09	13680	0	0	32	ereimer	Ship		518-2	\N	2015-11-09	2015-11-30	11561	75	\N	nreimer	alopez		\N	\N	dthiessen	2016-01-15 10:48:13.734	4	11561	0	1
50820	1025	2015-11-23	6480	0	0	42	ereimer	Ship		524-1	\N	2015-11-23	2015-12-14	5320	57	\N	cmanzanero	agongora		\N	\N	dthiessen	2016-01-15 11:00:56.14	4	5320	0	1
50711	1020	2015-12-03	12960	0	0	44	admin	Otto			\N	2015-12-03	2015-12-24	9131	188	\N	admin	grodriguez		\N	\N	dthiessen	2015-12-03 10:08:55.354	4	9131	0	1
50726	1016	2015-12-10	1800	0	1800	58	admin	Wife			\N	2015-12-10	2015-12-31	1337	24	\N	admin	alopez		\N	\N	dthiessen	2015-12-10 13:47:27.451	4	1337	0	1
50740	1020	2015-12-14	13140	0	0	45	admin	otto			\N	2015-12-14	2016-01-04	11075	83	\N	cmanzanero	zalegria		\N	\N	dthiessen	2015-12-14 09:12:42.152	4	11075	0	1
50834	1025	2015-12-21	6480	0	0	62	ereimer	Ship		510	\N	2015-12-21	2016-01-11	4197	98	\N	nreimer	admin		\N	\N	dthiessen	2016-01-15 13:13:51.562	4	4197	0	1
50757	1016	2015-12-28	13320	0	0	60	admin	Abram			\N	2015-12-28	2016-01-18	9159	125	\N	nrecinos	grodriguez		\N	\N	dthiessen	2015-12-28 07:24:47.531	4	9159	0	1
50771	1017	2015-12-31	19080	0	0	56	admin	Jake			\N	2015-12-31	2016-01-21	15709	132	\N	grodriguez	nrecinos		\N	\N	dthiessen	2015-12-31 07:55:29.526	4	15709	0	1
50785	1025	2016-01-04	5040	0	0	53	admin	Ship		404-1	\N	2016-01-04	2016-01-25	4214	43	\N	wcabb	alopez		\N	\N	dthiessen	2016-01-07 10:45:36.684	4	4214	0	1
50848	1025	2016-01-11	8640	0	0	31	ereimer	Ship		530-2	\N	2016-01-11	2016-02-01	6832	63	\N	admin	0		\N	\N	dthiessen	2016-01-15 13:31:36.968	4	6832	0	1
50799	1021	2016-01-14	27360	0	0	42	admin	Abe			\N	2016-01-14	2016-02-04	23063	224	\N	jquewell	wcabb		\N	\N	dthiessen	2016-01-14 09:32:53.25	4	23063	0	1
50862	1029	2016-01-21	180	0	0	25	ereimer	Richard			\N	2016-01-21	2016-02-11	102	0	\N	grodriguez	nrecinos		\N	\N	ereimer	2016-01-21 09:20:14.359	2	102	0	1
50950	1017	2016-02-04	0	7380	0	61	dthiessen	ME			\N	2016-02-04	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-02-19 09:20:12.658	4	\N	\N	1
50876	1016	2016-01-28	4680	0	0	65	ereimer	Abram			\N	2016-01-28	2016-02-18	2977	102	\N	zalegria	agongora		\N	\N	ereimer	2016-01-28 08:51:38.171	4	2977	0	1
50904	1025	2016-02-04	4680	0	0	63	ereimer	Ship		403-1	\N	2016-02-04	2016-02-25	3607	62	\N	jquewell	alopez		\N	\N	ereimer	2016-02-04 17:34:12.562	4	3607	0	1
50918	1017	2016-02-08	16560	0	0	61	ereimer	Galen			\N	2016-02-08	2016-02-29	12787	270	\N	grodriguez	admin		\N	\N	ereimer	2016-02-08 09:39:49.979	4	12787	0	1
50972	1025	2016-02-11	7200	0	0	28	ereimer	Ship		402-4	\N	2016-02-11	2016-03-03	6023	37	\N	jguenther	admin		\N	\N	ereimer	2016-02-19 15:12:37.846	4	6023	0	1
50932	1020	2016-02-18	25020	0	0	55	ereimer	Otto			\N	2016-02-18	2016-03-10	20262	223	\N	cmanzanero	admin		\N	\N	ereimer	2016-02-18 11:20:10.973	4	20262	0	1
51102	1020	2016-04-04	2880	0	2880	61	admin	otto			\N	2016-04-04	2016-04-25	2138	37	\N	cmanzanero	nreimer		\N	\N	ereimer	2016-04-04 14:08:23.015	4	2138	0	1
50987	1017	2016-02-22	15840	0	0	63	ereimer	Jake			\N	2016-02-22	2016-03-14	11470	452	\N	kochao	cmanzanero		\N	\N	dthiessen	2016-02-22 10:12:33.745	4	11470	0	1
51000	1025	2016-02-25	3600	0	0	36	ereimer	Ship		400-6	\N	2016-02-25	2016-03-17	3145	67	\N	wcabb	jquewell		\N	\N	ereimer	2016-02-25 19:54:03.32	4	3145	0	1
51011	1017	2016-03-07	14940	0	0	65	ereimer	Helena			\N	2016-03-07	2016-03-28	10711	413	\N	jquewell	admin		\N	\N	dthiessen	2016-03-07 09:28:52.134	4	10711	0	1
51024	1025	2016-03-10	9360	0	0	63	ereimer	Ship		526-2	\N	2016-03-10	2016-03-31	5725	77	\N	wcabb	0		\N	\N	ereimer	2016-03-10 09:20:14.568	4	5725	0	1
51033	1019	2016-03-14	8820	0	0	60	ereimer	Allen			\N	2016-03-14	2016-04-04	7020	95	\N	alopez	0		\N	\N	ereimer	2016-03-14 08:36:44.561	4	7020	0	1
51046	1021	2016-03-17	3420	0	0	51	ereimer	Abe			\N	2016-03-17	2016-04-07	2987	13	\N	jquewell	alopez		\N	\N	ereimer	2016-03-17 08:47:20.693	4	2987	0	1
51059	1025	2016-03-24	3960	0	0	64	ereimer	Ship		404-2	\N	2016-03-24	2016-04-14	2897	37	\N	wcabb	zalegria		\N	\N	ereimer	2016-03-22 14:22:27.619	4	2897	0	1
51119	1025	2016-04-07	10440	0	0	42	dthiessen	ship		400-5	\N	2016-04-07	2016-04-28	9038	54	\N	wcabb	alopez		\N	\N	dthiessen	2016-04-05 08:58:48.671	4	9038	0	1
51137	1030	2016-04-14	2160	0	0	27	dthiessen	worker			\N	2016-04-14	2016-05-05	1835	13	\N	grodriguez	gcano		\N	\N	dthiessen	2016-04-14 15:05:11.916	7	1835	0	1
51150	1019	2016-04-18	7380	0	0	65	ereimer	Allen			\N	2016-04-18	2016-05-09	5663	146	\N	grodriguez	zalegria		\N	\N	ereimer	2016-04-18 08:50:09.669	4	5663	0	1
50890	1025	2016-01-21	7560	0	0	28	ereimer	Ship	fixed date	529-2	\N	2016-01-21	2016-02-11	6969	105	\N	zalegria	admin		\N	\N	ereimer	2016-02-04 08:34:32.593	4	6969	0	1
51089	1029	2016-03-31	3240	0	3240	35	admin	Vange			\N	2016-03-31	2016-04-21	2924	7	\N	wcabb	zalegria		\N	\N	dthiessen	2016-03-31 13:56:25.906	2	2924	0	1
51219	1036	2016-03-10	5400	0	0	31	admin	ship		TM	\N	2016-03-10	2016-03-31	1587	0	\N	admin	0		\N	\N	dthiessen	2016-05-13 13:12:14.187	5	3284	1697	2
51163	1025	2016-04-21	7560	0	0	51	ereimer	Ship		517-1	\N	2016-04-21	2016-05-12	5674	87	\N	cmanzanero	kochao		\N	\N	ereimer	2016-04-22 10:35:05.966	4	5674	0	1
51176	1020	2016-04-28	6840	4320	0	65	ereimer	Annie			\N	2016-04-28	2016-05-19	4692	109	\N	jquewell	nreimer		\N	\N	ereimer	2016-04-28 08:46:26.732	4	4692	0	1
51189	1029	2016-05-05	9180	0	0	40	ereimer	Richard			\N	2016-05-05	2016-05-26	8133	49	\N	agongora	zalegria		\N	\N	dthiessen	2016-05-05 08:48:10.544	2	8133	0	1
51204	1025	2016-05-05	7920	0	0	36	ereimer	Ship		402-2	\N	2016-05-05	2016-05-26	6952	34	\N	wcabb	alopez		\N	\N	ereimer	2016-05-10 10:44:54.968	4	6952	0	1
51232	1025	2016-05-12	10440	0	0	30	ereimer	Ship		403-2	\N	2016-05-12	2016-06-02	8475	26	\N	wcabb	agongora		\N	\N	ereimer	2016-05-13 14:57:45.015	4	8475	0	1
51253	1025	2016-05-19	8280	0	0	34	ereimer	Ship		403-4	\N	2016-05-19	2016-06-09	6609	56	\N	grodriguez	ealergria		\N	\N	ereimer	2016-05-20 13:37:35.246	4	6609	0	1
51270	1025	2016-05-26	8640	0	0	52	ereimer	Ship		407-1	\N	2016-05-26	2016-06-16	6131	121	\N	cmanzanero	zalegria		\N	\N	ereimer	2016-05-27 16:07:44.031	4	6131	0	1
51308	1025	2016-06-02	3600	0	0	28	ereimer	Ship		404-2	\N	2016-06-02	2016-06-23	2829	5	\N	wcabb	alopez		\N	\N	ereimer	2016-06-06 14:42:14.844	4	2829	0	1
51295	1033	2016-06-06	5220	0	0	25	ereimer	Paul			\N	2016-06-06	2016-06-27	4312	47	\N	zalegria	dmenendez		\N	\N	ereimer	2016-06-06 09:31:44.032	7	4312	0	1
51321	1025	2016-06-09	5040	0	0	54	ereimer	Ship		400-4	\N	2016-06-09	2016-06-30	4048	30	\N	dmenendez	admin		\N	\N	ereimer	2016-06-10 14:40:27.562	4	4048	0	1
51330	1028	2016-06-13	8640	0	0	49	ereimer	Anton			\N	2016-06-13	2016-07-04	7163	69	\N	jquewell	ealergria		\N	\N	ereimer	2016-06-13 10:02:29.625	2	7163	0	1
51344	1025	2016-06-16	9360	0	0	55	ereimer	Ship		400-4	\N	2016-06-16	2016-07-07	7583	52	\N	grodriguez	ealergria		\N	\N	ereimer	2016-06-17 14:42:07.552	4	7583	0	1
51412	1025	2016-07-07	4320	0	0	64	ereimer	Ship		401-3	\N	2016-07-07	2016-07-28	3364	35	\N	nreimer	kochao		\N	\N	ereimer	2016-07-08 10:11:07.097	4	3364	0	1
51365	1025	2016-06-23	3240	0	0	36	ereimer	Ship		403-2	\N	2016-06-23	2016-07-14	2278	40	\N	jquewell	cmanzanero		\N	\N	ereimer	2016-06-24 13:22:38.343	4	2278	0	1
51382	1033	2016-06-30	9900	0	0	29	ereimer	Paul			\N	2016-06-30	2016-07-21	8888	58	\N	ealergria	admin		\N	\N	ereimer	2016-06-30 09:24:28.41	7	8888	0	1
51386	1025	2016-06-30	6120	0	0	57	ereimer	Ship		407-1	\N	2016-06-30	2016-07-21	3528	30	\N	admin	0		\N	\N	ereimer	2016-07-01 14:21:46.925	4	3528	0	1
51395	1033	2016-07-04	13320	0	0	29	ereimer	Paul			\N	2016-07-04	2016-07-25	11874	30	\N	ealergria	admin		\N	\N	ereimer	2016-07-04 10:10:57.066	7	11874	0	1
51414	1025	2016-07-07	8280	0	0	55	ereimer	Ship		523-7	\N	2016-07-07	2016-07-28	5511	52	\N	grodriguez	jquewell		\N	\N	ereimer	2016-07-08 10:11:47.535	4	5511	0	1
51416	1025	2016-07-07	8280	0	0	45	ereimer	Ship		402-2	\N	2016-07-07	2016-07-28	7030	45	\N	nreimer	kochao		\N	\N	ereimer	2016-07-08 10:12:31.316	4	7030	0	1
50670	1014	2015-11-05	7200	0	0	62	admin	Kenton			\N	2015-11-05	2015-11-26	4854	64	\N	gcano	agongora		\N	\N	dthiessen	2015-11-05 10:43:51.593	1	4854	0	1
50807	1025	2015-11-09	11160	0	0	31	ereimer	Ship		401-1	\N	2015-11-09	2015-11-30	9020	45	\N	cmanzanero	kochao		\N	\N	dthiessen	2016-01-15 10:48:40	4	9020	0	1
50821	1025	2015-11-23	6840	0	0	42	ereimer	Ship		524-2	\N	2015-11-23	2015-12-14	5429	27	\N	grodriguez	admin		\N	\N	dthiessen	2016-01-15 11:01:24.796	4	5429	0	1
50712	1016	2015-12-03	1800	0	1800	57	admin	Abram			\N	2015-12-03	2015-12-24	1348	19	\N	grodriguez	admin		\N	\N	dthiessen	2015-12-03 13:22:46.651	4	1348	0	1
50727	1019	2015-12-10	1080	0	1080	47	admin	Peter			\N	2015-12-10	2015-12-31	843	13	\N	wcabb	cmanzanero		\N	\N	dthiessen	2015-12-10 13:47:48.643	4	843	0	1
50741	1016	2015-12-14	7020	0	0	58	admin	Abram			\N	2015-12-14	2016-01-04	4878	135	\N	admin	agongora		\N	\N	dthiessen	2015-12-14 09:33:07.69	4	4878	0	1
50835	1025	2015-12-21	6840	0	0	33	ereimer	Ship		400-1	\N	2015-12-21	2016-01-11	5863	41	\N	wcabb	cmanzanero		\N	\N	dthiessen	2016-01-15 13:14:23.203	4	5863	0	1
50758	1020	2015-12-28	25740	0	0	47	admin	Otto			\N	2015-12-28	2016-01-18	21098	122	\N	nrecinos	grodriguez		\N	\N	dthiessen	2015-12-28 07:25:28.625	4	21098	0	1
50772	1021	2015-12-31	27360	0	0	40	admin	Abe			\N	2015-12-31	2016-01-21	23515	143	\N	agongora	nreimer		\N	\N	dthiessen	2015-12-31 09:29:12.479	4	23515	0	1
50786	1025	2016-01-04	5400	0	0	53	admin	Ship		404-2	\N	2016-01-04	2016-01-25	4318	40	\N	grodriguez	kochao		\N	\N	dthiessen	2016-01-07 10:47:26.215	4	4318	0	1
50849	1025	2016-01-11	9000	0	0	30	ereimer	Ship		523-7	\N	2016-01-11	2016-02-01	7343	27	\N	admin	0		\N	\N	dthiessen	2016-01-15 13:32:11.64	4	7343	0	1
50800	1028	2016-01-14	3600	0	0	28	admin	Mark			\N	2016-01-14	2016-02-04	2406	61	\N	jquewell	wcabb		\N	\N	dthiessen	2016-01-14 10:31:04	2	2406	0	1
50863	1020	2016-01-21	11340	0	0	51	ereimer	Richard			\N	2016-01-21	2016-02-11	9466	122	\N	grodriguez	agongora		\N	\N	ereimer	2016-01-21 10:55:48.031	4	9466	0	1
50933	1016	2015-12-24	0	4860	0	60	dthiessen	ME			\N	2015-12-24	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-02-19 08:44:07.544	4	\N	\N	1
50877	1020	2016-01-28	27180	0	0	52	ereimer	Richard			\N	2016-01-28	2016-02-18	22665	147	\N	wcabb	alopez		\N	\N	ereimer	2016-01-28 10:51:30.671	4	22665	0	1
50905	1025	2016-02-04	4680	0	0	63	ereimer	Ship		403-2	\N	2016-02-04	2016-02-25	3632	53	\N	grodriguez	admin		\N	\N	ereimer	2016-02-04 17:34:37.421	4	3632	0	1
50919	1021	2016-02-08	22680	0	0	45	ereimer	Abe			\N	2016-02-08	2016-02-29	19313	82	\N	nreimer	agongora		\N	\N	ereimer	2016-02-08 09:44:16.127	4	19313	0	1
50973	1025	2016-02-18	1800	0	0	65	ereimer	Ship		403-2	\N	2016-02-18	2016-03-10	1433	22	\N	wcabb	alopez		\N	\N	ereimer	2016-02-19 15:14:59.523	4	1433	0	1
50988	1029	2016-02-22	34020	0	0	29	ereimer	Richard			\N	2016-02-22	2016-03-14	30658	118	\N	wcabb	alopez		\N	\N	dthiessen	2016-02-22 10:38:32.079	2	30658	0	1
51001	1029	2016-02-29	35280	0	0	30	ereimer	Richard			\N	2016-02-29	2016-03-21	31589	164	\N	cmanzanero	admin		\N	\N	ereimer	2016-02-29 08:23:30.969	2	31589	0	1
51012	1026	2016-03-07	5760	0	0	81	ereimer	Helena			\N	2016-03-07	2016-03-28	1714	0	\N	jquewell	admin		\N	\N	dthiessen	2016-03-07 09:29:08.366	6	3465	1751	2
51025	1025	2016-03-10	4320	0	0	59	ereimer	Ship		404-4	\N	2016-03-10	2016-03-31	2873	16	\N	kochao	grodriguez		\N	\N	ereimer	2016-03-10 09:20:46.705	4	2873	0	1
51034	1021	2016-03-14	24480	0	0	50	ereimer	Abe			\N	2016-03-14	2016-04-04	19591	198	\N	kochao	cmanzanero		\N	\N	ereimer	2016-03-14 08:56:07.542	4	19591	0	1
51047	1026	2016-03-17	8280	0	0	83	ereimer	Jake			\N	2016-03-17	2016-04-07	2468	0	\N	jquewell	zalegria		\N	\N	ereimer	2016-03-17 09:06:28.282	6	4874	2406	2
51071	1029	2016-03-24	5040	0	0	34	ereimer	Richard			\N	2016-03-24	2016-04-14	4590	26	\N	alopez	admin		\N	\N	ereimer	2016-03-24 07:59:19.078	2	4590	0	1
51060	1025	2016-03-24	3600	0	0	61	ereimer	Ship		527-1	\N	2016-03-24	2016-04-14	2167	57	\N	admin	0		\N	\N	ereimer	2016-03-22 14:22:51.614	4	2167	0	1
51220	1036	2016-03-10	1800	0	0	66	admin	ship		354	\N	2016-03-10	2016-03-31	520	0	\N	admin	0		\N	\N	dthiessen	2016-05-13 13:12:51.14	5	979	459	2
50891	1025	2016-01-21	14760	0	0	48	ereimer	Ship	fixed date	7934	\N	2016-01-21	2016-02-11	11023	60	\N	alopez	wcabb		\N	\N	ereimer	2016-02-04 08:35:05.671	4	11023	0	1
51077	1017	2016-03-28	7200	0	0	68	dthiessen	jake			\N	2016-03-28	2016-04-18	5326	157	\N	kochao	wcabb		\N	\N	dthiessen	2016-03-29 11:04:41.25	4	5326	0	1
51090	1028	2016-03-31	1800	0	1800	39	admin	Mark			\N	2016-03-31	2016-04-21	1620	7	\N	zalegria	kochao		\N	\N	dthiessen	2016-03-31 13:58:58.531	2	1620	0	1
51103	1029	2016-04-04	3780	0	3780	35	admin	Otto	fixed 3600		\N	2016-04-04	2016-04-25	3358	20	\N	agongora	zalegria		\N	\N	ereimer	2016-04-04 14:08:58.562	2	3358	0	1
51107	1025	2016-04-07	4680	0	0	63	dthiessen	ship		525-1	\N	2016-04-07	2016-04-28	2654	66	\N	grodriguez	zalegria		\N	\N	dthiessen	2016-04-05 08:53:30.421	4	2654	0	1
51120	1025	2016-04-07	9720	0	0	42	dthiessen	ship		400-6	\N	2016-04-07	2016-04-28	7872	46	\N	wcabb	alopez		\N	\N	dthiessen	2016-04-05 08:59:10.515	4	7872	0	1
51125	1021	2016-04-11	20160	0	0	54	dthiessen	Abe			\N	2016-04-11	2016-05-02	15905	245	\N	cmanzanero	kochao		\N	\N	dthiessen	2016-04-11 08:45:09.734	4	15905	0	1
51138	1025	2016-04-14	6480	0	0	64	ereimer	Ship		527-2	\N	2016-04-14	2016-05-05	3640	179	\N	jquewell	nreimer		\N	\N	ereimer	2016-04-14 16:21:25.416	4	3640	0	1
51151	1030	2016-04-18	22320	0	0	27	ereimer	Worker			\N	2016-04-18	2016-05-09	18356	200	\N	admin	nreimer		\N	\N	ereimer	2016-04-18 08:57:41.076	7	18356	0	1
51164	1025	2016-04-21	7560	0	0	51	ereimer	Ship		517-2	\N	2016-04-21	2016-05-12	5746	40	\N	grodriguez	kochao		\N	\N	ereimer	2016-04-22 10:35:24.841	4	5746	0	1
51177	1029	2016-04-28	9360	0	0	39	dthiessen	Evangeline			\N	2016-04-28	2016-05-19	8407	44	\N	wcabb	alopez		\N	\N	ereimer	2016-04-28 09:17:37.138	2	8407	0	1
51190	1019	2016-05-05	1080	0	0	68	admin	Liesbeth			\N	2016-05-05	2016-05-26	810	6	\N	jquewell	kochao		\N	\N	dthiessen	2016-05-05 09:05:34.638	4	810	0	1
51205	1025	2016-05-05	8280	0	0	32	ereimer	Ship		403-3	\N	2016-05-05	2016-05-26	7290	16	\N	jquewell	kochao		\N	\N	ereimer	2016-05-10 10:45:19.781	4	7290	0	1
51192	1019	2016-05-09	1620	0	0	68	admin	Allan			\N	2016-05-09	2016-05-30	1208	94	\N	grodriguez	ealergria		\N	\N	dthiessen	2016-05-09 07:36:08.031	4	1208	0	1
51207	1031	2016-05-12	720	0	0	28	ereimer	Jerry			\N	2016-05-12	2016-06-02	570	1	\N	agongora	0		\N	\N	ereimer	2016-05-12 07:41:28.64	7	570	0	1
51233	1025	2016-05-12	3960	0	0	27	ereimer	Ship		403-5	\N	2016-05-12	2016-06-02	3183	130	\N	zalegria	kochao		\N	\N	ereimer	2016-05-13 14:58:07.546	4	3183	0	1
51235	1030	2016-05-16	17280	0	0	31	ereimer	Worker			\N	2016-05-16	2016-06-06	14335	36	\N	nreimer	alopez		\N	\N	ereimer	2016-05-16 08:14:04.703	7	14335	0	1
51241	1031	2016-05-19	540	0	0	29	ereimer	Tim			\N	2016-05-19	2016-06-09	468	0	\N	wcabb	cmanzanero		\N	\N	ereimer	2016-05-19 07:51:40.14	7	468	0	1
51258	1021	2016-05-23	15480	0	0	60	ereimer	Son			\N	2016-05-23	2016-06-13	10749	283	\N	jquewell	admin		\N	\N	ereimer	2016-05-23 09:08:13.781	4	10749	0	1
51309	1030	2016-06-09	7200	2880	0	35	ereimer	Emery			\N	2016-06-09	2016-06-30	5758	16	\N	nreimer	kochao		\N	\N	ereimer	2016-06-09 07:57:00.39	7	5758	0	1
51322	1025	2016-06-09	9000	0	0	51	ereimer	Ship		523-7	\N	2016-06-09	2016-06-30	6447	53	\N	dmenendez	admin		\N	\N	ereimer	2016-06-10 14:40:51.875	4	6447	0	1
51345	1025	2016-06-16	7200	0	0	52	ereimer	Ship		523-7	\N	2016-06-16	2016-07-07	5200	82	\N	grodriguez	ealergria		\N	\N	ereimer	2016-06-17 14:42:27.13	4	5200	0	1
51355	1033	2016-06-23	6660	0	0	28	ereimer	Paul			\N	2016-06-23	2016-07-14	5824	31	\N	nreimer	kochao		\N	\N	ereimer	2016-06-23 08:09:19.906	7	5824	0	1
50671	1016	2015-11-05	7920	0	0	53	admin	Tim			\N	2015-11-05	2015-11-26	6155	43	\N	admin	jquewell		\N	\N	dthiessen	2015-11-05 11:05:22.89	1	6155	0	1
50934	1020	2015-12-24	0	9180	0	47	dthiessen	ME			\N	2015-12-24	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-02-19 08:44:48.074	4	\N	\N	1
50808	1025	2015-11-16	11520	0	0	43	ereimer	Ship		525-1	\N	2015-11-16	2015-12-07	9092	115	\N	jquewell	zalegria		\N	\N	dthiessen	2016-01-15 10:50:29.562	4	9092	0	1
50822	1025	2015-11-23	12600	0	0	41	ereimer	Ship		523-1	\N	2015-11-23	2015-12-14	9828	60	\N	nreimer	alopez		\N	\N	dthiessen	2016-01-15 11:01:52.203	4	9828	0	1
50952	1021	2016-02-04	0	10620	0	45	dthiessen	ME			\N	2016-02-04	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-02-19 09:21:01.952	4	\N	\N	1
50728	1021	2015-12-10	3240	0	3240	37	admin	Abe			\N	2015-12-10	2015-12-31	2956	10	\N	grodriguez	admin		\N	\N	dthiessen	2015-12-10 13:53:28.592	4	2956	0	1
50836	1025	2015-12-21	7920	0	0	33	ereimer	Ship		400-2	\N	2015-12-21	2016-01-11	6929	51	\N	nreimer	admin		\N	\N	dthiessen	2016-01-15 13:14:49.265	4	6929	0	1
50713	1021	2015-12-03	3240	0	3240	36	admin	Betty			\N	2015-12-03	2015-12-24	2656	18	\N	admin	grodriguez		\N	\N	dthiessen	2015-12-03 13:46:18.385	4	2656	0	1
51078	1019	2016-03-28	7560	0	0	62	dthiessen	Allan			\N	2016-03-28	2016-04-18	5852	79	\N	cmanzanero	wcabb		\N	\N	dthiessen	2016-03-29 11:05:09.296	4	5852	0	1
50759	1025	2015-12-28	3960	0	0	63	admin	Ship		402-1	\N	2015-12-28	2016-01-18	3017	39	\N	nrecinos	grodriguez		\N	\N	dthiessen	2015-12-29 15:01:19.281	4	3017	0	1
50773	1019	2015-12-31	9540	0	0	50	admin	Allen			\N	2015-12-31	2016-01-21	7295	368	\N	jquewell	zalegria		\N	\N	dthiessen	2015-12-31 09:36:24.479	4	7295	0	1
50787	1025	2016-01-04	7920	0	0	50	admin	Ship		527-1	\N	2016-01-04	2016-01-25	5329	56	\N	cmanzanero	agongora		\N	\N	dthiessen	2016-01-07 10:48:14.09	4	5329	0	1
51091	1019	2016-03-31	900	0	900	63	admin	Allan			\N	2016-03-31	2016-04-21	721	22	\N	cmanzanero	zalegria		\N	\N	dthiessen	2016-03-31 14:07:07.031	4	721	0	1
50850	1025	2016-01-11	9000	0	0	31	ereimer	Ship		530-1	\N	2016-01-11	2016-02-01	7035	34	\N	nreimer	cmanzanero		\N	\N	dthiessen	2016-01-15 13:32:33.921	4	7035	0	1
50864	1026	2016-01-21	10080	4860	0	75	admin	Linda			\N	2016-01-21	2016-02-11	2923	35	\N	admin	0		\N	\N	dthiessen	2016-01-21 13:57:03.937	6	6105	3182	2
51104	1017	2016-04-04	900	0	900	69	admin	Galen			\N	2016-04-04	2016-04-25	642	22	\N	grodriguez	admin		\N	\N	ereimer	2016-04-04 14:16:34.875	4	642	0	1
50892	1025	2016-01-28	1800	0	0	60	ereimer	Ship		406-2	\N	2016-01-28	2016-02-18	1083	26	\N	zalegria	kochao		\N	\N	ereimer	2016-02-04 08:41:21.109	4	1083	0	1
50906	1025	2016-02-04	5760	0	0	57	ereimer	Ship		526-1	\N	2016-02-04	2016-02-25	3491	154	\N	wcabb	alopez		\N	\N	ereimer	2016-02-04 17:34:59.937	4	3491	0	1
50920	1029	2016-02-08	23760	0	0	27	ereimer	Richard			\N	2016-02-08	2016-02-29	19400	76	\N	admin	0		\N	\N	ereimer	2016-02-08 10:00:28.148	2	19400	0	1
50974	1025	2016-02-18	2880	0	0	63	ereimer	Ship		406-1	\N	2016-02-18	2016-03-10	1700	10	\N	grodriguez	kochao		\N	\N	ereimer	2016-02-19 15:16:48.335	4	1700	0	1
50989	1020	2016-02-25	25560	0	0	56	ereimer	Otto			\N	2016-02-25	2016-03-17	20499	327	\N	zalegria	cmanzanero		\N	\N	ereimer	2016-02-25 10:22:40.533	4	20499	0	1
51002	1019	2016-02-29	8820	0	0	58	ereimer	Allen			\N	2016-02-29	2016-03-21	7273	100	\N	alopez	dyoung		\N	\N	ereimer	2016-02-29 08:32:15.832	4	7273	0	1
51013	1028	2016-03-07	14760	0	0	35	ereimer	Anton			\N	2016-03-07	2016-03-28	13114	77	\N	zalegria	grodriguez		\N	\N	dthiessen	2016-03-07 09:57:00.778	2	13114	0	1
51026	1025	2016-03-10	5760	0	0	44	ereimer	Ship		400-1	\N	2016-03-10	2016-03-31	5005	31	\N	grodriguez	kochao		\N	\N	ereimer	2016-03-10 09:21:09.462	4	5005	0	1
51035	1017	2016-03-14	15120	0	0	66	ereimer	Jake			\N	2016-03-14	2016-04-04	10807	285	\N	kochao	cmanzanero		\N	\N	ereimer	2016-03-14 09:04:41.13	4	10807	0	1
51048	1028	2016-03-17	2160	0	0	37	ereimer	Mark Reimer			\N	2016-03-17	2016-04-07	1943	15	\N	jquewell	alopez		\N	\N	ereimer	2016-03-17 09:22:00.463	2	1943	0	1
51072	1021	2016-03-24	3240	0	0	52	ereimer	Abe			\N	2016-03-24	2016-04-14	2727	54	\N	zalegria	kochao		\N	\N	ereimer	2016-03-24 08:02:57.171	4	2727	0	1
51061	1025	2016-03-24	6120	0	0	50	ereimer	Ship		401-1	\N	2016-03-24	2016-04-14	5170	67	\N	zalegria	kochao		\N	\N	ereimer	2016-03-22 14:23:17.239	4	5170	0	1
50878	1016	2016-01-28	1260	0	1260	65	ereimer	Jerry	fixed		\N	2016-01-28	2016-02-18	802	27	\N	zalegria	agongora		\N	\N	ereimer	2016-01-28 14:09:01.609	4	802	0	1
50742	1026	2015-12-14	12960	0	0	53	admin	Jake			\N	2015-12-14	2016-01-04	4374	0	\N	admin	jquewell	55 left to feed and 425 dumped	\N	\N	dthiessen	2015-12-14 10:44:02.992	6	8700	4326	2
51108	1025	2016-04-07	4320	0	0	63	dthiessen	ship		525-2	\N	2016-04-07	2016-04-28	2268	9	\N	gcano	agongora		\N	\N	dthiessen	2016-04-05 08:53:50.765	4	2268	0	1
51121	1025	2016-04-07	8280	0	0	32	dthiessen	ship		402-1	\N	2016-04-07	2016-04-28	7143	25	\N	cmanzanero	agongora		\N	\N	dthiessen	2016-04-05 08:59:30.078	4	7143	0	1
51126	1019	2016-04-11	7560	0	0	64	admin	Peter			\N	2016-04-11	2016-05-02	5870	118	\N	admin	gcano		\N	\N	dthiessen	2016-04-11 08:57:44.937	4	5870	0	1
51139	1025	2016-04-14	9360	0	0	62	ereimer	Ship		524-2	\N	2016-04-14	2016-05-05	6693	282	\N	cmanzanero	zalegria		\N	\N	ereimer	2016-04-14 16:21:57.354	4	6693	0	1
51152	1028	2016-04-18	11160	0	0	41	ereimer	Son			\N	2016-04-18	2016-05-09	9504	55	\N	cmanzanero	agongora		\N	\N	ereimer	2016-04-18 09:06:54.388	2	9504	0	1
51165	1025	2016-04-21	11880	0	0	48	ereimer	Ship		523-5	\N	2016-04-21	2016-05-12	9001	78	\N	wcabb	alopez		\N	\N	ereimer	2016-04-22 10:35:49.388	4	9001	0	1
51208	1028	2016-05-12	5400	0	0	45	ereimer	Son			\N	2016-05-12	2016-06-02	4830	18	\N	kochao	ealergria		\N	\N	ereimer	2016-05-12 08:06:55.796	2	4830	0	1
51178	1028	2016-04-28	3960	0	0	43	ereimer	Anton			\N	2016-04-28	2016-05-19	3416	60	\N	nreimer	zalegria		\N	\N	ereimer	2016-04-28 09:22:25.029	2	3416	0	1
51221	1036	2016-03-24	10080	0	0	39	admin	ship	fix 20520	GM	\N	2016-03-24	2016-04-14	3418	0	\N	admin	0		\N	\N	dthiessen	2016-05-13 13:13:39.562	5	6778	3360	2
51206	1025	2016-05-05	7560	0	0	29	ereimer	Ship		403-2	\N	2016-05-05	2016-05-26	6145	67	\N	wcabb	alopez		\N	\N	ereimer	2016-05-10 10:46:12.078	4	6145	0	1
51191	1020	2016-05-05	6660	0	0	66	ereimer	Otto			\N	2016-05-05	2016-05-26	4163	61	\N	cmanzanero	zalegria		\N	\N	dthiessen	2016-05-05 09:54:10.638	4	4163	0	1
51193	1021	2016-05-09	14940	0	0	58	ereimer	Abe	fix 11340		\N	2016-05-09	2016-05-30	10763	279	\N	jquewell	nreimer		\N	\N	dthiessen	2016-05-09 08:28:43.812	4	10763	0	1
51234	1025	2016-05-12	5400	0	0	27	ereimer	Ship		403-6	\N	2016-05-12	2016-06-02	4161	9	\N	zalegria	kochao		\N	\N	ereimer	2016-05-13 14:58:26.015	4	4161	0	1
51236	1021	2016-05-16	11520	0	0	59	dthiessen	Abe	fix 11880		\N	2016-05-16	2016-06-06	8191	293	\N	cmanzanero	ealergria		\N	\N	ereimer	2016-05-16 08:25:30.312	4	8191	0	1
51242	1030	2016-05-19	4680	0	0	32	ereimer	Worker			\N	2016-05-19	2016-06-09	3961	15	\N	grodriguez	ealergria		\N	\N	ereimer	2016-05-19 08:26:09.578	7	3961	0	1
51255	1025	2016-05-19	12600	0	0	31	ereimer	Ship		403-2	\N	2016-05-19	2016-06-09	10320	22	\N	grodriguez	ealergria		\N	\N	ereimer	2016-05-20 13:38:13.579	4	10320	0	1
51259	1028	2016-05-23	11160	0	0	46	ereimer	Anton			\N	2016-05-23	2016-06-13	9416	147	\N	grodriguez	ealergria		\N	\N	ereimer	2016-05-23 09:29:27.531	2	9416	0	1
51323	1025	2016-06-09	11880	0	0	39	ereimer	Ship		521-1	\N	2016-06-09	2016-06-30	10072	59	\N	grodriguez	ealergria		\N	\N	ereimer	2016-06-10 14:41:11.484	4	10072	0	1
51356	1021	2016-06-23	1080	0	0	65	ereimer	Abe			\N	2016-06-23	2016-07-14	829	5	\N	jquewell	cmanzanero		\N	\N	ereimer	2016-06-23 08:11:01.859	4	829	0	1
51346	1025	2016-06-16	6120	0	0	28	ereimer	Ship		526-1	\N	2016-06-16	2016-07-07	4486	15	\N	dmenendez	admin		\N	\N	ereimer	2016-06-17 14:42:50.802	4	4486	0	1
51367	1025	2016-06-23	5400	0	0	28	ereimer	Ship		404-4	\N	2016-06-23	2016-07-14	4449	17	\N	grodriguez	ealergria		\N	\N	ereimer	2016-06-24 13:24:02.765	4	4449	0	1
50643	1026	2015-10-19	6120	5040	0	61	admin	Jake			\N	2015-10-19	2015-11-09	2337	10	\N	admin	admin		\N	\N	dthiessen	2015-10-19 07:50:00.303	2	4712	2375	2
50665	1021	2015-11-05	12960	0	0	32	admin	Abe			\N	2015-11-05	2015-11-26	10976	108	\N	admin	jquewell		\N	\N	dthiessen	2015-11-05 09:03:23.529	1	10976	0	1
50809	1025	2015-11-16	6840	0	0	43	ereimer	Ship		525-2	\N	2015-11-16	2015-12-07	5357	106	\N	admin	kochao		\N	\N	dthiessen	2016-01-15 10:50:58.25	4	5357	0	1
50851	1025	2015-11-19	3600	0	0	40	ereimer	Ship		523-10	\N	2015-11-19	2015-12-10	2856	22	\N	kochao	alopez		\N	\N	ereimer	2016-01-15 15:02:15.687	4	2856	0	1
50714	1020	2015-12-03	4140	0	4140	44	admin	Otto			\N	2015-12-03	2015-12-24	2917	60	\N	grodriguez	admin		\N	\N	dthiessen	2015-12-03 14:39:14.229	4	2917	0	1
50729	1014	2015-12-10	1980	0	0	67	admin	Worker			\N	2015-12-10	2015-12-31	1107	20	\N	admin	alopez		\N	\N	dthiessen	2015-12-10 14:23:53.998	4	1107	0	1
50823	1025	2015-12-14	5400	0	0	53	ereimer	Ship		406-1	\N	2015-12-14	2016-01-04	3297	97	\N	admin	grodriguez		\N	\N	dthiessen	2016-01-15 11:18:51.812	4	3297	0	1
50837	1025	2015-12-21	12960	0	0	33	ereimer	Ship		513-1	\N	2015-12-21	2016-01-11	11207	59	\N	admin	nreimer		\N	\N	dthiessen	2016-01-15 13:15:20.953	4	11207	0	1
50760	1025	2015-12-28	3960	0	0	63	admin	Ship		402-2	\N	2015-12-28	2016-01-18	2889	57	\N	nreimer	zalegria		\N	\N	dthiessen	2015-12-29 15:01:46.609	4	2889	0	1
50774	1026	2016-01-04	4320	2520	0	72	admin	Jake			\N	2016-01-04	2016-01-25	1415	16	\N	admin	0		\N	\N	dthiessen	2016-01-04 09:35:02.59	6	2787	1372	2
50788	1025	2016-01-04	6120	0	0	50	admin	Ship		527-2	\N	2016-01-04	2016-01-25	4468	73	\N	nrecinos	nreimer		\N	\N	dthiessen	2016-01-07 10:48:44.668	4	4468	0	1
50935	1016	2015-12-31	0	6300	0	61	dthiessen	ME			\N	2015-12-31	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-02-19 08:46:15	4	\N	\N	1
50953	1028	2016-02-04	0	5760	0	31	dthiessen	ME			\N	2016-02-04	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-02-19 09:22:21.693	2	\N	\N	1
50865	1029	2016-01-25	1440	0	0	25	ereimer	Richard			\N	2016-01-25	2016-02-15	912	3	\N	wcabb	jquewell		\N	\N	ereimer	2016-01-25 08:31:23.078	2	912	0	1
50879	1020	2016-01-28	2700	0	2700	52	ereimer	Richard			\N	2016-01-28	2016-02-18	2252	15	\N	wcabb	alopez		\N	\N	ereimer	2016-01-28 14:41:00	4	2252	0	1
50893	1025	2016-01-28	5040	0	0	56	ereimer	Ship		404-1	\N	2016-01-28	2016-02-18	3961	58	\N	wcabb	alopez		\N	\N	ereimer	2016-02-04 08:41:50.671	4	3961	0	1
50907	1025	2016-02-04	5760	0	0	57	ereimer	Ship		526-2	\N	2016-02-04	2016-02-25	4071	84	\N	wcabb	alopez		\N	\N	ereimer	2016-02-04 17:35:18.812	4	4071	0	1
50921	1028	2016-02-08	14760	0	0	31	ereimer	Anton			\N	2016-02-08	2016-02-29	12769	36	\N	grodriguez	admin		\N	\N	ereimer	2016-02-08 11:30:48.828	2	12769	0	1
50975	1025	2016-02-18	2880	0	0	63	ereimer	Ship		406-2	\N	2016-02-18	2016-03-10	1613	20	\N	grodriguez	kochao		\N	\N	ereimer	2016-02-19 15:17:12.265	4	1613	0	1
50990	1025	2016-02-25	5400	0	0	64	ereimer	Ship		406-1	\N	2016-02-25	2016-03-17	2817	111	\N	grodriguez	admin		\N	\N	ereimer	2016-02-25 19:50:34.821	4	2817	0	1
51003	1021	2016-02-29	24840	0	0	48	ereimer	Abe			\N	2016-02-29	2016-03-21	20949	345	\N	alopez	dyoung		\N	\N	ereimer	2016-02-29 08:57:19.811	4	20949	0	1
51014	1029	2016-03-07	35280	0	0	31	ereimer	Evangelyn			\N	2016-03-07	2016-03-28	31706	130	\N	jquewell	0		\N	\N	dthiessen	2016-03-07 11:10:48.801	2	31706	0	1
51027	1025	2016-03-10	5040	0	0	44	ereimer	Ship		400-2	\N	2016-03-10	2016-03-31	4344	39	\N	cmanzanero	0		\N	\N	ereimer	2016-03-10 09:21:40.47	4	4344	0	1
51036	1028	2016-03-14	15480	0	0	36	ereimer	Anton			\N	2016-03-14	2016-04-04	13572	84	\N	grodriguez	jquewell		\N	\N	ereimer	2016-03-14 10:53:00.698	2	13572	0	1
51049	1020	2016-03-17	25560	0	0	59	ereimer	Richard			\N	2016-03-17	2016-04-07	19630	214	\N	kochao	0		\N	\N	ereimer	2016-03-17 09:51:28.798	4	19630	0	1
51073	1019	2016-03-24	1260	0	0	62	ereimer	Peter			\N	2016-03-24	2016-04-14	1058	12	\N	wcabb	alopez		\N	\N	ereimer	2016-03-24 08:22:56.906	4	1058	0	1
51062	1025	2016-03-24	6120	0	0	50	ereimer	Ship		401-2	\N	2016-03-24	2016-04-14	5193	27	\N	zalegria	kochao		\N	\N	ereimer	2016-03-22 14:23:41.425	4	5193	0	1
51092	1017	2016-03-31	3060	0	0	69	dthiessen	Jake			\N	2016-03-31	2016-04-21	2287	40	\N	admin	gcano		\N	\N	dthiessen	2016-03-31 14:48:53.578	4	2287	0	1
51179	1030	2016-04-28	9000	0	0	29	ereimer	Worker			\N	2016-04-28	2016-05-19	7906	53	\N	zalegria	ealergria		\N	\N	ereimer	2016-04-28 09:22:44.31	7	7906	0	1
51079	1020	2016-03-28	21960	0	0	60	dthiessen	Anton			\N	2016-03-28	2016-04-18	16433	409	\N	zalegria	admin		\N	\N	dthiessen	2016-03-29 11:05:29.078	4	16433	0	1
51105	1028	2016-04-04	540	0	540	39	dthiessen	Anton			\N	2016-04-04	2016-04-25	457	4	\N	grodriguez	admin		\N	\N	dthiessen	2016-04-04 16:46:20.859	2	457	0	1
51109	1025	2016-04-07	3240	0	0	63	dthiessen	ship		527-2	\N	2016-04-07	2016-04-28	1850	61	\N	grodriguez	jquewell		\N	\N	dthiessen	2016-04-05 08:54:32.578	4	1850	0	1
51122	1025	2016-04-07	720	0	0	32	dthiessen	ship		402-2	\N	2016-04-07	2016-04-28	650	10	\N	jquewell	0		\N	\N	dthiessen	2016-04-05 08:59:51.828	4	650	0	1
51127	1020	2016-04-11	22320	0	0	62	admin	Annie			\N	2016-04-11	2016-05-02	15788	582	\N	grodriguez	jquewell		\N	\N	dthiessen	2016-04-11 09:31:38.562	4	15788	0	1
51209	1021	2016-05-12	8640	0	0	59	ereimer	Abe			\N	2016-05-12	2016-06-02	6114	168	\N	ealergria	kochao		\N	\N	ereimer	2016-05-12 08:37:11.062	4	6114	0	1
51153	1021	2016-04-18	19800	0	0	55	ereimer	Abe			\N	2016-04-18	2016-05-09	15497	171	\N	cmanzanero	admin		\N	\N	ereimer	2016-04-18 09:14:38.81	4	15497	0	1
51222	1036	2016-03-24	20520	0	0	33	admin	ship		TM	\N	2016-03-24	2016-04-14	5096	0	\N	admin	0		\N	\N	dthiessen	2016-05-13 13:14:43.437	5	10555	5459	2
51166	1025	2016-04-21	12240	0	0	44	ereimer	Ship		523-7	\N	2016-04-21	2016-05-12	10017	77	\N	wcabb	alopez		\N	\N	ereimer	2016-04-22 10:36:10.498	4	10017	0	1
51140	1025	2016-04-14	3240	0	0	61	ereimer	Ship	fixed 3600	523-1	\N	2016-04-14	2016-05-05	2130	149	\N	zalegria	agongora		\N	\N	ereimer	2016-04-14 16:22:20.932	4	2130	0	1
51194	1030	2016-05-09	22320	0	0	30	ereimer	Worker			\N	2016-05-09	2016-05-30	17777	86	\N	grodriguez	ealergria		\N	\N	ereimer	2016-05-09 09:12:28.062	7	17777	0	1
51237	1029	2016-05-16	23400	0	0	41	ereimer	Richard			\N	2016-05-16	2016-06-06	20397	148	\N	wcabb	ealergria		\N	\N	ereimer	2016-05-16 09:34:01.875	2	20397	0	1
51243	1021	2016-05-19	2880	0	0	60	ereimer	Abe			\N	2016-05-19	2016-06-09	2125	20	\N	grodriguez	agongora		\N	\N	ereimer	2016-05-19 08:38:12.984	4	2125	0	1
51256	1025	2016-05-19	2880	0	0	28	ereimer	Ship		403-5	\N	2016-05-19	2016-06-09	2462	4	\N	wcabb	admin		\N	\N	ereimer	2016-05-20 13:38:33.66	4	2462	0	1
51260	1031	2016-05-23	6840	0	0	29	ereimer	Tim			\N	2016-05-23	2016-06-13	5427	39	\N	wcabb	nreimer		\N	\N	ereimer	2016-05-23 09:45:00.109	7	5427	0	1
51273	1025	2016-05-26	6120	0	0	46	ereimer	Ship		528	\N	2016-05-26	2016-06-16	4981	57	\N	nreimer	ealergria		\N	\N	ereimer	2016-05-27 16:08:38.515	4	4981	0	1
51277	1030	2016-05-30	28080	0	0	33	ereimer	Worker			\N	2016-05-30	2016-06-20	22212	27	\N	grodriguez	ealergria		\N	\N	ereimer	2016-05-30 09:26:57.593	7	22212	0	1
51285	1030	2016-06-02	7920	0	0	34	admin	William			\N	2016-06-02	2016-06-23	6411	19	\N	kochao	admin		\N	\N	dthiessen	2016-06-02 08:29:39.625	7	6411	0	1
51357	1029	2016-06-23	9000	0	0	47	ereimer	Vange			\N	2016-06-23	2016-07-14	7757	23	\N	grodriguez	ealergria		\N	\N	ereimer	2016-06-23 08:25:57.312	2	7757	0	1
51368	1025	2016-06-23	7200	0	0	28	ereimer	Ship		527-1	\N	2016-06-23	2016-07-14	4836	112	\N	admin	0		\N	\N	ereimer	2016-06-24 13:25:15.531	4	4836	0	1
51383	1028	2016-06-30	5220	0	0	52	ereimer	Tina			\N	2016-06-30	2016-07-21	4184	102	\N	ealergria	admin		\N	\N	ereimer	2016-06-30 09:42:02.925	2	4184	0	1
51387	1025	2016-06-30	5760	0	0	57	ereimer	Ship		407-2	\N	2016-06-30	2016-07-21	3586	68	\N	admin	0		\N	\N	ereimer	2016-07-01 14:24:54.332	4	3586	0	1
50646	1017	2015-10-22	23040	0	0	46	admin	Marilyn			\N	2015-10-22	2015-11-12	20323	164	\N	kochao	alopez		\N	\N	dthiessen	2015-10-22 09:57:18.258	1	20323	0	1
50936	1020	2015-12-31	0	12420	0	48	dthiessen	ME			\N	2015-12-31	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-02-19 08:46:35.132	4	\N	\N	1
50743	1025	2015-10-26	11160	0	0	54	admin	ship		501	\N	2015-10-26	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2015-12-15 17:05:28.681	4	\N	\N	1
50810	1025	2015-11-16	7560	0	0	43	ereimer	Ship		527-1	\N	2015-11-16	2015-12-07	5878	40	\N	admin	kochao		\N	\N	dthiessen	2016-01-15 10:51:55.89	4	5878	0	1
50852	1014	2015-11-26	12600	900	0	65	ereimer	Kenton			\N	2015-11-26	2015-12-17	7924	197	\N	grodriguez	admin		\N	\N	ereimer	2016-01-15 15:55:45.953	4	7924	0	1
50715	1017	2015-12-03	2520	0	2520	52	admin	Marlyn			\N	2015-12-03	2015-12-24	2241	8	\N	jquewell	kochao		\N	\N	dthiessen	2015-12-03 14:42:52.494	4	2241	0	1
50824	1025	2015-12-14	5400	0	0	53	ereimer	Ship		406-2	\N	2015-12-14	2016-01-04	3354	85	\N	admin	grodriguez		\N	\N	dthiessen	2016-01-15 11:19:20.89	4	3354	0	1
50838	1025	2015-12-21	15120	0	0	33	ereimer	Ship		513-2	\N	2015-12-21	2016-01-11	13136	99	\N	nreimer	wcabb		\N	\N	dthiessen	2016-01-15 13:15:47.109	4	13136	0	1
50761	1025	2015-12-28	5040	0	0	59	admin	Ship		521-1	\N	2015-12-28	2016-01-18	3390	65	\N	nreimer	zalegria		\N	\N	dthiessen	2015-12-29 15:02:11.89	4	3390	0	1
50775	1016	2016-01-04	14220	0	0	61	admin	Abram			\N	2016-01-04	2016-01-25	9286	258	\N	nreimer	jquewell		\N	\N	dthiessen	2016-01-04 09:44:53.481	4	9286	0	1
50789	1025	2016-01-04	11880	0	0	47	admin	Ship		523-1	\N	2016-01-04	2016-01-25	8902	59	\N	grodriguez	kochao		\N	\N	dthiessen	2016-01-07 10:49:34.543	4	8902	0	1
50954	1029	2016-02-04	0	5040	0	27	dthiessen	ME			\N	2016-02-04	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-02-19 09:22:46.881	2	\N	\N	1
50866	1021	2016-01-25	27000	0	0	43	ereimer	Abe			\N	2016-01-25	2016-02-15	23656	130	\N	wcabb	alopez		\N	\N	ereimer	2016-01-25 08:45:24.75	4	23656	0	1
50894	1025	2016-01-28	5040	0	0	56	ereimer	Ship		404-2	\N	2016-01-28	2016-02-18	3854	88	\N	wcabb	cmanzanero		\N	\N	ereimer	2016-02-04 08:59:27.125	4	3854	0	1
50880	1029	2016-02-01	11700	0	0	26	ereimer	Richard			\N	2016-02-01	2016-02-22	8633	68	\N	wcabb	alopez		\N	\N	ereimer	2016-02-01 08:54:41.953	2	8633	0	1
50908	1025	2016-02-04	6120	0	0	54	ereimer	Ship		525-1	\N	2016-02-04	2016-02-25	4560	46	\N	grodriguez	admin		\N	\N	ereimer	2016-02-04 17:35:43.796	4	4560	0	1
50922	1016	2016-02-11	3420	0	0	67	ereimer	Abram			\N	2016-02-11	2016-03-03	1982	74	\N	admin	zalegria		\N	\N	ereimer	2016-02-11 09:23:19.061	4	1982	0	1
50976	1025	2016-02-18	11160	0	0	56	ereimer	Ship		525-1	\N	2016-02-18	2016-03-10	8067	127	\N	cmanzanero	admin		\N	\N	ereimer	2016-02-19 15:17:58.443	4	8067	0	1
50991	1025	2016-02-25	5400	0	0	64	ereimer	Ship		406-2	\N	2016-02-25	2016-03-17	2785	59	\N	kochao	cmanzanero		\N	\N	ereimer	2016-02-25 19:51:00.874	4	2785	0	1
51015	1025	2016-03-03	7200	0	0	61	ereimer	Ship		404-1	\N	2016-03-03	2016-03-24	5346	79	\N	cmanzanero	kochao		\N	\N	ereimer	2016-03-10 09:14:20.69	4	5346	0	1
51028	1025	2016-03-10	12960	0	0	42	ereimer	Ship		400-3	\N	2016-03-10	2016-03-31	11231	53	\N	grodriguez	kochao		\N	\N	ereimer	2016-03-10 09:22:06.049	4	11231	0	1
51037	1029	2016-03-14	34740	0	0	32	ereimer	Evangelyn			\N	2016-03-14	2016-04-04	31377	67	\N	jquewell	nreimer		\N	\N	ereimer	2016-03-14 11:10:30.332	2	31377	0	1
51050	1017	2016-03-17	2160	0	0	67	ereimer	Jake			\N	2016-03-17	2016-04-07	1667	55	\N	cmanzanero	0		\N	\N	ereimer	2016-03-17 10:41:12.854	4	1667	0	1
51074	1028	2016-03-24	2340	0	0	38	ereimer	Anton			\N	2016-03-24	2016-04-14	2106	14	\N	zalegria	kochao		\N	\N	ereimer	2016-03-24 09:23:23.562	2	2106	0	1
51063	1025	2016-03-24	5760	0	0	49	ereimer	Ship		401-3	\N	2016-03-24	2016-04-14	4892	64	\N	admin	wcabb		\N	\N	ereimer	2016-03-22 14:24:10.076	4	4892	0	1
50870	1026	2016-01-25	11520	0	0	75	ereimer	Jake	fixed		\N	2016-01-25	2016-02-15	3314	0	\N	nrecinos	alopez		\N	\N	ereimer	2016-01-25 10:08:05.171	6	6520	3206	2
51080	1021	2016-03-28	20520	0	0	52	dthiessen	Abe			\N	2016-03-28	2016-04-18	17414	184	\N	jquewell	kochao		\N	\N	dthiessen	2016-03-29 11:05:47.937	4	17414	0	1
51093	1020	2016-03-31	3420	0	3420	61	admin	Annie			\N	2016-03-31	2016-04-21	2730	29	\N	cmanzanero	admin		\N	\N	dthiessen	2016-03-31 15:24:58.562	4	2730	0	1
51106	1030	2016-04-04	2340	0	0	25	dthiessen	Joe			\N	2016-04-04	2016-04-25	1843	22	\N	grodriguez	zalegria		\N	\N	dthiessen	2016-04-04 16:49:23.765	7	1843	0	1
51110	1025	2016-04-07	4680	0	0	61	dthiessen	ship		524-1	\N	2016-04-07	2016-04-28	2888	91	\N	grodriguez	jquewell		\N	\N	dthiessen	2016-04-05 08:54:50.234	4	2888	0	1
51123	1025	2016-04-07	9000	0	0	28	dthiessen	ship		403-3	\N	2016-04-07	2016-04-28	7375	11	\N	cmanzanero	agongora		\N	\N	dthiessen	2016-04-05 09:00:12	4	7375	0	1
51180	1019	2016-05-02	3600	0	0	67	ereimer	Allen			\N	2016-05-02	2016-05-23	2632	60	\N	grodriguez	jquewell		\N	\N	ereimer	2016-05-02 10:40:54.216	4	2632	0	1
51210	1019	2016-05-12	1080	0	0	69	ereimer	Allen			\N	2016-05-12	2016-06-02	789	39	\N	wcabb	agongora		\N	\N	ereimer	2016-05-12 08:45:03.328	4	789	0	1
51128	1029	2016-04-11	30780	0	0	36	admin	Richard			\N	2016-04-11	2016-05-02	27367	189	\N	grodriguez	jquewell		\N	\N	dthiessen	2016-04-11 10:06:26.562	2	27367	0	1
51154	1017	2016-04-18	1440	0	0	71	ereimer	Galen			\N	2016-04-18	2016-05-09	994	23	\N	alopez	nreimer		\N	\N	ereimer	2016-04-18 10:00:53.794	4	994	0	1
51223	1036	2016-03-24	5400	0	0	33039	admin	ship		MX	\N	2016-03-24	2016-04-14	1727	0	\N	admin	0		\N	\N	dthiessen	2016-05-13 13:16:24.453	5	3421	1694	2
51167	1025	2016-04-21	8640	0	0	32	ereimer	Ship		521-2	\N	2016-04-21	2016-05-12	7186	30	\N	grodriguez	kochao		\N	\N	ereimer	2016-04-22 10:36:34.388	4	7186	0	1
51141	1025	2016-04-14	5400	0	0	54	ereimer	Ship		523-3	\N	2016-04-14	2016-05-05	3432	80	\N	grodriguez	kochao		\N	\N	ereimer	2016-04-14 16:22:43.104	4	3432	0	1
51195	1028	2016-05-09	9000	0	0	44	ereimer	Anton			\N	2016-05-09	2016-05-30	7555	105	\N	wcabb	agongora		\N	\N	ereimer	2016-05-09 09:18:51.125	2	7555	0	1
51238	1031	2016-05-16	1980	0	0	28	ereimer	Tim			\N	2016-05-16	2016-06-06	1557	17	\N	wcabb	jquewell		\N	\N	ereimer	2016-05-16 09:37:18.109	7	1557	0	1
51244	1032	2016-05-19	720	0	0	25	dthiessen	Edward			\N	2016-05-19	2016-06-09	523	6	\N	wcabb	cmanzanero		\N	\N	ereimer	2016-05-19 08:44:48.14	7	523	0	1
51254	1025	2016-05-19	7920	0	0	31	ereimer	Ship		403-1	\N	2016-05-19	2016-06-09	6141	31	\N	alopez	jquewell		\N	\N	ereimer	2016-05-20 13:37:55.617	4	6141	0	1
51257	1025	2016-05-19	2880	0	0	28	ereimer	Ship		403-6	\N	2016-05-19	2016-06-09	2443	0	\N	wcabb	admin		\N	\N	ereimer	2016-05-20 13:38:50.224	4	2443	0	1
51261	1032	2016-05-23	1440	0	0	25	ereimer	Edward			\N	2016-05-23	2016-06-13	1149	6	\N	jquewell	admin		\N	\N	ereimer	2016-05-23 09:52:10.14	7	1149	0	1
51274	1025	2016-05-26	9000	0	0	37	ereimer	Ship		521-1	\N	2016-05-26	2016-06-16	7583	109	\N	cmanzanero	zalegria		\N	\N	ereimer	2016-05-27 16:08:55.5	4	7583	0	1
51278	1028	2016-05-30	12780	0	0	47	ereimer	Anton	fix 16380		\N	2016-05-30	2016-06-20	10794	90	\N	wcabb	kochao		\N	\N	ereimer	2016-05-30 09:56:16.218	2	10794	0	1
51348	1030	2016-06-20	21600	0	0	36	ereimer	William	fix 2016-06-16		\N	2016-06-20	2016-07-11	16197	74	\N	nreimer	0		\N	\N	ereimer	2016-06-20 08:07:51.13	7	16197	0	1
51286	1033	2016-06-02	2160	0	0	25	dthiessen	Paul			\N	2016-06-02	2016-06-23	1691	12	\N	grodriguez	ealergria		\N	\N	dthiessen	2016-06-02 08:49:39.593	7	1691	0	1
51299	1025	2016-06-02	4320	0	0	61	ereimer	Ship		516-1	\N	2016-06-02	2016-06-23	3355	32	\N	zalegria	agongora		\N	\N	ereimer	2016-06-06 14:37:13.766	4	3355	0	1
51358	1030	2016-06-23	7920	0	0	37	ereimer	William			\N	2016-06-23	2016-07-14	6526	30	\N	nreimer	kochao		\N	\N	ereimer	2016-06-23 08:38:50.421	7	6526	0	1
51369	1025	2016-06-23	7920	0	0	33	ereimer	Ship		403-6	\N	2016-06-23	2016-07-14	6958	29	\N	nreimer	kochao		\N	\N	ereimer	2016-06-24 13:37:44.109	4	6958	0	1
50593	1025	2015-09-14	2160	0	0	48	admin	ship		501	\N	2015-09-14	2015-10-05	1786	13	\N	jquewell	admin		\N	\N	dthiessen	2015-10-05 16:11:19.738	1	1786	0	1
50651	1014	2015-10-22	17460	0	0	60	admin	Worker			\N	2015-10-22	2015-11-12	11174	0	\N	admin	0	We dumped all these eggs due to to many set. 	\N	\N	dthiessen	2015-10-22 13:55:43.367	1	11174	0	1
50937	1016	2016-01-07	0	6120	0	62	dthiessen	ME			\N	2016-01-07	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-02-19 08:47:36.497	4	\N	\N	1
50744	1025	2015-10-26	8640	0	0	54	admin	ship		510	\N	2015-10-26	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2015-12-15 17:06:16.756	4	\N	\N	1
50811	1025	2015-11-16	6840	0	0	43	ereimer	Ship		527-2	\N	2015-11-16	2015-12-07	4678	69	\N	nreimer	kochao		\N	\N	dthiessen	2016-01-15 10:52:25.828	4	4678	0	1
50853	1019	2015-11-26	5400	5760	0	45	ereimer	Allen			\N	2015-11-26	2015-12-17	4323	25	\N	alopez	kochao		\N	\N	ereimer	2016-01-15 15:58:19.062	4	4323	0	1
50716	1019	2015-12-03	1260	0	1260	46	admin	Peter			\N	2015-12-03	2015-12-24	973	11	\N	jquewell	kochao		\N	\N	dthiessen	2015-12-03 14:54:35.885	4	973	0	1
50825	1025	2015-12-14	1800	0	0	46	ereimer	Ship		527-1	\N	2015-12-14	2016-01-04	1369	57	\N	nreimer	kochao		\N	\N	dthiessen	2016-01-15 11:19:47.25	4	1369	0	1
50839	1025	2015-12-21	6480	0	0	33	ereimer	Ship		511	\N	2015-12-21	2016-01-11	5654	30	\N	nreimer	wcabb		\N	\N	dthiessen	2016-01-15 13:16:15.578	4	5654	0	1
50762	1025	2015-12-28	5040	0	0	59	admin	Ship		521-2	\N	2015-12-28	2016-01-18	3414	60	\N	cmanzanero	kochao		\N	\N	dthiessen	2015-12-29 15:02:37.015	4	3414	0	1
50776	1020	2016-01-04	28080	0	0	48	admin	Otto			\N	2016-01-04	2016-01-25	22137	261	\N	wcabb	alopez		\N	\N	dthiessen	2016-01-04 10:41:39.84	4	22137	0	1
50790	1025	2016-01-04	12960	0	0	39	admin	Ship		523-3	\N	2016-01-04	2016-01-25	10906	123	\N	wcabb	alopez		\N	\N	dthiessen	2016-01-07 10:49:59.043	4	10906	0	1
50923	1026	2016-02-11	10800	0	0	78	ereimer	Galen			\N	2016-02-11	\N	\N	\N	\N	\N	\N	\N	\N	\N	ereimer	2016-02-11 09:39:02.63	6	\N	\N	2
50955	1017	2016-02-11	0	7020	0	62	dthiessen	ME			\N	2016-02-11	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-02-19 09:25:03.438	4	\N	\N	1
50867	1016	2016-01-25	6840	0	0	64	ereimer	Abram 			\N	2016-01-25	2016-02-15	4292	130	\N	cmanzanero	zalegria		\N	\N	ereimer	2016-01-25 09:23:36.109	4	4292	0	1
50884	1017	2016-02-01	15120	0	0	60	ereimer	Galen			\N	2016-02-01	2016-02-22	11341	275	\N	alopez	admin		\N	\N	ereimer	2016-02-01 10:02:53.781	4	11341	0	1
50881	1028	2016-02-01	11880	0	0	30	ereimer	Anton			\N	2016-02-01	2016-02-22	10053	63	\N	jquewell	zalegria		\N	\N	ereimer	2016-02-01 09:30:39.593	2	10053	0	1
50895	1016	2016-02-04	8100	0	0	66	ereimer	Tim			\N	2016-02-04	2016-02-25	4576	170	\N	jquewell	zalegria		\N	\N	ereimer	2016-02-04 08:59:47.031	4	4576	0	1
50909	1025	2016-02-04	5400	0	0	54	ereimer	Ship		525-2	\N	2016-02-04	2016-02-25	4227	23	\N	grodriguez	admin		\N	\N	ereimer	2016-02-04 17:36:08.656	4	4227	0	1
50977	1025	2016-02-18	10800	0	0	54	ereimer	Ship		524-1	\N	2016-02-18	2016-03-10	7549	125	\N	grodriguez	kochao		\N	\N	ereimer	2016-02-19 15:18:30.522	4	7549	0	1
50992	1025	2016-02-25	5760	0	0	42	ereimer	Ship		400-1	\N	2016-02-25	2016-03-17	5124	39	\N	grodriguez	admin		\N	\N	ereimer	2016-02-25 19:51:36.619	4	5124	0	1
51016	1025	2016-03-03	7560	0	0	61	ereimer	Ship		404-2	\N	2016-03-03	2016-03-24	5778	46	\N	admin	agongora		\N	\N	ereimer	2016-03-10 09:15:02.563	4	5778	0	1
51029	1025	2016-03-10	12960	0	0	42	ereimer	Ship		400-4	\N	2016-03-10	2016-03-31	10658	24	\N	zalegria	0		\N	\N	ereimer	2016-03-10 09:22:27.629	4	10658	0	1
51051	1019	2016-03-17	1260	0	0	61	ereimer	Allen			\N	2016-03-17	2016-04-07	1045	18	\N	jquewell	zalegria		\N	\N	ereimer	2016-03-17 14:41:40.257	4	1045	0	1
51038	1025	2016-03-17	10440	0	0	60	ereimer	Ship		525-1	\N	2016-03-17	2016-04-07	6576	106	\N	jquewell	alopez		\N	\N	ereimer	2016-03-15 16:23:27.27	4	6576	0	1
51075	1020	2016-03-24	3600	0	0	60	ereimer	Otto			\N	2016-03-24	2016-04-14	2877	47	\N	wcabb	alopez		\N	\N	ereimer	2016-03-24 09:46:57.859	4	2877	0	1
51064	1025	2016-03-24	3960	0	0	49	ereimer	Ship		401-4	\N	2016-03-24	2016-04-14	3425	80	\N	zalegria	kochao		\N	\N	ereimer	2016-03-22 14:24:29.02	4	3425	0	1
51081	1028	2016-03-28	11880	0	0	38	dthiessen	Anton			\N	2016-03-28	2016-04-18	10548	61	\N	jquewell	kochao		\N	\N	dthiessen	2016-03-29 11:06:14.843	2	10548	0	1
51094	1019	2016-04-04	3960	0	0	63	admin	Allan			\N	2016-04-04	2016-04-25	3065	72	\N	agongora	0		\N	\N	dthiessen	2016-04-04 07:40:21.984	4	3065	0	1
51111	1025	2016-04-07	5040	0	0	61	dthiessen	ship		524-2	\N	2016-04-07	2016-04-28	3480	67	\N	jquewell	agongora		\N	\N	dthiessen	2016-04-05 08:55:09.89	4	3480	0	1
51124	1025	2016-04-07	9000	0	0	28	dthiessen	ship		403-4	\N	2016-04-07	2016-04-28	7109	32	\N	jquewell	kochao		\N	\N	dthiessen	2016-04-05 09:00:32.156	4	7109	0	1
51129	1017	2016-04-11	4320	0	0	70	admin	Linda			\N	2016-04-11	2016-05-02	2850	137	\N	cmanzanero	kochao		\N	\N	dthiessen	2016-04-11 10:09:53.984	4	2850	0	1
51142	1025	2016-04-14	8640	0	0	50	ereimer	Ship		517-2	\N	2016-04-14	2016-05-05	7033	126	\N	grodriguez	kochao		\N	\N	ereimer	2016-04-14 16:23:06.12	4	7033	0	1
51155	1020	2016-04-18	21420	0	0	63	ereimer	Annie			\N	2016-04-18	2016-05-09	14729	321	\N	jquewell	kochao		\N	\N	ereimer	2016-04-18 10:52:02.529	4	14729	0	1
51224	1036	2016-04-07	9000	0	0	41	admin	ship		GM	\N	2016-04-07	2016-04-28	3425	0	\N	admin	0		\N	\N	dthiessen	2016-05-13 13:17:47.671	5	6683	3258	2
51168	1019	2016-04-25	5760	0	0	66	ereimer	Allen			\N	2016-04-25	2016-05-16	4371	116	\N	grodriguez	jquewell		\N	\N	ereimer	2016-04-25 08:41:47.904	4	4371	0	1
51181	1020	2016-05-02	17280	0	0	65	ereimer	Otto			\N	2016-05-02	2016-05-23	10931	248	\N	grodriguez	jquewell		\N	\N	ereimer	2016-05-02 10:41:23.466	4	10931	0	1
51196	1031	2016-05-09	540	0	0	27	ereimer	Abram			\N	2016-05-09	2016-05-30	422	2	\N	grodriguez	ealergria		\N	\N	ereimer	2016-05-09 09:22:59.75	7	422	0	1
51211	1029	2016-05-12	9360	0	0	41	ereimer	Vange			\N	2016-05-12	2016-06-02	8348	23	\N	nreimer	ealergria		\N	\N	ereimer	2016-05-12 08:55:38.14	2	8348	0	1
51239	1020	2016-05-16	13140	0	0	67	ereimer	Otto			\N	2016-05-16	2016-06-06	7960	202	\N	cmanzanero	ealergria		\N	\N	ereimer	2016-05-16 09:41:35.703	4	7960	0	1
51245	1028	2016-05-19	1800	0	0	46	dthiessen	Mark			\N	2016-05-19	2016-06-09	1513	14	\N	wcabb	0		\N	\N	ereimer	2016-05-19 08:51:22.843	2	1513	0	1
51262	1020	2016-05-23	14400	0	0	68	ereimer	Otto			\N	2016-05-23	2016-06-13	7335	291	\N	grodriguez	ealergria		\N	\N	ereimer	2016-05-23 09:58:26.281	4	7335	0	1
51279	1033	2016-05-30	1440	0	0	24	ereimer	Paul			\N	2016-05-30	2016-06-20	1161	0	\N	grodriguez	ealergria		\N	\N	ereimer	2016-05-30 10:31:12.296	7	1161	0	1
51359	1031	2016-06-23	6840	3420	0	34	ereimer	Tim			\N	2016-06-23	2016-07-14	5816	39	\N	jquewell	0		\N	\N	ereimer	2016-06-23 09:30:32.578	7	5816	0	1
51287	1021	2016-06-02	5040	0	0	62	dthiessen	Abe			\N	2016-06-02	2016-06-23	3500	40	\N	grodriguez	ealergria		\N	\N	dthiessen	2016-06-02 08:56:49.89	4	3500	0	1
51300	1025	2016-06-02	2880	0	0	61	ereimer	Ship		516-2	\N	2016-06-02	2016-06-23	1995	33	\N	wcabb	alopez		\N	\N	ereimer	2016-06-06 14:37:40.485	4	1995	0	1
51313	1021	2016-06-09	5220	2700	0	63	ereimer	Abe			\N	2016-06-09	2016-06-30	3568	149	\N	wcabb	ealergria		\N	\N	ereimer	2016-06-09 08:40:28.781	4	3568	0	1
51311	1028	2016-06-09	3780	1800	0	49	ereimer	Anton			\N	2016-06-09	2016-06-30	3185	30	\N	wcabb	dmenendez		\N	\N	ereimer	2016-06-09 08:07:35.406	2	3185	0	1
51338	1031	2016-06-16	3240	7560	0	33	admin	Henry			\N	2016-06-16	2016-07-07	2831	17	\N	jquewell	kochao		\N	\N	ereimer	2016-06-16 09:17:46.287	7	2831	0	1
51370	1030	2016-06-27	17820	0	0	37	ereimer	William			\N	2016-06-27	2016-07-18	13891	192	\N	wcabb	nreimer		\N	\N	ereimer	2016-06-27 07:47:07.609	7	13891	0	1
51378	1030	2016-06-30	10980	0	0	38	ereimer	William			\N	2016-06-30	2016-07-21	8460	27	\N	zalegria	cmartinez		\N	\N	ereimer	2016-06-30 08:20:37.957	7	8460	0	1
51388	1025	2016-06-30	3960	0	0	37	ereimer	Ship		403-2	\N	2016-06-30	2016-07-21	3483	13	\N	ealergria	admin		\N	\N	ereimer	2016-07-01 14:26:28.269	4	3483	0	1
50653	1020	2015-10-26	19080	0	0	38	admin	Otto			\N	2015-10-26	2015-11-16	15825	144	\N	grodriguez	admin		\N	\N	dthiessen	2015-10-26 11:23:06.368	1	15825	0	1
50938	1020	2016-01-07	0	12060	0	49	dthiessen	ME			\N	2016-01-07	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-02-19 08:48:04.552	4	\N	\N	1
50745	1025	2015-10-26	11520	0	0	54	admin	ship		507-1	\N	2015-10-26	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2015-12-15 17:06:52.066	4	\N	\N	1
50812	1025	2015-11-16	6840	0	0	41	ereimer	Ship		524-1	\N	2015-11-16	2015-12-07	5399	93	\N	jquewell	zalegria		\N	\N	dthiessen	2016-01-15 10:53:01.906	4	5399	0	1
50956	1019	2016-02-11	0	3780	0	56	dthiessen	ME			\N	2016-02-11	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-02-19 09:25:34.114	4	\N	\N	1
50717	1014	2015-12-03	1800	0	1800	66	admin	Cindy			\N	2015-12-03	2015-12-24	1087	36	\N	gcano	cmanzanero		\N	\N	dthiessen	2015-12-03 15:08:29.947	4	1087	0	1
50826	1025	2015-12-14	18000	0	0	43	ereimer	Ship		523-1	\N	2015-12-14	2016-01-04	12094	217	\N	nreimer	alopez		\N	\N	dthiessen	2016-01-15 11:20:23.875	4	12094	0	1
50840	1025	2015-12-21	360	0	0	30	ereimer	Ship		400-4	\N	2015-12-21	2016-01-11	327	0	\N	cmanzanero	wcabb		\N	\N	dthiessen	2016-01-15 13:18:04.093	4	327	0	1
50763	1025	2015-12-28	6120	0	0	52	admin	Ship		526-1	\N	2015-12-28	2016-01-18	4549	48	\N	cmanzanero	kochao		\N	\N	dthiessen	2015-12-29 15:03:13.125	4	4549	0	1
50791	1025	2016-01-04	3240	0	0	33	admin	Ship		523-5	\N	2016-01-04	2016-01-25	1322	8	\N	grodriguez	kochao		\N	\N	dthiessen	2016-01-07 10:50:38.684	4	1322	0	1
50777	1017	2016-01-07	18900	0	0	57	admin	Galen			\N	2016-01-07	2016-01-28	15615	150	\N	nrecinos	grodriguez		\N	\N	dthiessen	2016-01-07 08:19:08.7	4	15615	0	1
50868	1019	2016-01-25	10080	0	0	53	ereimer	Allen			\N	2016-01-25	2016-02-15	8084	128	\N	jquewell	kochao		\N	\N	ereimer	2016-01-25 09:32:57.906	4	8084	0	1
50896	1025	2016-01-28	720	0	0	42	ereimer	Ship		401-1	\N	2016-01-28	2016-02-18	622	12	\N	zalegria	kochao		\N	\N	ereimer	2016-02-04 09:02:57.578	4	622	0	1
50882	1019	2016-02-01	9000	0	0	54	ereimer	Allen			\N	2016-02-01	2016-02-22	6938	225	\N	cmanzanero	jquewell		\N	\N	ereimer	2016-02-01 09:42:56.296	4	6938	0	1
50910	1025	2016-02-04	13320	0	0	37	ereimer	Ship		523-5	\N	2016-02-04	2016-02-25	10498	94	\N	jquewell	agongora		\N	\N	ereimer	2016-02-04 17:36:31	4	10498	0	1
50924	1020	2016-02-11	26640	0	0	54	ereimer	Richard			\N	2016-02-11	2016-03-03	21653	269	\N	jquewell	admin		\N	\N	ereimer	2016-02-11 10:46:34.774	4	21653	0	1
50993	1025	2016-02-25	5760	0	0	42	ereimer	Ship		400-2	\N	2016-02-25	2016-03-17	5063	24	\N	zalegria	cmanzanero		\N	\N	ereimer	2016-02-25 19:51:54.651	4	5063	0	1
51004	1026	2016-02-29	10080	0	0	80	ereimer	Jake			\N	2016-02-29	2016-03-21	3025	0	\N	admin	0		\N	\N	ereimer	2016-02-29 11:09:57.976	6	6195	3170	2
51017	1025	2016-03-03	8280	0	0	44	ereimer	Ship		517-1	\N	2016-03-03	2016-03-24	7089	57	\N	kochao	cmanzanero		\N	\N	ereimer	2016-03-10 09:15:32.515	4	7089	0	1
51030	1025	2016-03-10	12960	0	0	39	ereimer	Ship		530-1	\N	2016-03-10	2016-03-31	10642	141	\N	zalegria	0		\N	\N	ereimer	2016-03-10 09:22:43.656	4	10642	0	1
51039	1025	2016-03-17	3960	0	0	60	ereimer	Ship		525-2	\N	2016-03-17	2016-04-07	2482	51	\N	cmanzanero	0		\N	\N	ereimer	2016-03-15 16:23:44.637	4	2482	0	1
51052	1021	2016-03-21	20520	0	0	51	ereimer	Abe			\N	2016-03-21	2016-04-11	16425	146	\N	zalegria	nreimer		\N	\N	ereimer	2016-03-21 08:35:29.928	4	16425	0	1
51076	1017	2016-03-24	2160	0	0	68	ereimer	Jake			\N	2016-03-24	2016-04-14	1640	49	\N	wcabb	alopez		\N	\N	ereimer	2016-03-24 10:02:04.218	4	1640	0	1
51065	1025	2016-03-24	3240	0	0	46	ereimer	Ship		400-1	\N	2016-03-24	2016-04-14	2790	37	\N	wcabb	alopez		\N	\N	ereimer	2016-03-22 14:24:52.696	4	2790	0	1
51112	1025	2016-04-07	6120	0	0	52	dthiessen	ship		401-1	\N	2016-04-07	2016-04-28	5198	15	\N	cmanzanero	kochao		\N	\N	dthiessen	2016-04-05 08:55:31.312	4	5198	0	1
50978	1025	2016-02-18	7200	0	0	46	ereimer	Ship	fixed 8280	523-3	\N	2016-02-18	2016-03-10	5561	65	\N	jguenther	cmanzanero		\N	\N	ereimer	2016-02-19 15:23:03.534	4	5561	0	1
51130	1028	2016-04-11	12240	0	0	40	admin	Anton			\N	2016-04-11	2016-05-02	10606	105	\N	nreimer	kochao		\N	\N	dthiessen	2016-04-11 10:14:46.875	2	10606	0	1
51240	1028	2016-05-16	7380	0	0	45	ereimer	Tina			\N	2016-05-16	2016-06-06	6413	40	\N	nreimer	alopez		\N	\N	ereimer	2016-05-16 10:23:40.5	2	6413	0	1
51082	1029	2016-03-28	29520	0	0	34	dthiessen	Richard			\N	2016-03-28	2016-04-18	26833	122	\N	wcabb	alopez		\N	\N	dthiessen	2016-03-29 11:06:33.343	2	26833	0	1
51095	1020	2016-04-04	10800	0	0	61	admin	Otto			\N	2016-04-04	2016-04-25	8016	138	\N	nreimer	cmanzanero		\N	\N	dthiessen	2016-04-04 07:55:06.5	4	8016	0	1
51143	1025	2016-04-14	3240	0	0	47	ereimer	Ship	fixed 5400	523-5	\N	2016-04-14	2016-05-05	2477	73	\N	jquewell	nreimer		\N	\N	ereimer	2016-04-14 16:23:23.573	4	2477	0	1
51156	1029	2016-04-18	29160	0	0	37	ereimer	Vange			\N	2016-04-18	2016-05-09	25951	98	\N	wcabb	nreimer		\N	\N	ereimer	2016-04-18 11:23:04.919	2	25951	0	1
51225	1036	2016-04-07	9000	0	0	35	admin	ship		TM	\N	2016-04-07	2016-04-28	2609	0	\N	admin	0		\N	\N	dthiessen	2016-05-13 13:18:14.343	5	5340	2731	2
51169	1030	2016-04-25	32220	0	0	28	ereimer	Worker			\N	2016-04-25	2016-05-16	28214	91	\N	wcabb	alopez		\N	\N	ereimer	2016-04-25 08:53:22.201	7	28214	0	1
51182	1021	2016-05-02	15480	0	0	57	ereimer	Abe			\N	2016-05-02	2016-05-23	11782	160	\N	wcabb	alopez		\N	\N	ereimer	2016-05-02 10:41:42.466	4	11782	0	1
51197	1020	2016-05-09	16920	0	0	66	ereimer	Otto			\N	2016-05-09	2016-05-30	10230	308	\N	grodriguez	ealergria		\N	\N	ereimer	2016-05-09 09:27:14.265	4	10230	0	1
51212	1030	2016-05-12	14400	0	0	31	ereimer	Worker			\N	2016-05-12	2016-06-02	12272	100	\N	jquewell	zalegria		\N	\N	ereimer	2016-05-12 09:27:59.906	7	12272	0	1
51246	1029	2016-05-19	4860	0	0	42	dthiessen	Richard			\N	2016-05-19	2016-06-09	4193	44	\N	grodriguez	agongora		\N	\N	ereimer	2016-05-19 08:51:42.703	2	4193	0	1
50470	1025	2015-08-13	7200	0	0	63	admin	ship		516-1/2	\N	2015-08-13	2015-09-03	3982	457	\N	zalegria	alopez		\N	\N	dthiessen	2015-08-14 14:50:03.065	1	3982	0	1
51263	1030	2016-05-23	23040	0	0	32	ereimer	Joe			\N	2016-05-23	2016-06-13	17834	123	\N	nreimer	zalegria		\N	\N	ereimer	2016-05-23 10:05:05.75	7	17834	0	1
51271	1025	2016-05-26	8640	0	0	52	ereimer	Ship		407-2	\N	2016-05-26	2016-06-16	5931	185	\N	wcabb	jquewell		\N	\N	ereimer	2016-05-27 16:08:03.046	4	5931	0	1
51371	1021	2016-06-27	2160	0	0	65	ereimer	Erick			\N	2016-06-27	2016-07-18	1623	28	\N	ealergria	grodriguez		\N	\N	ereimer	2016-06-27 07:50:32.906	4	1623	0	1
51280	1020	2016-05-30	9360	0	0	69	ereimer	Otto			\N	2016-05-30	2016-06-20	3753	76	\N	grodriguez	ealergria		\N	\N	ereimer	2016-05-30 11:04:11.531	4	3753	0	1
51288	1028	2016-06-02	3600	0	0	48	dthiessen	Anton			\N	2016-06-02	2016-06-23	3057	40	\N	wcabb	alopez		\N	\N	dthiessen	2016-06-02 09:04:28.64	2	3057	0	1
51301	1025	2016-06-02	5400	0	0	54	ereimer	Ship		523-5	\N	2016-06-02	2016-06-23	3394	25	\N	grodriguez	ealergria		\N	\N	ereimer	2016-06-06 14:38:20.735	4	3394	0	1
51298	1028	2016-06-06	9000	0	0	48	ereimer	Anton			\N	2016-06-06	2016-06-27	7303	191	\N	nreimer	kochao		\N	\N	ereimer	2016-06-06 10:59:58.75	2	7303	0	1
51310	1029	2016-06-09	9000	0	0	45	ereimer	Richard			\N	2016-06-09	2016-06-30	7730	42	\N	grodriguez	ealergria		\N	\N	ereimer	2016-06-09 08:03:53.187	2	7730	0	1
51314	1032	2016-06-09	3240	1800	0	28	ereimer	Jake			\N	2016-06-09	2016-06-30	2638	18	\N	dmenendez	admin		\N	\N	ereimer	2016-06-09 08:51:19.437	7	2638	0	1
51326	1021	2016-06-13	10260	0	0	63	ereimer	Abe			\N	2016-06-13	2016-07-04	7253	147	\N	nreimer	kochao		\N	\N	ereimer	2016-06-13 08:58:13.375	4	7253	0	1
51389	1025	2016-06-30	7200	0	0	29	ereimer	Ship		404-3	\N	2016-06-30	2016-07-21	5961	45	\N	admin	0		\N	\N	ereimer	2016-07-01 14:27:40.988	4	5961	0	1
51403	1028	2016-07-07	4680	0	0	53	ereimer	Tina			\N	2016-07-07	2016-07-28	3677	55	\N	grodriguez	jquewell		\N	\N	ereimer	2016-07-07 10:41:06.628	2	3677	0	1
51408	1033	2016-07-07	2520	0	2520	30	ereimer	Veranica			\N	2016-07-07	2016-07-28	2279	19	\N	ealergria	admin		\N	\N	ereimer	2016-07-07 14:03:25.347	7	2279	0	1
50652	1016	2015-10-26	10620	0	0	51	admin	Abram			\N	2015-10-26	2015-11-16	8676	108	\N	grodriguez	admin		\N	\N	dthiessen	2015-10-26 09:59:43.024	1	8676	0	1
50658	1014	2015-10-29	17100	0	0	61	admin	Kenton			\N	2015-10-29	2015-11-19	11383	220	\N	kochao	alopez		\N	\N	dthiessen	2015-10-29 10:50:42.104	1	11383	0	1
50746	1025	2015-10-26	6480	0	0	54	admin	ship		507-2	\N	2015-10-26	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2015-12-15 17:07:25.714	4	\N	\N	1
50813	1025	2015-11-16	1800	0	0	41	ereimer	Ship		524-2	\N	2015-11-16	2015-12-07	1600	29	\N	nreimer	kochao		\N	\N	dthiessen	2016-01-15 10:53:30.656	4	1600	0	1
50718	1016	2015-12-07	7740	0	0	57	admin	Tim			\N	2015-12-07	2015-12-28	5539	141	\N	kochao	alopez		\N	\N	dthiessen	2015-12-07 08:55:56.171	4	5539	0	1
50827	1025	2015-12-14	18000	0	0	36	ereimer	Ship		523-3	\N	2015-12-14	2016-01-04	7438	151	\N	nreimer	0		\N	\N	dthiessen	2016-01-15 11:21:57.75	4	7438	0	1
50841	1025	2015-12-21	3600	0	0	27	ereimer	Ship		530-2	\N	2015-12-21	2016-01-11	2440	12	\N	kochao	grodriguez		\N	\N	dthiessen	2016-01-15 13:18:48.921	4	2440	0	1
50764	1025	2015-12-28	2520	0	0	52	admin	Ship		526-2	\N	2015-12-28	2016-01-18	1666	31	\N	zalegria	nreimer		\N	\N	dthiessen	2015-12-29 15:03:38.546	4	1666	0	1
50778	1026	2016-01-07	5400	2880	0	73	admin	Galen			\N	2016-01-07	2016-01-28	1793	25	\N	admin	0		\N	\N	dthiessen	2016-01-07 08:19:32.372	6	3540	1747	2
50792	1028	2016-01-07	900	0	0	27	admin	Anton			\N	2016-01-07	2016-01-28	517	7	\N	nrecinos	cmanzanero		\N	\N	dthiessen	2016-01-08 13:31:18.761	2	517	0	1
50855	1019	2016-01-18	5760	0	0	52	ereimer	Allen			\N	2016-01-18	2016-02-08	4703	35	\N	kochao	admin		\N	\N	ereimer	2016-01-18 08:55:58.828	4	4703	0	1
50939	1016	2016-01-14	0	5760	0	63	dthiessen	ME			\N	2016-01-14	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-02-19 08:50:12.108	4	\N	\N	1
50957	1021	2016-02-11	0	9720	0	46	dthiessen	ME			\N	2016-02-11	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-02-19 09:26:04.105	4	\N	\N	1
50869	1028	2016-01-25	11160	0	0	29	ereimer	Anton			\N	2016-01-25	2016-02-15	9317	31	\N	jquewell	kochao		\N	\N	ereimer	2016-01-25 09:39:02.546	2	9317	0	1
50897	1025	2016-01-28	720	0	0	42	ereimer	Ship		401-2	\N	2016-01-28	2016-02-18	639	4	\N	zalegria	kochao		\N	\N	ereimer	2016-02-04 09:03:53.546	4	639	0	1
50883	1026	2016-02-01	11160	0	0	76	ereimer	Galen			\N	2016-02-01	2016-02-22	3464	0	\N	admin	0		\N	\N	ereimer	2016-02-01 10:02:10.75	6	7040	3576	2
50911	1025	2016-02-04	13320	0	0	33	ereimer	Ship		523-7	\N	2016-02-04	2016-02-25	10415	148	\N	jquewell	admin		\N	\N	ereimer	2016-02-04 17:36:52.765	4	10415	0	1
50965	1025	2016-02-11	4320	0	0	64	ereimer	Ship		403-1	\N	2016-02-11	2016-03-03	3007	59	\N	kochao	cmanzanero		\N	\N	ereimer	2016-02-19 15:02:24.312	4	3007	0	1
50925	1019	2016-02-15	8820	0	0	56	ereimer	Allen			\N	2016-02-15	2016-03-07	6171	119	\N	jquewell	admin		\N	\N	ereimer	2016-02-15 07:34:54.39	4	6171	0	1
51113	1025	2016-04-07	6120	0	0	52	dthiessen	ship		401-2	\N	2016-04-07	2016-04-28	5013	50	\N	jquewell	agongora		\N	\N	dthiessen	2016-04-05 08:55:52.375	4	5013	0	1
50994	1025	2016-02-25	6840	0	0	40	ereimer	Ship		400-3	\N	2016-02-25	2016-03-17	5962	42	\N	wcabb	jquewell		\N	\N	ereimer	2016-02-25 19:52:15.688	4	5962	0	1
51005	1017	2016-02-29	15840	0	0	64	ereimer	Jake			\N	2016-02-29	2016-03-21	12854	274	\N	jquewell	admin		\N	\N	ereimer	2016-02-29 11:11:49.545	4	12854	0	1
51018	1025	2016-03-03	8640	0	0	44	ereimer	Ship		517-2	\N	2016-03-03	2016-03-24	7161	61	\N	wcabb	alopez		\N	\N	ereimer	2016-03-10 09:16:25.95	4	7161	0	1
51040	1025	2016-03-17	9000	0	0	57	ereimer	Ship		523-1	\N	2016-03-17	2016-04-07	5752	48	\N	cmanzanero	0		\N	\N	ereimer	2016-03-15 16:24:09.004	4	5752	0	1
51053	1019	2016-03-21	7560	0	0	61	ereimer	Allen			\N	2016-03-21	2016-04-11	5979	168	\N	grodriguez	0		\N	\N	ereimer	2016-03-21 08:53:56.148	4	5979	0	1
51066	1025	2016-03-24	3600	0	0	46	ereimer	Ship		400-2	\N	2016-03-24	2016-04-14	3224	3	\N	wcabb	agongora		\N	\N	ereimer	2016-03-22 14:25:15.615	4	3224	0	1
51131	1030	2016-04-11	10620	0	0	26	dthiessen	Joe			\N	2016-04-11	2016-05-02	8855	47	\N	nreimer	zalegria		\N	\N	dthiessen	2016-04-11 10:47:10.203	7	8855	0	1
50979	1025	2016-02-18	11880	0	0	35	ereimer	Ship	fixed 10800	523-7	\N	2016-02-18	2016-03-10	9663	64	\N	alopez	grodriguez		\N	\N	ereimer	2016-02-19 15:23:33.791	4	9663	0	1
51144	1025	2016-04-14	11520	0	0	43	ereimer	Ship		530-2	\N	2016-04-14	2016-05-05	9479	127	\N	jquewell	nreimer		\N	\N	ereimer	2016-04-14 16:23:45.307	4	9479	0	1
51083	1020	2016-03-31	10980	0	0	61	dthiessen	Otto	fixed 10800		\N	2016-03-31	2016-04-21	8763	92	\N	cmanzanero	admin		\N	\N	dthiessen	2016-03-31 08:12:12.953	4	8763	0	1
51096	1021	2016-04-04	10800	0	0	53	admin	Abe			\N	2016-04-04	2016-04-25	8680	118	\N	grodriguez	admin		\N	\N	dthiessen	2016-04-04 08:15:39.859	4	8680	0	1
51226	1036	2016-04-21	16200	0	0	43	admin	ship		GM	\N	2016-04-21	2016-05-12	5587	0	\N	admin	0		\N	\N	dthiessen	2016-05-13 13:18:56.078	5	11252	5665	2
51157	1025	2016-04-21	7920	0	0	62	ereimer	Ship		523-1	\N	2016-04-21	2016-05-12	4328	48	\N	wcabb	alopez		\N	\N	ereimer	2016-04-22 10:32:57.06	4	4328	0	1
51170	1021	2016-04-25	22320	0	0	56	ereimer	Abe			\N	2016-04-25	2016-05-16	17790	232	\N	grodriguez	jquewell		\N	\N	ereimer	2016-04-25 09:08:11.607	4	17790	0	1
51183	1028	2016-05-02	9000	0	0	43	ereimer	Anton			\N	2016-05-02	2016-05-23	7623	170	\N	nreimer	alopez		\N	\N	ereimer	2016-05-02 10:42:03.732	2	7623	0	1
50004	1006	2015-03-02	0	5040	0	57	admin	nobody			\N	2015-03-02	\N	\N	\N	\N	\N	\N	\N	\N	\N	admin	2015-05-06 08:11:00.585	1	\N	\N	1
51198	1029	2016-05-09	23220	0	0	40	ereimer	Richard			\N	2016-05-09	2016-05-30	20390	126	\N	nreimer	ealergria		\N	\N	ereimer	2016-05-09 09:43:33.125	2	20390	0	1
51213	1020	2016-05-12	9900	0	0	67	ereimer	Otto			\N	2016-05-12	2016-06-02	6259	175	\N	ealergria	agongora		\N	\N	ereimer	2016-05-12 09:33:51	4	6259	0	1
51247	1020	2016-05-19	3240	0	0	68	ereimer	Otto			\N	2016-05-19	2016-06-09	1958	23	\N	grodriguez	agongora		\N	\N	ereimer	2016-05-19 09:23:06.375	4	1958	0	1
51264	1029	2016-05-23	27000	0	0	42	ereimer	Richard			\N	2016-05-23	2016-06-13	23204	210	\N	zalegria	cmanzanero		\N	\N	ereimer	2016-05-23 10:20:38.89	2	23204	0	1
51272	1025	2016-05-26	11880	0	0	49	ereimer	Ship		523-7	\N	2016-05-26	2016-06-16	8939	205	\N	wcabb	jquewell		\N	\N	ereimer	2016-05-27 16:08:19.781	4	8939	0	1
51281	1029	2016-05-30	31320	0	0	43	ereimer	Richard			\N	2016-05-30	2016-06-20	26599	117	\N	alopez	admin		\N	\N	ereimer	2016-05-30 13:30:36.859	2	26599	0	1
51289	1032	2016-06-02	2160	0	0	27	dthiessen	Edward			\N	2016-06-02	2016-06-23	1832	18	\N	grodriguez	ealergria		\N	\N	dthiessen	2016-06-02 10:27:31.782	7	1832	0	1
51302	1025	2016-06-02	6840	0	0	50	ereimer	Ship		523-7	\N	2016-06-02	2016-06-23	5322	48	\N	grodriguez	ealergria		\N	\N	ereimer	2016-06-06 14:38:45.329	4	5322	0	1
51297	1029	2016-06-06	22500	0	0	44	ereimer	Richard			\N	2016-06-06	2016-06-27	18440	235	\N	admin	0		\N	\N	ereimer	2016-06-06 10:04:57.125	2	18440	0	1
51312	1031	2016-06-09	6480	3240	0	32	ereimer	Tim			\N	2016-06-09	2016-06-30	5484	86	\N	dmenendez	admin		\N	\N	ereimer	2016-06-09 08:17:40.375	7	5484	0	1
51315	1033	2016-06-09	4140	2880	0	26	ereimer	Elma			\N	2016-06-09	2016-06-30	3464	53	\N	grodriguez	ealergria		\N	\N	ereimer	2016-06-09 09:25:12.875	7	3464	0	1
51325	1030	2016-06-13	18720	0	0	35	dthiessen	William			\N	2016-06-13	2016-07-04	14557	141	\N	grodriguez	dmenendez		\N	\N	ereimer	2016-06-13 07:47:00.734	7	14557	0	1
51361	1028	2016-06-23	3600	0	0	51	ereimer	Tina			\N	2016-06-23	2016-07-14	2978	31	\N	jquewell	kochao		\N	\N	ereimer	2016-06-23 14:08:52.812	2	2978	0	1
51351	1033	2016-06-20	18360	0	0	27	ereimer	Elma			\N	2016-06-20	2016-07-11	15614	46	\N	kochao	admin		\N	\N	ereimer	2016-06-20 09:31:25.755	7	15614	0	1
51390	1025	2016-06-30	5760	0	0	29	ereimer	Ship		404-4	\N	2016-06-30	2016-07-21	4564	40	\N	admin	0		\N	\N	ereimer	2016-07-01 14:28:03.941	4	4564	0	1
51392	1029	2016-07-04	17280	0	0	48	ereimer	Richard	fix 16920		\N	2016-07-04	2016-07-25	14500	84	\N	grodriguez	jquewell		\N	\N	ereimer	2016-07-04 08:18:27.425	2	14500	0	1
50029	1014	2015-03-05	0	1800	0	27	admin	nobody			\N	2015-03-05	\N	\N	\N	\N	\N	\N	\N	\N	\N	admin	2015-05-06 09:59:40.408	1	\N	\N	1
50008	1010	2015-03-02	0	5760	0	43	admin	nobody			\N	2015-03-02	\N	\N	\N	\N	\N	\N	\N	\N	\N	admin	2015-05-06 08:15:08.897	1	\N	\N	1
50009	1011	2015-03-02	0	8640	0	38	admin	nobody			\N	2015-03-02	\N	\N	\N	\N	\N	\N	\N	\N	\N	admin	2015-05-06 08:15:44.85	1	\N	\N	1
50011	1013	2015-03-02	0	8640	0	29	admin	nobody			\N	2015-03-02	\N	\N	\N	\N	\N	\N	\N	\N	\N	admin	2015-05-06 08:18:33.397	1	\N	\N	1
50002	1004	2015-03-02	3240	0	0	68	admin	Timmy			\N	2015-03-02	2015-03-23	1800	241	\N	icarrias	jquewell		\N	\N	admin	2015-05-05 17:13:01.443	1	1800	0	1
50003	1005	2015-03-02	2700	0	0	65	admin	Otto			\N	2015-03-02	2015-03-23	1495	70	\N	gcano	zalegria		\N	\N	admin	2015-05-05 17:14:10.115	1	1495	0	1
50005	1007	2015-03-02	4320	0	0	67	admin	Anton			\N	2015-03-02	2015-03-23	3312	179	\N	jquewell	grodriguez		\N	\N	admin	2015-05-06 08:11:41.054	1	3312	0	1
50006	1008	2015-03-02	14400	0	0	62	admin	Abe			\N	2015-03-02	2015-03-23	11186	287	\N	jquewell	grodriguez		\N	\N	admin	2015-05-06 08:12:07.882	1	11186	0	1
50007	1009	2015-03-02	9720	0	0	46	admin	Leo			\N	2015-03-02	2015-03-23	7414	132	\N	jquewell	grodriguez		\N	\N	admin	2015-05-06 08:14:36.663	1	7414	0	1
50010	1012	2015-03-02	9900	0	0	35	admin	Paul			\N	2015-03-02	2015-03-23	8526	73	\N	jquewell	grodriguez		\N	\N	admin	2015-05-06 08:16:48.772	1	8526	0	1
50012	1014	2015-03-02	1080	0	0	26	admin	Kenton			\N	2015-03-02	2015-03-23	733	4	\N	gcano	zalegria		\N	\N	admin	2015-05-06 08:19:53.569	1	733	0	1
50013	1025	2015-03-02	12600	0	0	38	admin	Ship		400-1	\N	2015-03-02	2015-03-23	10328	148	\N	wcabb	0		\N	\N	admin	2015-05-06 08:35:47.569	1	10328	0	1
50014	1025	2015-03-02	12600	0	0	38	admin	Ship		400-2	\N	2015-03-02	2015-03-23	10504	134	\N	jquewell	zalegria		\N	\N	admin	2015-05-06 08:37:31.007	1	10504	0	1
50015	1025	2015-03-02	12600	0	0	33	admin	Ship		518-1	\N	2015-03-02	2015-03-23	9356	124	\N	jquewell	grodriguez		\N	\N	admin	2015-05-06 08:38:12.225	1	9356	0	1
50016	1025	2015-03-02	12240	0	0	33	admin	Ship		518-2	\N	2015-03-02	2015-03-23	7491	219	\N	jquewell	zalegria		\N	\N	admin	2015-05-06 08:38:42.444	1	7491	0	1
50017	1025	2015-03-02	11160	0	0	28	admin	Ship		519-1	\N	2015-03-02	2015-03-23	8141	76	\N	jquewell	grodriguez		\N	\N	admin	2015-05-06 08:39:19.444	1	8141	0	1
50022	1007	2015-03-05	0	4320	0	58	admin	nobody			\N	2015-03-05	\N	\N	\N	\N	\N	\N	\N	\N	\N	admin	2015-05-06 09:56:02.142	1	\N	\N	1
50027	1012	2015-03-05	0	10080	0	36	admin	nobody			\N	2015-03-05	\N	\N	\N	\N	\N	\N	\N	\N	\N	admin	2015-05-06 09:58:59.846	1	\N	\N	1
50018	1026	2015-03-05	7740	0	0	29	jguenther	Marilyn			\N	2015-03-05	2015-03-26	3300	85	\N	wcabb	0		\N	\N	admin	2015-05-06 09:49:24.174	2	6610	3310	2
50019	1004	2015-03-05	1800	180	0	69	jguenther	Timmy			\N	2015-03-05	2015-03-26	1020	88	\N	icarrias	gcano		\N	\N	admin	2015-05-06 09:50:27.408	1	1020	0	1
50020	1005	2015-03-05	2520	360	0	66	cmanzanero	Otto			\N	2015-03-05	2015-03-26	1366	117	\N	icarrias	gcano		\N	\N	admin	2015-05-06 09:53:29.861	1	1366	0	1
50021	1006	2015-03-05	4320	5220	0	58	cmanzanero	Peter			\N	2015-03-05	2015-03-26	3109	172	\N	icarrias	gcano		\N	\N	admin	2015-05-06 09:54:06.924	1	3109	0	1
50023	1008	2015-03-05	12960	0	0	53	cmanzanero	Son			\N	2015-03-05	2015-03-26	10693	168	\N	gcano	mcarrias		\N	\N	admin	2015-05-06 09:56:41.517	1	10693	0	1
50025	1010	2015-03-05	4320	7560	0	44	cmanzanero	Marilyn			\N	2015-03-05	2015-03-26	3679	90	\N	gcano	grodriguez		\N	\N	admin	2015-05-06 09:57:55.408	1	3679	0	1
50026	1011	2015-03-05	6480	10440	0	39	cmanzanero	Allan			\N	2015-03-05	2015-03-26	5374	156	\N	wcabb	grodriguez		\N	\N	admin	2015-05-06 09:58:23.705	1	5374	0	1
50028	1013	2015-03-05	6480	12600	0	30	cmanzanero	Leo			\N	2015-03-05	2015-03-26	5450	58	\N	jquewell	kochao		\N	\N	admin	2015-05-06 09:59:20.908	1	5450	0	1
50031	1025	2015-03-05	2520	0	0	40	admin	Ship		516-1	\N	2015-03-05	2015-03-26	1922	80	\N	jquewell	kochao		\N	\N	admin	2015-05-06 10:04:15.642	1	1922	0	1
50035	1025	2015-03-05	16200	0	0	35	admin	Ship		500-2	\N	2015-03-05	2015-03-26	11840	469	\N	gcano	0		\N	\N	admin	2015-05-06 10:06:55.236	1	11840	0	1
50036	1025	2015-03-05	2880	0	0	35	admin	Ship		500-3	\N	2015-03-05	2015-03-26	2172	63	\N	gcano	alopez		\N	\N	admin	2015-05-06 10:07:13.549	1	2172	0	1
50067	1013	2015-03-16	13320	0	0	31	admin	Leo			\N	2015-03-16	2015-04-06	10190	323	\N	gcano	kochao		\N	\N	dthiessen	2015-05-07 14:17:44.22	1	10190	0	1
50034	1025	2015-03-05	15840	0	0	34	admin	Ship	5 cases given to 518-1; Lot 50033	518-2	\N	2015-03-05	2015-03-26	11515	320	\N	wcabb	mcarrias		\N	\N	admin	2015-05-06 10:06:28.596	1	11515	0	1
50038	1004	2015-03-09	1620	0	0	69	admin	Timmy			\N	2015-03-09	2015-03-30	1003	56	\N	icarrias	0		\N	\N	dthiessen	2015-05-07 09:53:51.267	1	1003	0	1
50040	1006	2015-03-09	11880	0	0	58	admin	Peter			\N	2015-03-09	2015-03-30	8424	564	\N	gcano	0		\N	\N	dthiessen	2015-05-07 09:57:01.814	1	8424	0	1
50041	1007	2015-03-09	10080	0	0	58	admin	Tina			\N	2015-03-09	2015-03-30	7920	218	\N	jquewell	grodriguez		\N	\N	dthiessen	2015-05-07 09:57:51.017	1	7920	0	1
50042	1010	2015-03-09	14940	0	0	44	admin	Jake			\N	2015-03-09	2015-03-30	12632	104	\N	jquewell	grodriguez		\N	\N	dthiessen	2015-05-07 09:59:39.329	1	12632	0	1
50044	1012	2015-03-09	22500	0	0	36	admin	Paul			\N	2015-03-09	2015-03-30	18493	255	\N	jquewell	grodriguez		\N	\N	dthiessen	2015-05-07 10:16:53.126	1	18493	0	1
50045	1013	2015-03-09	25740	0	0	30	admin	Leo			\N	2015-03-09	2015-03-30	20139	469	\N	gcano	kochao		\N	\N	dthiessen	2015-05-07 10:30:59.142	1	20139	0	1
50037	1026	2015-03-09	10080	0	0	29	admin	Jake			\N	2015-03-09	2015-03-30	4212	30	\N	wcabb	0		\N	\N	dthiessen	2015-05-07 09:53:10.72	2	8447	4235	2
50048	1004	2015-03-12	900	0	0	70	admin	Timmy			\N	2015-03-12	2015-04-02	576	42	\N	gcano	agongora		\N	\N	dthiessen	2015-05-07 13:58:59.767	1	576	0	1
50049	1005	2015-03-12	2340	0	0	67	admin	otto			\N	2015-03-12	2015-04-02	1313	47	\N	icarrias	0		\N	\N	dthiessen	2015-05-07 13:59:29.532	1	1313	0	1
50050	1006	2015-03-12	4860	0	0	59	admin	Peter			\N	2015-03-12	2015-04-02	3586	166	\N	jquewell	kochao		\N	\N	dthiessen	2015-05-07 14:00:02.142	1	3586	0	1
50052	1010	2015-03-12	5580	0	0	45	admin	Marilyn			\N	2015-03-12	2015-04-02	4399	105	\N	jquewell	kochao		\N	\N	dthiessen	2015-05-07 14:01:33.642	1	4399	0	1
50053	1011	2015-03-12	8100	0	0	40	admin	Allan			\N	2015-03-12	2015-04-02	6560	125	\N	jquewell	kochao		\N	\N	dthiessen	2015-05-07 14:02:40.048	1	6560	0	1
50054	1012	2015-03-12	9540	0	0	37	admin	Paul			\N	2015-03-12	2015-04-02	7587	131	\N	wcabb	mcarrias		\N	\N	dthiessen	2015-05-07 14:03:47.611	1	7587	0	1
50047	1026	2015-03-12	7740	0	0	30	admin	Marilyn			\N	2015-03-12	2015-04-02	3257	20	\N	wcabb	0		\N	\N	dthiessen	2015-05-07 13:58:16.142	2	6538	3281	2
50056	1014	2015-03-12	8100	0	0	28	admin	Kenton			\N	2015-03-12	2015-04-02	6473	10	\N	gcano	alopez		\N	\N	dthiessen	2015-05-07 14:04:56.126	1	6473	0	1
50058	1004	2015-03-16	360	0	0	70	admin	Timmy			\N	2015-03-16	2015-04-06	228	23	\N	gcano	0		\N	\N	dthiessen	2015-05-07 14:07:24.923	1	228	0	1
50060	1005	2015-03-16	720	0	0	67	admin	Otto			\N	2015-03-16	2015-04-06	378	13	\N	gcano	0		\N	\N	dthiessen	2015-05-07 14:07:58.673	1	378	0	1
50063	1007	2015-03-16	6120	0	0	59	admin	Tina			\N	2015-03-16	2015-04-06	4335	460	\N	gcano	icarrias		\N	\N	dthiessen	2015-05-07 14:09:12.267	1	4335	0	1
50064	1010	2015-03-16	7560	0	0	45	admin	Jake			\N	2015-03-16	2015-04-06	6383	160	\N	jquewell	zalegria		\N	\N	dthiessen	2015-05-07 14:09:39.876	1	6383	0	1
50066	1012	2015-03-16	12960	0	0	45	admin	Paul			\N	2015-03-16	2015-04-06	10601	206	\N	wcabb	mcarrias		\N	\N	dthiessen	2015-05-07 14:17:11.97	1	10601	0	1
50057	1026	2015-03-16	10080	0	0	30	admin	Jake			\N	2015-03-16	2015-04-06	4368	30	\N	wcabb	0		\N	\N	dthiessen	2015-05-07 14:06:53.017	2	8515	4147	2
50068	1014	2015-03-16	12420	0	0	28	admin	Kenton			\N	2015-03-16	2015-04-06	10300	170	\N	wcabb	mcarrias		\N	\N	dthiessen	2015-05-07 14:18:24.111	1	10300	0	1
50001	1026	2015-03-02	10080	0	0	28	admin	Jake			\N	2015-03-02	2015-03-23	4230	25	\N	wcabb	0		\N	\N	admin	2015-05-05 17:10:57.568	2	8277	4047	2
50024	1009	2015-03-05	7020	0	0	47	cmanzanero	Leo			\N	2015-03-05	2015-03-26	5813	63	\N	jquewell	kochao		\N	\N	admin	2015-05-06 09:57:06.174	1	5813	0	1
50958	1028	2016-02-11	0	6300	0	32	dthiessen	me			\N	2016-02-11	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-02-19 09:28:17.934	2	\N	\N	1
50030	1025	2015-03-05	13680	0	0	42	admin	Ship		401-3	\N	2015-03-05	2015-03-26	10113	493	\N	jquewell	grodriguez		\N	\N	admin	2015-05-06 10:03:41.924	1	10113	0	1
50032	1025	2015-03-05	1440	0	0	40	admin	Ship		516-2	\N	2015-03-05	2015-03-26	1041	58	\N	jquewell	kochao		\N	\N	admin	2015-05-06 10:04:48.517	1	1041	0	1
50039	1005	2015-03-09	3600	0	0	66	admin	Otto			\N	2015-03-09	2015-03-30	1989	92	\N	grodriguez	alopez		\N	\N	dthiessen	2015-05-07 09:56:19.079	1	1989	0	1
50043	1011	2015-03-09	20880	0	0	39	admin	Allan			\N	2015-03-09	2015-03-30	16158	311	\N	jquewell	grodriguez		\N	\N	dthiessen	2015-05-07 10:02:29.407	1	16158	0	1
50046	1014	2015-03-09	9000	0	0	27	admin	Kenton			\N	2015-03-09	2015-03-30	6978	92	\N	wcabb	mcarrias		\N	\N	dthiessen	2015-05-07 10:31:50.689	1	6978	0	1
50051	1007	2015-03-12	4320	0	0	59	admin	Tina			\N	2015-03-12	2015-04-02	3395	175	\N	jquewell	kochao		\N	\N	dthiessen	2015-05-07 14:00:36.767	1	3395	0	1
50055	1013	2015-03-12	9720	0	0	31	admin	Leo			\N	2015-03-12	2015-04-02	7829	131	\N	gcano	0		\N	\N	dthiessen	2015-05-07 14:04:27.47	1	7829	0	1
50062	1006	2015-03-16	6480	0	0	59	admin	Peter			\N	2015-03-16	2015-04-06	4785	262	\N	gcano	kochao		\N	\N	dthiessen	2015-05-07 14:08:32.017	1	4785	0	1
50065	1011	2015-03-16	10620	0	0	40	admin	Allan			\N	2015-03-16	2015-04-06	8798	227	\N	wcabb	mcarrias		\N	\N	dthiessen	2015-05-07 14:16:05.329	1	8798	0	1
50959	1029	2016-02-11	0	10980	0	28	dthiessen	me			\N	2016-02-11	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-02-19 10:17:46.954	2	\N	\N	1
50076	1026	2015-03-19	5400	0	0	31	admin	Marilyn			\N	2015-03-19	2015-04-09	2409	20	\N	wcabb	0		\N	\N	dthiessen	2015-05-21 13:33:46.625	2	4722	2313	2
50069	1004	2015-03-19	180	0	0	71	admin	Timmy			\N	2015-03-19	2015-04-09	28	0	\N	icarrias	kochao		\N	\N	dthiessen	2015-05-21 13:25:32.609	1	28	0	1
50070	1006	2015-03-19	5040	0	0	60	admin	Peter			\N	2015-03-19	2015-04-09	4009	74	\N	grodriguez	kochao		\N	\N	dthiessen	2015-05-21 13:26:07.484	1	4009	0	1
50072	1010	2015-03-19	5400	0	0	46	admin	Marilyn			\N	2015-03-19	2015-04-09	4847	19	\N	grodriguez	zalegria		\N	\N	dthiessen	2015-05-21 13:27:16.343	1	4847	0	1
50073	1011	2015-03-19	8100	0	0	41	admin	Allan			\N	2015-03-19	2015-04-09	6440	218	\N	wcabb	jquewell		\N	\N	dthiessen	2015-05-21 13:27:38.359	1	6440	0	1
50074	1012	2015-03-19	11520	0	0	38	admin	Paul			\N	2015-03-19	2015-04-09	9407	108	\N	gcano	zalegria		\N	\N	dthiessen	2015-05-21 13:28:07.796	1	9407	0	1
50077	1014	2015-03-19	10620	0	0	29	admin	Kenton			\N	2015-03-19	2015-04-09	8930	97	\N	grodriguez	agongora		\N	\N	dthiessen	2015-05-21 13:34:08.046	1	8930	0	1
50078	1015	2015-03-19	1260	0	0	24	admin	Joe			\N	2015-03-19	2015-04-09	909	9	\N	grodriguez	agongora		\N	\N	dthiessen	2015-05-21 13:34:38.968	1	909	0	1
50080	1025	2015-03-19	3240	0	0	64	admin	ship		502-2	\N	2015-03-19	2015-04-09	2082	49	\N	icarrias	gcano		\N	\N	dthiessen	2015-05-21 13:43:59.5	1	2082	0	1
50081	1025	2015-03-19	12240	0	0	47	admin	ship		401-1	\N	2015-03-19	2015-04-09	9294	325	\N	wcabb	grodriguez		\N	\N	dthiessen	2015-05-21 13:45:42.343	1	9294	0	1
50082	1025	2015-03-19	9360	0	0	47	admin	ship		401-2	\N	2015-03-19	2015-04-09	6786	244	\N	gcano	kochao		\N	\N	dthiessen	2015-05-21 13:46:19.828	1	6786	0	1
50084	1025	2015-03-19	11520	0	0	44	admin	ship		401-4	\N	2015-03-19	2015-04-09	8474	378	\N	gcano	0		\N	\N	dthiessen	2015-05-21 13:48:11.109	1	8474	0	1
50085	1025	2015-03-19	4680	0	0	42	admin	ship		516-1	\N	2015-03-19	2015-04-09	2713	120	\N	jquewell	zalegria		\N	\N	dthiessen	2015-05-21 13:48:49.281	1	2713	0	1
50087	1025	2015-03-19	10080	0	0	37	admin	ship		500-2	\N	2015-03-19	2015-04-09	6385	221	\N	icarrias	zalegria		\N	\N	dthiessen	2015-05-21 13:49:57.39	1	6385	0	1
50094	1026	2015-03-23	11160	0	0	31	admin	jake			\N	2015-03-23	2015-04-13	4818	58	\N	wcabb	0		\N	\N	dthiessen	2015-05-21 13:53:42.484	2	9556	4738	2
50088	1006	2015-03-23	6660	0	0	60	admin	peter			\N	2015-03-23	2015-04-13	4608	161	\N	mcarrias	gcano		\N	\N	dthiessen	2015-05-21 13:51:15.89	1	4608	0	1
50089	1007	2015-03-23	5400	0	0	60	admin	Tina			\N	2015-03-23	2015-04-13	3846	258	\N	zalegria	0		\N	\N	dthiessen	2015-05-21 13:51:41.234	1	3846	0	1
50091	1011	2015-03-23	10620	0	0	41	admin	Allan			\N	2015-03-23	2015-04-13	8605	115	\N	mcarrias	gcano		\N	\N	dthiessen	2015-05-21 13:52:33.156	1	8605	0	1
50092	1012	2015-03-23	13320	0	0	38	admin	Paul			\N	2015-03-23	2015-04-13	10728	179	\N	jquewell	0		\N	\N	dthiessen	2015-05-21 13:53:00.312	1	10728	0	1
50093	1013	2015-03-23	13140	0	0	32	admin	Leo			\N	2015-03-23	2015-04-13	11235	121	\N	icarrias	mcarrias		\N	\N	dthiessen	2015-05-21 13:53:21.687	1	11235	0	1
50096	1015	2015-03-23	3960	0	0	24	admin	Joe			\N	2015-03-23	2015-04-13	3123	30	\N	gcano	mcarrias		\N	\N	dthiessen	2015-05-21 13:54:26.265	1	3123	0	1
50105	1026	2015-03-26	6840	0	0	32	admin	Marilyn			\N	2015-03-26	2015-04-16	2998	20	\N	admin	0		\N	\N	dthiessen	2015-05-21 13:59:32.453	2	5967	2969	2
50101	1010	2015-03-26	5580	0	0	47	admin	Marilyn			\N	2015-03-26	2015-04-16	4906	45	\N	gcano	0		\N	\N	dthiessen	2015-05-21 13:58:14.687	1	4906	0	1
50102	1011	2015-03-26	7740	0	0	42	admin	Allan			\N	2015-03-26	2015-04-16	6832	74	\N	jquewell	kochao		\N	\N	dthiessen	2015-05-21 13:58:35.187	1	6832	0	1
50103	1012	2015-03-26	11160	0	0	39	admin	Paul			\N	2015-03-26	2015-04-16	9342	164	\N	mcarrias	gcano		\N	\N	dthiessen	2015-05-21 13:58:52.453	1	9342	0	1
50104	1013	2015-03-26	9900	0	0	33	admin	Leo			\N	2015-03-26	2015-04-16	8553	71	\N	grodriguez	kochao		\N	\N	dthiessen	2015-05-21 13:59:12.734	1	8553	0	1
50107	1015	2015-03-26	5040	0	0	25	admin	Joe			\N	2015-03-26	2015-04-16	4096	29	\N	grodriguez	kochao		\N	\N	dthiessen	2015-05-21 14:00:02.218	1	4096	0	1
50114	1026	2015-03-30	5400	0	0	32	admin	Jake			\N	2015-03-30	2015-04-20	2360	0	\N	admin	0		\N	\N	dthiessen	2015-05-21 14:05:18.734	2	4682	2322	2
50108	1006	2015-03-30	5940	0	0	61	admin	Peter			\N	2015-03-30	2015-04-20	3925	368	\N	jquewell	zalegria		\N	\N	dthiessen	2015-05-21 14:03:25.828	1	3925	0	1
50110	1010	2015-03-30	7020	0	0	47	admin	Jake			\N	2015-03-30	2015-04-20	5928	100	\N	jquewell	zalegria		\N	\N	dthiessen	2015-05-21 14:04:01.734	1	5928	0	1
50111	1011	2015-03-30	10620	0	0	42	admin	Allan			\N	2015-03-30	2015-04-20	8508	222	\N	jquewell	zalegria		\N	\N	dthiessen	2015-05-21 14:04:20.968	1	8508	0	1
50113	1013	2015-03-30	13140	0	0	33	admin	leo			\N	2015-03-30	2015-04-20	11197	186	\N	jquewell	zalegria		\N	\N	dthiessen	2015-05-21 14:04:58.687	1	11197	0	1
50115	1014	2015-03-30	15480	0	0	30	admin	Kenton			\N	2015-03-30	2015-04-20	12282	164	\N	grodriguez	kochao		\N	\N	dthiessen	2015-05-21 14:05:37.39	1	12282	0	1
50116	1015	2015-03-30	9720	0	0	25	admin	Joe			\N	2015-03-30	2015-04-20	8054	88	\N	wcabb	gcano		\N	\N	dthiessen	2015-05-21 14:05:54.531	1	8054	0	1
50099	1006	2015-03-26	5040	0	0	61	admin	Peter			\N	2015-03-26	2015-04-16	3297	492	\N	kochao	grodriguez	split sort	\N	\N	dthiessen	2015-05-21 13:57:12.828	1	3297	0	1
50117	1006	2015-04-02	4140	0	0	62	admin	Peter			\N	2015-04-02	2015-04-23	3120	174	\N	jquewell	kochao		\N	\N	dthiessen	2015-05-21 14:07:25.625	1	3120	0	1
50118	1007	2015-04-02	4140	0	0	62	admin	Anton			\N	2015-04-02	2015-04-23	2990	194	\N	kochao	0		\N	\N	dthiessen	2015-05-21 14:07:45.421	1	2990	0	1
50120	1011	2015-04-02	7920	0	0	43	admin	Allan			\N	2015-04-02	2015-04-23	6429	73	\N	jquewell	kochao		\N	\N	dthiessen	2015-05-21 14:08:33.375	1	6429	0	1
50121	1012	2015-04-02	10260	0	0	40	admin	Paul			\N	2015-04-02	2015-04-23	8136	169	\N	jquewell	kochao		\N	\N	dthiessen	2015-05-21 14:08:53.484	1	8136	0	1
50122	1013	2015-04-02	9540	0	0	34	admin	Leo			\N	2015-04-02	2015-04-23	8222	80	\N	icarrias	zalegria		\N	\N	dthiessen	2015-05-21 14:09:51.14	1	8222	0	1
50124	1015	2015-04-02	6120	0	0	26	admin	Joe			\N	2015-04-02	2015-04-23	5294	60	\N	jquewell	kochao		\N	\N	dthiessen	2015-05-21 14:10:46.656	1	5294	0	1
50585	1026	2015-10-05	10080	180	0	59	admin	Linda			\N	2015-10-05	2015-10-26	3822	25	\N	admin	0		\N	\N	dthiessen	2015-10-05 11:08:02.769	2	7580	3758	2
50141	1012	2015-04-06	2520	0	2520	40	admin	Daughter			\N	2015-04-06	2015-04-27	2101	32	\N	wcabb	mcarrias		\N	\N	dthiessen	2015-05-21 14:43:54.812	1	2101	0	1
50033	1025	2015-03-05	19440	0	0	34	admin	Ship	5 cases belonged to 518-2; Lot 50034	518-1	\N	2015-03-05	2015-03-26	14260	190	\N	jquewell	grodriguez		\N	\N	admin	2015-05-06 10:05:46.892	1	14260	0	1
50166	1006	2015-04-13	2880	0	0	63	admin	peter			\N	2015-04-13	2015-05-04	1939	172	\N	zalegria	wcabb		\N	\N	dthiessen	2015-05-26 10:28:37.313	1	1939	0	1
50168	1010	2015-04-13	5220	0	0	49	admin	jake			\N	2015-04-13	2015-05-04	4298	89	\N	jquewell	cmanzanero		\N	\N	dthiessen	2015-05-26 10:30:05.001	1	4298	0	1
50169	1011	2015-04-13	8820	0	0	44	admin	allan			\N	2015-04-13	2015-05-04	7494	118	\N	jquewell	cmanzanero		\N	\N	dthiessen	2015-05-26 10:30:22.938	1	7494	0	1
50170	1012	2015-04-13	11160	0	0	41	admin	paul			\N	2015-04-13	2015-05-04	9063	205	\N	zalegria	kochao		\N	\N	dthiessen	2015-05-26 10:30:42.86	1	9063	0	1
50172	1014	2015-04-13	11880	0	0	32	admin	kenton			\N	2015-04-13	2015-05-04	9975	145	\N	jquewell	cmanzanero		\N	\N	dthiessen	2015-05-26 10:31:20.891	1	9975	0	1
50173	1015	2015-04-13	14760	0	0	27	admin	Joe			\N	2015-04-13	2015-05-04	12914	188	\N	grodriguez	kochao		\N	\N	dthiessen	2015-05-26 10:31:38.704	1	12914	0	1
50175	1010	2015-04-16	5580	0	0	50	admin	marilyn			\N	2015-04-16	2015-05-07	4625	49	\N	gcano	zalegria		\N	\N	dthiessen	2015-05-26 10:35:15.61	1	4625	0	1
50176	1011	2015-04-16	7920	0	0	45	admin	Allan			\N	2015-04-16	2015-05-07	6575	73	\N	gcano	zalegria		\N	\N	dthiessen	2015-05-26 10:35:30.344	1	6575	0	1
50177	1012	2015-04-16	9900	0	0	42	admin	Paul			\N	2015-04-16	2015-05-07	8020	130	\N	wcabb	mcarrias		\N	\N	dthiessen	2015-05-26 10:35:49.782	1	8020	0	1
50178	1013	2015-04-16	9360	0	0	36	admin	leo			\N	2015-04-16	2015-05-07	7939	98	\N	wcabb	nreimer		\N	\N	dthiessen	2015-05-26 10:36:03.876	1	7939	0	1
50180	1015	2015-04-16	12420	0	0	28	admin	Joe			\N	2015-04-16	2015-05-07	10995	127	\N	jquewell	kochao		\N	\N	dthiessen	2015-05-26 10:36:34.485	1	10995	0	1
50181	1025	2015-04-16	5040	0	0	60	admin	ship		515	\N	2015-04-16	2015-05-07	2582	111	\N	wcabb	nreimer		\N	\N	dthiessen	2015-05-26 10:38:06.032	1	2582	0	1
50183	1025	2015-04-16	6120	0	0	45	admin	ship		400-2	\N	2015-04-16	2015-05-07	4778	74	\N	gcano	zalegria		\N	\N	dthiessen	2015-05-26 10:38:58.798	1	4778	0	1
50184	1025	2015-04-16	7560	0	0	42	admin	ship		407-1	\N	2015-04-16	2015-05-07	5866	141	\N	jquewell	kochao		\N	\N	dthiessen	2015-05-26 10:39:15.344	1	5866	0	1
50185	1025	2015-04-16	7200	0	0	49	admin	ship		400-3	\N	2015-04-16	2015-05-07	5701	87	\N	jquewell	kochao		\N	\N	dthiessen	2015-05-26 10:39:40.001	1	5701	0	1
50187	1025	2015-04-16	7200	0	0	35	admin	ship		400-5	\N	2015-04-16	2015-05-07	5582	83	\N	gcano	zalegria		\N	\N	dthiessen	2015-05-26 10:40:19.876	1	5582	0	1
50188	1025	2015-04-16	4320	0	0	35	admin	ship		400-6	\N	2015-04-16	2015-05-07	3497	21	\N	jquewell	kochao		\N	\N	dthiessen	2015-05-26 10:40:43.454	1	3497	0	1
50190	1025	2015-04-16	5400	0	0	35	admin	ship		520-2	\N	2015-04-16	2015-05-07	4063	85	\N	wcabb	nreimer		\N	\N	dthiessen	2015-05-26 10:41:32.735	1	4063	0	1
50191	1025	2015-04-16	2520	0	0	26	admin	ship		402-1	\N	2015-04-16	2015-05-07	1786	136	\N	jquewell	kochao		\N	\N	dthiessen	2015-05-26 10:41:54.454	1	1786	0	1
50192	1026	2015-04-20	5400	0	0	35	admin	jake			\N	2015-04-20	2015-05-11	2352	30	\N	admin	0		\N	\N	dthiessen	2015-05-26 10:43:46.266	2	2581	229	2
50125	1006	2015-04-02	1440	0	1440	62	admin	Peter			\N	2015-04-02	2015-04-23	1085	60	\N	jquewell	kochao		\N	\N	dthiessen	2015-05-21 14:11:40.625	1	1085	0	1
50126	1007	2015-04-02	1260	0	1260	62	admin	tina			\N	2015-04-02	2015-04-23	910	59	\N	kochao	0		\N	\N	dthiessen	2015-05-21 14:12:08.437	1	910	0	1
50127	1010	2015-04-02	1260	0	1260	48	admin	Jake			\N	2015-04-02	2015-04-23	1014	13	\N	jquewell	kochao		\N	\N	dthiessen	2015-05-21 14:12:39.5	1	1014	0	1
50128	1011	2015-04-02	1800	0	1800	43	admin	Allan			\N	2015-04-02	2015-04-23	1461	16	\N	jquewell	kochao		\N	\N	dthiessen	2015-05-21 14:13:00.234	1	1461	0	1
50130	1013	2015-04-02	3240	0	3240	34	admin	Leo			\N	2015-04-02	2015-04-23	2792	27	\N	icarrias	zalegria		\N	\N	dthiessen	2015-05-21 14:13:47.046	1	2792	0	1
50131	1014	2015-04-02	3420	0	3420	31	admin	Kenton			\N	2015-04-02	2015-04-23	2783	22	\N	icarrias	zalegria		\N	\N	dthiessen	2015-05-21 14:14:19.89	1	2783	0	1
50133	1006	2015-04-06	5040	0	0	62	admin	Peter			\N	2015-04-06	2015-04-27	3604	160	\N	gcano	jquewell		\N	\N	dthiessen	2015-05-21 14:39:11.453	1	3604	0	1
50134	1007	2015-04-06	4320	0	0	62	admin	Tina			\N	2015-04-06	2015-04-27	3076	169	\N	gcano	icarrias		\N	\N	dthiessen	2015-05-21 14:39:44.984	1	3076	0	1
50135	1010	2015-04-06	5760	0	0	48	admin	Jake			\N	2015-04-06	2015-04-27	4958	62	\N	nreimer	zalegria		\N	\N	dthiessen	2015-05-21 14:40:21.14	1	4958	0	1
50137	1012	2015-04-06	11340	0	0	40	admin	Paul			\N	2015-04-06	2015-04-27	9454	145	\N	wcabb	mcarrias		\N	\N	dthiessen	2015-05-21 14:40:54.921	1	9454	0	1
50138	1013	2015-04-06	9720	0	0	34	admin	Leo			\N	2015-04-06	2015-04-27	8379	83	\N	wcabb	mcarrias		\N	\N	dthiessen	2015-05-21 14:42:53.765	1	8379	0	1
50142	1014	2015-04-06	3600	0	3600	31	admin	Kenton			\N	2015-04-06	2015-04-27	3013	17	\N	nreimer	0		\N	\N	dthiessen	2015-05-21 14:44:28.453	1	3013	0	1
50140	1015	2015-04-06	11520	0	0	26	admin	Joe			\N	2015-04-06	2015-04-27	9888	105	\N	grodriguez	kochao		\N	\N	dthiessen	2015-05-21 14:43:29.984	1	9888	0	1
50143	1026	2015-04-09	3600	0	0	34	admin	Jake			\N	2015-04-09	2015-04-30	1144	50	\N	admin	0		\N	\N	dthiessen	2015-05-21 15:41:10.14	2	2219	1075	2
50157	1006	2015-04-09	1260	0	1260	63	admin	peter			\N	2015-04-09	2015-04-30	865	49	\N	icarrias	mcarrias		\N	\N	dthiessen	2015-05-26 10:23:11.251	1	865	0	1
50145	1007	2015-04-09	4320	0	0	63	admin	Tina			\N	2015-04-09	2015-04-30	2092	645	\N	gcano	alopez		\N	\N	dthiessen	2015-05-26 10:15:41.391	1	2092	0	1
50159	1010	2015-04-09	1800	0	1800	49	admin	Marilyn			\N	2015-04-09	2015-04-30	1528	36	\N	jquewell	kochao		\N	\N	dthiessen	2015-05-26 10:23:59.235	1	1528	0	1
50158	1007	2015-04-09	1080	0	1080	63	admin	Tina			\N	2015-04-09	2015-04-30	523	161	\N	gcano	alopez		\N	\N	dthiessen	2015-05-26 10:23:35.329	1	523	0	1
50147	1011	2015-04-09	8100	0	0	44	admin	allan			\N	2015-04-09	2015-04-30	6797	172	\N	wcabb	mcarrias		\N	\N	dthiessen	2015-05-26 10:16:25.907	1	6797	0	1
50160	1011	2015-04-09	1800	0	1800	44	admin	allan			\N	2015-04-09	2015-04-30	1511	38	\N	wcabb	mcarrias		\N	\N	dthiessen	2015-05-26 10:24:26.298	1	1511	0	1
50161	1012	2015-04-09	2160	0	2160	41	admin	Paul			\N	2015-04-09	2015-04-30	1760	43	\N	jquewell	gcano		\N	\N	dthiessen	2015-05-26 10:24:49.876	1	1760	0	1
50149	1013	2015-04-09	9540	0	0	35	admin	Leo			\N	2015-04-09	2015-04-30	8069	142	\N	jquewell	kochao		\N	\N	dthiessen	2015-05-26 10:16:59.251	1	8069	0	1
50162	1013	2015-04-09	3240	0	3240	35	admin	leo			\N	2015-04-09	2015-04-30	2741	48	\N	jquewell	kochao		\N	\N	dthiessen	2015-05-26 10:26:03.126	1	2741	0	1
50163	1014	2015-04-09	3600	0	3600	32	admin	kenton			\N	2015-04-09	2015-04-30	2952	25	\N	wcabb	mcarrias		\N	\N	dthiessen	2015-05-26 10:26:25.173	1	2952	0	1
50151	1015	2015-04-09	10980	0	0	27	admin	Joe			\N	2015-04-09	2015-04-30	9677	71	\N	gcano	zalegria		\N	\N	dthiessen	2015-05-26 10:18:51.579	1	9677	0	1
50164	1015	2015-04-09	3780	0	3780	27	admin	Joe			\N	2015-04-09	2015-04-30	3331	25	\N	gcano	zalegria		\N	\N	dthiessen	2015-05-26 10:27:02.094	1	3331	0	1
50153	1024	2015-04-09	17280	0	0	50	admin	fly in		25	\N	2015-04-09	2015-04-30	11778	461	\N	wcabb	mcarrias		\N	\N	dthiessen	2015-05-26 10:21:12.782	1	11778	0	1
50152	1024	2015-04-09	14400	0	0	57	admin	ship		274	\N	2015-04-09	2015-04-30	8230	230	\N	wcabb	mcarrias		\N	\N	dthiessen	2015-05-26 10:20:30.923	1	8230	0	1
50154	1024	2015-04-09	11880	0	0	47	admin	fly in 		924	\N	2015-04-09	2015-04-30	9251	94	\N	jquewell	kochao		\N	\N	dthiessen	2015-05-26 10:21:45.844	1	9251	0	1
50960	1017	2016-02-18	0	7020	0	63	dthiessen	me			\N	2016-02-18	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-02-19 10:20:37.083	4	\N	\N	1
50195	1011	2015-04-20	10440	0	0	45	admin	allan			\N	2015-04-20	2015-05-11	3531	130	\N	jquewell	0		\N	\N	dthiessen	2015-05-26 10:44:35.813	1	3531	0	1
50196	1012	2015-04-20	13320	0	0	42	admin	paul			\N	2015-04-20	2015-05-11	10912	141	\N	grodriguez	kochao		\N	\N	dthiessen	2015-05-26 10:44:52.282	1	10912	0	1
50198	1014	2015-04-20	15480	0	0	33	admin	kenton			\N	2015-04-20	2015-05-11	13172	205	\N	icarrias	mcarrias		\N	\N	dthiessen	2015-05-26 10:45:21.954	1	13172	0	1
50199	1015	2015-04-20	17640	0	0	28	admin	Joe			\N	2015-04-20	2015-05-11	15613	152	\N	wcabb	mcarrias		\N	\N	dthiessen	2015-05-26 10:45:38.032	1	15613	0	1
50200	1026	2015-04-23	2880	0	0	36	admin	jake			\N	2015-04-23	2015-05-14	1272	0	\N	admin	0		\N	\N	dthiessen	2015-05-26 10:48:00.548	2	2523	1251	2
50202	1010	2015-04-23	5400	0	0	51	admin	jake			\N	2015-04-23	2015-05-14	4595	126	\N	wcabb	mcarrias		\N	\N	dthiessen	2015-05-26 10:48:29.298	1	4595	0	1
50203	1011	2015-04-23	7560	0	0	46	admin	allan			\N	2015-04-23	2015-05-14	6139	115	\N	wcabb	mcarrias		\N	\N	dthiessen	2015-05-26 10:48:43.548	1	6139	0	1
50204	1012	2015-04-23	9540	0	0	43	admin	paul			\N	2015-04-23	2015-05-14	7758	78	\N	grodriguez	kochao		\N	\N	dthiessen	2015-05-26 10:49:04.204	1	7758	0	1
50206	1014	2015-04-23	11340	0	0	34	admin	kenton			\N	2015-04-23	2015-05-14	9158	122	\N	grodriguez	kochao		\N	\N	dthiessen	2015-05-26 10:49:49.36	1	9158	0	1
50207	1015	2015-04-23	12420	0	0	29	admin	joe			\N	2015-04-23	2015-05-14	10860	136	\N	icarrias	jquewell		\N	\N	dthiessen	2015-05-26 10:50:00.969	1	10860	0	1
50209	1024	2015-04-23	10440	0	0	48	admin	ship		325	\N	2015-04-23	2015-05-14	6850	164	\N	icarrias	mcarrias		\N	\N	dthiessen	2015-05-26 10:51:36.641	1	6850	0	1
50210	1024	2015-04-23	14400	0	0	38	admin	ship		35	\N	2015-04-23	2015-05-14	8277	317	\N	icarrias	jquewell		\N	\N	dthiessen	2015-05-26 10:52:01.094	1	8277	0	1
50211	1024	2015-04-23	14400	0	0	37	admin	ship		146	\N	2015-04-23	2015-05-14	11976	102	\N	wcabb	mcarrias		\N	\N	dthiessen	2015-05-26 10:52:17.86	1	11976	0	1
50213	1026	2015-04-27	7920	0	0	36	admin	jake			\N	2015-04-27	2015-05-18	3249	60	\N	admin	0		\N	\N	dthiessen	2015-05-26 10:53:36.126	2	6339	3090	2
50214	1007	2015-04-27	5400	0	0	65	admin	tina			\N	2015-04-27	2015-05-18	3440	270	\N	icarrias	kochao		\N	\N	dthiessen	2015-05-26 10:53:46.501	1	3440	0	1
50215	1010	2015-04-27	6480	0	0	51	admin	jake			\N	2015-04-27	2015-05-18	5487	83	\N	grodriguez	zalegria		\N	\N	dthiessen	2015-05-26 10:53:58.438	1	5487	0	1
50217	1012	2015-04-27	12960	0	0	43	admin	paul			\N	2015-04-27	2015-05-18	10121	227	\N	icarrias	kochao		\N	\N	dthiessen	2015-05-26 10:54:26.641	1	10121	0	1
50218	1013	2015-04-27	12420	0	0	37	admin	leo			\N	2015-04-27	2015-05-18	9973	185	\N	grodriguez	zalegria		\N	\N	dthiessen	2015-05-26 10:54:40.407	1	9973	0	1
50220	1015	2015-04-27	4140	0	0	29	admin	joe			\N	2015-04-27	2015-05-18	3751	38	\N	wcabb	jquewell		\N	\N	dthiessen	2015-05-26 10:55:16.048	1	3751	0	1
50221	1007	2015-04-30	4320	0	0	66	admin	tina			\N	2015-04-30	2015-05-21	2820	310	\N	grodriguez	zalegria		\N	\N	dthiessen	2015-05-26 10:55:44.329	1	2820	0	1
50222	1010	2015-04-30	5040	0	0	52	admin	marilyn			\N	2015-04-30	2015-05-21	4255	77	\N	jquewell	kochao		\N	\N	dthiessen	2015-05-26 10:56:07.907	1	4255	0	1
50224	1014	2015-04-30	10620	0	0	35	admin	Kenton			\N	2015-04-30	2015-05-21	8507	91	\N	grodriguez	zalegria		\N	\N	dthiessen	2015-05-26 10:57:15.688	1	8507	0	1
50225	1025	2015-04-30	5760	0	0	61	admin	ship		404-3	\N	2015-04-30	2015-05-21	3653	131	\N	kochao	alopez		\N	\N	dthiessen	2015-05-26 10:58:32.907	1	3653	0	1
50226	1025	2015-04-30	3960	0	0	61	admin	ship		404-4	\N	2015-04-30	2015-05-21	2642	110	\N	nreimer	kochao		\N	\N	dthiessen	2015-05-26 10:58:52.673	1	2642	0	1
50228	1025	2015-04-30	15840	0	0	47	admin	ship		400-2	\N	2015-04-30	2015-05-21	12362	388	\N	grodriguez	zalegria		\N	\N	dthiessen	2015-05-26 10:59:23.579	1	12362	0	1
50229	1025	2015-04-30	15120	0	0	44	admin	ship		407-1	\N	2015-04-30	2015-05-21	9558	160	\N	grodriguez	zalegria		\N	\N	dthiessen	2015-05-26 10:59:40.969	1	9558	0	1
50232	1025	2015-04-30	3600	0	0	27	admin	ship		403-4	\N	2015-04-30	2015-05-21	2858	49	\N	jguenther	zalegria		\N	\N	dthiessen	2015-05-26 11:00:43.251	1	2858	0	1
50230	1025	2015-04-30	12600	0	0	44	admin	ship		407-2	\N	2015-04-30	2015-05-21	10071	264	\N	grodriguez	alopez		\N	\N	dthiessen	2015-05-26 10:59:59.751	1	10071	0	1
50239	1026	2015-05-07	8280	0	0	38	admin	Marilyn			\N	2015-05-07	2015-05-28	3324	0	\N	admin	0		\N	\N	dthiessen	2015-05-26 11:03:41.313	2	6570	3246	2
50233	1026	2015-05-04	9360	0	0	37	admin	jake			\N	2015-05-04	2015-05-25	3916	45	\N	admin	0		\N	\N	dthiessen	2015-05-26 11:01:24.204	2	7602	3686	2
50234	1007	2015-05-04	5400	0	0	66	admin	tina			\N	2015-05-04	2015-05-25	3616	197	\N	gcano	alopez		\N	\N	dthiessen	2015-05-26 11:01:34.657	1	3616	0	1
50235	1010	2015-05-04	6300	0	0	52	admin	jake			\N	2015-05-04	2015-05-25	4994	78	\N	jquewell	grodriguez		\N	\N	dthiessen	2015-05-26 11:01:46.516	1	4994	0	1
50236	1012	2015-05-04	12600	0	0	44	admin	Paul			\N	2015-05-04	2015-05-25	9299	168	\N	grodriguez	kochao		\N	\N	dthiessen	2015-05-26 11:02:45.344	1	9299	0	1
50237	1014	2015-05-04	13860	0	0	35	admin	kenton			\N	2015-05-04	2015-05-25	10906	116	\N	wcabb	mcarrias		\N	\N	dthiessen	2015-05-26 11:03:04.141	1	10906	0	1
50238	1016	2015-05-04	540	0	0	77	admin	timmy			\N	2015-05-04	2015-05-25	358	0	\N	grodriguez	kochao		\N	\N	dthiessen	2015-05-26 11:03:20.969	1	358	0	1
50240	1007	2015-05-07	3960	0	0	67	admin	tina			\N	2015-05-07	2015-05-28	2875	153	\N	wcabb	mcarrias		\N	\N	dthiessen	2015-05-26 11:03:53.157	1	2875	0	1
50241	1010	2015-05-07	5040	0	0	53	admin	marilyn 			\N	2015-05-07	2015-05-28	4141	43	\N	grodriguez	kochao		\N	\N	dthiessen	2015-05-26 11:04:06.532	1	4141	0	1
50242	1012	2015-05-07	9540	0	0	45	admin	Paul			\N	2015-05-07	2015-05-28	7444	53	\N	wcabb	mcarrias		\N	\N	dthiessen	2015-05-26 11:04:22.438	1	7444	0	1
50245	1025	2015-05-07	8640	0	0	63	admin	ship		404-3/4	\N	2015-05-07	2015-05-28	6178	228	\N	wcabb	mcarrias		\N	\N	dthiessen	2015-05-26 11:08:04.548	1	6178	0	1
50246	1025	2015-05-07	11520	0	0	57	admin	air		405-1/2	\N	2015-05-07	2015-05-28	8818	195	\N	wcabb	mcarrias		\N	\N	dthiessen	2015-05-26 11:08:36.61	1	8818	0	1
50248	1025	2015-05-07	12240	0	0	52	admin	air		401-3/4	\N	2015-05-07	2015-05-28	9817	122	\N	wcabb	mcarrias		\N	\N	dthiessen	2015-05-26 11:12:02.094	1	9817	0	1
50249	1025	2015-05-07	12960	0	0	34	admin	air		402-3/4	\N	2015-05-07	2015-05-28	11556	69	\N	zalegria	nreimer		\N	\N	dthiessen	2015-05-26 11:12:38.251	1	11556	0	1
50250	1025	2015-05-07	15120	0	0	29	admin	air		403-3/4	\N	2015-05-07	2015-05-28	12977	69	\N	jquewell	zalegria		\N	\N	dthiessen	2015-05-26 11:13:00.032	1	12977	0	1
50252	1007	2015-05-11	5220	0	0	67	admin	tina			\N	2015-05-11	2015-06-01	3312	288	\N	grodriguez	kochao		\N	\N	dthiessen	2015-05-26 11:13:37.751	1	3312	0	1
50253	1010	2015-05-11	6480	0	0	53	admin	jake			\N	2015-05-11	2015-06-01	5200	122	\N	grodriguez	kochao		\N	\N	dthiessen	2015-05-26 11:13:50.704	1	5200	0	1
50254	1012	2015-05-11	12780	0	0	45	admin	Paul			\N	2015-05-11	2015-06-01	9907	186	\N	wcabb	grodriguez		\N	\N	dthiessen	2015-05-26 11:14:21.094	1	9907	0	1
50257	1026	2015-05-14	6120	0	0	39	admin	Marlilyn			\N	2015-05-14	2015-06-04	2595	85	\N	jquewell	grodriguez		\N	\N	dthiessen	2015-05-26 11:15:28.954	2	4886	2291	2
50258	1007	2015-05-14	3960	0	0	68	admin	tina			\N	2015-05-14	2015-06-04	2830	125	\N	wcabb	mcarrias		\N	\N	dthiessen	2015-05-26 11:15:40.813	1	2830	0	1
50259	1010	2015-05-14	4860	0	0	54	admin	marilyn			\N	2015-05-14	2015-06-04	4048	74	\N	wcabb	mcarrias		\N	\N	dthiessen	2015-05-26 11:15:58.282	1	4048	0	1
50261	1014	2015-05-14	10800	0	0	37	admin	kenton			\N	2015-05-14	2015-06-04	8798	99	\N	wcabb	mcarrias		\N	\N	dthiessen	2015-05-26 11:16:34.282	1	8798	0	1
50263	1025	2015-05-14	6120	0	0	52	admin	ship		401-3	\N	2015-05-14	2015-06-04	5152	136	\N	wcabb	mcarrias		\N	\N	dthiessen	2015-05-26 11:17:13.36	1	5152	0	1
50071	1007	2015-03-19	3960	0	0	60	admin	Anton			\N	2015-03-19	2015-04-09	3140	108	\N	grodriguez	alopez		\N	\N	dthiessen	2015-05-21 13:26:39.515	1	3140	0	1
50075	1013	2015-03-19	9900	0	0	32	admin	Leo			\N	2015-03-19	2015-04-09	8223	123	\N	wcabb	jquewell		\N	\N	dthiessen	2015-05-21 13:33:17.968	1	8223	0	1
50079	1025	2015-03-19	4320	0	0	64	admin	ship		501-1	\N	2015-03-19	2015-04-09	2867	84	\N	grodriguez	agongora		\N	\N	dthiessen	2015-05-21 13:42:58.734	1	2867	0	1
50083	1025	2015-03-19	11520	0	0	44	admin	ship		401-3	\N	2015-03-19	2015-04-09	9144	191	\N	gcano	zalegria		\N	\N	dthiessen	2015-05-21 13:47:26.125	1	9144	0	1
50086	1025	2015-03-19	5040	0	0	42	admin	ship		516-2	\N	2015-03-19	2015-04-09	4044	802	\N	wcabb	grodriguez		\N	\N	dthiessen	2015-05-21 13:49:19.843	1	4044	0	1
50090	1010	2015-03-23	7200	0	0	46	admin	Jake			\N	2015-03-23	2015-04-13	6098	138	\N	mcarrias	wcabb		\N	\N	dthiessen	2015-05-21 13:52:06.281	1	6098	0	1
50095	1014	2015-03-23	14940	0	0	29	admin	Kenton			\N	2015-03-23	2015-04-13	12626	134	\N	mcarrias	gcano		\N	\N	dthiessen	2015-05-21 13:54:03.859	1	12626	0	1
50100	1007	2015-03-26	4320	0	0	61	admin	Anton			\N	2015-03-26	2015-04-16	3289	50	\N	grodriguez	kochao		\N	\N	dthiessen	2015-05-21 13:57:49.828	1	3289	0	1
50106	1014	2015-03-26	11520	0	0	30	admin	Kenton			\N	2015-03-26	2015-04-16	9591	57	\N	gcano	0		\N	\N	dthiessen	2015-05-21 13:59:47.5	1	9591	0	1
50109	1007	2015-03-30	5760	0	0	61	admin	Anton			\N	2015-03-30	2015-04-20	3969	240	\N	grodriguez	kochao		\N	\N	dthiessen	2015-05-21 14:03:41.109	1	3969	0	1
50112	1012	2015-03-30	12960	0	0	39	admin	Paul			\N	2015-03-30	2015-04-20	10688	149	\N	wcabb	gcano		\N	\N	dthiessen	2015-05-21 14:04:37.89	1	10688	0	1
50165	1026	2015-04-13	7200	0	0	34	admin	Jake			\N	2015-04-13	2015-05-04	3040	23	\N	admin	0		\N	\N	dthiessen	2015-05-26 10:28:20.548	2	5907	2867	2
50167	1007	2015-04-13	4320	0	0	63	admin	tina			\N	2015-04-13	2015-05-04	2919	211	\N	zalegria	alopez		\N	\N	dthiessen	2015-05-26 10:28:48.141	1	2919	0	1
50171	1013	2015-04-13	9720	0	0	35	admin	leo			\N	2015-04-13	2015-05-04	8260	156	\N	wcabb	zalegria		\N	\N	dthiessen	2015-05-26 10:31:05.813	1	8260	0	1
50174	1007	2015-04-16	4320	0	0	64	admin	tina			\N	2015-04-16	2015-05-07	3070	162	\N	gcano	agongora		\N	\N	dthiessen	2015-05-26 10:34:54.251	1	3070	0	1
50179	1014	2015-04-16	11880	0	0	33	admin	kenton			\N	2015-04-16	2015-05-07	10100	182	\N	jquewell	kochao		\N	\N	dthiessen	2015-05-26 10:36:14.548	1	10100	0	1
50298	1025	2015-04-16	7560	0	0	42	admin	SHIP		407-2	\N	2015-04-16	2015-05-07	5979	7	\N	gcano	zalegria		\N	\N	dthiessen	2015-05-26 14:27:07.079	1	5979	0	1
50186	1025	2015-04-16	7200	0	0	39	admin	ship		400-4	\N	2015-04-16	2015-05-07	5551	122	\N	wcabb	nreimer		\N	\N	dthiessen	2015-05-26 10:40:01.126	1	5551	0	1
50189	1025	2015-04-16	5760	0	0	35	admin	ship		520-1	\N	2015-04-16	2015-05-07	4534	47	\N	gcano	zalegria		\N	\N	dthiessen	2015-05-26 10:41:03.126	1	4534	0	1
50193	1007	2015-04-20	5400	0	0	64	admin	tina			\N	2015-04-20	2015-05-11	3651	232	\N	icarrias	zalegria		\N	\N	dthiessen	2015-05-26 10:44:04.188	1	3651	0	1
50194	1010	2015-04-20	6840	0	0	50	admin	jake			\N	2015-04-20	2015-05-11	5772	78	\N	wcabb	mcarrias		\N	\N	dthiessen	2015-05-26 10:44:21.719	1	5772	0	1
50197	1013	2015-04-20	12240	0	0	36	admin	leo			\N	2015-04-20	2015-05-11	10302	142	\N	grodriguez	kochao		\N	\N	dthiessen	2015-05-26 10:45:04.344	1	10302	0	1
50201	1007	2015-04-23	4140	0	0	65	admin	tina			\N	2015-04-23	2015-05-14	2799	292	\N	icarrias	0		\N	\N	dthiessen	2015-05-26 10:48:15.969	1	2799	0	1
50205	1013	2015-04-23	8640	0	0	37	admin	leo			\N	2015-04-23	2015-05-14	6863	176	\N	grodriguez	kochao		\N	\N	dthiessen	2015-05-26 10:49:29.063	1	6863	0	1
50208	1024	2015-04-23	14760	0	0	59	admin	ship		274	\N	2015-04-23	2015-05-14	5732	231	\N	icarrias	mcarrias		\N	\N	dthiessen	2015-05-26 10:51:20.688	1	5732	0	1
50212	1024	2015-04-23	18000	0	0	30	admin	ship		484	\N	2015-04-23	2015-05-14	13260	216	\N	grodriguez	kochao		\N	\N	dthiessen	2015-05-26 10:52:39.063	1	13260	0	1
50267	1025	2015-05-14	7200	0	0	46	admin	ship		407-1	\N	2015-05-14	2015-06-04	5457	401	\N	jquewell	nreimer		\N	\N	dthiessen	2015-05-26 11:18:43.516	1	5457	0	1
50292	1026	2015-05-25	11160	0	0	40	admin	jake			\N	2015-05-25	2015-06-15	4485	0	\N	admin	0		\N	\N	dthiessen	2015-05-26 11:34:16.001	2	8798	4313	2
50182	1025	2015-04-16	6120	0	0	45	admin	ship		400-1	\N	2015-04-16	2015-05-07	4841	60	\N	jquewell	kochao		\N	\N	dthiessen	2015-05-26 10:38:32.735	1	4841	0	1
50293	1007	2015-05-25	4320	0	0	69	admin	tina			\N	2015-05-25	2015-06-15	2859	180	\N	zalegria	nreimer		\N	\N	dthiessen	2015-05-26 11:34:27.907	1	2859	0	1
50264	1025	2015-05-14	6120	0	0	52	admin	ship		401-4	\N	2015-05-14	2015-06-04	5119	81	\N	jquewell	grodriguez		\N	\N	dthiessen	2015-05-26 11:17:36.876	1	5119	0	1
50265	1025	2015-05-14	9000	0	0	48	admin	ship		517-1	\N	2015-05-14	2015-06-04	7104	252	\N	kochao	zalegria		\N	\N	dthiessen	2015-05-26 11:18:01.407	1	7104	0	1
50266	1025	2015-05-14	10440	0	0	48	admin	ship		517-2	\N	2015-05-14	2015-06-04	8283	296	\N	kochao	zalegria		\N	\N	dthiessen	2015-05-26 11:18:25.798	1	8283	0	1
50269	1025	2015-05-14	12960	0	0	44	admin	ship		500-3	\N	2015-05-14	2015-06-04	10323	272	\N	jquewell	gcano		\N	\N	dthiessen	2015-05-26 11:19:21.969	1	10323	0	1
50270	1025	2015-05-14	7200	0	0	43	admin	ship		400-3	\N	2015-05-14	2015-06-04	5977	136	\N	kochao	zalegria		\N	\N	dthiessen	2015-05-26 11:20:09.876	1	5977	0	1
50268	1025	2015-05-14	12960	0	0	44	admin	ship		500-2	\N	2015-05-14	2015-06-04	9820	206	\N	kochao	zalegria		\N	\N	dthiessen	2015-05-26 11:19:04.141	1	9820	0	1
50271	1026	2015-05-18	5040	0	0	39	admin	jake			\N	2015-05-18	2015-06-08	2104	30	\N	admin	0		\N	\N	dthiessen	2015-05-26 11:20:28.344	2	4235	2131	2
50272	1007	2015-05-18	5400	0	0	68	admin	tina			\N	2015-05-18	2015-06-08	3574	265	\N	grodriguez	gcano		\N	\N	dthiessen	2015-05-26 11:20:41.626	1	3574	0	1
50273	1010	2015-05-18	6120	0	0	54	admin	jake			\N	2015-05-18	2015-06-08	5072	82	\N	wcabb	mcarrias		\N	\N	dthiessen	2015-05-26 11:20:56.579	1	5072	0	1
50274	1012	2015-05-18	12600	0	0	46	admin	paul			\N	2015-05-18	2015-06-08	9562	235	\N	admin	admin		\N	\N	dthiessen	2015-05-26 11:21:17.079	1	9562	0	1
50275	1014	2015-05-18	14400	0	0	37	admin	kenton			\N	2015-05-18	2015-06-08	11652	315	\N	grodriguez	alopez		\N	\N	dthiessen	2015-05-26 11:21:27.923	1	11652	0	1
50276	1016	2015-05-18	6840	0	0	79	admin	timmy			\N	2015-05-18	2015-06-08	5748	127	\N	admin	admin		\N	\N	dthiessen	2015-05-26 11:21:41.126	1	5748	0	1
50294	1010	2015-05-25	4500	0	0	55	admin	jake 			\N	2015-05-25	2015-06-15	3870	94	\N	zalegria	nreimer		\N	\N	dthiessen	2015-05-26 11:34:42.141	1	3870	0	1
50277	1007	2015-05-21	3600	0	0	68	admin	tina			\N	2015-05-21	2015-06-11	2441	174	\N	grodriguez	kochao		\N	\N	dthiessen	2015-05-26 11:28:05.219	1	2441	0	1
50295	1012	2015-05-25	9900	0	0	47	admin	paul			\N	2015-05-25	2015-06-15	7782	158	\N	zalegria	nreimer		\N	\N	dthiessen	2015-05-26 11:35:03.688	1	7782	0	1
50296	1014	2015-05-25	10980	0	0	38	admin	kenton			\N	2015-05-25	2015-06-15	9045	171	\N	kochao	gcano		\N	\N	dthiessen	2015-05-26 11:35:16.766	1	9045	0	1
50297	1016	2015-05-25	8640	0	0	80	admin	timmy			\N	2015-05-25	2015-06-15	7374	177	\N	zalegria	nreimer		\N	\N	dthiessen	2015-05-26 11:35:34.329	1	7374	0	1
50381	1010	2015-06-29	9540	0	0	60	admin	jake			\N	2015-06-29	2015-07-20	6486	102	\N	alopez	admin		\N	\N	dthiessen	2015-07-13 15:03:17.11	1	6486	0	1
50383	1014	2015-06-29	23220	0	0	43	admin	Kenton			\N	2015-06-29	2015-07-20	18491	322	\N	admin	0		\N	\N	dthiessen	2015-07-13 15:04:53.954	1	18491	0	1
50384	1016	2015-06-29	24300	0	0	34	admin	Timmy			\N	2015-06-29	2015-07-20	21984	141	\N	admin	admin		\N	\N	dthiessen	2015-07-13 15:05:11.11	1	21984	0	1
50387	1025	2015-07-02	10080	0	0	62	admin	ship		401-1/2	\N	2015-07-02	2015-07-23	1326	194	\N	jquewell	admin		\N	\N	dthiessen	2015-07-13 15:07:15.892	1	1326	0	1
50386	1026	2015-07-02	7920	0	0	46	admin	Marilyn			\N	2015-07-02	2015-07-23	3084	0	\N	jquewell	admin		\N	\N	dthiessen	2015-07-13 15:06:46.782	2	6076	2992	2
50216	1011	2015-04-27	5940	0	0	46	admin	allan			\N	2015-04-27	2015-05-18	4716	99	\N	icarrias	kochao		\N	\N	dthiessen	2015-05-26 10:54:11.032	1	4716	0	1
50219	1014	2015-04-27	14580	0	0	34	admin	kenton			\N	2015-04-27	2015-05-18	12002	255	\N	grodriguez	zalegria		\N	\N	dthiessen	2015-05-26 10:55:00.173	1	12002	0	1
50223	1012	2015-04-30	9540	0	0	44	admin	Paul			\N	2015-04-30	2015-05-21	7507	113	\N	grodriguez	alopez		\N	\N	dthiessen	2015-05-26 10:56:31.032	1	7507	0	1
50227	1025	2015-04-30	15120	0	0	47	admin	ship		400-1	\N	2015-04-30	2015-05-21	11838	372	\N	kochao	alopez		\N	\N	dthiessen	2015-05-26 10:59:07.704	1	11838	0	1
50231	1025	2015-04-30	3600	0	0	27	admin	ship		403-3	\N	2015-04-30	2015-05-21	2866	23	\N	jquewell	zalegria		\N	\N	dthiessen	2015-05-26 11:00:26.751	1	2866	0	1
50621	1025	2015-10-05	59400	0	0	38	admin	ship		7422	\N	2015-10-05	2015-10-26	47908	481	\N	alopez	agongora		\N	\N	dthiessen	2015-10-09 16:34:15.347	1	47908	0	1
50284	1012	2015-05-21	2160	0	2160	46	admin	paul			\N	2015-05-21	2015-06-11	1726	29	\N	grodriguez	kochao		\N	\N	dthiessen	2015-05-26 11:29:58.313	1	1726	0	1
50280	1014	2015-05-21	10440	0	0	37	admin	kenton			\N	2015-05-21	2015-06-11	8580	147	\N	admin	0		\N	\N	dthiessen	2015-05-26 11:28:49.188	1	8580	0	1
50278	1010	2015-05-21	4680	0	0	54	admin	jake			\N	2015-05-21	2015-06-11	3696	76	\N	admin	0		\N	\N	dthiessen	2015-05-26 11:28:22.126	1	3696	0	1
50279	1012	2015-05-21	9180	0	0	46	admin	paul			\N	2015-05-21	2015-06-11	7334	124	\N	grodriguez	kochao		\N	\N	dthiessen	2015-05-26 11:28:35.876	1	7334	0	1
50285	1014	2015-05-21	3240	0	3240	37	admin	kenton			\N	2015-05-21	2015-06-11	2663	45	\N	admin	0		\N	\N	dthiessen	2015-05-26 11:30:21.376	1	2663	0	1
50281	1016	2015-05-21	6480	0	0	79	admin	timmy			\N	2015-05-21	2015-06-11	5472	107	\N	gcano	kochao		\N	\N	dthiessen	2015-05-26 11:29:05.891	1	5472	0	1
50286	1016	2015-05-21	2160	0	2160	79	admin	timmy			\N	2015-05-21	2015-06-11	1824	36	\N	gcano	kochao		\N	\N	dthiessen	2015-05-26 11:30:38.641	1	1824	0	1
50289	1025	2015-05-21	16200	0	0	31	admin	ship		402-2	\N	2015-05-21	2015-06-11	14000	109	\N	admin	0		\N	\N	dthiessen	2015-05-26 11:32:14.782	1	14000	0	1
50290	1025	2015-05-21	32040	0	0	30	admin	ship		403-3	\N	2015-05-21	2015-06-11	26701	285	\N	admin	0		\N	\N	dthiessen	2015-05-26 11:32:36.579	1	26701	0	1
50291	1025	2015-05-21	31320	0	0	30	admin	ship		403-4	\N	2015-05-21	2015-06-11	26636	166	\N	admin	0		\N	\N	dthiessen	2015-05-26 11:32:53.891	1	26636	0	1
50299	1007	2015-05-28	3960	0	0	70	admin	Tina			\N	2015-05-28	2015-06-18	2590	175	\N	zalegria	admin		\N	\N	dthiessen	2015-05-29 09:04:04.348	1	2590	0	1
50301	1012	2015-05-28	9360	0	0	48	admin	Wife			\N	2015-05-28	2015-06-18	7026	183	\N	aquinonez	admin		\N	\N	dthiessen	2015-05-29 09:04:54.88	1	7026	0	1
50287	1025	2015-05-21	12600	0	0	36	admin	ship		402-3	\N	2015-05-21	2015-06-11	10991	232	\N	gcano	kochao		\N	\N	dthiessen	2015-05-26 11:31:30.501	1	10991	0	1
50302	1014	2015-05-28	10620	0	0	39	admin	Kenton			\N	2015-05-28	2015-06-18	8948	139	\N	grodriguez	kochao		\N	\N	dthiessen	2015-05-29 09:05:13.708	1	8948	0	1
50305	1025	2015-05-28	11520	0	0	57	admin	ship		504-1/2	\N	2015-05-28	2015-06-18	8917	385	\N	grodriguez	kochao		\N	\N	dthiessen	2015-05-29 11:17:29.098	1	8917	0	1
50098	1006	2015-03-26	1440	0	1440	61	admin	Peter			\N	2015-03-26	2015-04-16	942	141	\N	kochao	grodriguez	split sort	\N	\N	dthiessen	2015-05-21 13:56:07.75	1	942	0	1
50119	1010	2015-04-02	5580	0	0	48	admin	Marilyn			\N	2015-04-02	2015-04-23	4492	58	\N	jquewell	kochao		\N	\N	dthiessen	2015-05-21 14:08:08.109	1	4492	0	1
50123	1014	2015-04-02	11700	0	0	31	admin	Kenton			\N	2015-04-02	2015-04-23	9522	77	\N	icarrias	zalegria		\N	\N	dthiessen	2015-05-21 14:10:24.937	1	9522	0	1
50129	1012	2015-04-02	2520	0	2520	40	admin	Paul			\N	2015-04-02	2015-04-23	1998	42	\N	jquewell	kochao		\N	\N	dthiessen	2015-05-21 14:13:27.234	1	1998	0	1
50132	1015	2015-04-02	2700	0	2700	26	admin	Joe			\N	2015-04-02	2015-04-23	2335	27	\N	jquewell	kochao		\N	\N	dthiessen	2015-05-21 14:14:46.218	1	2335	0	1
50136	1011	2015-04-06	8820	0	0	43	admin	Allan			\N	2015-04-06	2015-04-27	7505	75	\N	grodriguez	kochao		\N	\N	dthiessen	2015-05-21 14:40:37.968	1	7505	0	1
50139	1014	2015-04-06	11880	0	0	31	admin	Kenton			\N	2015-04-06	2015-04-27	9941	56	\N	nreimer	0		\N	\N	dthiessen	2015-05-21 14:43:13.25	1	9941	0	1
50144	1006	2015-04-09	4860	0	0	63	admin	Peter			\N	2015-04-09	2015-04-30	3337	189	\N	icarrias	mcarrias		\N	\N	dthiessen	2015-05-21 15:41:28	1	3337	0	1
50146	1010	2015-04-09	5400	0	0	49	admin	Marilyn			\N	2015-04-09	2015-04-30	4583	107	\N	jquewell	kochao		\N	\N	dthiessen	2015-05-26 10:16:09.438	1	4583	0	1
50148	1012	2015-04-09	7740	0	0	41	admin	Paul			\N	2015-04-09	2015-04-30	6306	155	\N	jquewell	gcano		\N	\N	dthiessen	2015-05-26 10:16:42.876	1	6306	0	1
50256	1016	2015-05-11	2340	0	0	78	admin	timmy			\N	2015-05-11	2015-06-01	1890	27	\N	jquewell	zalegria		\N	\N	dthiessen	2015-05-26 11:14:52.704	1	1890	0	1
50262	1016	2015-05-14	3600	0	0	79	admin	timmy			\N	2015-05-14	2015-06-04	2947	43	\N	kochao	zalegria		\N	\N	dthiessen	2015-05-26 11:16:45.938	1	2947	0	1
50303	1016	2015-05-28	9180	0	0	81	admin	Timmy			\N	2015-05-28	2015-06-18	7588	127	\N	zalegria	nreimer		\N	\N	dthiessen	2015-05-29 09:05:32.63	1	7588	0	1
50306	1025	2015-05-28	12600	0	0	57	admin	ship		505-1/2	\N	2015-05-28	2015-06-18	8273	379	\N	aquinonez	admin		\N	\N	dthiessen	2015-05-29 11:18:42.505	1	8273	0	1
50307	1025	2015-05-28	21240	0	0	52	admin	ship		516-1/2	\N	2015-05-28	2015-06-18	14037	631	\N	zalegria	nreimer		\N	\N	dthiessen	2015-05-29 11:19:35.13	1	14037	0	1
50309	1025	2015-05-28	4680	0	0	37	admin	ship		402-3/4	\N	2015-05-28	2015-06-18	3994	23	\N	jquewell	kochao		\N	\N	dthiessen	2015-05-29 13:09:35.895	1	3994	0	1
50310	1025	2015-05-28	25200	0	0	28	admin	ship		521-1/2	\N	2015-05-28	2015-06-18	17884	281	\N	aquinonez	admin		\N	\N	dthiessen	2015-05-29 13:11:21.708	1	17884	0	1
50314	1010	2015-06-01	5940	0	0	56	admin	Jake			\N	2015-06-01	2015-06-22	4626	73	\N	admin	zalegria		\N	\N	dthiessen	2015-06-08 09:53:13.003	1	4626	0	1
50315	1012	2015-06-01	12060	0	0	48	admin	Paul			\N	2015-06-01	2015-06-22	8789	302	\N	kochao	nreimer		\N	\N	dthiessen	2015-06-08 09:53:33.769	1	8789	0	1
50316	1014	2015-06-01	13680	0	0	39	admin	Kenotn			\N	2015-06-01	2015-06-22	11387	104	\N	jquewell	admin		\N	\N	dthiessen	2015-06-08 13:38:01.081	1	11387	0	1
50318	1026	2015-06-04	7920	0	0	42	admin	Marilyn			\N	2015-06-04	2015-06-25	3016	0	\N	jguenther	admin		\N	\N	dthiessen	2015-06-08 13:38:40.784	2	6026	3010	2
50319	1007	2015-06-04	2880	0	0	71	admin	tina			\N	2015-06-04	2015-06-25	1742	248	\N	grodriguez	kochao		\N	\N	dthiessen	2015-06-08 13:38:53.284	1	1742	0	1
50320	1010	2015-06-04	4320	0	0	57	admin	Marilyn			\N	2015-06-04	2015-06-25	3386	65	\N	alopez	nreimer		\N	\N	dthiessen	2015-06-08 13:39:09.503	1	3386	0	1
50322	1014	2015-06-04	10440	0	0	40	admin	Kenton			\N	2015-06-04	2015-06-25	8771	33	\N	admin	nreimer		\N	\N	dthiessen	2015-06-08 13:39:43.972	1	8771	0	1
50323	1016	2015-06-04	10260	0	0	31	admin	timmy			\N	2015-06-04	2015-06-25	7968	112	\N	grodriguez	kochao		\N	\N	dthiessen	2015-06-08 13:40:03.69	1	7968	0	1
50324	1025	2015-06-04	54000	0	0	38	admin	ship		1590	\N	2015-06-04	2015-06-25	42956	497	\N	kochao	nreimer		\N	\N	dthiessen	2015-06-09 10:56:54.358	1	42956	0	1
50326	1025	2015-06-04	10080	0	0	51	admin	ship		517-2	\N	2015-06-04	2015-06-25	8031	92	\N	grodriguez	kochao		\N	\N	dthiessen	2015-06-09 10:57:43.123	1	8031	0	1
50327	1025	2015-06-04	7920	0	0	38	admin	ship		402-3	\N	2015-06-04	2015-06-25	6953	55	\N	gcano	nreimer		\N	\N	dthiessen	2015-06-09 10:58:39.404	1	6953	0	1
50329	1025	2015-06-04	16560	0	0	28	admin	ship		502-2	\N	2015-06-04	2015-06-25	14184	97	\N	grodriguez	kochao		\N	\N	dthiessen	2015-06-09 10:59:55.873	1	14184	0	1
50330	1025	2015-06-04	1800	0	0	28	admin	ship		522	\N	2015-06-04	2015-06-25	1464	25	\N	gcano	nreimer		\N	\N	dthiessen	2015-06-09 11:00:33.904	1	1464	0	1
50380	1026	2015-06-29	9000	0	0	45	admin	Jake			\N	2015-06-29	2015-07-20	3630	0	\N	admin	0		\N	\N	dthiessen	2015-07-13 15:02:58.813	2	7319	3689	2
50150	1014	2015-04-09	8100	0	0	32	admin	Kenton			\N	2015-04-09	2015-04-30	6642	55	\N	wcabb	mcarrias		\N	\N	dthiessen	2015-05-26 10:18:04.391	1	6642	0	1
50155	1024	2015-04-09	12240	0	0	35	admin	fly in		146	\N	2015-04-09	2015-04-30	10293	86	\N	mcarrias	wcabb		\N	\N	dthiessen	2015-05-26 10:22:14.094	1	10293	0	1
50156	1024	2015-04-09	16200	0	0	28	admin	fly in		484	\N	2015-04-09	2015-04-30	14126	87	\N	wcabb	mcarrias		\N	\N	dthiessen	2015-05-26 10:22:37.36	1	14126	0	1
50624	1025	2015-10-05	14400	0	0	29	admin	ship		7491	\N	2015-10-05	2015-10-26	11268	87	\N	jquewell	admin		\N	\N	dthiessen	2015-10-09 16:36:18.035	1	11268	0	1
50617	1017	2015-10-08	23400	0	0	44	admin	Marlyn			\N	2015-10-08	2015-10-29	19989	175	\N	grodriguez	admin		\N	\N	dthiessen	2015-10-08 09:50:01.832	1	19989	0	1
50961	1019	2016-02-18	0	3780	0	57	dthiessen	me			\N	2016-02-18	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-02-19 10:20:51.824	4	\N	\N	1
50243	1014	2015-05-07	10620	0	0	36	admin	kenton			\N	2015-05-07	2015-05-28	8611	109	\N	grodriguez	kochao		\N	\N	dthiessen	2015-05-26 11:04:39.344	1	8611	0	1
50244	1016	2015-05-07	900	0	0	78	admin	Timmy			\N	2015-05-07	2015-05-28	649	4	\N	grodriguez	kochao		\N	\N	dthiessen	2015-05-26 11:04:50.016	1	649	0	1
50247	1025	2015-05-07	11520	0	0	54	admin	air		401-1/2	\N	2015-05-07	2015-05-28	9472	210	\N	jquewell	kochao		\N	\N	dthiessen	2015-05-26 11:09:09.501	1	9472	0	1
50661	1019	2015-11-02	6300	0	0	41	admin	Allen			\N	2015-11-02	2015-11-23	5095	58	\N	jquewell	admin		\N	\N	dthiessen	2015-11-02 08:58:38.838	1	5095	0	1
50251	1026	2015-05-11	11160	0	0	38	admin	jake			\N	2015-05-11	2015-06-01	4653	90	\N	jquewell	zalegria		\N	\N	dthiessen	2015-05-26 11:13:27.688	2	9494	4841	2
50255	1014	2015-05-11	14220	0	0	36	admin	kenton			\N	2015-05-11	2015-06-01	11535	163	\N	grodriguez	kochao		\N	\N	dthiessen	2015-05-26 11:14:38.469	1	11535	0	1
50260	1012	2015-05-14	9720	0	0	46	admin	paul			\N	2015-05-14	2015-06-04	7889	104	\N	jquewell	grodriguez		\N	\N	dthiessen	2015-05-26 11:16:14.36	1	7889	0	1
50282	1007	2015-05-21	1080	0	1080	68	admin	tina			\N	2015-05-21	2015-06-11	732	52	\N	grodriguez	kochao		\N	\N	dthiessen	2015-05-26 11:29:27.454	1	732	0	1
50283	1010	2015-05-21	1440	0	1440	54	admin	jake			\N	2015-05-21	2015-06-11	1137	24	\N	admin	0		\N	\N	dthiessen	2015-05-26 11:29:42.048	1	1137	0	1
50288	1025	2015-05-21	15840	0	0	31	admin	ship		402-1	\N	2015-05-21	2015-06-11	13944	123	\N	wcabb	nreimer		\N	\N	dthiessen	2015-05-26 11:31:51.407	1	13944	0	1
50300	1010	2015-05-28	4500	0	0	56	admin	Marilyn			\N	2015-05-28	2015-06-18	3496	50	\N	aquinonez	admin		\N	\N	dthiessen	2015-05-29 09:04:37.083	1	3496	0	1
50304	1025	2015-05-28	1440	0	0	57	admin	ship		503-1	\N	2015-05-28	2015-06-18	1044	24	\N	wcabb	0		\N	\N	dthiessen	2015-05-29 11:14:19.333	1	1044	0	1
50308	1025	2015-05-28	14400	0	0	47	admin	ship		518-1/2	\N	2015-05-28	2015-06-18	9604	320	\N	wcabb	nreimer		\N	\N	dthiessen	2015-05-29 11:23:33.411	1	9604	0	1
50311	1025	2015-05-28	16920	0	0	27	admin	ship		514-1/2	\N	2015-05-28	2015-06-18	12700	80	\N	zalegria	nreimer		\N	\N	dthiessen	2015-05-29 13:14:10.848	1	12700	0	1
50353	1025	2015-05-28	18000	0	0	0	admin	ship		276	\N	2015-05-28	2015-06-18	14065	255	\N	zalegria	nreimer	Keith Smith Chicks	\N	\N	dthiessen	2015-06-22 11:07:05.189	1	14065	0	1
50332	1010	2015-06-08	5580	0	0	57	admin	Jake			\N	2015-06-08	2015-06-29	3913	188	\N	grodriguez	admin		\N	\N	dthiessen	2015-06-18 08:12:46.904	1	3913	0	1
50333	1012	2015-06-08	11340	0	0	49	admin	Paul			\N	2015-06-08	2015-06-29	8545	191	\N	grodriguez	admin		\N	\N	dthiessen	2015-06-18 08:13:04.465	1	8545	0	1
50335	1016	2015-06-08	13680	0	0	31	admin	Timmy			\N	2015-06-08	2015-06-29	11862	219	\N	grodriguez	admin		\N	\N	dthiessen	2015-06-18 08:13:43.155	1	11862	0	1
50336	1017	2015-06-08	360	0	0	26	admin	Jake			\N	2015-06-08	2015-06-29	298	9	\N	grodriguez	admin		\N	\N	dthiessen	2015-06-18 08:14:03.545	1	298	0	1
50337	1026	2015-06-11	21960	0	0	43	admin	Marilyn			\N	2015-06-11	2015-07-02	8672	216	\N	grodriguez	admin		\N	\N	dthiessen	2015-06-18 08:14:27.062	2	17055	8383	2
50340	1025	2015-06-11	6120	0	0	62	admin	ship		405-2	\N	2015-06-11	2015-07-02	4480	152	\N	zalegria	nreimer		\N	\N	dthiessen	2015-06-18 08:16:08.916	1	4480	0	1
50339	1025	2015-06-11	6120	0	0	62	admin	ship		405-1	\N	2015-06-11	2015-07-02	4481	153	\N	zalegria	nreimer		\N	\N	dthiessen	2015-06-18 08:15:37.704	1	4481	0	1
50341	1025	2015-06-11	8640	0	0	53	admin	ship		400-1	\N	2015-06-11	2015-07-02	6966	136	\N	grodriguez	0		\N	\N	dthiessen	2015-06-18 08:16:59.44	1	6966	0	1
50343	1025	2015-06-11	12600	0	0	43	admin	ship		400-5	\N	2015-06-11	2015-07-02	9712	464	\N	zalegria	kochao		\N	\N	dthiessen	2015-06-18 08:18:09.311	1	9712	0	1
50346	1025	2015-06-11	10800	0	0	43	admin	ship		520-2	\N	2015-06-11	2015-07-02	8777	209	\N	zalegria	kochao		\N	\N	dthiessen	2015-06-18 08:19:43.475	1	8777	0	1
50344	1025	2015-06-11	13320	0	0	43	admin	ship		400-6	\N	2015-06-11	2015-07-02	10775	236	\N	grodriguez	admin		\N	\N	dthiessen	2015-06-18 08:18:48.977	1	10775	0	1
50347	1026	2015-06-15	6120	0	0	43	admin	jake			\N	2015-06-15	2015-07-06	2452	55	\N	admin	0		\N	\N	dthiessen	2015-06-18 08:20:26.645	2	5035	2583	2
50348	1010	2015-06-15	10080	0	0	58	admin	jake			\N	2015-06-15	2015-07-06	6552	174	\N	grodriguez	admin		\N	\N	dthiessen	2015-06-18 08:20:44.963	1	6552	0	1
50350	1014	2015-06-15	23580	0	0	41	admin	Kenton			\N	2015-06-15	2015-07-06	18472	314	\N	grodriguez	admin		\N	\N	dthiessen	2015-06-18 08:21:23.07	1	18472	0	1
50351	1016	2015-06-15	24120	0	0	32	admin	Timmy			\N	2015-06-15	2015-07-06	21290	190	\N	grodriguez	admin		\N	\N	dthiessen	2015-06-18 08:21:44.79	1	21290	0	1
50352	1017	2015-06-15	1440	0	0	27	admin	Jake			\N	2015-06-15	2015-07-06	1166	5	\N	grodriguez	admin		\N	\N	dthiessen	2015-06-18 08:22:09.252	1	1166	0	1
50354	1026	2015-06-18	5760	0	0	44	admin	Marilyn			\N	2015-06-18	2015-07-09	2337	45	\N	wcabb	0		\N	\N	dthiessen	2015-06-22 15:39:45.489	2	4612	2275	2
50367	1025	2015-06-18	12600	0	0	51	admin	ship		407-1/2	\N	2015-06-18	2015-07-09	10059	243	\N	jquewell	admin		\N	\N	dthiessen	2015-07-13 14:50:04.407	1	10059	0	1
50369	1025	2015-06-18	16200	0	0	48	admin	ship		400-3/4	\N	2015-06-18	2015-07-09	11907	191	\N	grodriguez	admin		\N	\N	dthiessen	2015-07-13 14:52:34.282	1	11907	0	1
50372	1025	2015-06-18	8280	0	0	28	admin	ship		406-2	\N	2015-06-18	2015-07-09	6875	79	\N	grodriguez	kochao		\N	\N	dthiessen	2015-07-13 14:54:13.485	1	6875	0	1
50371	1025	2015-06-18	7920	0	0	30	admin	ship		403-2	\N	2015-06-18	2015-07-09	7088	18	\N	grodriguez	admin		\N	\N	dthiessen	2015-07-13 14:53:41.095	1	7088	0	1
51613	1036	2016-08-25	25200	0	0	36	dthiessen	ship		JD	\N	2016-08-25	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-09-13 13:43:08.468	5	\N	\N	2
50373	1025	2015-06-18	18000	0	0	46	admin	ship		1570	\N	2015-06-18	2015-07-09	12666	64	\N	wcabb	0		\N	\N	dthiessen	2015-07-13 14:54:50.11	1	12666	0	1
50366	1025	2015-06-18	10800	0	0	57	admin	ship		401-3/4	\N	2015-06-18	2015-07-09	8837	131	\N	jquewell	admin		\N	\N	dthiessen	2015-07-13 14:49:27.688	1	8837	0	1
50355	1026	2015-06-22	14400	0	0	44	admin	Jake			\N	2015-06-22	2015-07-13	5770	100	\N	admin	0		\N	\N	dthiessen	2015-07-13 14:23:55.798	2	11578	5808	2
50356	1010	2015-06-22	9540	0	0	59	admin	Jake			\N	2015-06-22	2015-07-13	6283	132	\N	jquewell	admin		\N	\N	dthiessen	2015-07-13 14:24:19.126	1	6283	0	1
50358	1014	2015-06-22	23040	0	0	42	admin	Kenton			\N	2015-06-22	2015-07-13	18091	236	\N	jquewell	0		\N	\N	dthiessen	2015-07-13 14:25:23.97	1	18091	0	1
50359	1016	2015-06-22	24480	0	0	33	admin	Timmy			\N	2015-06-22	2015-07-13	21764	203	\N	wcabb	0		\N	\N	dthiessen	2015-07-13 14:27:10.438	1	21764	0	1
50360	1017	2015-06-22	3780	0	0	28	admin	Jake			\N	2015-06-22	2015-07-13	3202	32	\N	jquewell	0		\N	\N	dthiessen	2015-07-13 14:27:33.36	1	3202	0	1
50375	1025	2015-06-25	36000	0	0	42	admin	ship		5064	\N	2015-06-25	2015-07-16	25461	505	\N	admin	0		\N	\N	dthiessen	2015-07-13 14:58:02.048	1	25461	0	1
50376	1025	2015-06-25	36000	0	0	47	admin	ship		1570	\N	2015-06-25	2015-07-16	24821	525	\N	admin	0		\N	\N	dthiessen	2015-07-13 14:58:27.907	1	24821	0	1
50377	1025	2015-06-25	16200	0	0	31	admin	ship		403-2	\N	2015-06-25	2015-07-16	13259	381	\N	zalegria	0		\N	\N	dthiessen	2015-07-13 14:59:08.829	1	13259	0	1
50378	1025	2015-06-25	15840	0	0	31	admin	ship		403-1	\N	2015-06-25	2015-07-16	12079	198	\N	wcabb	0		\N	\N	dthiessen	2015-07-13 14:59:32.813	1	12079	0	1
50962	1021	2016-02-18	0	10080	0	47	dthiessen	me			\N	2016-02-18	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-02-19 10:21:14.619	4	\N	\N	1
50312	1026	2015-06-01	9000	0	0	41	admin	Jake			\N	2015-06-01	2015-06-22	3022	0	\N	jquewell	admin		\N	\N	dthiessen	2015-06-08 09:51:29.534	2	5906	2884	2
50313	1007	2015-06-01	5220	0	0	70	admin	Tina			\N	2015-06-01	2015-06-22	2931	398	\N	kochao	nreimer		\N	\N	dthiessen	2015-06-08 09:52:30.19	1	2931	0	1
50317	1016	2015-06-01	12960	0	0	30	admin	timmy			\N	2015-06-01	2015-06-22	10979	96	\N	kochao	nreimer		\N	\N	dthiessen	2015-06-08 13:38:15.659	1	10979	0	1
50321	1012	2015-06-04	9000	0	0	49	admin	wife			\N	2015-06-04	2015-06-25	6597	150	\N	jquewell	admin		\N	\N	dthiessen	2015-06-08 13:39:25.784	1	6597	0	1
50325	1025	2015-06-04	9360	0	0	51	admin	ship		517-1	\N	2015-06-04	2015-06-25	8126	133	\N	alopez	nreimer		\N	\N	dthiessen	2015-06-09 10:57:21.717	1	8126	0	1
50328	1025	2015-06-04	8280	0	0	33	admin	ship		402-2	\N	2015-06-04	2015-06-25	6458	67	\N	nreimer	admin		\N	\N	dthiessen	2015-06-09 10:59:21.951	1	6458	0	1
50331	1007	2015-06-08	540	0	0	71	admin	Tina			\N	2015-06-08	2015-06-29	211	82	\N	aquinonez	nreimer		\N	\N	dthiessen	2015-06-18 08:12:23.062	1	211	0	1
50334	1014	2015-06-08	13500	0	0	40	admin	Kenton			\N	2015-06-08	2015-06-29	10730	230	\N	grodriguez	admin		\N	\N	dthiessen	2015-06-18 08:13:23.996	1	10730	0	1
50338	1025	2015-06-11	36000	0	0	45	admin	ship		1960	\N	2015-06-11	2015-07-02	27179	560	\N	zalegria	admin		\N	\N	dthiessen	2015-06-18 08:14:55.17	1	27179	0	1
50342	1025	2015-06-11	11520	0	0	53	admin	ship		400-2	\N	2015-06-11	2015-07-02	8890	230	\N	zalegria	kochao		\N	\N	dthiessen	2015-06-18 08:17:34.147	1	8890	0	1
50345	1025	2015-06-11	2880	0	0	43	admin	ship		520-1	\N	2015-06-11	2015-07-02	2440	58	\N	wcabb	0		\N	\N	dthiessen	2015-06-18 08:19:20.437	1	2440	0	1
50349	1012	2015-06-15	20700	0	0	50	admin	Paul			\N	2015-06-15	2015-07-06	12738	330	\N	nreimer	admin		\N	\N	dthiessen	2015-06-18 08:21:04.48	1	12738	0	1
50362	1025	2015-06-18	4680	0	0	60	admin	Ship		401-1/2	\N	2015-06-18	2015-07-09	3410	100	\N	admin	0		\N	\N	dthiessen	2015-07-13 14:43:00.376	1	3410	0	1
50370	1025	2015-06-18	11520	0	0	44	admin	ship		400-5/6	\N	2015-06-18	2015-07-09	9843	112	\N	wcabb	0		\N	\N	dthiessen	2015-07-13 14:53:11.829	1	9843	0	1
50374	1025	2015-06-18	18000	0	0	40	admin	ship		1180	\N	2015-06-18	2015-07-09	14858	125	\N	grodriguez	kochao		\N	\N	dthiessen	2015-07-13 14:55:14.829	1	14858	0	1
50357	1012	2015-06-22	20160	0	0	51	admin	Paul			\N	2015-06-22	2015-07-13	12980	419	\N	jquewell	0		\N	\N	dthiessen	2015-07-13 14:24:43.063	1	12980	0	1
50361	1026	2015-06-25	5040	0	0	45	admin	Marilyn			\N	2015-06-25	2015-07-16	2002	60	\N	jquewell	kochao		\N	\N	dthiessen	2015-07-13 14:28:09.86	2	4085	2083	2
50379	1025	2015-06-25	3960	0	0	29	admin	ship		406-1	\N	2015-06-25	2015-07-16	3216	63	\N	jquewell	wcabb		\N	\N	dthiessen	2015-07-13 14:59:52.017	1	3216	0	1
50389	1025	2015-07-02	19440	0	0	53	admin	ship		407-1/2	\N	2015-07-02	2015-07-23	14293	400	\N	admin	alopez		\N	\N	dthiessen	2015-07-13 15:08:14.845	1	14293	0	1
50390	1025	2015-07-02	11160	0	0	50	admin	ship		400-3/4	\N	2015-07-02	2015-07-23	7518	126	\N	kochao	admin		\N	\N	dthiessen	2015-07-13 15:08:42.813	1	7518	0	1
50391	1025	2015-07-02	5400	0	0	36	admin	ship		403-3	\N	2015-07-02	2015-07-23	4631	45	\N	kochao	admin		\N	\N	dthiessen	2015-07-13 15:09:16.22	1	4631	0	1
50393	1025	2015-07-02	21240	0	0	33	admin	ship		1505	\N	2015-07-02	2015-07-23	15231	143	\N	kochao	admin		\N	\N	dthiessen	2015-07-13 15:14:34.813	1	15231	0	1
50394	1025	2015-07-02	10080	0	0	42	admin	ship		3905	\N	2015-07-02	2015-07-23	8154	111	\N	kochao	admin		\N	\N	dthiessen	2015-07-13 15:16:01.97	1	8154	0	1
50395	1025	2015-07-02	5040	0	0	46	admin	SHIP		2205	\N	2015-07-02	2015-07-23	1467	22	\N	agongora	0		\N	\N	dthiessen	2015-07-13 15:16:26.188	1	1467	0	1
50397	1010	2015-07-06	9360	0	0	61	admin	Jake			\N	2015-07-06	2015-07-27	6060	306	\N	admin	agongora		\N	\N	dthiessen	2015-07-13 15:21:03.517	1	6060	0	1
50398	1012	2015-07-06	19440	0	0	53	admin	Paul			\N	2015-07-06	2015-07-27	12215	457	\N	admin	admin		\N	\N	dthiessen	2015-07-13 15:21:55.938	1	12215	0	1
50399	1014	2015-07-06	22680	0	0	44	admin	Kenton			\N	2015-07-06	2015-07-27	17723	431	\N	jquewell	zalegria		\N	\N	dthiessen	2015-07-13 15:22:09.532	1	17723	0	1
50401	1017	2015-07-06	12060	0	0	30	admin	Jake			\N	2015-07-06	2015-07-27	10486	113	\N	admin	admin		\N	\N	dthiessen	2015-07-13 15:22:43.548	1	10486	0	1
50403	1025	2015-07-09	6480	0	0	63	admin	ship		503-1/2	\N	2015-07-09	2015-07-30	3964	272	\N	grodriguez	kochao		\N	\N	dthiessen	2015-07-13 15:29:50.063	1	3964	0	1
50404	1025	2015-07-09	7920	0	0	63	admin	ship		504-1/2	\N	2015-07-09	2015-07-30	4579	398	\N	zalegria	admin		\N	\N	dthiessen	2015-07-13 15:30:20.485	1	4579	0	1
50405	1025	2015-07-09	5400	0	0	63	admin	ship		505-1/2	\N	2015-07-09	2015-07-30	3433	182	\N	zalegria	admin		\N	\N	dthiessen	2015-07-13 15:31:30.298	1	3433	0	1
50406	1025	2015-07-09	17640	0	0	58	admin	ship		516-1/2	\N	2015-07-09	2015-07-30	10635	869	\N	jquewell	0		\N	\N	dthiessen	2015-07-13 15:33:31.11	1	10635	0	1
50409	1025	2015-07-09	15120	0	0	33	admin	ship		403-1/2	\N	2015-07-09	2015-07-30	12677	150	\N	grodriguez	0		\N	\N	dthiessen	2015-07-13 15:35:38.001	1	12677	0	1
50410	1025	2015-07-09	10800	0	0	33	admin	ship		514-1/2	\N	2015-07-09	2015-07-30	9045	44	\N	zalegria	jquewell		\N	\N	dthiessen	2015-07-13 15:36:38.517	1	9045	0	1
50411	1025	2015-07-09	10080	0	0	27	admin	ship		526-1/2	\N	2015-07-09	2015-07-30	7647	8	\N	grodriguez	kochao		\N	\N	dthiessen	2015-07-13 15:45:53.142	1	7647	0	1
50407	1025	2015-07-09	11160	0	0	56	admin	ship		513-2	\N	2015-07-09	2015-07-30	7653	261	\N	grodriguez	0		\N	\N	dthiessen	2015-07-13 15:34:16.47	1	7653	0	1
50413	1026	2015-07-13	11160	0	0	47	admin	Jake			\N	2015-07-13	2015-08-03	4172	0	\N	admin	0		\N	\N	dthiessen	2015-07-14 15:04:22.428	2	8139	3967	2
50414	1010	2015-07-13	7380	0	0	62	admin	Jake			\N	2015-07-13	2015-08-03	4711	213	\N	grodriguez	alopez		\N	\N	dthiessen	2015-07-14 15:04:42.975	1	4711	0	1
50416	1014	2015-07-13	22320	0	0	45	admin	Kenton			\N	2015-07-13	2015-08-03	17019	419	\N	wcabb	grodriguez		\N	\N	dthiessen	2015-07-14 15:05:12.912	1	17019	0	1
50417	1016	2015-07-13	23580	0	0	36	admin	Timmy			\N	2015-07-13	2015-08-03	20334	325	\N	grodriguez	kochao		\N	\N	dthiessen	2015-07-14 15:05:31.49	1	20334	0	1
50418	1017	2015-07-13	16740	0	0	31	admin	Jake			\N	2015-07-13	2015-08-03	14824	90	\N	wcabb	0		\N	\N	dthiessen	2015-07-14 15:05:51.99	1	14824	0	1
50419	1025	2015-07-16	3600	0	0	64	admin	ship		503-2	\N	2015-07-16	2015-08-06	2206	237	\N	admin	0		\N	\N	dthiessen	2015-08-14 10:00:42.503	1	2206	0	1
50421	1025	2015-07-16	3600	0	0	64	admin	ship		504-1	\N	2015-07-16	2015-08-06	2209	113	\N	grodriguez	0		\N	\N	dthiessen	2015-08-14 10:04:50.034	1	2209	0	1
50422	1025	2015-07-16	3600	0	0	64	admin	ship		504-2	\N	2015-07-16	2015-08-06	2396	134	\N	alopez	0		\N	\N	dthiessen	2015-08-14 10:07:50.097	1	2396	0	1
50424	1025	2015-07-16	7920	0	0	55	admin	ship		407-1	\N	2015-07-16	2015-08-06	4684	638	\N	jquewell	0		\N	\N	dthiessen	2015-08-14 10:09:53.55	1	4684	0	1
50425	1025	2015-07-16	9000	0	0	55	admin	ship		407-2	\N	2015-07-16	2015-08-06	6541	253	\N	jquewell	0		\N	\N	dthiessen	2015-08-14 10:10:31.347	1	6541	0	1
50428	1026	2015-07-20	9360	0	0	48	admin	Jake			\N	2015-07-20	2015-08-10	3769	0	\N	admin	0		\N	\N	dthiessen	2015-08-14 10:16:06.425	2	7426	3657	2
50429	1010	2015-07-20	1800	0	0	63	admin	Jake			\N	2015-07-20	2015-08-10	908	45	\N	grodriguez	0		\N	\N	dthiessen	2015-08-14 10:16:58.487	1	908	0	1
50430	1012	2015-07-20	19260	0	0	55	admin	Paul			\N	2015-07-20	2015-08-10	11232	413	\N	grodriguez	0		\N	\N	dthiessen	2015-08-14 10:19:53.503	1	11232	0	1
50432	1016	2015-07-20	23220	0	0	37	admin	Timmy			\N	2015-07-20	2015-08-10	20705	235	\N	jquewell	0		\N	\N	dthiessen	2015-08-14 10:22:40.862	1	20705	0	1
50433	1017	2015-07-20	20520	0	0	32	admin	Jake			\N	2015-07-20	2015-08-10	17720	148	\N	grodriguez	0		\N	\N	dthiessen	2015-08-14 10:24:55.956	1	17720	0	1
50426	1025	2015-07-16	27720	0	0	44	admin	ship		402-3	\N	2015-07-16	2015-08-06	23760	315	\N	grodriguez	kochao		\N	\N	dthiessen	2015-08-14 10:12:28.003	1	23760	0	1
50963	1028	2016-02-18	0	6300	0	33	dthiessen	me			\N	2016-02-18	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-02-19 10:21:43.422	2	\N	\N	1
50382	1012	2015-06-29	19620	0	0	52	admin	Paul			\N	2015-06-29	2015-07-20	12558	225	\N	agongora	admin		\N	\N	dthiessen	2015-07-13 15:04:12.595	1	12558	0	1
50385	1017	2015-06-29	7740	0	0	29	admin	Jake			\N	2015-06-29	2015-07-20	6593	44	\N	kochao	admin		\N	\N	dthiessen	2015-07-13 15:05:27.876	1	6593	0	1
50388	1025	2015-07-02	10080	0	0	59	admin	ship		401-3/4	\N	2015-07-02	2015-07-23	7792	107	\N	kochao	admin		\N	\N	dthiessen	2015-07-13 15:07:44.954	1	7792	0	1
50392	1025	2015-07-02	15480	0	0	32	admin	ship		403-1/2	\N	2015-07-02	2015-07-23	13289	99	\N	admin	alopez		\N	\N	dthiessen	2015-07-13 15:09:49.126	1	13289	0	1
50396	1026	2015-07-06	9360	0	0	46	admin	Jake			\N	2015-07-06	2015-07-27	3744	98	\N	jquewell	zalegria		\N	\N	dthiessen	2015-07-13 15:20:46.688	2	7296	3552	2
50400	1016	2015-07-06	23760	0	0	35	admin	Timmy			\N	2015-07-06	2015-07-27	21043	150	\N	admin	kochao		\N	\N	dthiessen	2015-07-13 15:22:27.892	1	21043	0	1
50402	1026	2015-07-09	5760	0	0	47	admin	Marilyn			\N	2015-07-09	2015-07-30	2135	0	\N	jquewell	admin		\N	\N	dthiessen	2015-07-13 15:28:55.001	2	4280	2145	2
50408	1025	2015-07-09	9000	0	0	53	admin	ship		518-2	\N	2015-07-09	2015-07-30	5362	470	\N	zalegria	0		\N	\N	dthiessen	2015-07-13 15:35:11.079	1	5362	0	1
50412	1025	2015-07-09	5400	0	0	27	admin	ship		404-2	\N	2015-07-09	2015-07-30	4452	15	\N	grodriguez	kochao		\N	\N	dthiessen	2015-07-13 15:46:30.485	1	4452	0	1
50415	1012	2015-07-13	19260	0	0	54	admin	Paul			\N	2015-07-13	2015-08-03	11988	402	\N	grodriguez	0		\N	\N	dthiessen	2015-07-14 15:04:58.475	1	11988	0	1
50420	1026	2015-07-16	7920	0	0	48	admin	Jake			\N	2015-07-16	2015-08-06	3316	0	\N	admin	0		\N	\N	dthiessen	2015-08-14 10:01:53.815	2	6476	3160	2
50423	1025	2015-07-16	7200	0	0	64	admin	ship		505-1/2	\N	2015-07-16	2015-08-06	4596	234	\N	grodriguez	0		\N	\N	dthiessen	2015-08-14 10:09:15.237	1	4596	0	1
50431	1014	2015-07-20	21960	0	0	46	admin	Kenton			\N	2015-07-20	2015-08-10	15899	469	\N	grodriguez	0		\N	\N	dthiessen	2015-08-14 10:20:12.44	1	15899	0	1
50434	1025	2015-07-23	9000	0	0	58	admin	ship		511	\N	2015-07-23	2015-08-13	6678	280	\N	grodriguez	kochao		\N	\N	dthiessen	2015-08-14 10:32:14.644	1	6678	0	1
50435	1025	2015-07-23	6840	0	0	49	admin	ship		402-3	\N	2015-07-23	2015-08-13	5474	71	\N	admin	0		\N	\N	dthiessen	2015-08-14 10:37:22.378	1	5474	0	1
50436	1025	2015-07-23	14040	0	0	40	admin	ship		510	\N	2015-07-23	2015-08-13	10770	310	\N	grodriguez	kochao		\N	\N	dthiessen	2015-08-14 10:38:10.472	1	10770	0	1
50437	1025	2015-07-23	15480	0	0	40	admin	ship		507-1	\N	2015-07-23	2015-08-13	11988	188	\N	grodriguez	0		\N	\N	dthiessen	2015-08-14 10:38:45.847	1	11988	0	1
50438	1025	2015-07-23	17640	0	0	40	admin	ship		507-2	\N	2015-07-23	2015-08-13	15681	302	\N	jquewell	0		\N	\N	dthiessen	2015-08-14 10:40:07.065	1	15681	0	1
50439	1025	2015-07-23	36000	0	0	41	admin	ship		9605	\N	2015-07-23	2015-08-13	27960	297	\N	jquewell	0		\N	\N	dthiessen	2015-08-14 10:43:03.456	1	27960	0	1
50441	1012	2015-07-27	19080	0	0	56	admin	Paul			\N	2015-07-27	2015-08-17	10790	361	\N	grodriguez	0		\N	\N	dthiessen	2015-08-14 10:51:30.456	1	10790	0	1
50442	1014	2015-07-27	21600	0	0	47	admin	Kenton			\N	2015-07-27	2015-08-17	15050	437	\N	alopez	0		\N	\N	dthiessen	2015-08-14 10:55:03.05	1	15050	0	1
50443	1016	2015-07-27	22680	0	0	38	admin	Timmy			\N	2015-07-27	2015-08-17	20126	151	\N	wcabb	grodriguez		\N	\N	dthiessen	2015-08-14 10:58:19.706	1	20126	0	1
50444	1017	2015-07-27	22320	0	0	33	admin	Jake			\N	2015-07-27	2015-08-17	19172	129	\N	wcabb	grodriguez		\N	\N	dthiessen	2015-08-14 10:58:39.815	1	19172	0	1
50446	1025	2015-07-30	5400	0	0	64	admin	ship		401-4	\N	2015-07-30	2015-08-20	4209	74	\N	alopez	0		\N	\N	dthiessen	2015-08-14 11:01:54.503	1	4209	0	1
50448	1025	2015-07-30	30600	0	0	42	admin	ship		9605	\N	2015-07-30	2015-08-20	23473	449	\N	grodriguez	0		\N	\N	dthiessen	2015-08-14 11:07:02.956	1	23473	0	1
50449	1025	2015-07-30	1800	0	0	41	admin	ship		510	\N	2015-07-30	2015-08-20	1514	25	\N	wcabb	jquewell		\N	\N	dthiessen	2015-08-14 11:07:25.612	1	1514	0	1
50451	1025	2015-07-30	31320	0	0	31	admin	ship		806	\N	2015-07-30	2015-08-20	27040	105	\N	wcabb	0		\N	\N	dthiessen	2015-08-14 11:10:07.706	1	27040	0	1
50479	1014	2015-08-20	18000	5400	0	51	admin	worker			\N	2015-08-20	2015-09-10	13018	274	\N	jquewell	0		\N	\N	dthiessen	2015-08-20 10:25:37.896	1	13018	0	1
50450	1025	2015-07-30	7200	0	0	36	admin	ship		502-1	\N	2015-07-30	2015-08-20	6028	48	\N	admin	0		\N	\N	dthiessen	2015-08-14 11:08:59.722	1	6028	0	1
50452	1026	2015-08-03	18720	0	0	50	admin	Jake			\N	2015-08-03	2015-08-24	6121	0	\N	admin	0		\N	\N	dthiessen	2015-08-14 11:10:39.206	2	11512	5391	2
50482	1014	2015-08-17	5760	14400	0	51	admin	worker			\N	2015-08-17	2015-09-07	3748	175	\N	grodriguez	kochao		\N	\N	dthiessen	2015-08-20 10:38:50.896	1	3748	0	1
50440	1026	2015-07-27	3960	0	0	49	admin	Jake			\N	2015-07-27	2015-08-17	1580	0	\N	admin	0		\N	\N	dthiessen	2015-08-14 10:49:10.69	2	3193	1613	2
50463	1025	2015-08-06	10800	0	0	31	admin	ship		526-1/2	\N	2015-08-06	2015-08-27	8861	74	\N	zalegria	alopez		\N	\N	dthiessen	2015-08-14 13:56:27.925	1	8861	0	1
50453	1012	2015-08-03	18540	0	0	57	admin	Paul			\N	2015-08-03	2015-08-24	10279	258	\N	grodriguez	0		\N	\N	dthiessen	2015-08-14 11:11:01.487	1	10279	0	1
50455	1016	2015-08-03	22680	0	0	39	admin	Timmy			\N	2015-08-03	2015-08-24	19834	300	\N	grodriguez	alopez		\N	\N	dthiessen	2015-08-14 11:11:37.253	1	19834	0	1
50456	1017	2015-08-03	24120	0	0	34	admin	Jake			\N	2015-08-03	2015-08-24	20923	151	\N	admin	0		\N	\N	dthiessen	2015-08-14 11:11:49.909	1	20923	0	1
50457	1025	2015-08-06	7920	0	0	62	admin	ship		516-2	\N	2015-08-06	2015-08-27	4342	233	\N	grodriguez	0		\N	\N	dthiessen	2015-08-14 13:34:46.269	1	4342	0	1
50459	1025	2015-08-06	8280	0	0	57	admin	ship		578-2	\N	2015-08-06	2015-08-27	3663	270	\N	grodriguez	0		\N	\N	dthiessen	2015-08-14 13:40:37.815	1	3663	0	1
50460	1025	2015-08-06	9360	0	0	42	admin	ship		501	\N	2015-08-06	2015-08-27	7988	73	\N	grodriguez	jquewell		\N	\N	dthiessen	2015-08-14 13:42:27.55	1	7988	0	1
50461	1025	2015-08-06	6480	0	0	37	admin	ship		522	\N	2015-08-06	2015-08-27	5548	82	\N	wcabb	0		\N	\N	dthiessen	2015-08-14 13:47:04.175	1	5548	0	1
50464	1025	2015-08-06	5400	0	0	27	admin	ship		404-4	\N	2015-08-06	2015-08-27	4093	36	\N	jquewell	0		\N	\N	dthiessen	2015-08-14 13:57:05.519	1	4093	0	1
50465	1025	2015-08-06	12960	0	0	27	admin	ship		509-1/2	\N	2015-08-06	2015-08-27	10501	82	\N	wcabb	0		\N	\N	dthiessen	2015-08-14 13:57:36.269	1	10501	0	1
50467	1014	2015-08-10	20520	0	0	49	admin	Kenton			\N	2015-08-10	2015-08-31	14126	590	\N	grodriguez	kochao		\N	\N	dthiessen	2015-08-14 14:48:28.8	1	14126	0	1
50468	1016	2015-08-10	22320	0	0	40	admin	Timmy			\N	2015-08-10	2015-08-31	18790	285	\N	grodriguez	kochao		\N	\N	dthiessen	2015-08-14 14:48:44.175	1	18790	0	1
50469	1017	2015-08-10	24660	0	0	35	admin	Jake			\N	2015-08-10	2015-08-31	20687	292	\N	grodriguez	kochao		\N	\N	dthiessen	2015-08-14 14:49:14.034	1	20687	0	1
50471	1025	2015-08-13	7560	0	0	62	admin	ship		400-1/2	\N	2015-08-13	2015-09-03	5305	85	\N	wcabb	0		\N	\N	dthiessen	2015-08-14 14:50:35.753	1	5305	0	1
50472	1025	2015-08-13	16200	0	0	39	admin	ship		521-1/2	\N	2015-08-13	2015-09-03	12884	236	\N	jquewell	kochao		\N	\N	dthiessen	2015-08-14 14:51:17.69	1	12884	0	1
50474	1025	2015-08-13	27000	0	0	32	admin	ship		526-1/2	\N	2015-08-13	2015-09-03	21800	306	\N	jquewell	kochao		\N	\N	dthiessen	2015-08-14 14:52:21.659	1	21800	0	1
50475	1025	2015-08-13	23400	0	0	29	admin	ship		525-1/2	\N	2015-08-13	2015-09-03	16751	203	\N	zalegria	alopez		\N	\N	dthiessen	2015-08-14 14:52:49.909	1	16751	0	1
50476	1025	2015-08-13	14040	0	0	28	admin	ship		509-1	\N	2015-08-13	2015-09-03	10522	94	\N	wcabb	0		\N	\N	dthiessen	2015-08-14 14:53:19.144	1	10522	0	1
50481	1012	2015-08-17	4860	12060	0	60	admin	Paul			\N	2015-08-17	2015-09-07	2225	125	\N	grodriguez	kochao		\N	\N	dthiessen	2015-08-20 10:38:29.099	1	2225	0	1
50478	1017	2015-08-20	24480	8100	0	37	admin	jake			\N	2015-08-20	2015-09-10	20028	230	\N	grodriguez	kochao		\N	\N	dthiessen	2015-08-20 10:21:48.614	1	20028	0	1
50964	1029	2016-02-18	0	13320	0	29	dthiessen	me			\N	2016-02-18	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-02-19 10:22:03.348	2	\N	\N	1
50445	1025	2015-07-30	5040	0	0	64	admin	ship		401-3	\N	2015-07-30	2015-08-20	3375	104	\N	grodriguez	0		\N	\N	dthiessen	2015-08-14 11:00:59.597	1	3375	0	1
50447	1025	2015-07-30	6840	0	0	60	admin	ship		400-1	\N	2015-07-30	2015-08-20	4754	119	\N	grodriguez	0		\N	\N	dthiessen	2015-08-14 11:06:10.8	1	4754	0	1
50427	1025	2015-07-16	27360	0	0	44	admin	ship		402-4	\N	2015-07-16	2015-08-06	23818	213	\N	jquewell	0		\N	\N	dthiessen	2015-08-14 10:13:35.862	1	23818	0	1
50507	1019	2015-08-17	2160	5400	0	30	admin	Peter			\N	2015-08-17	2015-09-07	1462	39	\N	wcabb	alopez		\N	\N	dthiessen	2015-08-26 12:45:08.334	1	1462	0	1
50508	1020	2015-08-17	5040	12600	0	28	admin	Otto			\N	2015-08-17	2015-09-07	2416	127	\N	wcabb	alopez		\N	\N	dthiessen	2015-08-26 12:45:27.303	1	2416	0	1
50488	1025	2015-08-17	6840	0	0	44	admin	ship		402-1	\N	2015-08-17	2015-09-07	4946	384	\N	gcano	kochao		\N	\N	dthiessen	2015-08-21 13:48:56.585	1	4946	0	1
50492	1025	2015-08-17	12600	0	0	44	admin	ship		510	\N	2015-08-17	2015-09-07	10452	130	\N	gcano	kochao		\N	\N	dthiessen	2015-08-21 14:03:58.46	1	10452	0	1
50493	1025	2015-08-17	3600	0	0	44	dyoung	ship		507-1	\N	2015-08-17	2015-09-07	3135	40	\N	jquewell	zalegria		\N	\N	dthiessen	2015-08-21 14:04:35.6	1	3135	0	1
50454	1014	2015-08-03	21420	0	0	48	admin	Kenton			\N	2015-08-03	2015-08-24	14936	650	\N	grodriguez	zalegria		\N	\N	dthiessen	2015-08-14 11:11:21.05	1	14936	0	1
50503	1019	2015-08-03	1440	0	0	28	admin	Peter			\N	2015-08-03	2015-08-24	733	29	\N	jquewell	zalegria		\N	\N	dthiessen	2015-08-26 12:43:48.428	1	733	0	1
50504	1020	2015-08-03	1080	0	0	26	admin	Otto			\N	2015-08-03	2015-08-24	442	68	\N	jquewell	zalegria		\N	\N	dthiessen	2015-08-26 12:44:02.865	1	442	0	1
50505	1019	2015-08-10	5040	0	0	29	admin	Peter			\N	2015-08-10	2015-08-31	3295	56	\N	wcabb	jquewell		\N	\N	dthiessen	2015-08-26 12:44:28.397	1	3295	0	1
50506	1020	2015-08-10	6480	0	0	27	admin	Otto			\N	2015-08-10	2015-08-31	2994	256	\N	grodriguez	0		\N	\N	dthiessen	2015-08-26 12:44:44.084	1	2994	0	1
50483	1016	2015-08-17	6120	15300	0	42	admin	Timmy			\N	2015-08-17	2015-09-07	5032	78	\N	wcabb	0		\N	\N	dthiessen	2015-08-20 10:39:16.63	1	5032	0	1
50485	1025	2015-08-17	6120	0	0	49	admin	ship		402-3	\N	2015-08-17	2015-09-07	5201	111	\N	wcabb	0		\N	\N	dthiessen	2015-08-20 10:42:33.896	1	5201	0	1
50489	1025	2015-08-17	6480	0	0	44	admin	ship		402-2	\N	2015-08-17	2015-09-07	4857	413	\N	wcabb	alopez		\N	\N	dthiessen	2015-08-21 13:49:32.6	1	4857	0	1
50490	1025	2015-08-17	1800	0	0	28	admin	ship		524-1	\N	2015-08-17	2015-09-07	1244	27	\N	jquewell	zalegria		\N	\N	dthiessen	2015-08-21 13:50:06.616	1	1244	0	1
50494	1025	2015-08-17	3240	0	0	44	admin	ship		507-2	\N	2015-08-17	2015-09-07	2702	53	\N	gcano	kochao		\N	\N	dthiessen	2015-08-21 14:11:14.272	1	2702	0	1
50496	1025	2015-08-17	6120	0	0	39	admin	ship		502-2	\N	2015-08-17	2015-09-07	5520	47	\N	wcabb	0		\N	\N	dthiessen	2015-08-21 14:12:38.304	1	5520	0	1
50486	1012	2015-08-20	15120	5040	0	60	admin	Wife			\N	2015-08-20	2015-09-10	6880	208	\N	grodriguez	kochao		\N	\N	dthiessen	2015-08-20 10:43:44.286	1	6880	0	1
50509	1019	2015-08-20	7200	2520	0	31	admin	Peter			\N	2015-08-20	2015-09-10	4713	109	\N	jquewell	0		\N	\N	dthiessen	2015-08-26 12:45:47.834	1	4713	0	1
50497	1025	2015-08-20	7200	0	0	28	admin	ship		524-1	\N	2015-08-20	2015-09-10	4762	49	\N	grodriguez	kochao		\N	\N	dthiessen	2015-08-21 14:14:37.022	1	4762	0	1
50498	1025	2015-08-20	9000	0	0	28	admin	ship		524-2	\N	2015-08-20	2015-09-10	4346	163	\N	grodriguez	kochao		\N	\N	dthiessen	2015-08-21 14:15:00.741	1	4346	0	1
50499	1012	2015-08-24	4680	9540	0	60	admin	Elma			\N	2015-08-24	2015-09-14	2031	91	\N	grodriguez	kochao		\N	\N	dthiessen	2015-08-24 08:29:24.404	1	2031	0	1
50502	1016	2015-08-24	7020	14040	0	42	admin	Timmy			\N	2015-08-24	2015-09-14	6028	107	\N	jquewell	alopez		\N	\N	dthiessen	2015-08-24 09:52:03.56	1	6028	0	1
50501	1014	2015-08-24	5760	10800	0	51	admin	Kenton			\N	2015-08-24	2015-09-14	3272	220	\N	admin	zalegria		\N	\N	dthiessen	2015-08-24 09:40:56.545	1	3272	0	1
50511	1019	2015-08-24	2520	6480	0	31	admin	Peter			\N	2015-08-24	2015-09-14	1763	11	\N	admin	zalegria		\N	\N	dthiessen	2015-08-26 12:46:21.209	1	1763	0	1
50513	1025	2015-08-24	7200	0	0	64	admin	ship		400-1/2	\N	2015-08-24	2015-09-14	4431	307	\N	admin	zalegria		\N	\N	dthiessen	2015-08-26 13:08:12.756	1	4431	0	1
50514	1025	2015-08-24	9720	0	0	54	admin	SHIP		400-5/6	\N	2015-08-24	2015-09-14	7569	446	\N	admin	zalegria		\N	\N	dthiessen	2015-08-26 13:08:41.85	1	7569	0	1
50516	1025	2015-08-24	13320	0	0	45	admin	ship		402-1/2	\N	2015-08-24	2015-09-14	10790	315	\N	jquewell	alopez		\N	\N	dthiessen	2015-08-26 13:09:43.397	1	10790	0	1
50517	1025	2015-08-24	4680	0	0	40	admin	ship		403-1	\N	2015-08-24	2015-09-14	3872	28	\N	kochao	alopez		\N	\N	dthiessen	2015-08-26 13:10:09.943	1	3872	0	1
50518	1025	2015-08-24	14040	0	0	38	admin	ship		406-1/2	\N	2015-08-24	2015-09-14	10636	402	\N	admin	zalegria		\N	\N	dthiessen	2015-08-26 13:10:32.412	1	10636	0	1
50520	1025	2015-08-24	3960	0	0	31	admin	ship		525-1	\N	2015-08-24	2015-09-14	3057	127	\N	jquewell	wcabb		\N	\N	dthiessen	2015-08-26 13:15:07.522	1	3057	0	1
50521	1025	2015-08-24	5400	0	0	29	admin	ship		524-2	\N	2015-08-24	2015-09-14	4229	82	\N	wcabb	jquewell		\N	\N	dthiessen	2015-08-26 13:15:34.131	1	4229	0	1
50527	1026	2015-08-27	15840	0	0	54	admin	Galen Thiessen			\N	2015-08-27	2015-09-17	6432	0	\N	admin	admin		\N	\N	dthiessen	2015-08-27 11:03:37.156	2	12953	6521	2
50525	1014	2015-08-27	15120	3780	0	52	admin	Cindy Plett			\N	2015-08-27	2015-09-17	11235	218	\N	zalegria	kochao		\N	\N	dthiessen	2015-08-27 10:52:36.281	1	11235	0	1
50524	1016	2015-08-27	18720	1980	0	43	admin	Abram Reimer			\N	2015-08-27	2015-09-17	16284	121	\N	zalegria	kochao		\N	\N	dthiessen	2015-08-27 10:07:30.39	1	16284	0	1
50526	1017	2015-08-27	18900	0	0	38	admin	Galen Thiessen			\N	2015-08-27	2015-09-17	16270	197	\N	zalegria	kochao		\N	\N	dthiessen	2015-08-27 11:01:31.921	1	16270	0	1
50528	1020	2015-08-27	20880	10800	0	30	admin	Otto			\N	2015-08-27	2015-09-17	14824	371	\N	zalegria	wcabb		\N	\N	dthiessen	2015-08-27 14:08:10.812	1	14824	0	1
50534	1026	2015-08-31	5400	3240	0	54	admin	Galen			\N	2015-08-31	2015-09-21	2202	20	\N	jquewell	admin		\N	\N	dthiessen	2015-08-31 10:15:28.743	2	4365	2163	2
50535	1012	2015-08-31	10080	3240	0	61	admin	Candace			\N	2015-08-31	2015-09-21	3741	214	\N	kochao	alopez		\N	\N	dthiessen	2015-08-31 14:45:09.055	1	3741	0	1
50529	1016	2015-08-31	13500	0	0	43	admin	Tim			\N	2015-08-31	2015-09-21	10826	151	\N	wcabb	admin		\N	\N	dthiessen	2015-08-31 08:51:21.399	1	10826	0	1
50533	1017	2015-08-31	13860	0	0	38	admin	Galen			\N	2015-08-31	2015-09-21	11037	275	\N	jquewell	zalegria		\N	\N	dthiessen	2015-08-31 10:13:05.602	1	11037	0	1
50530	1019	2015-08-31	7200	3780	0	32	admin	Allen			\N	2015-08-31	2015-09-21	4785	160	\N	admin	kochao		\N	\N	dthiessen	2015-08-31 08:59:56.852	1	4785	0	1
50537	1026	2015-09-03	6840	2520	0	55	admin	Jake			\N	2015-09-03	2015-09-24	2826	18	\N	jquewell	zalegria		\N	\N	dthiessen	2015-09-03 08:03:59.669	2	5533	2707	2
50536	1012	2015-09-03	9720	0	0	62	admin	Candace			\N	2015-09-03	2015-09-24	2823	202	\N	agongora	gcano		\N	\N	dthiessen	2015-09-03 07:53:36.012	1	2823	0	1
50542	1014	2015-09-03	11880	0	0	53	admin	worker			\N	2015-09-03	2015-09-24	8869	170	\N	grodriguez	kochao		\N	\N	dthiessen	2015-09-03 10:30:58.903	1	8869	0	1
50538	1017	2015-09-03	10260	0	0	39	admin	Jake			\N	2015-09-03	2015-09-24	8861	86	\N	grodriguez	kochao		\N	\N	dthiessen	2015-09-03 08:04:34.715	1	8861	0	1
50539	1019	2015-09-03	8100	0	0	33	admin	Allen			\N	2015-09-03	2015-09-24	5587	63	\N	alopez	0		\N	\N	dthiessen	2015-09-03 08:09:20.309	1	5587	0	1
50543	1026	2015-09-07	10080	900	0	55	admin	Jake			\N	2015-09-07	2015-09-28	3941	0	\N	admin	admin		\N	\N	dthiessen	2015-09-07 07:39:59.984	2	7822	3881	2
50544	1012	2015-09-10	15300	0	0	63	admin	Candace			\N	2015-09-10	2015-10-01	6547	114	\N	alopez	kochao		\N	\N	dthiessen	2015-09-10 15:11:15.569	1	6547	0	1
50549	1020	2015-09-10	33840	0	0	32	admin	Annie			\N	2015-09-10	2015-10-01	27643	139	\N	grodriguez	admin		\N	\N	dthiessen	2015-09-10 15:20:56.397	1	27643	0	1
50550	1017	2015-09-10	23040	0	0	40	admin	Galen			\N	2015-09-10	2015-10-01	19688	125	\N	jquewell	zalegria		\N	\N	dthiessen	2015-09-10 15:31:45.991	1	19688	0	1
50577	1017	2015-09-24	2880	0	2880	42	admin	Jake			\N	2015-09-24	2015-10-15	2423	22	\N	wcabb	admin		\N	\N	dthiessen	2015-09-24 15:25:42.054	1	2423	0	1
50576	1012	2015-09-24	1620	0	1620	65	admin	Paul			\N	2015-09-24	2015-10-15	703	15	\N	zalegria	admin		\N	\N	dthiessen	2015-09-24 15:24:53.476	1	703	0	1
50573	1019	2015-09-24	1260	0	1260	36	admin	Allen			\N	2015-09-24	2015-10-15	857	11	\N	admin	agongora		\N	\N	dthiessen	2015-09-24 14:12:32.023	1	857	0	1
50572	1016	2015-09-24	2520	0	2520	47	admin	Tim			\N	2015-09-24	2015-10-15	2051	12	\N	admin	zalegria		\N	\N	dthiessen	2015-09-24 14:07:00.257	1	2051	0	1
50571	1014	2015-09-24	2340	0	2340	55	admin	Worker			\N	2015-09-24	2015-10-15	1675	17	\N	alopez	0		\N	\N	dthiessen	2015-09-24 13:57:16.039	1	1675	0	1
50569	1016	2015-09-24	8280	0	0	46	admin	Tim			\N	2015-09-24	2015-10-15	6740	38	\N	admin	zalegria		\N	\N	dthiessen	2015-09-24 09:26:14.461	1	6740	0	1
50611	1026	2015-08-06	3600	0	0	51	admin	Jake			\N	2015-08-06	2015-08-27	1328	0	\N	admin	0		\N	\N	dthiessen	2015-10-05 16:42:37.613	2	2667	1339	2
50458	1025	2015-08-06	10800	0	0	60	admin	ship		517-1/2	\N	2015-08-06	2015-08-27	8494	264	\N	wcabb	jquewell		\N	\N	dthiessen	2015-08-14 13:35:45.862	1	8494	0	1
50462	1025	2015-08-06	14400	0	0	35	admin	ship		406-1/2	\N	2015-08-06	2015-08-27	12644	104	\N	wcabb	jquewell		\N	\N	dthiessen	2015-08-14 13:48:59.315	1	12644	0	1
50466	1012	2015-08-10	18000	0	0	58	admin	Paul			\N	2015-08-10	2015-08-31	8729	445	\N	grodriguez	kochao		\N	\N	dthiessen	2015-08-14 14:48:13.862	1	8729	0	1
50588	1025	2015-09-07	3600	0	0	55	admin	ship		6020	\N	2015-09-07	2015-09-28	2517	19	\N	grodriguez	admin		\N	\N	dthiessen	2015-10-05 14:12:16.894	1	2517	0	1
50589	1025	2015-09-07	28440	0	0	48	admin	SHIP		6018	\N	2015-09-07	2015-09-28	19774	363	\N	grodriguez	admin		\N	\N	dthiessen	2015-10-05 14:12:45.238	1	19774	0	1
50591	1025	2015-09-07	6840	0	0	42	admin	ship		403-2	\N	2015-09-07	2015-09-28	5700	54	\N	grodriguez	admin		\N	\N	dthiessen	2015-10-05 14:13:44.816	1	5700	0	1
50551	1026	2015-09-10	5040	0	0	56	admin	Galen			\N	2015-09-10	2015-10-01	2080	0	\N	jquewell	zalegria		\N	\N	dthiessen	2015-09-10 15:32:36.366	2	4152	2072	2
50545	1014	2015-09-10	18000	0	0	54	admin	Cindy			\N	2015-09-10	2015-10-01	13208	66	\N	grodriguez	admin		\N	\N	dthiessen	2015-09-10 15:12:35.584	1	13208	0	1
50548	1019	2015-09-10	9360	0	0	34	admin	Allen			\N	2015-09-10	2015-10-01	6028	100	\N	kochao	alopez		\N	\N	dthiessen	2015-09-10 15:20:26.116	1	6028	0	1
50594	1025	2015-09-14	12240	0	0	47	admin	ship		403-3/4	\N	2015-09-14	2015-10-05	9945	65	\N	grodriguez	admin		\N	\N	dthiessen	2015-10-05 16:12:09.144	1	9945	0	1
50595	1025	2015-09-14	6840	0	0	46	admin	ship		1290	\N	2015-09-14	2015-10-05	5045	68	\N	grodriguez	gcano		\N	\N	dthiessen	2015-10-05 16:12:54.488	1	5045	0	1
50597	1025	2015-09-14	720	0	0	43	admin	ship		502-1	\N	2015-09-14	2015-10-05	612	8	\N	jquewell	wcabb		\N	\N	dthiessen	2015-10-05 16:14:33.004	1	612	0	1
50598	1025	2015-09-14	2160	0	0	41	admin	ship		406-1/2	\N	2015-09-14	2015-10-05	1833	25	\N	jquewell	wcabb		\N	\N	dthiessen	2015-10-05 16:15:11.441	1	1833	0	1
50600	1025	2015-09-14	17640	0	0	34	admin	ship		4707	\N	2015-09-14	2015-10-05	15134	32	\N	grodriguez	kochao		\N	\N	dthiessen	2015-10-05 16:16:33.488	1	15134	0	1
50601	1025	2015-09-14	9720	0	0	31	admin	ship		523-1	\N	2015-09-14	2015-10-05	7634	47	\N	wcabb	alopez		\N	\N	dthiessen	2015-10-05 16:17:14.316	1	7634	0	1
50602	1025	2015-09-14	1080	0	0	28	admin	ship		405-1	\N	2015-09-14	2015-10-05	809	0	\N	grodriguez	admin		\N	\N	dthiessen	2015-10-05 16:18:03.3	1	809	0	1
50555	1012	2015-09-17	16740	0	0	64	admin	Candice			\N	2015-09-17	2015-10-08	7049	148	\N	grodriguez	kochao		\N	\N	dthiessen	2015-09-17 09:44:33.064	1	7049	0	1
50557	1014	2015-09-17	19440	0	0	55	admin	Cindy			\N	2015-09-17	2015-10-08	13644	211	\N	grodriguez	kochao		\N	\N	dthiessen	2015-09-17 11:31:07.581	1	13644	0	1
50558	1016	2015-09-17	21960	0	0	46	admin	Abram			\N	2015-09-17	2015-10-08	18511	139	\N	alopez	kochao		\N	\N	dthiessen	2015-09-17 13:18:04.442	1	18511	0	1
50552	1019	2015-09-17	10440	0	0	35	admin	Allen			\N	2015-09-17	2015-10-08	7064	102	\N	wcabb	admin		\N	\N	dthiessen	2015-09-17 08:49:17.657	1	7064	0	1
50556	1020	2015-09-17	35280	0	0	33	admin	Otto			\N	2015-09-17	2015-10-08	28284	234	\N	alopez	kochao		\N	\N	dthiessen	2015-09-17 11:07:14.487	1	28284	0	1
50559	1026	2015-09-21	6840	0	0	57	admin	Jake			\N	2015-09-21	2015-10-12	2700	16	\N	admin	0		\N	\N	dthiessen	2015-09-22 08:40:33.599	2	5412	2712	2
50561	1014	2015-09-21	10260	0	0	55	admin	Cindy			\N	2015-09-21	2015-10-12	7074	83	\N	admin	zalegria		\N	\N	dthiessen	2015-09-22 08:41:27.115	1	7074	0	1
50562	1016	2015-09-21	11700	0	0	46	admin	Tim			\N	2015-09-21	2015-10-12	9757	91	\N	alopez	0		\N	\N	dthiessen	2015-09-22 08:41:48.162	1	9757	0	1
50563	1017	2015-09-21	13140	0	0	41	admin	Jake			\N	2015-09-21	2015-10-12	10906	128	\N	grodriguez	kochao		\N	\N	dthiessen	2015-09-22 08:42:11.662	1	10906	0	1
50565	1020	2015-09-21	19980	0	0	33	admin	Otto			\N	2015-09-21	2015-10-12	16394	51	\N	admin	zalegria		\N	\N	dthiessen	2015-09-22 08:42:55.365	1	16394	0	1
50566	1012	2015-09-24	6660	0	0	64	admin	Paul			\N	2015-09-24	2015-10-15	2889	63	\N	zalegria	admin		\N	\N	dthiessen	2015-09-24 08:32:45.224	1	2889	0	1
50568	1019	2015-09-24	4680	0	0	35	admin	Allen			\N	2015-09-24	2015-10-15	3182	41	\N	admin	agongora		\N	\N	dthiessen	2015-09-24 09:05:56.57	1	3182	0	1
50574	1020	2015-09-24	14760	0	0	34	admin	Otto			\N	2015-09-24	2015-10-15	11786	99	\N	admin	agongora		\N	\N	dthiessen	2015-09-24 14:48:02.07	1	11786	0	1
50603	1025	2015-09-28	8640	0	0	59	admin	ship		519-2	\N	2015-09-28	2015-10-19	5296	0	\N	grodriguez	admin		\N	\N	dthiessen	2015-10-05 16:32:20.347	1	5296	0	1
50604	1025	2015-09-28	14400	0	0	59	admin	ship		400-5/6	\N	2015-09-28	2015-10-19	10360	0	\N	zalegria	alopez		\N	\N	dthiessen	2015-10-05 16:33:06.394	1	10360	0	1
50606	1025	2015-09-28	32400	0	0	37	admin	ship		7917	\N	2015-09-28	2015-10-19	24894	0	\N	admin	admin		\N	\N	dthiessen	2015-10-05 16:34:51.722	1	24894	0	1
50607	1025	2015-09-28	15840	0	0	36	admin	ship		525-1/2	\N	2015-09-28	2015-10-19	13303	0	\N	admin	0		\N	\N	dthiessen	2015-10-05 16:35:29.8	1	13303	0	1
50608	1025	2015-09-28	15840	0	0	36	admin	ship		527-1/2	\N	2015-09-28	2015-10-19	12573	0	\N	jquewell	admin		\N	\N	dthiessen	2015-10-05 16:35:59.722	1	12573	0	1
50610	1025	2015-09-28	7200	0	0	33	admin	ship		523-1	\N	2015-09-28	2015-10-19	5855	0	\N	admin	grodriguez		\N	\N	dthiessen	2015-10-05 16:36:58.097	1	5855	0	1
50581	1012	2015-10-01	13500	0	0	66	admin	Elma			\N	2015-10-01	2015-10-22	5109	148	\N	agongora	0		\N	\N	dthiessen	2015-10-01 09:24:32.394	1	5109	0	1
50579	1026	2015-10-01	21600	1800	0	59	admin	Jake			\N	2015-10-01	2015-10-22	7887	0	\N	admin	0		\N	\N	dthiessen	2015-10-01 08:56:22.035	2	15553	7666	2
50583	1016	2015-10-01	18000	0	0	48	admin	Abram			\N	2015-10-01	2015-10-22	14400	111	\N	kochao	alopez		\N	\N	dthiessen	2015-10-01 10:01:13.66	1	14400	0	1
50580	1017	2015-10-01	20520	0	0	43	admin	Jake			\N	2015-10-01	2015-10-22	17612	104	\N	admin	0		\N	\N	dthiessen	2015-10-01 08:56:44.16	1	17612	0	1
50578	1019	2015-10-01	9360	0	0	37	admin	Peter			\N	2015-10-01	2015-10-22	6628	109	\N	wcabb	0		\N	\N	dthiessen	2015-10-01 08:36:27.426	1	6628	0	1
50582	1020	2015-10-01	29520	0	0	35	admin	Otto			\N	2015-10-01	2015-10-22	23843	238	\N	jquewell	admin		\N	\N	dthiessen	2015-10-01 09:37:10.879	1	23843	0	1
50473	1025	2015-08-13	3600	0	0	36	admin	ship		406-2	\N	2015-08-13	2015-09-03	3141	39	\N	zalegria	alopez		\N	\N	dthiessen	2015-08-14 14:51:45.565	1	3141	0	1
50477	1026	2015-08-17	17280	0	0	52	admin	Jake			\N	2015-08-17	2015-09-07	6656	0	\N	jquewell	zalegria		\N	\N	dthiessen	2015-08-20 10:09:15.927	2	12989	6333	2
50484	1017	2015-08-17	7920	21600	0	37	admin	Jake			\N	2015-08-17	2015-09-07	6444	78	\N	grodriguez	kochao		\N	\N	dthiessen	2015-08-20 10:39:38.708	1	6444	0	1
50487	1025	2015-08-17	5760	0	0	49	admin	ship		402-4	\N	2015-08-17	2015-09-07	4916	49	\N	gcano	kochao		\N	\N	dthiessen	2015-08-21 13:48:09.507	1	4916	0	1
50491	1025	2015-08-17	14040	0	0	44	admin	ship		501	\N	2015-08-17	2015-09-07	10790	454	\N	jquewell	zalegria		\N	\N	dthiessen	2015-08-21 13:50:43.007	1	10790	0	1
50495	1025	2015-08-17	1800	0	0	43	admin	ship		403-3	\N	2015-08-17	2015-09-07	1257	25	\N	gcano	kochao		\N	\N	dthiessen	2015-08-21 14:12:06.304	1	1257	0	1
50480	1016	2015-08-20	19800	6480	0	42	admin	Abram			\N	2015-08-20	2015-09-10	16488	290	\N	jquewell	0		\N	\N	dthiessen	2015-08-20 10:26:39.333	1	16488	0	1
50510	1020	2015-08-20	16200	5400	0	29	admin	Otto			\N	2015-08-20	2015-09-10	11355	203	\N	zalegria	alopez		\N	\N	dthiessen	2015-08-26 12:46:04.881	1	11355	0	1
50500	1017	2015-08-24	7920	15840	0	37	admin	Marilyn			\N	2015-08-24	2015-09-14	6677	108	\N	grodriguez	kochao		\N	\N	dthiessen	2015-08-24 09:30:56.373	1	6677	0	1
50512	1020	2015-08-24	7920	16560	0	29	admin	Otto			\N	2015-08-24	2015-09-14	5532	126	\N	grodriguez	kochao		\N	\N	dthiessen	2015-08-26 12:46:33.225	1	5532	0	1
50515	1025	2015-08-24	12240	0	0	50	admin	ship		402-3/4	\N	2015-08-24	2015-09-14	9789	256	\N	alopez	kochao		\N	\N	dthiessen	2015-08-26 13:09:09.928	1	9789	0	1
50519	1025	2015-08-24	1440	0	0	34	admin	ship		404-2	\N	2015-08-24	2015-09-14	1110	30	\N	jquewell	0		\N	\N	dthiessen	2015-08-26 13:11:39.272	1	1110	0	1
50523	1012	2015-08-27	12600	3960	0	61	admin	Candace Penner			\N	2015-08-27	2015-09-17	5121	324	\N	zalegria	alopez		\N	\N	dthiessen	2015-08-27 09:37:17.921	1	5121	0	1
50522	1019	2015-08-27	6480	4860	0	32	admin	Allen Loewen			\N	2015-08-27	2015-09-17	4341	53	\N	wcabb	jquewell		\N	\N	dthiessen	2015-08-27 09:07:12.73	1	4341	0	1
50531	1014	2015-08-31	11520	3960	0	52	admin	Kenton			\N	2015-08-31	2015-09-21	7972	315	\N	agongora	gcano		\N	\N	dthiessen	2015-08-31 09:48:41.43	1	7972	0	1
50532	1020	2015-08-31	21600	6660	0	30	admin	Annie			\N	2015-08-31	2015-09-21	16362	232	\N	kochao	alopez		\N	\N	dthiessen	2015-08-31 10:02:47.133	1	16362	0	1
50540	1016	2015-09-03	8820	0	0	44	admin	Tim			\N	2015-09-03	2015-09-24	7490	38	\N	jquewell	zalegria		\N	\N	dthiessen	2015-09-03 08:27:47.122	1	7490	0	1
50541	1020	2015-09-03	21240	0	0	31	admin	Annie			\N	2015-09-03	2015-09-24	16844	127	\N	jquewell	zalegria		\N	\N	dthiessen	2015-09-03 09:50:30.247	1	16844	0	1
50586	1025	2015-09-07	9360	0	0	63	admin	ship		407-1	\N	2015-09-07	2015-09-28	4984	292	\N	zalegria	agongora		\N	\N	dthiessen	2015-10-05 14:11:09.347	1	4984	0	1
50587	1025	2015-09-07	2880	0	0	56	admin	ship		400-5	\N	2015-09-07	2015-09-28	1987	105	\N	jquewell	kochao		\N	\N	dthiessen	2015-10-05 14:11:46.488	1	1987	0	1
50590	1025	2015-09-07	6480	0	0	46	admin	ship		403-3	\N	2015-09-07	2015-09-28	5463	76	\N	zalegria	agongora		\N	\N	dthiessen	2015-10-05 14:13:18.8	1	5463	0	1
50546	1016	2015-09-10	19980	0	0	45	admin	Tim			\N	2015-09-10	2015-10-01	17308	115	\N	grodriguez	admin		\N	\N	dthiessen	2015-09-10 15:13:05.241	1	17308	0	1
50592	1025	2015-09-14	10800	0	0	53	admin	ship		7908	\N	2015-09-14	2015-10-05	8751	75	\N	grodriguez	admin		\N	\N	dthiessen	2015-10-05 16:10:07.644	1	8751	0	1
50596	1025	2015-09-14	13680	0	0	43	admin	ship		403-1/2	\N	2015-09-14	2015-10-05	11460	106	\N	agongora	admin		\N	\N	dthiessen	2015-10-05 16:13:39.144	1	11460	0	1
50599	1025	2015-09-14	12960	0	0	37	admin	ship		404-1/2	\N	2015-09-14	2015-10-05	10887	44	\N	wcabb	zalegria		\N	\N	dthiessen	2015-10-05 16:16:00.05	1	10887	0	1
50622	1025	2015-10-05	10080	0	0	32	admin	ship		7492	\N	2015-10-05	2015-10-26	8303	51	\N	jquewell	admin		\N	\N	dthiessen	2015-10-09 16:34:49.238	1	8303	0	1
50625	1026	2015-10-12	9000	0	0	60	admin	Jake			\N	2015-10-12	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2015-10-12 14:28:09.349	2	\N	\N	2
50553	1026	2015-09-17	15480	1080	0	57	admin	Jake			\N	2015-09-17	2015-10-08	6136	0	\N	admin	0		\N	\N	dthiessen	2015-09-17 09:21:09.657	2	12049	5913	2
50560	1012	2015-09-21	9000	0	0	64	admin	Candace			\N	2015-09-21	2015-10-12	3871	59	\N	grodriguez	kochao		\N	\N	dthiessen	2015-09-22 08:41:03.24	1	3871	0	1
50564	1019	2015-09-21	5580	0	0	35	admin	Allen			\N	2015-09-21	2015-10-12	4275	16	\N	alopez	jquewell		\N	\N	dthiessen	2015-09-22 08:42:33.678	1	4275	0	1
50623	1025	2015-10-05	6120	0	0	32	admin	ship		7489	\N	2015-10-05	2015-10-26	5084	32	\N	jquewell	admin		\N	\N	dthiessen	2015-10-09 16:35:20.488	1	5084	0	1
50619	1020	2015-10-08	34200	0	0	36	admin	Julia			\N	2015-10-08	2015-10-29	26851	188	\N	jquewell	zalegria		\N	\N	dthiessen	2015-10-08 10:41:20.691	1	26851	0	1
50554	1017	2015-09-17	24120	0	0	41	admin	Jake			\N	2015-09-17	2015-10-08	20240	153	\N	grodriguez	kochao		\N	\N	dthiessen	2015-09-17 09:21:45.673	1	20240	0	1
50612	1012	2015-10-08	14220	0	0	67	admin	Elma			\N	2015-10-08	2015-10-29	4941	273	\N	grodriguez	admin		\N	\N	dthiessen	2015-10-08 08:48:39.535	1	4941	0	1
50620	1014	2015-10-08	18180	0	0	58	admin	worker			\N	2015-10-08	2015-10-29	11685	285	\N	jquewell	zalegria		\N	\N	dthiessen	2015-10-08 10:51:56.238	1	11685	0	1
50618	1016	2015-10-08	20160	0	0	49	admin	Abram			\N	2015-10-08	2015-10-29	15836	283	\N	jquewell	zalegria		\N	\N	dthiessen	2015-10-08 10:17:34.191	1	15836	0	1
50613	1019	2015-10-08	10980	0	0	38	admin	Peter			\N	2015-10-08	2015-10-29	7905	117	\N	nreimer	admin		\N	\N	dthiessen	2015-10-08 08:56:34.644	1	7905	0	1
50614	1021	2015-10-08	9000	0	0	28	admin	Abe			\N	2015-10-08	2015-10-29	6807	31	\N	nreimer	admin		\N	\N	dthiessen	2015-10-08 09:36:52.707	1	6807	0	1
50626	1025	2015-10-12	9360	0	0	61	admin	ship		519-3	\N	2015-10-12	2015-11-02	7367	135	\N	grodriguez	admin		\N	\N	dthiessen	2015-10-13 10:05:09.552	1	7367	0	1
50627	1025	2015-10-12	14760	0	0	61	admin	ship		519-4	\N	2015-10-12	2015-11-02	10559	223	\N	jquewell	cmanzanero		\N	\N	dthiessen	2015-10-13 10:05:51.036	1	10559	0	1
50629	1025	2015-10-12	8280	0	0	61	admin	ship		520-2	\N	2015-10-12	2015-11-02	6228	133	\N	admin	alopez		\N	\N	dthiessen	2015-10-13 10:06:48.036	1	6228	0	1
50630	1025	2015-10-12	5760	0	0	52	admin	ship		402-1	\N	2015-10-12	2015-11-02	4384	37	\N	jquewell	cmanzanero		\N	\N	dthiessen	2015-10-13 10:07:14.771	1	4384	0	1
50631	1025	2015-10-12	5760	0	0	52	admin	ship		402-2	\N	2015-10-12	2015-11-02	4884	17	\N	admin	alopez		\N	\N	dthiessen	2015-10-13 10:07:34.693	1	4884	0	1
50633	1025	2015-10-12	14040	0	0	38	admin	ship		525-2	\N	2015-10-12	2015-11-02	12131	59	\N	admin	alopez		\N	\N	dthiessen	2015-10-13 10:08:25.99	1	12131	0	1
50634	1025	2015-10-12	5400	0	0	35	admin	ship		523-1	\N	2015-10-12	2015-11-02	4531	14	\N	admin	wcabb		\N	\N	dthiessen	2015-10-13 10:08:46.88	1	4531	0	1
50635	1025	2015-10-12	1800	0	0	28	admin	ship		523-2	\N	2015-10-12	2015-11-02	1239	5	\N	admin	wcabb		\N	\N	dthiessen	2015-10-13 10:09:11.38	1	1239	0	1
50636	1012	2015-10-15	11520	0	0	68	admin	Elma			\N	2015-10-15	2015-11-05	3974	0	\N	admin	0		\N	\N	dthiessen	2015-10-15 08:55:25.099	1	3974	0	1
50638	1016	2015-10-15	20160	0	0	50	admin	Henry			\N	2015-10-15	2015-11-05	16228	84	\N	kochao	alopez		\N	\N	dthiessen	2015-10-15 09:41:13.443	1	16228	0	1
50640	1017	2015-10-15	22860	0	0	45	admin	Galen			\N	2015-10-15	2015-11-05	18341	162	\N	cmanzanero	alopez		\N	\N	dthiessen	2015-10-15 10:08:09.271	1	18341	0	1
50641	1020	2015-10-15	33840	0	0	37	admin	Charlie			\N	2015-10-15	2015-11-05	26714	194	\N	alopez	cmanzanero		\N	\N	dthiessen	2015-10-15 11:22:27.601	1	26714	0	1
50639	1021	2015-10-15	20340	0	0	29	admin	Abe			\N	2015-10-15	2015-11-05	15742	52	\N	admin	kochao		\N	\N	dthiessen	2015-10-15 09:51:41.786	1	15742	0	1
50570	1014	2015-09-24	7740	0	0	55	admin	Worker			\N	2015-09-24	2015-10-15	5542	58	\N	alopez	0		\N	\N	dthiessen	2015-09-24 09:43:07.429	1	5542	0	1
50567	1017	2015-09-24	10440	0	0	41	admin	Marlyn			\N	2015-09-24	2015-10-15	8785	81	\N	wcabb	admin		\N	\N	dthiessen	2015-09-24 08:43:52.804	1	8785	0	1
50575	1020	2015-09-24	4860	0	4860	34	admin	Otto			\N	2015-09-24	2015-10-15	3880	32	\N	admin	agongora		\N	\N	dthiessen	2015-09-24 14:48:22.351	1	3880	0	1
50605	1025	2015-09-28	9720	0	0	39	admin	ship		526-1/2	\N	2015-09-28	2015-10-19	7675	0	\N	admin	0		\N	\N	dthiessen	2015-10-05 16:34:18.707	1	7675	0	1
50609	1025	2015-09-28	3960	0	0	34	admin	ship		524-1	\N	2015-09-28	2015-10-19	3310	0	\N	wcabb	admin		\N	\N	dthiessen	2015-10-05 16:36:31.285	1	3310	0	1
50584	1014	2015-10-01	16020	0	0	57	admin	Kenton			\N	2015-10-01	2015-10-22	11018	105	\N	cmanzanero	admin		\N	\N	dthiessen	2015-10-01 10:41:48.816	1	11018	0	1
50615	1021	2015-10-01	1620	0	0	27	admin	Abe			\N	2015-10-01	2015-10-22	1162	20	\N	wcabb	0		\N	\N	dthiessen	2015-10-08 09:37:47.691	1	1162	0	1
50616	1026	2015-10-08	5400	1080	0	60	admin	Marlyn			\N	2015-10-08	2015-10-29	2125	13	\N	jquewell	grodriguez		\N	\N	dthiessen	2015-10-08 09:49:43.129	2	4185	2060	2
50647	1026	2015-10-22	5040	6120	0	62	admin	Marilyn			\N	2015-10-22	2015-11-12	1992	0	\N	jquewell	admin		\N	\N	dthiessen	2015-10-22 09:58:18.274	2	4039	2047	2
50649	1016	2015-10-22	19620	0	0	51	admin	Abram			\N	2015-10-22	2015-11-12	16187	85	\N	grodriguez	admin		\N	\N	dthiessen	2015-10-22 11:24:26.367	1	16187	0	1
50648	1021	2015-10-22	29160	0	0	30	admin	Abe			\N	2015-10-22	2015-11-12	23470	127	\N	kochao	admin		\N	\N	dthiessen	2015-10-22 10:13:48.539	1	23470	0	1
50645	1020	2015-10-22	33480	0	0	38	admin	Otto			\N	2015-10-22	2015-11-12	26724	176	\N	grodriguez	admin		\N	\N	dthiessen	2015-10-22 09:36:57.18	1	26724	0	1
50644	1019	2015-10-22	11160	0	0	40	admin	Peter			\N	2015-10-22	2015-11-12	8273	124	\N	grodriguez	admin		\N	\N	dthiessen	2015-10-22 09:22:36.867	1	8273	0	1
50650	1012	2015-10-22	5400	0	0	69	admin	Paul			\N	2015-10-22	2015-11-12	1836	0	\N	admin	0		\N	\N	dthiessen	2015-10-22 13:51:49.992	1	1836	0	1
50657	1026	2015-10-29	18000	720	0	63	admin	Marilyn			\N	2015-10-29	2015-11-19	5318	0	\N	admin	0		\N	\N	dthiessen	2015-10-29 09:53:26.026	2	10422	5104	2
50664	1020	2015-11-02	32580	0	0	39	admin	Julia			\N	2015-11-02	2015-11-23	26483	187	\N	grodriguez	admin		\N	\N	dthiessen	2015-11-02 11:33:10.854	1	26483	0	1
50662	1021	2015-11-02	18000	0	0	31	admin	Eric			\N	2015-11-02	2015-11-23	15469	36	\N	jquewell	admin		\N	\N	dthiessen	2015-11-02 10:06:10.073	1	15469	0	1
50668	1017	2015-11-05	9360	0	0	48	admin	Jake			\N	2015-11-05	2015-11-26	8363	40	\N	wcabb	cmanzanero		\N	\N	dthiessen	2015-11-05 10:02:17.484	1	8363	0	1
50666	1019	2015-11-05	4500	0	0	42	admin	Elizabeth Loewen			\N	2015-11-05	2015-11-26	3449	46	\N	zalegria	alopez		\N	\N	dthiessen	2015-11-05 09:08:27.951	1	3449	0	1
50667	1020	2015-11-05	13860	0	0	40	admin	Otto			\N	2015-11-05	2015-11-26	10842	143	\N	alopez	zalegria		\N	\N	dthiessen	2015-11-05 09:59:01.734	1	10842	0	1
50688	1019	2015-11-19	10080	0	0	44	admin	Allen			\N	2015-11-19	2015-12-10	8190	88	\N	gcano	zalegria		\N	\N	dthiessen	2015-11-19 09:37:11.06	1	8190	0	1
50628	1025	2015-10-12	3960	0	0	61	admin	ship		400-6	\N	2015-10-12	2015-11-02	2948	105	\N	wcabb	0		\N	\N	dthiessen	2015-10-13 10:06:16.193	1	2948	0	1
50632	1025	2015-10-12	2880	0	0	38	admin	ship		525-1	\N	2015-10-12	2015-11-02	2522	11	\N	wcabb	admin		\N	\N	dthiessen	2015-10-13 10:07:54.74	1	2522	0	1
50642	1014	2015-10-15	17820	0	0	59	admin	Worker			\N	2015-10-15	2015-11-05	11405	0	\N	admin	0		\N	\N	dthiessen	2015-10-15 11:23:56.554	1	11405	0	1
50637	1019	2015-10-15	10980	0	0	39	admin	Allan			\N	2015-10-15	2015-11-05	8208	69	\N	alopez	cmanzanero		\N	\N	dthiessen	2015-10-15 09:03:21.396	1	8208	0	1
50678	1025	2015-10-19	12600	0	0	49	admin	Ship		#521-1	\N	2015-10-19	2015-11-09	9470	173	\N	admin	kochao		\N	\N	dthiessen	2015-11-13 14:28:54.354	1	9470	0	1
50679	1025	2015-10-19	13680	0	0	43	admin	Ship		#526-2	\N	2015-10-19	2015-11-09	10445	76	\N	admin	0		\N	\N	dthiessen	2015-11-13 14:29:29.151	1	10445	0	1
50680	1025	2015-10-19	3600	0	0	39	admin	Ship		#527-1	\N	2015-10-19	2015-11-09	3051	24	\N	admin	kochao		\N	\N	dthiessen	2015-11-13 14:30:31.433	1	3051	0	1
50681	1025	2015-10-19	14400	0	0	39	admin	Ship		#527-2	\N	2015-10-19	2015-11-09	11832	216	\N	grodriguez	kochao		\N	\N	dthiessen	2015-11-13 14:30:57.417	1	11832	0	1
50682	1025	2015-10-19	11880	0	0	36	admin	Ship		#523-1	\N	2015-10-19	2015-11-09	9232	80	\N	grodriguez	admin		\N	\N	dthiessen	2015-11-13 14:31:26.245	1	9232	0	1
50683	1025	2015-10-19	15840	0	0	28	admin	Ship		#401-1	\N	2015-10-19	2015-11-09	12631	69	\N	zalegria	kochao		\N	\N	dthiessen	2015-11-13 14:31:54.323	1	12631	0	1
50655	1017	2015-10-29	21960	0	0	47	admin	Marilyn			\N	2015-10-29	2015-11-19	19579	110	\N	wcabb	cmanzanero		\N	\N	dthiessen	2015-10-29 09:50:49.714	1	19579	0	1
50672	1016	2015-11-09	10260	0	0	53	admin	Abram			\N	2015-11-09	2015-11-30	7615	164	\N	grodriguez	admin		\N	\N	dthiessen	2015-11-09 10:50:52.75	1	7615	0	1
50673	1020	2015-11-09	18720	0	0	40	admin	Nelson			\N	2015-11-09	2015-11-30	15002	125	\N	admin	cmanzanero		\N	\N	dthiessen	2015-11-09 11:32:16.296	1	15002	0	1
50674	1021	2015-11-12	31680	0	0	32	admin	Abe			\N	2015-11-12	2015-12-03	27310	96	\N	admin	0		\N	\N	dthiessen	2015-11-12 08:56:46.042	1	27310	0	1
50697	1017	2015-11-26	14400	5040	0	51	admin	Jake			\N	2015-11-26	2015-12-17	12123	144	\N	grodriguez	admin		\N	\N	dthiessen	2015-11-26 08:48:35.492	1	12123	0	1
50676	1017	2015-11-12	21420	0	0	49	admin	Jake			\N	2015-11-12	2015-12-03	18518	143	\N	jquewell	kochao		\N	\N	dthiessen	2015-11-12 10:24:22.042	1	18518	0	1
50675	1019	2015-11-12	11340	0	0	43	admin	Peter 			\N	2015-11-12	2015-12-03	8963	79	\N	grodriguez	admin		\N	\N	dthiessen	2015-11-12 09:07:53.151	1	8963	0	1
50687	1014	2015-11-19	15300	0	0	64	admin	worker			\N	2015-11-19	2015-12-10	9482	221	\N	kochao	alopez		\N	\N	dthiessen	2015-11-19 08:55:52.638	1	9482	0	1
50677	1014	2015-11-12	16380	0	0	63	admin	Kenton			\N	2015-11-12	2015-12-03	9811	279	\N	admin	kochao		\N	\N	dthiessen	2015-11-12 11:28:00.729	1	9811	0	1
50698	1020	2015-11-26	6480	0	0	43	admin	Otto			\N	2015-11-26	2015-12-17	4910	41	\N	grodriguez	admin		\N	\N	dthiessen	2015-11-26 09:45:20.945	1	4910	0	1
50685	1016	2015-11-16	18000	0	0	54	admin	Abram			\N	2015-11-16	2015-12-07	13015	207	\N	admin	kochao		\N	\N	dthiessen	2015-11-16 10:49:20.152	1	13015	0	1
50686	1020	2015-11-16	31680	0	0	41	admin	Julia			\N	2015-11-16	2015-12-07	25417	184	\N	admin	kochao		\N	\N	dthiessen	2015-11-16 11:03:26.277	1	25417	0	1
50691	1026	2015-11-19	3600	1440	0	66	admin	Jake			\N	2015-11-19	2015-12-10	1321	0	\N	jquewell	0		\N	\N	dthiessen	2015-11-19 11:18:00.248	2	2576	1255	2
50689	1017	2015-11-19	21060	0	0	50	admin	Jake			\N	2015-11-19	2015-12-10	18494	109	\N	grodriguez	admin		\N	\N	dthiessen	2015-11-19 10:04:18.279	1	18494	0	1
50690	1021	2015-11-19	32040	0	0	34	admin	Abe			\N	2015-11-19	2015-12-10	26416	318	\N	jquewell	admin		\N	\N	dthiessen	2015-11-19 10:16:57.42	1	26416	0	1
50693	1016	2015-11-23	14400	3060	0	55	admin	Abram			\N	2015-11-23	2015-12-14	10441	214	\N	gcano	kochao		\N	\N	dthiessen	2015-11-23 11:11:08.446	1	10441	0	1
50692	1020	2015-11-23	25200	5760	0	42	admin	Charlie			\N	2015-11-23	2015-12-14	20143	193	\N	gcano	kochao		\N	\N	dthiessen	2015-11-23 10:32:23.399	1	20143	0	1
50703	1021	2015-11-30	30060	0	0	35	admin	Laine			\N	2015-11-30	2015-12-21	26695	98	\N	kochao	alopez		\N	\N	dthiessen	2015-11-30 09:56:10.815	1	26695	0	1
50747	1025	2015-10-26	10080	0	0	49	admin	Ship		522	\N	2015-10-26	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2015-12-15 17:07:56.4	4	\N	\N	1
50684	1026	2015-11-16	6480	7920	0	65	admin	Jake			\N	2015-11-16	2015-12-07	2249	0	\N	zalegria	jquewell		\N	\N	dthiessen	2015-11-16 09:51:10.402	2	4515	2266	2
50695	1021	2015-11-26	19800	11880	0	35	admin	Abe			\N	2015-11-26	2015-12-17	17526	98	\N	alopez	kochao		\N	\N	dthiessen	2015-11-26 08:14:33.102	1	17526	0	1
50814	1025	2015-11-23	5760	0	0	58	ereimer	Ship		510	\N	2015-11-23	2015-12-14	4231	61	\N	grodriguez	admin		\N	\N	dthiessen	2016-01-15 10:56:14.5	4	4231	0	1
50696	1026	2015-11-26	9720	7200	0	67	admin	Jake			\N	2015-11-26	2015-12-17	3329	56	\N	jquewell	agongora		\N	\N	dthiessen	2015-11-26 08:48:12.852	2	6823	3494	2
50694	1016	2015-11-26	3600	0	0	56	admin	Abram			\N	2015-11-26	2015-12-17	2777	33	\N	admin	agongora		\N	\N	dthiessen	2015-11-26 07:46:24.852	1	2777	0	1
50700	1026	2015-11-30	6120	0	0	67	admin	Jake			\N	2015-11-30	2015-12-21	2062	0	\N	nreimer	alopez		\N	\N	dthiessen	2015-11-30 09:02:22.987	2	4250	2188	2
50699	1014	2015-11-30	7740	0	0	65	admin	Cindy			\N	2015-11-30	2015-12-21	4743	145	\N	cmanzanero	zalegria		\N	\N	dthiessen	2015-11-30 08:34:40.862	1	4743	0	1
50704	1016	2015-11-30	16740	0	0	56	admin	Abram			\N	2015-11-30	2015-12-21	12137	132	\N	admin	grodriguez		\N	\N	dthiessen	2015-11-30 10:21:36.643	1	12137	0	1
50701	1017	2015-11-30	18000	0	0	51	admin	Jake			\N	2015-11-30	2015-12-21	15000	114	\N	zalegria	jquewell		\N	\N	dthiessen	2015-11-30 09:05:32.909	1	15000	0	1
50702	1019	2015-11-30	12060	0	0	45	admin	Peter			\N	2015-11-30	2015-12-21	9958	111	\N	grodriguez	admin		\N	\N	dthiessen	2015-11-30 09:19:29.034	1	9958	0	1
50705	1020	2015-11-30	30240	0	0	43	admin	Otto			\N	2015-11-30	2015-12-21	24804	216	\N	grodriguez	admin		\N	\N	dthiessen	2015-11-30 10:58:40.081	1	24804	0	1
50719	1026	2015-12-07	6120	0	0	68	admin	Jake			\N	2015-12-07	2015-12-28	2107	0	\N	jquewell	admin		\N	\N	dthiessen	2015-12-07 09:11:47.187	6	4355	2248	2
50734	1014	2015-12-07	5580	0	0	66	rthiessen	Kenton			\N	2015-12-07	2015-12-28	3497	45	\N	kochao	alopez		\N	\N	dthiessen	2015-12-10 14:33:45.145	4	3497	0	1
50842	1025	2015-12-21	1440	0	0	27	ereimer	Ship		523-7	\N	2015-12-21	2016-01-11	934	10	\N	grodriguez	kochao		\N	\N	dthiessen	2016-01-15 13:19:12.656	4	934	0	1
50765	1025	2015-12-28	12960	0	0	34	admin	Ship		400-1	\N	2015-12-28	2016-01-18	11101	60	\N	nreimer	jquewell		\N	\N	dthiessen	2015-12-29 15:04:15.515	4	11101	0	1
50779	1019	2016-01-07	9360	0	0	51	admin	Allan			\N	2016-01-07	2016-01-28	7631	93	\N	jquewell	zalegria		\N	\N	dthiessen	2016-01-07 08:33:14.918	4	7631	0	1
50793	1026	2016-01-11	4680	5580	0	73	admin	Jake			\N	2016-01-11	2016-02-01	1386	0	\N	zalegria	agongora		\N	\N	dthiessen	2016-01-11 09:13:45.718	6	2811	1425	2
50856	1028	2016-01-18	4500	0	0	28	ereimer	Anton			\N	2016-01-18	2016-02-08	3590	20	\N	admin	kochao		\N	\N	ereimer	2016-01-18 09:21:19.953	2	3590	0	1
50940	1020	2016-01-14	0	12240	0	50	dthiessen	ME			\N	2016-01-14	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-02-19 08:50:36.497	4	\N	\N	1
50966	1025	2016-02-11	5400	0	0	64	ereimer	Ship		403-2	\N	2016-02-11	2016-03-03	4120	80	\N	gcano	agongora		\N	\N	ereimer	2016-02-19 15:03:16.63	4	4120	0	1
50912	1025	2016-02-04	7560	0	0	28	ereimer	Ship		519-1	\N	2016-02-04	2016-02-25	6265	50	\N	wcabb	alopez		\N	\N	ereimer	2016-02-04 17:37:15.953	4	6265	0	1
50898	1026	2016-02-04	5040	0	0	77	ereimer	Jake			\N	2016-02-04	2016-02-25	1520	0	\N	kochao	agongora		\N	\N	ereimer	2016-02-04 09:24:18.046	6	2992	1472	2
50828	1025	2015-12-14	7560	0	0	36	ereimer	Ship		516-1	\N	2015-12-14	2016-01-04	5990	44	\N	admin	grodriguez	fixed 5947	\N	\N	dthiessen	2016-01-15 11:22:31.921	4	5990	0	1
51332	1028	2016-06-16	1800	0	0	50	ereimer	Mark			\N	2016-06-16	2016-07-07	1502	5	\N	jquewell	kochao		\N	\N	ereimer	2016-06-16 07:54:19.021	2	1502	0	1
51333	1029	2016-06-16	4320	0	0	46	ereimer	Richard			\N	2016-06-16	2016-07-07	3580	17	\N	dmenendez	admin		\N	\N	ereimer	2016-06-16 08:24:13.505	2	3580	0	1
51334	1030	2016-06-16	3600	0	0	36	ereimer	Willam			\N	2016-06-16	2016-07-07	2992	7	\N	dmenendez	admin		\N	\N	ereimer	2016-06-16 08:31:33.693	7	2992	0	1
51336	1032	2016-06-16	1800	3600	0	29	ereimer	Jake			\N	2016-06-16	2016-07-07	1594	6	\N	dmenendez	admin		\N	\N	ereimer	2016-06-16 08:55:19.927	7	1594	0	1
51337	1033	2016-06-16	2880	0	0	27	ereimer	Paul			\N	2016-06-16	2016-07-07	2388	13	\N	jquewell	kochao		\N	\N	ereimer	2016-06-16 09:00:05.646	7	2388	0	1
51342	1025	2016-06-16	7200	0	0	56	ereimer	Ship		523-5	\N	2016-06-16	2016-07-07	4633	74	\N	jquewell	kochao		\N	\N	ereimer	2016-06-17 14:41:26.365	4	4633	0	1
51343	1025	2016-06-16	7560	0	0	55	ereimer	Ship		400-3	\N	2016-06-16	2016-07-07	6074	59	\N	grodriguez	ealergria		\N	\N	ereimer	2016-06-17 14:41:45.677	4	6074	0	1
51347	1025	2016-06-16	5760	0	0	28	ereimer	Ship		526-2	\N	2016-06-16	2016-07-07	4486	23	\N	grodriguez	ealergria		\N	\N	ereimer	2016-06-17 14:43:16.287	4	4486	0	1
51335	1021	2016-06-16	1440	0	0	64	ereimer	Betty			\N	2016-06-16	2016-07-07	1061	14	\N	dmenendez	admin		\N	\N	ereimer	2016-06-16 08:38:08.021	4	1061	0	1
51349	1021	2016-06-20	3420	0	0	64	ereimer	Eric	fix 2016-06-16		\N	2016-06-20	2016-07-11	2584	47	\N	grodriguez	dmenendez		\N	\N	ereimer	2016-06-20 08:25:15.802	4	2584	0	1
51354	1028	2016-06-20	10440	0	0	50	ereimer	Anton			\N	2016-06-20	2016-07-11	8394	160	\N	kochao	admin		\N	\N	ereimer	2016-06-20 10:20:05.583	2	8394	0	1
51353	1029	2016-06-20	26460	0	0	46	ereimer	Richard			\N	2016-06-20	2016-07-11	22268	224	\N	kochao	admin		\N	\N	ereimer	2016-06-20 10:08:17.552	2	22268	0	1
51350	1031	2016-06-20	20340	0	0	33	ereimer	Tim	fix 20520		\N	2016-06-20	2016-07-11	16765	46	\N	grodriguez	dmenendez		\N	\N	ereimer	2016-06-20 08:35:47.693	7	16765	0	1
51352	1032	2016-06-20	10800	0	0	29	ereimer	Edward			\N	2016-06-20	2016-07-11	9075	17	\N	kochao	admin		\N	\N	ereimer	2016-06-20 10:00:28.396	7	9075	0	1
51360	1032	2016-06-23	3960	0	0	30	ereimer	Jake			\N	2016-06-23	2016-07-14	3372	21	\N	jquewell	0		\N	\N	ereimer	2016-06-23 10:02:38.921	7	3372	0	1
51363	1025	2016-06-23	2160	0	0	64	ereimer	Ship		516-2	\N	2016-06-23	2016-07-14	1554	55	\N	jquewell	zalegria		\N	\N	ereimer	2016-06-24 13:21:58.953	4	1554	0	1
51444	1033	2016-07-18	13500	0	0	31	ereimer	Paul			\N	2016-07-18	2016-08-08	12291	30	\N	dmenendez	admin		\N	\N	ereimer	2016-07-18 08:59:26.925	7	12291	0	1
51450	1030	2016-07-21	10620	0	0	41	admin	William			\N	2016-07-21	2016-08-11	8283	48	\N	ealergria	admin		\N	\N	ereimer	2016-07-21 07:36:07.16	7	8283	0	1
51377	1028	2016-06-27	8640	0	0	51	dthiessen	Tina			\N	2016-06-27	2016-07-18	7032	121	\N	nreimer	admin		\N	\N	dthiessen	2016-06-27 16:05:44.063	2	7032	0	1
51430	1028	2016-07-14	5040	0	0	54	ereimer	Tina			\N	2016-07-14	2016-08-04	4043	30	\N	wcabb	admin		\N	\N	ereimer	2016-07-14 09:54:16.769	2	4043	0	1
51420	1030	2016-07-11	12420	0	0	39	admin	William			\N	2016-07-11	2016-08-01	10067	131	\N	dmenendez	admin		\N	\N	ereimer	2016-07-11 08:27:31.707	7	10067	0	1
51422	1031	2016-07-11	10800	0	0	36	ereimer	Abram			\N	2016-07-11	2016-08-01	9190	45	\N	jquewell	ealergria		\N	\N	ereimer	2016-07-11 08:46:51.878	7	9190	0	1
51423	1032	2016-07-11	6120	0	0	32	ereimer	Edward			\N	2016-07-11	2016-08-01	4865	63	\N	dmenendez	admin		\N	\N	ereimer	2016-07-11 09:39:41.144	7	4865	0	1
51424	1034	2016-07-11	2700	0	0	27	ereimer	Melvin			\N	2016-07-11	2016-08-01	1953	18	\N	dmenendez	admin		\N	\N	ereimer	2016-07-11 10:52:01.769	1	1953	0	1
51425	1028	2016-07-11	5400	0	0	53	ereimer	Anton			\N	2016-07-11	2016-08-01	4250	71	\N	jquewell	ealergria		\N	\N	ereimer	2016-07-11 11:09:45.707	2	4250	0	1
51426	1030	2016-07-14	9900	0	0	40	ereimer	William			\N	2016-07-14	2016-08-04	8111	65	\N	wcabb	kochao		\N	\N	ereimer	2016-07-14 07:31:58.816	7	8111	0	1
51432	1034	2016-07-14	3060	0	0	28	dthiessen	Leo			\N	2016-07-14	2016-08-04	2337	17	\N	wcabb	admin		\N	\N	dthiessen	2016-07-15 11:13:06.878	1	2337	0	1
51429	1033	2016-07-14	9900	0	0	31	ereimer	Conway			\N	2016-07-14	2016-08-04	8979	41	\N	dmenendez	admin		\N	\N	ereimer	2016-07-14 09:31:09.144	7	8979	0	1
51431	1032	2016-07-14	5760	0	0	33	ereimer	Jake			\N	2016-07-14	2016-08-04	5104	13	\N	kochao	jquewell		\N	\N	ereimer	2016-07-14 10:12:36.05	7	5104	0	1
51433	1025	2016-07-14	5400	0	0	62	ereimer	Ship		511	\N	2016-07-14	2016-08-04	4477	43	\N	kochao	jguenther		\N	\N	ereimer	2016-07-15 11:28:44.441	4	4477	0	1
51434	1025	2016-07-14	5400	0	0	62	ereimer	Ship		513-2	\N	2016-07-14	2016-08-04	4120	109	\N	edueck	wcabb		\N	\N	ereimer	2016-07-15 11:29:02.863	4	4120	0	1
51436	1025	2016-07-14	5400	0	0	56	ereimer	Ship		523-7	\N	2016-07-14	2016-08-04	3654	43	\N	ereimer	admin		\N	\N	ereimer	2016-07-15 11:29:42.8	4	3654	0	1
51437	1025	2016-07-14	7200	0	0	36	ereimer	Ship		403-5	\N	2016-07-14	2016-08-04	6338	26	\N	kochao	jguenther		\N	\N	ereimer	2016-07-15 11:30:00.691	4	6338	0	1
51438	1025	2016-07-14	7200	0	0	36	ereimer	Ship		403-6	\N	2016-07-14	2016-08-04	6359	23	\N	jquewell	admin		\N	\N	ereimer	2016-07-15 11:31:09.128	4	6359	0	1
51440	1025	2016-07-14	7920	0	0	35	ereimer	Ship		404-2	\N	2016-07-14	2016-08-04	7051	17	\N	grodriguez	kochao		\N	\N	ereimer	2016-07-15 11:31:41.503	4	7051	0	1
51441	1025	2016-07-14	5040	0	0	29	ereimer	Ship		525-1	\N	2016-07-14	2016-08-04	3339	15	\N	jguenther	admin		\N	\N	ereimer	2016-07-15 11:31:59.644	4	3339	0	1
51447	1028	2016-07-18	6480	0	0	54	ereimer	Anton			\N	2016-07-18	2016-08-08	5060	67	\N	ealergria	admin		\N	\N	ereimer	2016-07-18 09:15:29.847	2	5060	0	1
51446	1029	2016-07-18	16380	0	0	50	ereimer	Richard			\N	2016-07-18	2016-08-08	13450	64	\N	admin	0		\N	\N	ereimer	2016-07-18 09:08:26.253	2	13450	0	1
51443	1030	2016-07-18	14040	0	0	40	ereimer	William			\N	2016-07-18	2016-08-08	10804	96	\N	ealergria	admin		\N	\N	ereimer	2016-07-18 07:36:42.503	7	10804	0	1
51448	1032	2016-07-18	7560	0	0	33	ereimer	Jake	fix 8280		\N	2016-07-18	2016-08-08	6311	37	\N	jquewell	ealergria		\N	\N	ereimer	2016-07-18 10:00:25.41	7	6311	0	1
51449	1034	2016-07-18	5760	0	0	28	dthiessen	Leo			\N	2016-07-18	2016-08-08	4395	21	\N	dmenendez	admin		\N	\N	dthiessen	2016-07-18 11:22:58.269	1	4395	0	1
51452	1032	2016-07-21	5400	0	0	34	ereimer	Jake			\N	2016-07-21	2016-08-11	4582	15	\N	kochao	dmenendez		\N	\N	ereimer	2016-07-21 08:35:43.738	7	4582	0	1
51455	1033	2016-07-21	10260	0	0	32	ereimer	Elma			\N	2016-07-21	2016-08-11	9317	26	\N	jquewell	ealergria		\N	\N	ereimer	2016-07-21 09:48:42.082	7	9317	0	1
51456	1034	2016-07-21	5400	0	0	29	dthiessen	Leo			\N	2016-07-21	2016-08-11	4107	36	\N	grodriguez	ealergria		\N	\N	dthiessen	2016-07-21 11:33:24.097	1	4107	0	1
51458	1025	2016-07-21	6840	0	0	37	ereimer	Ship		403-5	\N	2016-07-21	2016-08-11	5896	32	\N	grodriguez	ealergria		\N	\N	ereimer	2016-07-22 14:35:23.097	4	5896	0	1
51459	1025	2016-07-21	7200	0	0	37	ereimer	Ship		403-6	\N	2016-07-21	2016-08-11	6202	72	\N	dmenendez	kochao		\N	\N	ereimer	2016-07-22 14:35:49.8	4	6202	0	1
51461	1025	2016-07-21	6120	0	0	29	ereimer	Ship		525-1	\N	2016-07-21	2016-08-11	5058	23	\N	jquewell	agongora		\N	\N	ereimer	2016-07-22 14:36:26.066	4	5058	0	1
51462	1025	2016-07-21	3240	0	0	29	ereimer	Ship		525-2	\N	2016-07-21	2016-08-11	2718	9	\N	kochao	dmenendez		\N	\N	ereimer	2016-07-22 14:36:42.941	4	2718	0	1
51463	1025	2016-07-21	3600	0	0	27	ereimer	Ship		524-1	\N	2016-07-21	2016-08-11	2958	15	\N	ealergria	admin		\N	\N	ereimer	2016-07-22 14:37:00.363	4	2958	0	1
51465	1025	2016-07-21	3600	0	0	28	ereimer	Ship		533-1	\N	2016-07-21	2016-08-11	2908	6	\N	kochao	dmenendez		\N	\N	ereimer	2016-07-22 14:37:37.785	4	2908	0	1
51454	1031	2016-07-21	9720	0	0	38	dthiessen	Abram			\N	2016-07-21	2016-08-11	8708	31	\N	ealergria	admin		\N	\N	ereimer	2016-07-21 09:18:32.566	7	8708	0	1
51372	1031	2016-06-27	16920	0	0	34	ereimer	Gerry			\N	2016-06-27	2016-07-18	14512	151	\N	jquewell	admin		\N	\N	ereimer	2016-06-27 08:27:40.078	7	14512	0	1
51376	1021	2016-06-27	360	0	360	65	dthiessen	Son			\N	2016-06-27	2016-07-18	271	5	\N	grodriguez	ealergria		\N	\N	dthiessen	2016-06-27 15:58:45.719	4	271	0	1
51379	1032	2016-06-30	5760	0	0	31	ereimer	Edward			\N	2016-06-30	2016-07-21	5048	62	\N	zalegria	cmartinez		\N	\N	ereimer	2016-06-30 08:28:04.753	7	5048	0	1
51385	1025	2016-06-30	3600	0	0	63	ereimer	Ship		401-4	\N	2016-06-30	2016-07-21	2763	20	\N	kochao	cmartinez		\N	\N	ereimer	2016-07-01 14:21:27.019	4	2763	0	1
51476	1028	2016-07-28	5040	0	0	56	ereimer	Anton			\N	2016-07-28	2016-08-18	3901	19	\N	cmanzanero	0		\N	\N	ereimer	2016-07-28 09:11:05.316	2	3901	0	1
51397	1034	2016-07-04	1080	0	1080	26	ereimer	Leo			\N	2016-07-04	2016-07-25	826	0	\N	grodriguez	jquewell		\N	\N	ereimer	2016-07-04 15:45:26.628	1	826	0	1
51396	1028	2016-07-04	7200	0	0	52	ereimer	Jake			\N	2016-07-04	2016-07-25	5792	87	\N	ealergria	admin		\N	\N	ereimer	2016-07-04 10:38:52.66	2	5792	0	1
51406	1028	2016-07-07	1440	0	1440	53	ereimer	Tina			\N	2016-07-07	2016-07-28	1131	17	\N	grodriguez	jquewell		\N	\N	ereimer	2016-07-07 13:50:00.394	2	1131	0	1
51402	1029	2016-07-07	12600	0	0	49	ereimer	Richard	fix 13320		\N	2016-07-07	2016-07-28	10524	90	\N	ealergria	admin		\N	\N	ereimer	2016-07-07 08:49:28.972	2	10524	0	1
51398	1031	2016-07-07	9720	0	0	36	dthiessen	Jerry	fix 10080		\N	2016-07-07	2016-07-28	8895	8	\N	nreimer	kochao		\N	\N	ereimer	2016-07-07 07:51:28.878	7	8895	0	1
51401	1032	2016-07-07	5760	0	0	32	ereimer	Edward			\N	2016-07-07	2016-07-28	5050	47	\N	grodriguez	jquewell		\N	\N	ereimer	2016-07-07 08:42:25.691	7	5050	0	1
51404	1034	2016-07-07	900	0	0	27	ereimer	Leo			\N	2016-07-07	2016-07-28	682	4	\N	grodriguez	jquewell		\N	\N	ereimer	2016-07-07 11:03:42.347	1	682	0	1
51418	1025	2016-07-07	1440	0	0	33	ereimer	Ship		404-2	\N	2016-07-07	2016-07-28	1256	10	\N	grodriguez	jquewell		\N	\N	ereimer	2016-07-08 10:14:53.457	4	1256	0	1
51421	1029	2016-07-11	13860	0	0	49	ereimer	Richard			\N	2016-07-11	2016-08-01	11453	80	\N	dmenendez	admin		\N	\N	ereimer	2016-07-11 08:37:11.332	2	11453	0	1
51419	1033	2016-07-11	10980	0	0	30	admin	Conway			\N	2016-07-11	2016-08-01	9416	88	\N	wcabb	nreimer		\N	\N	ereimer	2016-07-11 07:50:38.41	7	9416	0	1
51427	1029	2016-07-14	12420	0	0	50	ereimer	Richard			\N	2016-07-14	2016-08-04	10380	32	\N	jquewell	kochao		\N	\N	ereimer	2016-07-14 08:50:30.519	2	10380	0	1
51428	1031	2016-07-14	9720	0	0	37	ereimer	Abram			\N	2016-07-14	2016-08-04	8729	25	\N	agongora	jquewell		\N	\N	ereimer	2016-07-14 09:24:19.628	7	8729	0	1
51435	1025	2016-07-14	5400	0	0	60	ereimer	Ship		400-3	\N	2016-07-14	2016-08-04	4013	57	\N	jquewell	admin		\N	\N	ereimer	2016-07-15 11:29:22.082	4	4013	0	1
51439	1025	2016-07-14	5040	0	0	35	ereimer	Ship		404-1	\N	2016-07-14	2016-08-04	4413	3	\N	ereimer	admin		\N	\N	ereimer	2016-07-15 11:31:26.16	4	4413	0	1
51442	1025	2016-07-14	3600	0	0	29	ereimer	Ship		525-2	\N	2016-07-14	2016-08-04	2255	24	\N	wcabb	kochao		\N	\N	ereimer	2016-07-15 11:32:16.597	4	2255	0	1
51498	1032	2016-08-04	5760	0	0	35	ereimer	Edward	fix 2016-08-01		\N	2016-08-04	2016-08-25	4841	28	\N	wcabb	zalegria		\N	\N	ereimer	2016-08-05 09:21:10.953	7	4841	0	1
51496	1030	2016-08-04	10260	0	0	42	ereimer	Emery	fix 2016-08-01		\N	2016-08-04	2016-08-25	8121	37	\N	ealergria	admin		\N	\N	ereimer	2016-08-05 09:18:56.671	7	8121	0	1
51497	1031	2016-08-04	9540	0	0	39	ereimer	Tim	fix 2016-08-01		\N	2016-08-04	2016-08-25	8420	34	\N	cmanzanero	dmenendez		\N	\N	ereimer	2016-08-05 09:19:24.671	7	8420	0	1
51500	1034	2016-08-04	8280	0	0	30	ereimer	Leo	fix 2016-08-01		\N	2016-08-04	2016-08-25	6210	35	\N	cmanzanero	zalegria		\N	\N	ereimer	2016-08-05 09:22:15.062	1	6210	0	1
51501	1038	2016-08-04	1620	0	0	26	ereimer	Otto	fix 2016-08-01		\N	2016-08-04	2016-08-25	1182	3	\N	jquewell	kochao		\N	\N	ereimer	2016-08-05 09:22:33.062	7	1182	0	1
51502	1030	2016-08-08	12960	0	0	43	ereimer	William			\N	2016-08-08	2016-08-29	10068	108	\N	dmenendez	admin		\N	\N	ereimer	2016-08-08 08:14:11.265	7	10068	0	1
51504	1031	2016-08-08	11520	0	0	40	ereimer	Tim			\N	2016-08-08	2016-08-29	9737	62	\N	nreimer	kochao		\N	\N	ereimer	2016-08-08 08:47:25.046	7	9737	0	1
51445	1031	2016-07-18	12960	0	0	37	ereimer	Tim			\N	2016-07-18	2016-08-08	11341	99	\N	dmenendez	admin		\N	\N	ereimer	2016-07-18 09:00:41.144	7	11341	0	1
51508	1032	2016-08-08	7560	0	0	36	ereimer	Edward			\N	2016-08-08	2016-08-29	6347	45	\N	jquewell	admin		\N	\N	ereimer	2016-08-08 09:55:52.328	7	6347	0	1
51466	1030	2016-07-25	14040	0	0	41	ereimer	William			\N	2016-07-25	2016-08-15	10817	80	\N	jquewell	kochao		\N	\N	ereimer	2016-07-25 07:31:20.816	7	10817	0	1
51467	1031	2016-07-25	12780	0	0	38	ereimer	Henry Woelk			\N	2016-07-25	2016-08-15	10953	142	\N	ealergria	admin		\N	\N	ereimer	2016-07-25 08:26:47.019	7	10953	0	1
51468	1033	2016-07-25	13320	0	0	32	admin	paul			\N	2016-07-25	2016-08-15	11929	7	\N	cmanzanero	zalegria		\N	\N	ereimer	2016-07-25 08:40:41.925	7	11929	0	1
51471	1034	2016-07-25	8280	0	0	29	ereimer	Melvin	fix 11880		\N	2016-07-25	2016-08-15	6334	29	\N	grodriguez	ealergria		\N	\N	ereimer	2016-07-25 10:42:30.488	1	6334	0	1
51473	1030	2016-07-28	10080	0	0	42	dthiessen	William			\N	2016-07-28	2016-08-18	8012	3	\N	jquewell	wcabb		\N	\N	ereimer	2016-07-28 07:26:12.957	7	8012	0	1
51475	1031	2016-07-28	9360	0	0	39	ereimer	Tim			\N	2016-07-28	2016-08-18	8284	89	\N	ealergria	zalegria		\N	\N	ereimer	2016-07-28 09:02:01.457	7	8284	0	1
51479	1033	2016-07-28	9900	0	0	33	ereimer	Paul			\N	2016-07-28	2016-08-18	8908	19	\N	cmanzanero	admin		\N	\N	ereimer	2016-07-28 09:38:40.972	7	8908	0	1
51477	1034	2016-07-28	6660	0	0	30	ereimer	Melvin			\N	2016-07-28	2016-08-18	5030	19	\N	kochao	admin		\N	\N	ereimer	2016-07-28 09:11:31.113	1	5030	0	1
51480	1038	2016-07-28	360	0	0	26	ereimer	Otto			\N	2016-07-28	2016-08-18	241	6	\N	jquewell	dmenendez		\N	\N	ereimer	2016-07-28 09:54:12.503	7	241	0	1
51482	1025	2016-07-28	3600	0	0	61	ereimer	Ship		407-2	\N	2016-07-28	2016-08-18	1792	45	\N	kochao	dmenendez		\N	\N	ereimer	2016-07-28 14:26:20.457	4	1792	0	1
51483	1025	2016-07-28	9000	0	0	58	ereimer	Ship		523-7	\N	2016-07-28	2016-08-18	5596	140	\N	admin	0		\N	\N	ereimer	2016-07-28 14:26:36.175	4	5596	0	1
51484	1025	2016-07-28	4680	0	0	46	ereimer	Ship		521-1	\N	2016-07-28	2016-08-18	4005	11	\N	cmanzanero	admin		\N	\N	ereimer	2016-07-28 14:26:53.66	4	4005	0	1
51488	1028	2016-08-01	6300	0	0	56	ereimer	Anton			\N	2016-08-01	2016-08-22	4722	93	\N	dmenendez	admin		\N	\N	ereimer	2016-08-01 08:56:23.535	2	4722	0	1
51492	1029	2016-08-01	15660	0	0	52	ereimer	Annie			\N	2016-08-01	2016-08-22	11617	213	\N	ealergria	admin		\N	\N	ereimer	2016-08-01 09:59:23.269	2	11617	0	1
51490	1031	2016-08-01	12780	0	0	39	ereimer	Tim			\N	2016-08-01	2016-08-22	11246	99	\N	ealergria	admin		\N	\N	ereimer	2016-08-01 09:15:11.488	7	11246	0	1
51493	1032	2016-08-01	7560	0	0	35	ereimer	Edward			\N	2016-08-01	2016-08-22	6291	35	\N	dmenendez	jquewell		\N	\N	ereimer	2016-08-01 10:23:33.066	7	6291	0	1
51489	1033	2016-08-01	12960	0	0	33	ereimer	Paul			\N	2016-08-01	2016-08-22	11524	72	\N	ealergria	admin		\N	\N	ereimer	2016-08-01 09:05:33.878	7	11524	0	1
51486	1038	2016-08-01	1080	0	0	26	ereimer	Nelson			\N	2016-08-01	2016-08-22	786	8	\N	cmanzanero	kochao		\N	\N	ereimer	2016-08-01 08:36:37.378	7	786	0	1
51494	1028	2016-08-04	4680	0	0	56	ereimer	Anton	fix 2016-08-01		\N	2016-08-04	2016-08-25	3540	78	\N	cmanzanero	kochao		\N	\N	ereimer	2016-08-05 09:17:05.64	2	3540	0	1
51507	1034	2016-08-08	10620	0	0	31	ereimer	Leo			\N	2016-08-08	2016-08-29	8065	55	\N	nreimer	kochao		\N	\N	ereimer	2016-08-08 09:49:06.484	1	8065	0	1
51505	1038	2016-08-08	4140	0	0	27	ereimer	Otto			\N	2016-08-08	2016-08-29	2958	30	\N	jquewell	admin		\N	\N	ereimer	2016-08-08 09:13:13.093	7	2958	0	1
51506	1028	2016-08-08	5400	0	0	57	ereimer	Anton			\N	2016-08-08	2016-08-29	3790	75	\N	dmenendez	admin		\N	\N	ereimer	2016-08-08 09:27:48.015	2	3790	0	1
51451	1028	2016-07-21	5040	0	0	55	admin	Anton			\N	2016-07-21	2016-08-11	3966	57	\N	jquewell	ealergria		\N	\N	ereimer	2016-07-21 07:52:58.207	2	3966	0	1
51453	1029	2016-07-21	12420	0	0	51	dthiessen	Otto	FIX 12600		\N	2016-07-21	2016-08-11	10177	40	\N	dmenendez	kochao		\N	\N	ereimer	2016-07-21 09:16:16.582	2	10177	0	1
51457	1025	2016-07-21	5400	0	0	63	ereimer	Ship		511	\N	2016-07-21	2016-08-11	4338	42	\N	dmenendez	kochao		\N	\N	ereimer	2016-07-22 14:34:46.003	4	4338	0	1
51460	1025	2016-07-21	3600	0	0	35	ereimer	Ship		404-1	\N	2016-07-21	2016-08-11	3105	10	\N	ealergria	0		\N	\N	ereimer	2016-07-22 14:36:07.988	4	3105	0	1
51464	1025	2016-07-21	3600	0	0	27	ereimer	Ship		524-2	\N	2016-07-21	2016-08-11	3028	12	\N	dmenendez	kochao		\N	\N	ereimer	2016-07-22 14:37:16.613	4	3028	0	1
51537	1032	2016-08-15	9000	0	0	37	ereimer	Edward			\N	2016-08-15	2016-09-05	7516	8	\N	nreimer	kochao		\N	\N	ereimer	2016-08-15 10:26:39.937	7	7516	0	1
51469	1028	2016-07-25	6660	0	0	55	ereimer	Anton			\N	2016-07-25	2016-08-15	5013	106	\N	grodriguez	ealergria		\N	\N	ereimer	2016-07-25 08:46:58.191	2	5013	0	1
51472	1029	2016-07-25	16200	0	0	51	ereimer	Annie Penner			\N	2016-07-25	2016-08-15	12833	144	\N	grodriguez	ealergria		\N	\N	ereimer	2016-07-25 11:23:50.613	2	12833	0	1
51470	1032	2016-07-25	7560	0	0	34	ereimer	Edward			\N	2016-07-25	2016-08-15	6049	67	\N	grodriguez	ealergria		\N	\N	ereimer	2016-07-25 09:45:57.503	7	6049	0	1
51474	1032	2016-07-28	5760	0	0	35	ereimer	Edward			\N	2016-07-28	2016-08-18	5003	24	\N	kochao	dmenendez		\N	\N	ereimer	2016-07-28 08:19:19.675	7	5003	0	1
51481	1025	2016-07-28	3600	0	0	61	ereimer	Ship		407-1	\N	2016-07-28	2016-08-18	1972	35	\N	dmenendez	kochao		\N	\N	ereimer	2016-07-28 14:26:05.253	4	1972	0	1
51485	1025	2016-07-28	15120	0	0	34	ereimer	Ship		526-2	\N	2016-07-28	2016-08-18	13056	66	\N	dmenendez	kochao		\N	\N	ereimer	2016-07-28 14:27:11.566	4	13056	0	1
51511	1025	2016-08-04	2880	0	0	59	ereimer	Ship		400-6	\N	2016-08-04	2016-08-25	1967	64	\N	ealergria	admin		\N	\N	ereimer	2016-08-09 09:01:29.359	4	1967	0	1
51557	1028	2016-08-25	3060	0	0	60	ereimer	Mark			\N	2016-08-25	2016-09-15	2131	4	\N	jquewell	agongora		\N	\N	ereimer	2016-08-25 08:09:04.515	2	2131	0	1
51487	1030	2016-08-01	13860	0	0	42	ereimer	Emery			\N	2016-08-01	2016-08-22	10777	89	\N	ealergria	admin		\N	\N	ereimer	2016-08-01 08:47:07.91	7	10777	0	1
51524	1028	2016-08-11	2880	0	0	58	ereimer	Anton			\N	2016-08-11	2016-09-01	1959	52	\N	zalegria	agongora		\N	\N	ereimer	2016-08-11 09:49:11.593	2	1959	0	1
51512	1025	2016-08-04	6840	0	0	39	ereimer	Ship		403-5	\N	2016-08-04	2016-08-25	5897	12	\N	cmanzanero	dmenendez		\N	\N	ereimer	2016-08-09 09:01:56.765	4	5897	0	1
51513	1025	2016-08-04	6840	0	0	39	ereimer	Ship		403-6	\N	2016-08-04	2016-08-25	5893	46	\N	jquewell	kochao		\N	\N	ereimer	2016-08-09 09:02:24.171	4	5893	0	1
51515	1025	2016-08-04	5040	0	0	34	ereimer	Ship		404-3	\N	2016-08-04	2016-08-25	4435	26	\N	jquewell	kochao		\N	\N	ereimer	2016-08-09 09:03:11.296	4	4435	0	1
51516	1025	2016-08-04	6120	0	0	34	ereimer	Ship		404-4	\N	2016-08-04	2016-08-25	5160	10	\N	admin	0		\N	\N	ereimer	2016-08-09 09:05:17.281	4	5160	0	1
51520	1029	2016-08-11	7560	0	0	54	ereimer	Richard			\N	2016-08-11	2016-09-01	5685	76	\N	jquewell	admin		\N	\N	ereimer	2016-08-11 08:29:39.14	2	5685	0	1
51517	1030	2016-08-11	6840	0	0	44	ereimer	William			\N	2016-08-11	2016-09-01	5212	22	\N	kochao	bmiranda		\N	\N	ereimer	2016-08-11 07:27:52.421	7	5212	0	1
51519	1031	2016-08-11	6300	0	0	41	ereimer	Abram			\N	2016-08-11	2016-09-01	5556	26	\N	zalegria	dmenendez		\N	\N	ereimer	2016-08-11 08:20:36.609	7	5556	0	1
51521	1033	2016-08-11	6120	0	0	35	ereimer	Elma			\N	2016-08-11	2016-09-01	5387	14	\N	jquewell	admin		\N	\N	ereimer	2016-08-11 08:53:26.234	7	5387	0	1
51518	1034	2016-08-11	5760	0	0	32	ereimer	Juan Carlos			\N	2016-08-11	2016-09-01	4072	16	\N	jquewell	admin		\N	\N	ereimer	2016-08-11 08:06:10.421	1	4072	0	1
51525	1025	2016-08-11	4680	0	0	60	ereimer	Ship		530-2	\N	2016-08-11	2016-09-01	3104	138	\N	wcabb	0		\N	\N	ereimer	2016-08-12 11:22:32.125	4	3104	0	1
51526	1025	2016-08-11	4680	0	0	60	ereimer	Ship		523-7	\N	2016-08-11	2016-09-01	3145	64	\N	kochao	bmiranda		\N	\N	ereimer	2016-08-12 11:22:47.296	4	3145	0	1
51527	1025	2016-08-11	12600	0	0	48	ereimer	Ship		521-1	\N	2016-08-11	2016-09-01	10739	53	\N	jquewell	admin		\N	\N	ereimer	2016-08-12 11:23:02.812	4	10739	0	1
51529	1025	2016-08-11	6480	0	0	36	ereimer	Ship		526-1	\N	2016-08-11	2016-09-01	5752	33	\N	wcabb	agongora		\N	\N	ereimer	2016-08-12 11:24:09.421	4	5752	0	1
51530	1025	2016-08-11	6120	0	0	36	ereimer	Ship		526-2	\N	2016-08-11	2016-09-01	5229	32	\N	kochao	agongora		\N	\N	ereimer	2016-08-12 11:24:25.828	4	5229	0	1
51538	1028	2016-08-15	7560	0	0	58	ereimer	Anton			\N	2016-08-15	2016-09-05	5331	100	\N	jquewell	dmenendez		\N	\N	ereimer	2016-08-15 10:50:51.562	2	5331	0	1
51531	1030	2016-08-15	16200	0	0	44	ereimer	William			\N	2016-08-15	2016-09-05	11932	84	\N	jquewell	admin		\N	\N	ereimer	2016-08-15 08:10:05.593	7	11932	0	1
51535	1031	2016-08-15	15300	0	0	41	ereimer	Abram	fix 15120		\N	2016-08-15	2016-09-05	13184	80	\N	jquewell	admin		\N	\N	ereimer	2016-08-15 09:58:59.906	7	13184	0	1
51536	1034	2016-08-15	13500	0	0	32	ereimer	Rene			\N	2016-08-15	2016-09-05	8370	93	\N	grodriguez	bmiranda		\N	\N	ereimer	2016-08-15 10:05:54.734	1	8370	0	1
51532	1038	2016-08-15	12240	0	0	28	ereimer	Otto			\N	2016-08-15	2016-09-05	8706	29	\N	grodriguez	bmiranda		\N	\N	ereimer	2016-08-15 08:37:45.515	7	8706	0	1
51545	1029	2016-08-18	11520	0	0	55	ereimer	Vange			\N	2016-08-18	2016-09-08	9034	84	\N	grodriguez	admin		\N	\N	ereimer	2016-08-18 10:10:13.687	2	9034	0	1
51539	1030	2016-08-18	9900	0	0	45	ereimer	William			\N	2016-08-18	2016-09-08	7658	22	\N	jquewell	kochao		\N	\N	ereimer	2016-08-18 07:36:21.859	7	7658	0	1
51541	1031	2016-08-18	9180	0	0	42	ereimer	Tim			\N	2016-08-18	2016-09-08	8157	27	\N	nreimer	admin		\N	\N	ereimer	2016-08-18 08:04:10.171	7	8157	0	1
51546	1033	2016-08-18	10080	0	0	36	ereimer	Elma			\N	2016-08-18	2016-09-08	8782	23	\N	jquewell	kochao		\N	\N	ereimer	2016-08-18 13:36:19.109	7	8782	0	1
51543	1034	2016-08-18	8640	0	0	33	ereimer	Charlos			\N	2016-08-18	2016-09-08	6504	33	\N	nreimer	bmiranda		\N	\N	ereimer	2016-08-18 08:45:54.843	1	6504	0	1
51553	1029	2016-08-22	15480	0	0	55	ereimer	Richard			\N	2016-08-22	2016-09-12	12044	44	\N	grodriguez	kochao		\N	\N	ereimer	2016-08-22 10:15:37.031	2	12044	0	1
51547	1030	2016-08-22	13140	0	0	45	ereimer	William			\N	2016-08-22	2016-09-12	9945	47	\N	grodriguez	kochao		\N	\N	ereimer	2016-08-22 08:23:14.234	7	9945	0	1
51554	1032	2016-08-22	7200	0	0	38	ereimer	Edward			\N	2016-08-22	2016-09-12	5806	26	\N	nreimer	bmiranda		\N	\N	ereimer	2016-08-22 10:39:25.234	7	5806	0	1
51552	1033	2016-08-22	13320	0	0	36	ereimer	Elma			\N	2016-08-22	2016-09-12	11881	47	\N	nreimer	bmiranda		\N	\N	ereimer	2016-08-22 09:33:25.468	7	11881	0	1
51551	1034	2016-08-22	11340	0	0	33	ereimer	Carlos			\N	2016-08-22	2016-09-12	8266	70	\N	zalegria	wcabb		\N	\N	ereimer	2016-08-22 09:17:39.843	1	8266	0	1
51558	1029	2016-08-25	7920	0	0	56	ereimer	Richard			\N	2016-08-25	2016-09-15	6124	72	\N	wcabb	agongora		\N	\N	ereimer	2016-08-25 08:22:24.828	2	6124	0	1
51555	1030	2016-08-25	6480	0	0	46	ereimer	William			\N	2016-08-25	2016-09-15	4928	39	\N	grodriguez	bmiranda		\N	\N	ereimer	2016-08-25 07:58:51.421	7	4928	0	1
51562	1032	2016-08-25	3600	0	0	39	ereimer	Edward			\N	2016-08-25	2016-09-15	2909	21	\N	ealergria	zalegria		\N	\N	ereimer	2016-08-25 09:39:49.062	7	2909	0	1
51560	1033	2016-08-25	6480	3240	0	37	ereimer	Elma			\N	2016-08-25	2016-09-15	5869	24	\N	jquewell	kochao		\N	\N	ereimer	2016-08-25 08:52:42.093	7	5869	0	1
51561	1038	2016-08-25	8640	0	0	30	ereimer	Otto			\N	2016-08-25	2016-09-15	6767	28	\N	jquewell	kochao		\N	\N	ereimer	2016-08-25 09:33:28.562	7	6767	0	1
51491	1034	2016-08-01	10260	0	0	30	ereimer	Leo			\N	2016-08-01	2016-08-22	7815	40	\N	cmanzanero	kochao		\N	\N	ereimer	2016-08-01 09:30:21.363	1	7815	0	1
51495	1029	2016-08-04	11700	0	0	52	ereimer	Richard	fix 2016-08-01		\N	2016-08-04	2016-08-25	8424	176	\N	cmanzanero	kochao		\N	\N	ereimer	2016-08-05 09:18:17.781	2	8424	0	1
51499	1033	2016-08-04	10260	0	0	33	ereimer	Paul	fix 2016-08-01		\N	2016-08-04	2016-08-25	9140	40	\N	wcabb	dmenendez		\N	\N	ereimer	2016-08-05 09:21:41.25	7	9140	0	1
51510	1025	2016-08-04	3600	0	0	59	ereimer	Ship		400-5	\N	2016-08-04	2016-08-25	2585	68	\N	jquewell	kochao		\N	\N	ereimer	2016-08-09 09:01:08.078	4	2585	0	1
51514	1025	2016-08-04	8280	0	0	37	ereimer	Ship		404-1	\N	2016-08-04	2016-08-25	7294	19	\N	cmanzanero	dmenendez		\N	\N	ereimer	2016-08-09 09:02:47.984	4	7294	0	1
51478	1029	2016-07-28	12060	0	0	52	ereimer	Charlie			\N	2016-07-28	2016-08-18	9563	55	\N	jquewell	wcabb		\N	\N	ereimer	2016-07-28 09:21:58.441	2	9563	0	1
51509	1029	2016-08-08	13140	0	0	52	ereimer	Richard	fix 1028		\N	2016-08-08	2016-08-29	9270	162	\N	dmenendez	admin		\N	\N	ereimer	2016-08-08 10:27:52.421	2	9270	0	1
51503	1033	2016-08-08	11160	0	0	34	ereimer	Elmia			\N	2016-08-08	2016-08-29	9089	43	\N	jquewell	admin		\N	\N	ereimer	2016-08-08 08:39:56.609	7	9089	0	1
51523	1032	2016-08-11	3960	1800	0	37	ereimer	Jake			\N	2016-08-11	2016-09-01	3369	9	\N	wcabb	dmenendez		\N	\N	ereimer	2016-08-11 09:44:03.64	7	3369	0	1
51522	1038	2016-08-11	2880	0	0	28	ereimer	Charlie			\N	2016-08-11	2016-09-01	2106	3	\N	jquewell	admin		\N	\N	ereimer	2016-08-11 09:04:27.984	7	2106	0	1
51528	1025	2016-08-11	12240	0	0	48	ereimer	Ship		521-2	\N	2016-08-11	2016-09-01	10146	60	\N	kochao	bmiranda		\N	\N	ereimer	2016-08-12 11:23:51.531	4	10146	0	1
51534	1029	2016-08-15	17820	0	0	54	ereimer	Richard			\N	2016-08-15	2016-09-05	13335	234	\N	jquewell	admin		\N	\N	ereimer	2016-08-15 09:42:09.718	2	13335	0	1
51533	1033	2016-08-15	16200	0	0	35	ereimer	Elma			\N	2016-08-15	2016-09-05	14380	60	\N	nreimer	kochao		\N	\N	ereimer	2016-08-15 09:06:17.078	7	14380	0	1
51540	1028	2016-08-18	4860	0	0	59	ereimer	Anton			\N	2016-08-18	2016-09-08	3453	58	\N	agongora	admin		\N	\N	ereimer	2016-08-18 07:39:01.875	2	3453	0	1
51542	1032	2016-08-18	5400	0	0	38	ereimer	Edward			\N	2016-08-18	2016-09-08	4403	10	\N	grodriguez	admin		\N	\N	ereimer	2016-08-18 08:10:44.203	7	4403	0	1
51544	1038	2016-08-18	10080	0	0	29	ereimer	Nelson			\N	2016-08-18	2016-09-08	7299	25	\N	jquewell	kochao		\N	\N	ereimer	2016-08-18 09:45:17.859	7	7299	0	1
51612	1036	2016-09-08	777600	0	0	38	dthiessen	ship		JD	\N	2016-09-08	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-09-13 13:41:33.437	5	\N	\N	2
51564	1025	2016-08-25	7560	0	0	40	ereimer	Ship		404-2	\N	2016-08-25	2016-09-15	6247	26	\N	jquewell	kochao		\N	\N	ereimer	2016-08-26 14:02:22.937	4	6247	0	1
51566	1025	2016-08-25	5760	0	0	37	ereimer	Ship		404-4	\N	2016-08-25	2016-09-15	4516	54	\N	zalegria	agongora		\N	\N	ereimer	2016-08-26 14:03:16.187	4	4516	0	1
51567	1025	2016-08-25	8280	0	0	29	ereimer	Ship		405-1	\N	2016-08-25	2016-09-15	6494	15	\N	ealergria	bmiranda		\N	\N	ereimer	2016-08-26 14:03:32.468	4	6494	0	1
51568	1025	2016-08-25	3240	0	0	29	ereimer	Ship		405-2	\N	2016-08-25	2016-09-15	2762	8	\N	jquewell	kochao		\N	\N	ereimer	2016-08-26 14:03:48.921	4	2762	0	1
51571	1029	2016-08-29	18720	0	0	56	ereimer	Annie			\N	2016-08-29	2016-09-19	14141	246	\N	grodriguez	bmiranda		\N	\N	ereimer	2016-08-29 09:04:28.734	2	14141	0	1
51573	1030	2016-08-29	15480	0	0	46	ereimer	WIlliam			\N	2016-08-29	2016-09-19	11100	65	\N	nreimer	kochao		\N	\N	ereimer	2016-08-29 09:43:40.343	7	11100	0	1
51602	1025	2016-09-08	18000	0	0	56	ereimer	Ship		7911	\N	2016-09-08	2016-09-29	13547	211	\N	admin	0		\N	\N	ereimer	2016-09-08 15:05:28.015	4	13547	0	1
51572	1033	2016-08-29	16560	0	0	37	ereimer	Paul			\N	2016-08-29	2016-09-19	14267	104	\N	admin	ealergria		\N	\N	ereimer	2016-08-29 09:43:01.734	7	14267	0	1
51570	1034	2016-08-29	13860	0	0	34	ereimer	Carlos			\N	2016-08-29	2016-09-19	10340	70	\N	zalegria	jquewell		\N	\N	ereimer	2016-08-29 08:57:20.328	1	10340	0	1
51577	1028	2016-09-01	4680	0	0	61	ereimer	Anton			\N	2016-09-01	2016-09-22	3178	76	\N	jquewell	ealergria		\N	\N	ereimer	2016-09-01 07:44:12.14	2	3178	0	1
51582	1029	2016-09-01	10980	0	0	57	ereimer	Richard			\N	2016-09-01	2016-09-22	8389	100	\N	ealergria	jquewell		\N	\N	ereimer	2016-09-01 08:42:23.453	2	8389	0	1
51580	1031	2016-09-01	8640	0	0	44	ereimer	Abram			\N	2016-09-01	2016-09-22	7611	53	\N	nreimer	bmiranda		\N	\N	ereimer	2016-09-01 08:24:48.109	7	7611	0	1
51581	1032	2016-09-01	5400	0	0	40	ereimer	Edward			\N	2016-09-01	2016-09-22	4409	23	\N	jquewell	nreimer		\N	\N	ereimer	2016-09-01 08:38:42.468	7	4409	0	1
51583	1033	2016-09-01	9720	0	0	38	ereimer	Elma			\N	2016-09-01	2016-09-22	8690	47	\N	grodriguez	zalegria		\N	\N	ereimer	2016-09-01 08:57:41.265	7	8690	0	1
51584	1038	2016-09-01	14220	0	0	31	ereimer	Otto			\N	2016-09-01	2016-09-22	11494	45	\N	jquewell	kochao		\N	\N	ereimer	2016-09-01 09:52:39.812	7	11494	0	1
51588	1028	2016-09-05	6120	0	0	61	ereimer	Anton			\N	2016-09-05	2016-09-26	4022	78	\N	bmiranda	agongora		\N	\N	ereimer	2016-09-05 09:05:20.906	2	4022	0	1
51585	1030	2016-09-05	11880	0	0	47	ereimer	William			\N	2016-09-05	2016-09-26	8169	53	\N	ealergria	bmiranda		\N	\N	ereimer	2016-09-05 08:00:49.109	7	8169	0	1
51586	1031	2016-09-05	12060	0	0	44	ealergria	Tim			\N	2016-09-05	2016-09-26	10218	129	\N	nreimer	kochao		\N	\N	ereimer	2016-09-05 08:18:15.625	7	10218	0	1
51589	1032	2016-09-05	7200	0	0	40	ereimer	Edward			\N	2016-09-05	2016-09-26	5787	27	\N	jquewell	nreimer		\N	\N	ereimer	2016-09-05 09:42:56.75	7	5787	0	1
51587	1034	2016-09-05	10800	0	0	35	ereimer	Charlos			\N	2016-09-05	2016-09-26	7933	59	\N	grodriguez	bmiranda		\N	\N	ereimer	2016-09-05 08:59:36.39	1	7933	0	1
51592	1038	2016-09-05	19800	0	0	31	ereimer	Nelson			\N	2016-09-05	2016-09-26	16048	80	\N	nreimer	kochao		\N	\N	ereimer	2016-09-05 10:46:23.046	7	16048	0	1
51594	1028	2016-09-08	3060	0	0	62	ereimer	Mark			\N	2016-09-08	2016-09-29	2011	25	\N	jquewell	bmiranda		\N	\N	ereimer	2016-09-08 08:00:17.359	2	2011	0	1
51599	1029	2016-09-08	7200	0	0	58	ereimer	Vange			\N	2016-09-08	2016-09-29	5203	63	\N	bmiranda	agongora		\N	\N	ereimer	2016-09-08 09:12:07.468	2	5203	0	1
51596	1039	2016-09-08	720	0	0	28	ereimer	Bettie			\N	2016-09-08	2016-09-29	435	6	\N	jquewell	kochao		\N	\N	ereimer	2016-09-08 08:33:55.796	7	435	0	1
51600	1032	2016-09-08	3600	0	0	41	ereimer	Edward			\N	2016-09-08	2016-09-29	2903	13	\N	bmiranda	agongora		\N	\N	ereimer	2016-09-08 09:15:38.937	7	2903	0	1
51597	1033	2016-09-08	6480	0	0	39	ereimer	Paul			\N	2016-09-08	2016-09-29	5757	25	\N	jquewell	kochao		\N	\N	ereimer	2016-09-08 08:56:25.328	7	5757	0	1
51601	1038	2016-09-08	9720	0	0	32	ereimer	Otto			\N	2016-09-08	2016-09-29	7781	20	\N	bmiranda	agongora		\N	\N	ereimer	2016-09-08 09:24:04.328	7	7781	0	1
51593	1030	2016-09-08	6120	0	0	48	ereimer	William			\N	2016-09-08	2016-09-29	4170	29	\N	ealergria	admin		\N	\N	ereimer	2016-09-08 07:42:02.39	7	4170	0	1
51609	1028	2016-09-12	7380	0	0	62	ereimer	Anton			\N	2016-09-12	2016-10-03	4800	68	\N	zalegria	jquewell		\N	\N	ereimer	2016-09-12 09:30:01.171	2	4800	0	1
51604	1030	2016-09-12	14400	0	0	48	ereimer	William			\N	2016-09-12	2016-10-03	9584	62	\N	kochao	zalegria		\N	\N	ereimer	2016-09-12 08:31:39.515	7	9584	0	1
51603	1031	2016-09-12	14760	0	0	45	ereimer	Tim			\N	2016-09-12	2016-10-03	12561	131	\N	grodriguez	kochao		\N	\N	ereimer	2016-09-12 08:16:12.703	7	12561	0	1
51607	1033	2016-09-12	16020	0	0	39	ereimer	Paul			\N	2016-09-12	2016-10-03	14059	68	\N	nreimer	agongora		\N	\N	ereimer	2016-09-12 08:55:01.656	7	14059	0	1
51605	1034	2016-09-12	13500	0	0	36	ereimer	Carlos			\N	2016-09-12	2016-10-03	9416	110	\N	ealergria	admin		\N	\N	ereimer	2016-09-12 08:38:41.734	1	9416	0	1
51611	1038	2016-09-12	24660	0	0	32	ereimer	Otto			\N	2016-09-12	2016-10-03	20079	133	\N	grodriguez	kochao		\N	\N	ereimer	2016-09-12 10:14:36.203	7	20079	0	1
51615	1036	2016-07-28	23400	0	0	32	dthiessen	SHIP		JD	\N	2016-07-28	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-09-13 13:44:16.125	5	\N	\N	2
51616	1036	2016-07-21	28800	0	0	31	dthiessen	SHIP		JD	\N	2016-07-21	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-09-13 13:44:54.546	5	\N	\N	2
51617	1036	2016-07-14	21600	0	0	30	dthiessen	SHIP		JD	\N	2016-07-14	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-09-13 13:45:21.765	5	\N	\N	2
51618	1037	2016-06-30	19080	0	0	28	dthiessen	SHIP		JD	\N	2016-06-30	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-09-13 13:46:10.031	8	\N	\N	2
51619	1036	2016-06-30	9720	0	0	47	dthiessen	SHIP		TM	\N	2016-06-30	\N	\N	\N	\N	\N	\N	\N	\N	\N	dthiessen	2016-09-13 13:48:03.671	5	\N	\N	2
51614	1037	2016-08-11	21600	0	0	34	dthiessen	SHIP		JD	\N	2016-08-11	2016-09-01	8112	0	\N	jquewell	admin		\N	\N	dthiessen	2016-09-13 13:43:40.859	8	15940	7828	2
51549	1028	2016-08-22	6300	0	0	59	ereimer	Tina			\N	2016-08-22	2016-09-12	4365	63	\N	zalegria	agongora		\N	\N	ereimer	2016-08-22 08:36:08.39	2	4365	0	1
51548	1031	2016-08-22	12240	0	0	42	ereimer	Tim			\N	2016-08-22	2016-09-12	10718	45	\N	nreimer	bmiranda		\N	\N	ereimer	2016-08-22 08:29:18.625	7	10718	0	1
51550	1038	2016-08-22	15660	0	0	29	ereimer	Otto	fif 15480		\N	2016-08-22	2016-09-12	11589	76	\N	grodriguez	kochao		\N	\N	ereimer	2016-08-22 09:06:45.906	7	11589	0	1
51559	1031	2016-08-25	6120	0	0	43	ereimer	Tim			\N	2016-08-25	2016-09-15	5358	56	\N	jquewell	kochao		\N	\N	ereimer	2016-08-25 08:37:25.171	7	5358	0	1
51556	1034	2016-08-25	6120	0	0	34	ereimer	Charlos			\N	2016-08-25	2016-09-15	4538	38	\N	ealergria	bmiranda		\N	\N	ereimer	2016-08-25 08:04:56.187	1	4538	0	1
51563	1025	2016-08-25	7920	0	0	40	ereimer	Ship		404-1	\N	2016-08-25	2016-09-15	6559	83	\N	ealergria	0		\N	\N	ereimer	2016-08-26 14:02:00.375	4	6559	0	1
51634	1032	2016-09-19	6840	0	0	42	ereimer	Edward			\N	2016-09-19	2016-10-10	5289	30	\N	grodriguez	nreimer		\N	\N	ereimer	2016-09-19 10:10:15.968	7	5289	0	1
51565	1025	2016-08-25	6840	0	0	37	ereimer	Ship		404-3	\N	2016-08-25	2016-09-15	5513	60	\N	zalegria	agongora		\N	\N	ereimer	2016-08-26 14:02:53.515	4	5513	0	1
51574	1028	2016-08-29	7560	0	0	60	ereimer	Tina			\N	2016-08-29	2016-09-19	5031	127	\N	zalegria	agongora		\N	\N	ereimer	2016-08-29 09:43:56.515	2	5031	0	1
51569	1031	2016-08-29	14760	0	0	43	ereimer	Abram			\N	2016-08-29	2016-09-19	12463	173	\N	jquewell	nreimer		\N	\N	ereimer	2016-08-29 08:51:01.156	7	12463	0	1
51576	1038	2016-08-29	22680	0	0	30	ereimer	Charlie			\N	2016-08-29	2016-09-19	18277	46	\N	kochao	zalegria		\N	\N	ereimer	2016-08-29 13:39:30.093	7	18277	0	1
51578	1030	2016-09-01	9360	0	0	47	ereimer	William			\N	2016-09-01	2016-09-22	6922	50	\N	bmiranda	zalegria		\N	\N	ereimer	2016-09-01 08:05:42.343	7	6922	0	1
51579	1034	2016-09-01	8460	0	0	35	ereimer	Carlos			\N	2016-09-01	2016-09-22	5951	56	\N	nreimer	kochao		\N	\N	ereimer	2016-09-01 08:18:15	1	5951	0	1
51591	1029	2016-09-05	14760	0	0	57	ereimer	Richard			\N	2016-09-05	2016-09-26	10839	163	\N	grodriguez	jquewell		\N	\N	ereimer	2016-09-05 10:21:58.312	2	10839	0	1
51590	1033	2016-09-05	13320	0	0	38	ereimer	Elma			\N	2016-09-05	2016-09-26	11843	48	\N	grodriguez	jquewell		\N	\N	ereimer	2016-09-05 10:09:47.265	7	11843	0	1
51620	1030	2016-09-15	7920	0	0	49	ereimer	William			\N	2016-09-15	2016-10-06	5319	51	\N	grodriguez	admin		\N	\N	ereimer	2016-09-15 07:51:08.156	7	5319	0	1
51621	1031	2016-09-15	8640	0	0	46	ereimer	Tim			\N	2016-09-15	2016-10-06	7444	55	\N	nreimer	zalegria		\N	\N	ereimer	2016-09-15 08:10:54.468	7	7444	0	1
51625	1032	2016-09-15	5040	0	0	42	ereimer	Edward			\N	2016-09-15	2016-10-06	3919	20	\N	grodriguez	admin		\N	\N	ereimer	2016-09-15 08:43:14.328	7	3919	0	1
51624	1034	2016-09-15	8280	0	0	37	ereimer	Carlos			\N	2016-09-15	2016-10-06	5608	52	\N	nreimer	dmenendez		\N	\N	ereimer	2016-09-15 08:32:54.734	1	5608	0	1
51627	1038	2016-09-15	14760	0	0	33	ereimer	Otto			\N	2016-09-15	2016-10-06	12039	55	\N	grodriguez	admin		\N	\N	ereimer	2016-09-15 09:18:17.015	7	12039	0	1
51631	1028	2016-09-19	5940	0	0	63	ereimer	Anton			\N	2016-09-19	2016-10-10	3719	112	\N	zalegria	agongora		\N	\N	ereimer	2016-09-19 08:59:52.953	2	3719	0	1
51635	1029	2016-09-19	13860	0	0	59	ereimer	Vange			\N	2016-09-19	2016-10-10	9636	200	\N	jquewell	kochao		\N	\N	ereimer	2016-09-19 10:20:06.421	2	9636	0	1
51637	1030	2016-09-19	11520	0	0	49	dthiessen	William			\N	2016-09-19	2016-10-10	7487	36	\N	jquewell	kochao		\N	\N	dthiessen	2016-09-20 17:52:15.515	7	7487	0	1
51630	1033	2016-09-19	12600	0	0	40	ereimer	Paul			\N	2016-09-19	2016-10-10	11089	62	\N	bmiranda	agongora		\N	\N	ereimer	2016-09-19 08:56:41.671	7	11089	0	1
51636	1038	2016-09-19	19620	0	0	33	ereimer	Richard			\N	2016-09-19	2016-10-10	15921	88	\N	grodriguez	nreimer		\N	\N	ereimer	2016-09-19 11:02:06.218	7	15921	0	1
51633	1039	2016-09-19	8820	0	0	29	ereimer	Betty			\N	2016-09-19	2016-10-10	6489	80	\N	grodriguez	bmiranda		\N	\N	ereimer	2016-09-19 09:10:07.765	7	6489	0	1
51645	1028	2016-09-22	4320	0	0	64	ereimer	Anton			\N	2016-09-22	2016-10-13	2720	58	\N	admin	ealergria		\N	\N	ereimer	2016-09-22 09:11:58.937	2	2720	0	1
51638	1030	2016-09-22	8280	0	0	50	dthiessen	Kenroy			\N	2016-09-22	2016-10-13	5400	23	\N	jquewell	kochao		\N	\N	ereimer	2016-09-22 08:01:01.609	7	5400	0	1
51641	1039	2016-09-22	8640	0	0	30	ereimer	Abe			\N	2016-09-22	2016-10-13	6790	27	\N	admin	ealergria		\N	\N	ereimer	2016-09-22 08:34:51.593	7	6790	0	1
51642	1033	2016-09-22	9360	0	0	41	ereimer	Paul			\N	2016-09-22	2016-10-13	8231	51	\N	admin	ealergria		\N	\N	ereimer	2016-09-22 08:45:22.328	7	8231	0	1
51643	1034	2016-09-22	7740	0	0	38	ereimer	Carlos			\N	2016-09-22	2016-10-13	5827	56	\N	zalegria	bmiranda		\N	\N	ereimer	2016-09-22 08:53:29.062	1	5827	0	1
51646	1038	2016-09-22	14760	0	0	34	ereimer	Richard			\N	2016-09-22	2016-10-13	12258	40	\N	jquewell	kochao		\N	\N	ereimer	2016-09-22 09:42:35	7	12258	0	1
51665	1027	2016-09-22	6840	0	0	54	ereimer	Ship		442	\N	2016-09-22	2016-10-13	3450	83	\N	jquewell	agongora		\N	\N	ereimer	2016-09-30 08:59:35.031	4	3450	0	1
51666	1027	2016-09-22	5760	0	0	49	ereimer	Ship		456	\N	2016-09-22	2016-10-13	5011	151	\N	kochao	admin		\N	\N	ereimer	2016-09-30 09:02:11.406	4	5011	0	1
51649	1029	2016-09-26	10440	0	0	60	ereimer	Vange			\N	2016-09-26	2016-10-17	7127	150	\N	grodriguez	kochao		\N	\N	ereimer	2016-09-26 08:25:30.687	2	7127	0	1
51647	1030	2016-09-26	10980	0	0	50	ereimer	Kenroy			\N	2016-09-26	2016-10-17	7218	92	\N	jquewell	admin		\N	\N	ereimer	2016-09-26 08:06:51.031	7	7218	0	1
51654	1031	2016-09-26	8820	2880	0	47	ereimer	Abram			\N	2016-09-26	2016-10-17	7601	76	\N	nreimer	bmiranda		\N	\N	ereimer	2016-09-26 08:57:56.312	7	7601	0	1
51651	1033	2016-09-26	9360	2880	0	41	ereimer	Paul			\N	2016-09-26	2016-10-17	8194	56	\N	jquewell	admin		\N	\N	ereimer	2016-09-26 08:40:24.593	7	8194	0	1
51652	1034	2016-09-26	8460	2700	0	38	ereimer	Carlos			\N	2016-09-26	2016-10-17	6174	63	\N	jquewell	admin		\N	\N	ereimer	2016-09-26 08:46:37.531	1	6174	0	1
51648	1038	2016-09-26	14400	0	0	34	ereimer	Ottto			\N	2016-09-26	2016-10-17	11902	70	\N	grodriguez	kochao		\N	\N	ereimer	2016-09-26 08:15:34.046	7	11902	0	1
51664	1028	2016-09-29	5400	0	0	65	ereimer	Anton			\N	2016-09-29	2016-10-20	3292	69	\N	grodriguez	jquewell		\N	\N	ereimer	2016-09-29 11:01:00	2	3292	0	1
51661	1029	2016-09-29	13680	0	0	61	ereimer	Vange			\N	2016-09-29	2016-10-20	9151	118	\N	grodriguez	bmiranda		\N	\N	ereimer	2016-09-29 09:51:11.078	2	9151	0	1
51657	1031	2016-09-29	11520	0	0	48	ereimer	Abram			\N	2016-09-29	2016-10-20	9847	66	\N	nreimer	kochao		\N	\N	ereimer	2016-09-29 08:32:16.484	7	9847	0	1
51660	1032	2016-09-29	6840	0	0	44	ereimer	Jake			\N	2016-09-29	2016-10-20	5420	30	\N	jquewell	admin		\N	\N	ereimer	2016-09-29 09:42:36.671	7	5420	0	1
51656	1039	2016-09-29	15840	0	0	31	ereimer	Eric			\N	2016-09-29	2016-10-20	12536	108	\N	grodriguez	agongora		\N	\N	ereimer	2016-09-29 08:04:06.406	7	12536	0	1
51662	1038	2016-09-29	19620	0	0	35	ereimer	Richard			\N	2016-09-29	2016-10-20	16403	77	\N	jquewell	admin		\N	\N	ereimer	2016-09-29 09:56:03.218	7	16403	0	1
51658	1034	2016-09-29	10800	0	0	39	ereimer	Carlos			\N	2016-09-29	2016-10-20	7935	156	\N	jquewell	admin		\N	\N	ereimer	2016-09-29 08:34:09.593	1	7935	0	1
51575	1032	2016-08-29	9000	0	0	39	ereimer	Edward			\N	2016-08-29	2016-09-19	7231	43	\N	grodriguez	bmiranda		\N	\N	ereimer	2016-08-29 09:50:48.437	7	7231	0	1
51598	1031	2016-09-08	6120	0	0	45	ereimer	TIm			\N	2016-09-08	2016-09-29	5313	40	\N	admin	ealergria		\N	\N	ereimer	2016-09-08 08:56:56.375	7	5313	0	1
51595	1034	2016-09-08	5220	0	0	36	ereimer	Charlos			\N	2016-09-08	2016-09-29	3645	40	\N	admin	ealergria		\N	\N	ereimer	2016-09-08 08:26:34.968	1	3645	0	1
51673	1030	2016-10-03	10980	0	0	51	ereimer	William	fix 10800		\N	2016-10-03	2016-10-24	6942	49	\N	admin	0		\N	\N	ereimer	2016-10-03 09:28:55.078	7	6942	0	1
51670	1031	2016-10-03	11520	0	0	48	ereimer	Abram			\N	2016-10-03	2016-10-24	9735	148	\N	zalegria	nreimer		\N	\N	ereimer	2016-10-03 08:35:35.765	7	9735	0	1
51610	1029	2016-09-12	18180	0	0	58	ereimer	Richard			\N	2016-09-12	2016-10-03	12723	222	\N	grodriguez	admin		\N	\N	ereimer	2016-09-12 10:05:56	2	12723	0	1
51608	1032	2016-09-12	8640	0	0	41	ereimer	Edward			\N	2016-09-12	2016-10-03	6793	59	\N	admin	kochao		\N	\N	ereimer	2016-09-12 09:22:32.765	7	6793	0	1
51606	1039	2016-09-12	2520	0	0	28	ereimer	Abe			\N	2016-09-12	2016-10-03	1897	12	\N	jquewell	nreimer		\N	\N	ereimer	2016-09-12 08:41:50.703	7	1897	0	1
51626	1028	2016-09-15	4320	0	0	63	ereimer	Tina			\N	2016-09-15	2016-10-06	2783	39	\N	grodriguez	admin		\N	\N	ereimer	2016-09-15 09:05:25.421	2	2783	0	1
51623	1029	2016-09-15	10800	0	0	59	ereimer	Richard			\N	2016-09-15	2016-10-06	7734	76	\N	jquewell	nreimer		\N	\N	ereimer	2016-09-15 08:23:34.593	2	7734	0	1
51622	1033	2016-09-15	9540	0	0	40	ereimer	Paul			\N	2016-09-15	2016-10-06	8501	32	\N	grodriguez	admin		\N	\N	ereimer	2016-09-15 08:16:11.171	7	8501	0	1
51628	1039	2016-09-15	3960	0	0	29	ereimer	Betty			\N	2016-09-15	2016-10-06	2870	12	\N	nreimer	dmenendez		\N	\N	ereimer	2016-09-15 09:27:00.125	7	2870	0	1
51697	1031	2016-10-10	8640	0	0	49	ereimer	Abram			\N	2016-10-10	2016-10-31	7040	102	\N	kochao	cmartinez		\N	\N	ereimer	2016-10-10 09:20:31.281	7	7040	0	1
51705	1033	2016-10-13	11700	0	0	44	dthiessen	Elma			\N	2016-10-13	2016-11-03	10106	72	\N	cmartinez	bmiranda		\N	\N	dthiessen	2016-10-13 09:12:37.281	7	10106	0	1
51629	1031	2016-09-19	11880	0	0	46	ereimer	Tim	fix 11520		\N	2016-09-19	2016-10-10	10019	62	\N	grodriguez	nreimer		\N	\N	ereimer	2016-09-19 08:32:54.796	7	10019	0	1
51632	1034	2016-09-19	10980	0	0	37	ereimer	Carlos			\N	2016-09-19	2016-10-10	7948	58	\N	ealergria	admin		\N	\N	ereimer	2016-09-19 09:06:27.328	1	7948	0	1
51640	1029	2016-09-22	10440	0	0	60	ereimer	Richard			\N	2016-09-22	2016-10-13	7208	87	\N	jquewell	bmiranda		\N	\N	ereimer	2016-09-22 08:22:59.578	2	7208	0	1
51644	1032	2016-09-22	5400	0	0	43	ereimer	Edward			\N	2016-09-22	2016-10-13	4272	19	\N	admin	ealergria		\N	\N	ereimer	2016-09-22 08:58:46.75	7	4272	0	1
51639	1031	2016-09-22	8820	0	0	47	ereimer	Abram			\N	2016-09-22	2016-10-13	7559	64	\N	kochao	admin		\N	\N	ereimer	2016-09-22 08:18:12.781	7	7559	0	1
51667	1027	2016-09-22	12960	0	0	45	ereimer	Ship		470	\N	2016-09-22	2016-10-13	7436	112	\N	jquewell	agongora		\N	\N	ereimer	2016-09-30 09:03:13.937	4	7436	0	1
51668	1027	2016-09-22	3240	0	0	45	ereimer	Ship		471	\N	2016-09-22	2016-10-13	2039	24	\N	admin	0		\N	\N	ereimer	2016-09-30 09:04:31.437	4	2039	0	1
51674	1032	2016-10-03	6480	0	0	44	ereimer	Edward			\N	2016-10-03	2016-10-24	4996	32	\N	nreimer	bmiranda		\N	\N	ereimer	2016-10-03 09:33:17	7	4996	0	1
51675	1034	2016-10-03	10800	0	0	39	ereimer	Rene			\N	2016-10-03	2016-10-24	7980	114	\N	cmanzanero	bmiranda		\N	\N	ereimer	2016-10-03 10:00:41.75	1	7980	0	1
51677	1038	2016-10-03	19620	0	0	35	ereimer	Otto			\N	2016-10-03	2016-10-24	16179	78	\N	grodriguez	kochao		\N	\N	ereimer	2016-10-03 10:51:33.671	7	16179	0	1
51685	1028	2016-10-06	3060	0	0	66	ereimer	Anton			\N	2016-10-06	2016-10-27	1744	38	\N	jquewell	admin		\N	\N	ereimer	2016-10-06 10:09:50.484	2	1744	0	1
51680	1029	2016-10-06	9900	0	0	62	ereimer	Vange			\N	2016-10-06	2016-10-27	6487	86	\N	grodriguez	admin		\N	\N	ereimer	2016-10-06 08:49:10.359	2	6487	0	1
51684	1031	2016-10-06	8460	0	0	49	ereimer	Abram			\N	2016-10-06	2016-10-27	7175	71	\N	grodriguez	admin		\N	\N	ereimer	2016-10-06 09:38:09.5	7	7175	0	1
51686	1032	2016-10-06	5400	0	0	45	ereimer	Edward			\N	2016-10-06	2016-10-27	4096	19	\N	grodriguez	agongora		\N	\N	ereimer	2016-10-06 13:16:28.781	7	4096	0	1
51678	1033	2016-10-06	9180	0	0	43	ereimer	Elma			\N	2016-10-06	2016-10-27	7954	72	\N	grodriguez	agongora		\N	\N	ereimer	2016-10-06 08:12:40.468	7	7954	0	1
51683	1038	2016-10-06	14580	0	0	36	ereimer	Otto			\N	2016-10-06	2016-10-27	12090	33	\N	grodriguez	admin		\N	\N	ereimer	2016-10-06 09:30:25.312	7	12090	0	1
51679	1039	2016-10-06	12240	0	0	32	ereimer	Abe			\N	2016-10-06	2016-10-27	9563	77	\N	bmiranda	agongora		\N	\N	ereimer	2016-10-06 08:34:45.265	7	9563	0	1
51688	1027	2016-10-06	5760	0	0	47	ereimer	Ship		474	\N	2016-10-06	2016-10-27	4417	61	\N	bmiranda	admin		\N	\N	ereimer	2016-10-07 16:32:36.593	4	4417	0	1
51689	1027	2016-10-06	6120	0	0	47	ereimer	Ship		475	\N	2016-10-06	2016-10-27	4974	99	\N	zalegria	jquewell		\N	\N	ereimer	2016-10-07 16:32:54.984	4	4974	0	1
51690	1027	2016-10-06	7200	0	0	33	ereimer	Ship		508	\N	2016-10-06	2016-10-27	5722	28	\N	grodriguez	admin		\N	\N	ereimer	2016-10-07 16:33:14.328	4	5722	0	1
51700	1028	2016-10-10	2340	0	0	66	ereimer	Anton			\N	2016-10-10	2016-10-31	1266	18	\N	jquewell	admin		\N	\N	ereimer	2016-10-10 09:49:42.609	2	1266	0	1
51694	1029	2016-10-10	9900	0	0	62	ereimer	Vange	fix 13500		\N	2016-10-10	2016-10-31	5997	142	\N	cmartinez	kochao		\N	\N	ereimer	2016-10-10 08:49:08.296	2	5997	0	1
51699	1032	2016-10-10	5040	0	0	45	ereimer	Jake			\N	2016-10-10	2016-10-31	3740	17	\N	nreimer	agongora		\N	\N	ereimer	2016-10-10 09:34:50.75	7	3740	0	1
51695	1033	2016-10-10	9180	0	0	43	ereimer	Paul			\N	2016-10-10	2016-10-31	7916	62	\N	nreimer	agongora		\N	\N	ereimer	2016-10-10 09:00:23.062	7	7916	0	1
51696	1038	2016-10-10	14400	0	0	36	ereimer	Otto			\N	2016-10-10	2016-10-31	11550	100	\N	cmartinez	bmiranda		\N	\N	ereimer	2016-10-10 09:14:42.734	7	11550	0	1
51693	1039	2016-10-10	12060	0	0	32	ereimer	Betty			\N	2016-10-10	2016-10-31	8811	80	\N	admin	bmiranda		\N	\N	ereimer	2016-10-10 08:28:28.843	7	8811	0	1
51708	1029	2016-10-13	13140	0	0	63	dthiessen	Evangeline			\N	2016-10-13	2016-11-03	7496	161	\N	cmartinez	bmiranda		\N	\N	dthiessen	2016-10-13 10:11:34.234	2	7496	0	1
51702	1030	2016-10-13	10260	0	0	53	dthiessen	Kenroy			\N	2016-10-13	2016-11-03	5954	90	\N	kochao	agongora		\N	\N	dthiessen	2016-10-13 08:08:19.421	7	5954	0	1
51703	1031	2016-10-13	11160	0	0	50	dthiessen	Abram			\N	2016-10-13	2016-11-03	9436	51	\N	kochao	0		\N	\N	dthiessen	2016-10-13 08:15:36.265	7	9436	0	1
51707	1034	2016-10-13	7920	0	0	41	dthiessen	Rene			\N	2016-10-13	2016-11-03	5732	23	\N	kochao	agongora		\N	\N	dthiessen	2016-10-13 09:54:00.187	1	5732	0	1
51709	1038	2016-10-13	19440	0	0	37	dthiessen	Otto			\N	2016-10-13	2016-11-03	15689	95	\N	zalegria	cmartinez		\N	\N	dthiessen	2016-10-13 10:57:44.5	7	15689	0	1
51712	1030	2016-10-17	10440	0	0	53	ereimer	Kenroy			\N	2016-10-17	2016-11-07	6325	80	\N	zalegria	bmiranda		\N	\N	ereimer	2016-10-17 08:38:09.765	7	6325	0	1
51713	1031	2016-10-17	8280	0	0	50	ereimer	Abram			\N	2016-10-17	2016-11-07	6833	97	\N	cmartinez	agongora		\N	\N	ereimer	2016-10-17 08:52:28.625	7	6833	0	1
51714	1033	2016-10-17	9000	0	0	44	ereimer	Paul			\N	2016-10-17	2016-11-07	7644	87	\N	nreimer	zalegria		\N	\N	ereimer	2016-10-17 08:54:53.828	7	7644	0	1
51715	1034	2016-10-17	10980	0	0	41	ereimer	Carlos			\N	2016-10-17	2016-11-07	7892	65	\N	cmartinez	agongora		\N	\N	ereimer	2016-10-17 08:59:46.046	1	7892	0	1
51710	1039	2016-10-17	12240	0	0	33	ereimer	Eric			\N	2016-10-17	2016-11-07	9380	74	\N	admin	kochao		\N	\N	ereimer	2016-10-17 08:22:09.859	7	9380	0	1
51716	1029	2016-10-17	9360	0	0	63	ereimer	Vange			\N	2016-10-17	2016-11-07	5238	120	\N	admin	bmiranda		\N	\N	ereimer	2016-10-17 09:07:54.703	2	5238	0	1
51655	1028	2016-09-26	4500	0	0	64	ereimer	Anton			\N	2016-09-26	2016-10-17	2803	64	\N	grodriguez	kochao		\N	\N	ereimer	2016-09-26 10:04:09.156	2	2803	0	1
51653	1032	2016-09-26	5040	1800	0	43	ereimer	Edward			\N	2016-09-26	2016-10-17	4001	11	\N	nreimer	bmiranda		\N	\N	ereimer	2016-09-26 08:50:44.078	7	4001	0	1
51650	1039	2016-09-26	10620	3960	0	30	ereimer	Eric			\N	2016-09-26	2016-10-17	8532	40	\N	nreimer	agongora		\N	\N	ereimer	2016-09-26 08:31:09.609	7	8532	0	1
51663	1030	2016-09-29	8280	0	0	51	ereimer	William			\N	2016-09-29	2016-10-20	553	62	\N	jquewell	admin		\N	\N	ereimer	2016-09-29 10:06:59.64	7	5539	0	1
51659	1033	2016-09-29	12240	0	0	42	ereimer	Jesse			\N	2016-09-29	2016-10-20	10737	61	\N	nreimer	kochao		\N	\N	ereimer	2016-09-29 09:28:43.046	7	10737	0	1
51733	1038	2016-10-24	14400	0	0	38	ereimer	Charlie			\N	2016-10-24	2016-11-14	11416	146	\N	admin	0		\N	\N	ereimer	2016-10-24 09:09:21.125	7	11416	0	1
51671	1028	2016-10-03	5580	0	0	65	ereimer	Anton			\N	2016-10-03	2016-10-24	3279	80	\N	jquewell	admin		\N	\N	ereimer	2016-10-03 08:39:56.734	2	3279	0	1
51676	1029	2016-10-03	13500	0	0	61	ereimer	Vange	fix 17100		\N	2016-10-03	2016-10-24	8436	116	\N	agongora	nreimer		\N	\N	ereimer	2016-10-03 10:08:28.218	2	8436	0	1
51669	1033	2016-10-03	12600	0	0	42	ereimer	Paul			\N	2016-10-03	2016-10-24	11058	87	\N	jquewell	admin		\N	\N	ereimer	2016-10-03 08:28:17.203	7	11058	0	1
51672	1039	2016-10-03	16020	0	0	31	ereimer	Eric			\N	2016-10-03	2016-10-24	12192	86	\N	grodriguez	kochao		\N	\N	ereimer	2016-10-03 08:46:27.796	7	12192	0	1
51682	1030	2016-10-06	8100	0	0	52	ereimer	William			\N	2016-10-06	2016-10-27	5029	67	\N	zalegria	bmiranda		\N	\N	ereimer	2016-10-06 09:15:07.812	7	5029	0	1
51681	1034	2016-10-06	8100	0	0	40	ereimer	Rene			\N	2016-10-06	2016-10-27	5749	127	\N	zalegria	bmiranda		\N	\N	ereimer	2016-10-06 08:50:32.062	1	5749	0	1
51687	1027	2016-10-06	2520	0	0	57	ereimer	Ship		442	\N	2016-10-06	2016-10-27	1848	25	\N	grodriguez	admin		\N	\N	ereimer	2016-10-07 16:32:13.984	4	1848	0	1
51691	1027	2016-10-06	7200	0	0	33	ereimer	Ship		509	\N	2016-10-06	2016-10-27	6002	28	\N	bmiranda	admin		\N	\N	ereimer	2016-10-07 16:33:30.64	4	6002	0	1
51751	1039	2016-10-31	19800	0	0	35	dthiessen	Eric			\N	2016-10-31	2016-11-21	14916	146	\N	kochao	bmiranda		\N	\N	ereimer	2016-10-31 09:20:24.14	7	14916	0	1
51692	1030	2016-10-10	7560	0	0	52	ereimer	William			\N	2016-10-10	2016-10-31	4556	87	\N	admin	bmiranda		\N	\N	ereimer	2016-10-10 08:18:01.75	7	4556	0	1
51698	1034	2016-10-10	10260	0	0	40	ereimer	Melvin			\N	2016-10-10	2016-10-31	7275	116	\N	kochao	cmartinez		\N	\N	ereimer	2016-10-10 09:29:46.687	1	7275	0	1
51761	1030	2016-11-03	7740	0	0	56	ereimer	William			\N	2016-11-03	2016-11-24	4818	84	\N	admin	zalegria		\N	\N	ereimer	2016-11-03 09:21:00.265	7	4818	0	1
51701	1028	2016-10-13	3240	0	0	67	dthiessen	Anton			\N	2016-10-13	2016-11-03	1590	61	\N	jquewell	kochao		\N	\N	dthiessen	2016-10-13 07:59:09.843	2	1590	0	1
51704	1032	2016-10-13	6480	0	0	46	dthiessen	Jake	fix 7200		\N	2016-10-13	2016-11-03	4862	49	\N	cmartinez	bmiranda		\N	\N	dthiessen	2016-10-13 08:19:54.984	7	4862	0	1
51706	1039	2016-10-13	15660	0	0	37	dthiessen	Abe	fix 1038		\N	2016-10-13	2016-11-03	11715	155	\N	zalegria	cmartinez		\N	\N	dthiessen	2016-10-13 09:14:33.218	7	11715	0	1
51725	1029	2016-10-20	11880	0	0	64	ereimer	Vange			\N	2016-10-20	2016-11-10	6228	200	\N	bmiranda	zalegria		\N	\N	ereimer	2016-10-20 09:48:48.75	2	6228	0	1
51719	1030	2016-10-20	7920	0	0	54	ereimer	Joe			\N	2016-10-20	2016-11-10	4940	102	\N	admin	kochao		\N	\N	ereimer	2016-10-20 08:15:49.625	7	4940	0	1
51727	1032	2016-10-20	6840	0	0	47	ereimer	Edwrad			\N	2016-10-20	2016-11-10	5069	49	\N	bmiranda	admin		\N	\N	ereimer	2016-10-20 10:28:41.843	7	5069	0	1
51723	1033	2016-10-20	12060	0	0	45	ereimer	Paul			\N	2016-10-20	2016-11-10	10308	100	\N	admin	nreimer		\N	\N	ereimer	2016-10-20 09:01:12.562	7	10308	0	1
51726	1038	2016-10-20	19260	0	0	38	ereimer	Richard			\N	2016-10-20	2016-11-10	15552	103	\N	admin	kochao		\N	\N	ereimer	2016-10-20 10:21:49.89	7	15552	0	1
51724	1039	2016-10-20	16200	0	0	34	ereimer	Abe			\N	2016-10-20	2016-11-10	11946	169	\N	admin	nreimer		\N	\N	ereimer	2016-10-20 09:24:23.671	7	11946	0	1
51720	1040	2016-10-20	720	0	0	28	ereimer	Louis			\N	2016-10-20	2016-11-10	439	0	\N	nreimer	agongora		\N	\N	ereimer	2016-10-20 08:21:04.109	1	439	0	1
51728	1030	2016-10-24	7560	0	0	54	admin	Emory			\N	2016-10-24	2016-11-14	4506	85	\N	admin	bmiranda		\N	\N	ereimer	2016-10-24 07:50:30.359	7	4506	0	1
51732	1031	2016-10-24	8460	0	0	51	ereimer	Margaret			\N	2016-10-24	2016-11-14	6690	152	\N	nreimer	bmiranda		\N	\N	ereimer	2016-10-24 09:02:10.437	7	6690	0	1
51734	1033	2016-10-24	9720	0	0	45	ereimer	Elma			\N	2016-10-24	2016-11-14	7982	87	\N	nreimer	agongora		\N	\N	ereimer	2016-10-24 10:01:34.718	7	7982	0	1
51731	1034	2016-10-24	8100	0	0	42	ereimer	Carlos	fix 7920		\N	2016-10-24	2016-11-14	5697	53	\N	agongora	admin		\N	\N	ereimer	2016-10-24 08:47:33.281	1	5697	0	1
51729	1039	2016-10-24	11520	0	0	34	ereimer	Eric			\N	2016-10-24	2016-11-14	8520	24	\N	dmenendez	zalegria		\N	\N	ereimer	2016-10-24 08:32:36.843	7	8520	0	1
51742	1029	2016-10-27	7560	0	0	65	ereimer	Richard			\N	2016-10-27	2016-11-17	3784	98	\N	zalegria	admin		\N	\N	ereimer	2016-10-27 09:15:11.64	2	3784	0	1
51740	1030	2016-10-27	7740	0	0	55	ereimer	William			\N	2016-10-27	2016-11-17	4356	56	\N	kochao	bmiranda		\N	\N	ereimer	2016-10-27 08:55:03.437	7	4356	0	1
51738	1032	2016-10-27	4680	0	0	48	ereimer	Jake			\N	2016-10-27	2016-11-17	3473	13	\N	jquewell	zalegria		\N	\N	ereimer	2016-10-27 08:36:07.328	7	3473	0	1
51739	1033	2016-10-27	7920	0	0	46	ereimer	Paul			\N	2016-10-27	2016-11-17	6526	40	\N	zalegria	jquewell		\N	\N	ereimer	2016-10-27 08:45:53.234	7	6526	0	1
51745	1038	2016-10-27	14400	0	0	39	ereimer	Otto			\N	2016-10-27	2016-11-17	11698	103	\N	jquewell	zalegria		\N	\N	ereimer	2016-10-27 09:36:33.671	7	11698	0	1
51743	1039	2016-10-27	11340	0	0	35	ereimer	Abe			\N	2016-10-27	2016-11-17	8718	85	\N	bmiranda	zalegria		\N	\N	ereimer	2016-10-27 09:24:36.031	7	8718	0	1
51744	1040	2016-10-27	5040	1620	0	29	ereimer	Kenton			\N	2016-10-27	2016-11-17	3382	70	\N	zalegria	0		\N	\N	ereimer	2016-10-27 09:30:34.796	1	3382	0	1
51746	1029	2016-10-31	9540	0	0	65	ereimer	Richard			\N	2016-10-31	2016-11-21	4524	63	\N	admin	agongora		\N	\N	ereimer	2016-10-31 08:21:30.125	2	4524	0	1
51749	1030	2016-10-31	13860	0	0	55	ereimer	Joe			\N	2016-10-31	2016-11-21	8187	68	\N	kochao	bmiranda		\N	\N	ereimer	2016-10-31 09:08:35	7	8187	0	1
51747	1031	2016-10-31	13680	0	0	52	ereimer	Jerry			\N	2016-10-31	2016-11-21	10657	284	\N	admin	cmartinez		\N	\N	ereimer	2016-10-31 08:49:07.5	7	10657	0	1
51748	1033	2016-10-31	14400	0	0	46	ereimer	Elma			\N	2016-10-31	2016-11-21	11462	273	\N	bmiranda	kochao		\N	\N	ereimer	2016-10-31 08:58:26.625	7	11462	0	1
51750	1034	2016-10-31	13320	0	0	43	ereimer	Charlos			\N	2016-10-31	2016-11-21	9537	200	\N	kochao	wcabb		\N	\N	ereimer	2016-10-31 09:18:47.062	1	9537	0	1
51753	1040	2016-10-31	12240	0	0	29	ereimer	Kenton			\N	2016-10-31	2016-11-21	9362	30	\N	nreimer	agongora		\N	\N	ereimer	2016-10-31 10:25:56.921	1	9362	0	1
51756	1029	2016-11-03	4680	0	0	66	ereimer	Richard	fix 3600		\N	2016-11-03	2016-11-24	1972	45	\N	admin	jquewell		\N	\N	ereimer	2016-11-03 08:23:32.093	2	1972	0	1
51760	1032	2016-11-03	4680	0	0	49	ereimer	Edward			\N	2016-11-03	2016-11-24	3452	37	\N	admin	zalegria		\N	\N	ereimer	2016-11-03 08:56:33.296	7	3452	0	1
51757	1033	2016-11-03	8640	0	0	47	ereimer	Elma			\N	2016-11-03	2016-11-24	7155	38	\N	admin	agongora		\N	\N	ereimer	2016-11-03 08:29:51.437	7	7155	0	1
51755	1038	2016-11-03	14220	0	0	40	ereimer	Richard			\N	2016-11-03	2016-11-24	11331	107	\N	zalegria	bmiranda		\N	\N	ereimer	2016-11-03 08:22:57.515	7	11331	0	1
51758	1039	2016-11-03	11700	0	0	36	ereimer	Betty			\N	2016-11-03	2016-11-24	8897	128	\N	admin	zalegria		\N	\N	ereimer	2016-11-03 08:46:34.687	7	8897	0	1
51763	1040	2016-11-03	9720	0	0	30	ereimer	Kenton			\N	2016-11-03	2016-11-24	7416	133	\N	admin	cmartinez		\N	\N	ereimer	2016-11-03 10:39:24.125	1	7416	0	1
51771	1032	2016-11-07	6120	0	0	49	ereimer	Edward			\N	2016-11-07	2016-11-28	4504	86	\N	bmiranda	0		\N	\N	ereimer	2016-11-07 09:30:48.265	7	4504	0	1
51765	1039	2016-11-07	15480	0	0	36	ereimer	Eric			\N	2016-11-07	2016-11-28	12275	83	\N	admin	dmenendez		\N	\N	ereimer	2016-11-07 08:29:22.406	7	12275	0	1
51773	1038	2016-11-07	19080	0	0	40	ereimer	Otto	fix 8280		\N	2016-11-07	2016-11-28	15231	127	\N	cmartinez	kochao		\N	\N	ereimer	2016-11-07 10:17:50.468	7	15231	0	1
51717	1032	2016-10-17	5040	0	0	46	ereimer	Edward			\N	2016-10-17	2016-11-07	3725	66	\N	nreimer	bmiranda		\N	\N	ereimer	2016-10-17 09:14:40.843	7	3725	0	1
51711	1038	2016-10-17	14580	0	0	37	ereimer	Annie`			\N	2016-10-17	2016-11-07	11880	100	\N	cmartinez	agongora		\N	\N	ereimer	2016-10-17 08:30:18.625	7	11880	0	1
51718	1040	2016-10-17	180	0	0	27	ereimer	Kenton			\N	2016-10-17	2016-11-07	109	0	\N	admin	0		\N	\N	ereimer	2016-10-17 09:46:18.25	1	109	0	1
51721	1034	2016-10-20	7920	0	0	42	ereimer	Carlos			\N	2016-10-20	2016-11-10	5751	75	\N	kochao	admin		\N	\N	ereimer	2016-10-20 08:38:47.14	1	5751	0	1
51722	1031	2016-10-20	11160	0	0	51	ereimer	Abram			\N	2016-10-20	2016-11-10	9159	130	\N	nreimer	agongora		\N	\N	ereimer	2016-10-20 08:49:15.14	7	9159	0	1
51804	1038	2016-11-17	9360	0	0	42	ereimer	Otto			\N	2016-11-17	2016-12-08	7266	76	\N	zalegria	0		\N	\N	ereimer	2016-11-17 10:27:27.371	7	7266	0	1
51730	1029	2016-10-24	7200	0	0	64	ereimer	Richard			\N	2016-10-24	2016-11-14	3713	120	\N	jquewell	zalegria		\N	\N	ereimer	2016-10-24 08:38:56.343	2	3713	0	1
51736	1032	2016-10-24	4680	0	0	47	ereimer	Edward			\N	2016-10-24	2016-11-14	3347	62	\N	nreimer	agongora		\N	\N	ereimer	2016-10-24 10:12:57.828	7	3347	0	1
51735	1040	2016-10-24	2340	1080	0	28	ereimer	Kenton			\N	2016-10-24	2016-11-14	1489	21	\N	admin	bmiranda		\N	\N	ereimer	2016-10-24 10:08:06.765	1	1489	0	1
51737	1031	2016-10-27	7920	0	0	52	ereimer	Abram			\N	2016-10-27	2016-11-17	6482	83	\N	jquewell	zalegria		\N	\N	ereimer	2016-10-27 08:24:30.468	7	6482	0	1
51741	1034	2016-10-27	7920	0	0	43	ereimer	Charlos			\N	2016-10-27	2016-11-17	5818	40	\N	kochao	bmiranda		\N	\N	ereimer	2016-10-27 08:59:01.5	1	5818	0	1
51764	1027	2016-10-27	25200	0	0	47	ereimer	Ship		480	\N	2016-10-27	2016-11-17	20494	158	\N	jquewell	kochao		\N	\N	ereimer	2016-11-04 09:34:37.375	4	20494	0	1
51813	1031	2016-11-21	10620	2520	0	55	ereimer	Abram			\N	2016-11-21	2016-12-12	7695	203	\N	nreimer	0		\N	\N	ereimer	2016-11-21 09:24:14.011	7	7695	0	1
51770	1030	2016-11-07	10440	0	0	56	ereimer	William			\N	2016-11-07	2016-11-28	6310	116	\N	bmiranda	0		\N	\N	ereimer	2016-11-07 09:25:18.734	7	6310	0	1
51766	1033	2016-11-07	11340	0	0	47	ereimer	Paul			\N	2016-11-07	2016-11-28	8947	208	\N	nreimer	agongora		\N	\N	ereimer	2016-11-07 08:38:33.203	7	8947	0	1
51772	1040	2016-11-07	14400	0	0	30	ereimer	Kenton			\N	2016-11-07	2016-11-28	11763	80	\N	zalegria	kochao		\N	\N	ereimer	2016-11-07 09:43:21.156	1	11763	0	1
51774	1029	2016-11-10	1620	0	0	67	ereimer	Richard			\N	2016-11-10	2016-12-01	651	24	\N	zalegria	admin		\N	\N	ereimer	2016-11-11 08:50:08.516	2	651	0	1
51776	1031	2016-11-10	8100	0	0	54	ereimer	Tim			\N	2016-11-10	2016-12-01	6423	96	\N	kochao	0		\N	\N	ereimer	2016-11-11 08:52:24.313	7	6423	0	1
51777	1032	2016-11-10	4680	0	0	50	ereimer	Edwrad			\N	2016-11-10	2016-12-01	3505	52	\N	bmiranda	0		\N	\N	ereimer	2016-11-11 08:52:56.813	7	3505	0	1
51778	1033	2016-11-10	8640	0	0	48	ereimer	Elma			\N	2016-11-10	2016-12-01	6938	140	\N	zalegria	0		\N	\N	ereimer	2016-11-11 08:53:17.125	7	6938	0	1
51780	1038	2016-11-10	14220	0	0	41	ereimer	Otto			\N	2016-11-10	2016-12-01	11241	56	\N	bmiranda	nreimer		\N	\N	ereimer	2016-11-11 08:54:01.985	7	11241	0	1
51781	1039	2016-11-10	11520	0	0	37	ereimer	Abe			\N	2016-11-10	2016-12-01	9456	50	\N	kochao	0		\N	\N	ereimer	2016-11-11 08:54:19.672	7	9456	0	1
51782	1040	2016-11-10	11880	0	0	31	ereimer	Cindy			\N	2016-11-10	2016-12-01	10287	27	\N	kochao	0		\N	\N	ereimer	2016-11-11 08:54:35.672	1	10287	0	1
51784	1027	2016-11-10	3600	0	0	53	ereimer	Ship		470	\N	2016-11-10	2016-12-01	2718	43	\N	kochao	0		\N	\N	ereimer	2016-11-11 10:08:02.438	4	2718	0	1
51785	1027	2016-11-10	3600	0	0	53	ereimer	Ship		471	\N	2016-11-10	2016-12-01	2623	15	\N	kochao	0		\N	\N	ereimer	2016-11-11 10:08:27.969	4	2623	0	1
51786	1027	2016-11-10	7200	0	0	52	ereimer	Ship		474	\N	2016-11-10	2016-12-01	5766	116	\N	kochao	0		\N	\N	ereimer	2016-11-11 10:08:51.938	4	5766	0	1
51788	1027	2016-11-10	18000	0	0	49	ereimer	Ship		480	\N	2016-11-10	2016-12-01	14373	120	\N	kochao	0		\N	\N	ereimer	2016-11-11 10:10:20.25	4	14373	0	1
51796	1030	2016-11-14	9900	0	0	57	ereimer	Emery			\N	2016-11-14	2016-12-05	5473	104	\N	bmiranda	0		\N	\N	ereimer	2016-11-14 14:31:57.589	7	5473	0	1
51789	1031	2016-11-14	10620	0	0	54	ereimer	Abram			\N	2016-11-14	2016-12-05	7889	156	\N	admin	0		\N	\N	ereimer	2016-11-14 08:22:36.746	7	7889	0	1
51791	1033	2016-11-14	10980	0	0	48	ereimer	Paul			\N	2016-11-14	2016-12-05	8470	190	\N	bmiranda	0		\N	\N	ereimer	2016-11-14 08:47:57.964	7	8470	0	1
51790	1034	2016-11-14	10620	0	0	45	ereimer	Carlos			\N	2016-11-14	2016-12-05	7454	82	\N	cmanzanero	0		\N	\N	ereimer	2016-11-14 08:38:45.699	1	7454	0	1
51795	1038	2016-11-14	18720	0	0	41	ereimer	Otto			\N	2016-11-14	2016-12-05	14591	103	\N	nreimer	0		\N	\N	ereimer	2016-11-14 10:46:48.902	7	14591	0	1
51794	1040	2016-11-14	11880	4140	0	31	ereimer	Kenton			\N	2016-11-14	2016-12-05	9932	43	\N	admin	0		\N	\N	ereimer	2016-11-14 10:04:08.699	1	9932	0	1
51799	1030	2016-11-17	5040	0	0	58	ereimer	Joe			\N	2016-11-17	2016-12-08	2578	32	\N	bmiranda	cmanzanero		\N	\N	ereimer	2016-11-17 08:44:40.839	7	2578	0	1
51801	1031	2016-11-17	5040	0	0	55	ereimer	Abram			\N	2016-11-17	2016-12-08	3755	70	\N	admin	0		\N	\N	ereimer	2016-11-17 08:56:51.246	7	3755	0	1
51800	1033	2016-11-17	5400	0	0	49	ereimer	Paul			\N	2016-11-17	2016-12-08	4469	37	\N	bmiranda	0		\N	\N	ereimer	2016-11-17 08:50:22.308	7	4469	0	1
51798	1034	2016-11-17	5220	0	0	46	ereimer	Carlos	fix 5580		\N	2016-11-17	2016-12-08	3650	50	\N	kochao	0		\N	\N	ereimer	2016-11-17 07:59:39.746	1	3650	0	1
51803	1040	2016-11-17	12960	3780	0	32	ereimer	Kenton			\N	2016-11-17	2016-12-08	10772	106	\N	agongora	0		\N	\N	ereimer	2016-11-17 10:16:33.496	1	10772	0	1
51807	1027	2016-11-17	23400	0	0	37	ereimer	Ship		511	\N	2016-11-17	2016-12-08	19803	150	\N	kochao	0		\N	\N	ereimer	2016-11-17 16:39:54.902	4	19803	0	1
51805	1027	2016-11-17	19440	0	0	50	ereimer	Ship		480	\N	2016-11-17	2016-12-08	15629	105	\N	kochao	0		\N	\N	ereimer	2016-11-17 16:39:11.73	4	15629	0	1
51810	1030	2016-11-21	9720	2430	0	58	ereimer	Joe	fix 6480		\N	2016-11-21	2016-12-12	4843	96	\N	zalegria	0		\N	\N	ereimer	2016-11-21 08:16:30.699	7	4843	0	1
51809	1032	2016-11-21	6120	1440	0	51	dthiessen	Edward			\N	2016-11-21	2016-12-12	3974	139	\N	admin	0		\N	\N	ereimer	2016-11-21 07:58:06.839	7	3974	0	1
51808	1034	2016-11-21	10080	2520	0	46	dthiessen	Rene			\N	2016-11-21	2016-12-12	6914	168	\N	admin	0		\N	\N	ereimer	2016-11-21 07:48:22.621	1	6914	0	1
51814	1038	2016-11-21	18360	4680	0	42	ereimer	Annie			\N	2016-11-21	2016-12-12	14224	100	\N	nreimer	0		\N	\N	ereimer	2016-11-21 09:44:31.902	7	14224	0	1
51811	1039	2016-11-21	14040	3420	0	38	ereimer	Betty			\N	2016-11-21	2016-12-12	10469	135	\N	cmanzanero	0		\N	\N	ereimer	2016-11-21 08:47:41.496	7	10469	0	1
51819	1030	2016-11-24	10080	0	0	59	ereimer	Wiliiam			\N	2016-11-24	2016-12-15	5318	130	\N	bmiranda	zalegria		\N	\N	ereimer	2016-11-24 09:06:52.792	7	5318	0	1
51821	1031	2016-11-24	10080	0	0	56	ereimer	Tim			\N	2016-11-24	2016-12-15	7455	257	\N	kochao	0		\N	\N	ereimer	2016-11-24 10:29:42.23	7	7455	0	1
51818	1034	2016-11-24	10440	0	0	47	ereimer	Rene			\N	2016-11-24	2016-12-15	7678	13	\N	nreimer	0		\N	\N	ereimer	2016-11-24 09:01:15.074	1	7678	0	1
51816	1039	2016-11-24	14040	0	0	39	ereimer	Abe			\N	2016-11-24	2016-12-15	10567	104	\N	jquewell	nreimer		\N	\N	ereimer	2016-11-24 08:41:06.292	7	10567	0	1
51820	1040	2016-11-24	16740	0	0	33	ereimer	Kenton			\N	2016-11-24	2016-12-15	13226	121	\N	nreimer	jquewell		\N	\N	ereimer	2016-11-24 09:16:23.777	1	13226	0	1
51752	1032	2016-10-31	7920	0	0	48	ereimer	Edward 			\N	2016-10-31	2016-11-21	5706	65	\N	nreimer	agongora		\N	\N	ereimer	2016-10-31 09:46:29.89	7	5706	0	1
51754	1038	2016-10-31	24300	0	0	39	ereimer	Richard	fix 20700		\N	2016-10-31	2016-11-21	19221	178	\N	admin	cmartinez		\N	\N	ereimer	2016-10-31 10:32:27.078	7	19221	0	1
51762	1031	2016-11-03	8100	0	0	53	ereimer	Abram			\N	2016-11-03	2016-11-24	6427	143	\N	admin	bmiranda		\N	\N	ereimer	2016-11-03 10:01:08.984	7	6427	0	1
51759	1034	2016-11-03	7560	0	0	44	ereimer	Charlos			\N	2016-11-03	2016-11-24	5593	56	\N	dmenendez	kochao		\N	\N	ereimer	2016-11-03 08:53:50.203	1	5593	0	1
51767	1029	2016-11-07	4140	0	0	66	ereimer	Richard			\N	2016-11-07	2016-11-28	1646	49	\N	admin	bmiranda		\N	\N	ereimer	2016-11-07 08:42:33.562	2	1646	0	1
51768	1031	2016-11-07	10800	0	0	56	ereimer	Tim	fix 1030		\N	2016-11-07	2016-11-28	8488	153	\N	admin	bmiranda		\N	\N	ereimer	2016-11-07 08:49:32.515	7	8488	0	1
51769	1034	2016-11-07	10980	0	0	44	dthiessen	Carlos	fix 10800		\N	2016-11-07	2016-11-28	8064	77	\N	cmartinez	kochao		\N	\N	ereimer	2016-11-07 08:55:34.593	1	8064	0	1
51775	1030	2016-11-10	7920	0	0	57	ereimer	son			\N	2016-11-10	2016-12-01	4949	67	\N	nreimer	0		\N	\N	ereimer	2016-11-11 08:51:57.422	7	4949	0	1
51779	1034	2016-11-10	8100	0	0	45	ereimer	Carlos			\N	2016-11-10	2016-12-01	6067	58	\N	bmiranda	0		\N	\N	ereimer	2016-11-11 08:53:36.938	1	6067	0	1
51783	1027	2016-11-10	3600	0	0	53	ereimer	Ship		469	\N	2016-11-10	2016-12-01	2687	52	\N	cmartinez	0		\N	\N	ereimer	2016-11-11 10:07:10.579	4	2687	0	1
51787	1027	2016-11-10	3600	0	0	52	ereimer	Ship		475	\N	2016-11-10	2016-12-01	2991	25	\N	cmartinez	0		\N	\N	ereimer	2016-11-11 10:09:13.735	4	2991	0	1
51793	1032	2016-11-14	6120	0	0	50	ereimer	Edward			\N	2016-11-14	2016-12-05	4264	70	\N	nreimer	0		\N	\N	ereimer	2016-11-14 09:50:41.871	7	4264	0	1
51792	1039	2016-11-14	14760	0	0	37	ereimer	eric			\N	2016-11-14	2016-12-05	11259	100	\N	kochao	0		\N	\N	ereimer	2016-11-14 08:49:38.183	7	11259	0	1
51802	1032	2016-11-17	3240	0	0	51	ereimer	Edward			\N	2016-11-17	2016-12-08	2294	6	\N	zalegria	0		\N	\N	ereimer	2016-11-17 09:17:56.183	7	2294	0	1
51797	1039	2016-11-17	7200	0	0	38	ereimer	Eric			\N	2016-11-17	2016-12-08	5531	23	\N	agongora	0		\N	\N	ereimer	2016-11-17 07:40:28.058	7	5531	0	1
51806	1027	2016-11-17	3960	0	0	39	ereimer	Ship		509	\N	2016-11-17	2016-12-08	3217	32	\N	agongora	0		\N	\N	ereimer	2016-11-17 16:39:32.855	4	3217	0	1
51831	1041	2016-11-28	360	0	0	26	dthiessen	Jake			\N	2016-11-28	2016-12-19	149	0	\N	nreimer	admin		\N	\N	ereimer	2016-11-28 11:30:36.308	7	149	0	1
51827	1031	2016-11-28	10260	0	0	56	ereimer	Tim			\N	2016-11-28	2016-12-19	6931	334	\N	bmiranda	cmartinez		\N	\N	ereimer	2016-11-28 09:27:09.558	7	6931	0	1
51826	1033	2016-11-28	9900	0	0	50	ereimer	Paul			\N	2016-11-28	2016-12-19	7470	165	\N	bmiranda	cmanzanero		\N	\N	ereimer	2016-11-28 08:38:53.199	7	7470	0	1
51824	1034	2016-11-28	10080	0	0	47	ereimer	Carlos			\N	2016-11-28	2016-12-19	7078	90	\N	admin	kochao		\N	\N	ereimer	2016-11-28 08:11:15.652	1	7078	0	1
51828	1038	2016-11-28	18180	0	0	43	ereimer	Otto			\N	2016-11-28	2016-12-19	13535	282	\N	nreimer	agongora		\N	\N	ereimer	2016-11-28 09:52:37.574	7	13535	0	1
51829	1040	2016-11-28	17280	0	0	33	ereimer	Kenton			\N	2016-11-28	2016-12-19	13679	76	\N	kochao	cmanzanero		\N	\N	ereimer	2016-11-28 10:06:11.183	1	13679	0	1
51832	1030	2016-11-28	9720	0	0	59	ereimer	Joe			\N	2016-11-28	2016-12-19	5054	156	\N	zalegria	cmartinez		\N	\N	ereimer	2016-11-28 13:23:16.058	7	5054	0	1
51833	1030	2016-12-01	7020	0	0	60	dthiessen	Emory			\N	2016-12-01	2016-12-22	3717	66	\N	kochao	aquinonez		\N	\N	ereimer	2016-12-01 08:16:00.667	7	3717	0	1
51838	1032	2016-12-01	4320	0	0	53	dthiessen	Edward			\N	2016-12-01	2016-12-22	2984	74	\N	kochao	agongora		\N	\N	ereimer	2016-12-01 10:19:48.746	7	2984	0	1
51835	1033	2016-12-01	7200	0	0	51	dthiessen	Paul			\N	2016-12-01	2016-12-22	5495	90	\N	admin	dmenendez		\N	\N	ereimer	2016-12-01 08:39:03.058	7	5495	0	1
51839	1038	2016-12-01	13680	0	0	44	dthiessen	Otto			\N	2016-12-01	2016-12-22	10736	20	\N	admin	aquinonez		\N	\N	dthiessen	2016-12-01 10:34:26.808	7	10736	0	1
51834	1039	2016-12-01	10980	0	0	40	dthiessen	Abe			\N	2016-12-01	2016-12-22	7523	50	\N	admin	0		\N	\N	ereimer	2016-12-01 08:31:43.699	7	7523	0	1
51840	1040	2016-12-01	12960	0	0	34	dthiessen	Kenton			\N	2016-12-01	2016-12-22	11149	95	\N	kochao	agongora		\N	\N	dthiessen	2016-12-01 10:35:37.105	1	11149	0	1
51847	1039	2016-12-05	10980	3600	0	40	dthiessen	Betty			\N	2016-12-05	2016-12-26	7787	99	\N	bmiranda	agongora		\N	\N	ereimer	2016-12-05 09:14:18.052	7	7787	0	1
51842	1031	2016-12-05	7380	0	0	57	dthiessen	Abram			\N	2016-12-05	2016-12-26	4895	116	\N	bmiranda	zalegria		\N	\N	ereimer	2016-12-05 07:48:51.13	7	4895	0	1
51843	1032	2016-12-05	4680	0	0	53	dthiessen	Edward			\N	2016-12-05	2016-12-26	3035	58	\N	dmenendez	jquewell		\N	\N	ereimer	2016-12-05 07:54:01.208	7	3035	0	1
51844	1034	2016-12-05	7380	0	0	48	dthiessen	Juan			\N	2016-12-05	2016-12-26	5226	57	\N	nreimer	admin		\N	\N	ereimer	2016-12-05 08:31:59.662	1	5226	0	1
51849	1038	2016-12-05	13680	0	0	44	dthiessen	Otto			\N	2016-12-05	2016-12-26	10049	160	\N	nreimer	admin		\N	\N	dthiessen	2016-12-06 13:37:57.443	7	10049	0	1
51848	1040	2016-12-05	12960	3960	0	34	dthiessen	Kenton			\N	2016-12-05	2016-12-26	10902	60	\N	bmiranda	jquewell		\N	\N	ereimer	2016-12-05 09:35:03.849	1	10902	0	1
51850	1041	2016-12-05	2520	0	0	27	dthiessen	Jake			\N	2016-12-05	2016-12-26	1571	10	\N	jquewell	bmiranda		\N	\N	dthiessen	2016-12-06 13:38:11.005	7	1571	0	1
51852	1030	2016-12-08	9180	0	0	61	dthiessen	Kenroy			\N	2016-12-08	2016-12-29	4317	112	\N	nreimer	0		\N	\N	dthiessen	2016-12-08 08:55:39.068	7	4317	0	1
51854	1032	2016-12-08	5400	0	0	54	dthiessen	Edward			\N	2016-12-08	2016-12-29	3414	5	\N	admin	jquewell		\N	\N	dthiessen	2016-12-08 09:08:00.833	7	3414	0	1
51853	1033	2016-12-08	10080	0	0	52	dthiessen	Elma			\N	2016-12-08	2016-12-29	7518	80	\N	jquewell	kochao		\N	\N	dthiessen	2016-12-08 09:04:17.646	7	7518	0	1
51857	1038	2016-12-08	18000	0	0	45	dthiessen	Richard			\N	2016-12-08	2016-12-29	13679	40	\N	admin	0		\N	\N	dthiessen	2016-12-08 10:00:29.099	7	13679	0	1
51856	1039	2016-12-08	14220	0	0	41	dthiessen	Betty			\N	2016-12-08	2016-12-29	11160	80	\N	nreimer	bmiranda		\N	\N	dthiessen	2016-12-08 09:47:46.63	7	11160	0	1
51859	1040	2016-12-08	16560	0	0	35	dthiessen	Kenton			\N	2016-12-08	2016-12-29	13982	57	\N	admin	0		\N	\N	dthiessen	2016-12-08 10:21:18.552	1	13982	0	1
51863	1030	2016-12-12	6480	0	0	61	dthiessen	Kenroy			\N	2016-12-12	2017-01-02	3077	66	\N	kochao	agongora		\N	\N	dthiessen	2016-12-12 08:32:08.865	7	3077	0	1
51861	1031	2016-12-12	7020	0	0	58	dthiessen	Tim			\N	2016-12-12	2017-01-02	4762	80	\N	kochao	agongora		\N	\N	dthiessen	2016-12-12 08:07:27.24	7	4762	0	1
51860	1032	2016-12-12	3960	1440	0	54	dthiessen	Edward			\N	2016-12-12	2017-01-02	2495	51	\N	kochao	agongora		\N	\N	dthiessen	2016-12-12 07:33:16.224	7	2495	0	1
51862	1034	2016-12-12	7200	2520	0	49	dthiessen	Carlos			\N	2016-12-12	2017-01-02	4603	26	\N	kochao	agongora		\N	\N	dthiessen	2016-12-12 08:19:29.599	1	4603	0	1
51868	1038	2016-12-12	13320	0	0	45	dthiessen	Otto			\N	2016-12-12	2017-01-02	9878	76	\N	kochao	agongora		\N	\N	dthiessen	2016-12-12 10:22:38.74	7	9878	0	1
51864	1039	2016-12-12	10620	0	0	41	dthiessen	Eric			\N	2016-12-12	2017-01-02	7155	95	\N	agongora	kochao		\N	\N	dthiessen	2016-12-12 08:50:07.255	7	7155	0	1
51867	1041	2016-12-12	7380	2880	0	28	dthiessen	Jake			\N	2016-12-12	2017-01-02	5372	24	\N	kochao	agongora		\N	\N	dthiessen	2016-12-12 09:41:12.458	7	5372	0	1
51871	1030	2016-12-15	6840	0	0	62	dthiessen	Kenroy			\N	2016-12-15	2017-01-05	3401	27	\N	kochao	0		\N	\N	dthiessen	2016-12-15 08:55:33.521	7	3401	0	1
51870	1033	2016-12-15	10260	0	0	53	dthiessen	Paul			\N	2016-12-15	2017-01-05	7763	93	\N	kochao	agongora		\N	\N	dthiessen	2016-12-15 08:46:34.88	7	7763	0	1
51812	1033	2016-11-21	10440	2880	0	49	ereimer	Paul			\N	2016-11-21	2016-12-12	7938	313	\N	admin	0		\N	\N	ereimer	2016-11-21 09:07:51.355	7	7938	0	1
51815	1040	2016-11-21	16200	3960	0	32	ereimer	Kenton			\N	2016-11-21	2016-12-12	13256	90	\N	kochao	0		\N	\N	ereimer	2016-11-21 10:18:35.917	1	13256	0	1
51822	1032	2016-11-24	6120	0	0	52	ereimer	Edward			\N	2016-11-24	2016-12-15	4175	80	\N	nreimer	0		\N	\N	ereimer	2016-11-24 10:32:38.558	7	4175	0	1
51817	1033	2016-11-24	9540	0	0	50	ereimer	Elma			\N	2016-11-24	2016-12-15	7565	46	\N	bmiranda	cmanzanero		\N	\N	ereimer	2016-11-24 08:52:39.98	7	7565	0	1
51823	1038	2016-11-24	18180	0	0	43	ereimer	Nelson			\N	2016-11-24	2016-12-15	14268	100	\N	zalegria	cmanzanero		\N	\N	ereimer	2016-11-24 10:38:16.996	7	14268	0	1
51894	1038	2016-12-22	17460	0	0	47	ereimer	Charlie			\N	2016-12-22	2017-01-12	13085	119	\N	nreimer	bmiranda		\N	\N	ereimer	2016-12-22 10:42:41.628	7	13085	0	1
51830	1032	2016-11-28	5760	0	0	52	ereimer	Edward			\N	2016-11-28	2016-12-19	3716	121	\N	bmiranda	cmartinez		\N	\N	ereimer	2016-11-28 10:12:47.808	7	3716	0	1
51825	1039	2016-11-28	14400	0	0	39	ereimer	Eric			\N	2016-11-28	2016-12-19	10411	88	\N	bmiranda	cmanzanero		\N	\N	ereimer	2016-11-28 08:19:27.308	7	10411	0	1
51837	1031	2016-12-01	7560	0	0	57	dthiessen	Abram			\N	2016-12-01	2016-12-22	5333	98	\N	kochao	aquinonez		\N	\N	ereimer	2016-12-01 09:03:14.871	7	5333	0	1
51836	1034	2016-12-01	7560	0	0	48	dthiessen	Carlos			\N	2016-12-01	2016-12-22	5452	73	\N	admin	dmenendez		\N	\N	ereimer	2016-12-01 08:43:46.089	1	5452	0	1
51841	1041	2016-12-01	1260	0	0	27	dthiessen	Jake			\N	2016-12-01	2016-12-22	612	6	\N	jquewell	kochao		\N	\N	dthiessen	2016-12-01 10:38:51.167	7	612	0	1
51846	1033	2016-12-05	8100	0	0	51	dthiessen	Paul			\N	2016-12-05	2016-12-26	5861	123	\N	wcabb	jquewell		\N	\N	ereimer	2016-12-05 08:47:57.068	7	5861	0	1
51845	1030	2016-12-05	6840	0	0	60	dthiessen	Kenroy			\N	2016-12-05	2016-12-26	3256	110	\N	admin	agongora		\N	\N	ereimer	2016-12-05 08:41:48.818	7	3256	0	1
51858	1031	2016-12-08	9720	0	0	58	dthiessen	Tim			\N	2016-12-08	2016-12-29	6797	87	\N	jquewell	kochao		\N	\N	dthiessen	2016-12-08 10:01:25.458	7	6797	0	1
51851	1034	2016-12-08	9180	0	0	49	dthiessen	Carlos			\N	2016-12-08	2016-12-29	6272	61	\N	bmiranda	wcabb		\N	\N	dthiessen	2016-12-08 08:39:33.88	1	6272	0	1
51855	1041	2016-12-08	7200	0	0	28	dthiessen	Helena			\N	2016-12-08	2016-12-29	4824	31	\N	admin	0		\N	\N	dthiessen	2016-12-08 09:37:56.365	7	4824	0	1
51883	1030	2016-12-19	2700	0	0	62	ereimer	Joe			\N	2016-12-19	2017-01-09	1217	25	\N	jquewell	0		\N	\N	ereimer	2016-12-19 09:09:45.366	7	1217	0	1
51873	1039	2016-12-15	14940	0	0	42	dthiessen	Betty			\N	2016-12-15	2017-01-05	11837	18	\N	jquewell	0		\N	\N	dthiessen	2016-12-15 09:24:50.568	7	11837	0	1
51875	1040	2016-12-15	16380	0	0	36	dthiessen	Kenton			\N	2016-12-15	2017-01-05	14064	76	\N	jquewell	0		\N	\N	dthiessen	2016-12-15 09:42:27.724	1	14064	0	1
51879	1031	2016-12-19	7200	0	0	59	ereimer	Tim			\N	2016-12-19	2017-01-09	4926	83	\N	jquewell	0		\N	\N	ereimer	2016-12-19 08:10:22.131	7	4926	0	1
51878	1032	2016-12-19	4320	0	0	55	ereimer	Edward			\N	2016-12-19	2017-01-09	2802	53	\N	jquewell	0		\N	\N	ereimer	2016-12-19 07:39:00.303	7	2802	0	1
51882	1033	2016-12-19	7740	0	0	53	ereimer	Paul			\N	2016-12-19	2017-01-09	5699	83	\N	jquewell	0		\N	\N	ereimer	2016-12-19 09:09:17.522	7	5699	0	1
51885	1038	2016-12-19	13320	0	0	46	ereimer	Otto			\N	2016-12-19	2017-01-09	9977	102	\N	jquewell	0		\N	\N	ereimer	2016-12-19 09:33:33.006	7	9977	0	1
51880	1039	2016-12-19	11340	0	0	42	ereimer	Eric			\N	2016-12-19	2017-01-09	9003	55	\N	jquewell	0		\N	\N	ereimer	2016-12-19 08:51:43.288	7	9003	0	1
51886	1040	2016-12-19	12780	0	0	36	ereimer	Kenton			\N	2016-12-19	2017-01-09	11070	40	\N	jquewell	0		\N	\N	ereimer	2016-12-19 10:36:48.288	1	11070	0	1
51884	1041	2016-12-19	10800	0	0	29	ereimer	Galen			\N	2016-12-19	2017-01-09	9036	47	\N	jquewell	0		\N	\N	ereimer	2016-12-19 09:12:34.491	7	9036	0	1
51891	1031	2016-12-22	9180	0	0	60	ereimer	Tim			\N	2016-12-22	2017-01-12	6308	144	\N	jquewell	0		\N	\N	ereimer	2016-12-22 09:10:32.738	7	6308	0	1
51890	1032	2016-12-22	5400	0	0	56	ereimer	Edward			\N	2016-12-22	2017-01-12	3430	44	\N	jquewell	0		\N	\N	ereimer	2016-12-22 09:01:40.675	7	3430	0	1
51895	1034	2016-12-22	10080	0	0	54	ereimer	Carlos	fix 1033, 10260		\N	2016-12-22	2017-01-12	6832	110	\N	nreimer	bmiranda		\N	\N	ereimer	2016-12-22 10:45:53.675	7	6832	0	1
51889	1039	2016-12-22	14760	0	0	43	dthiessen	Abe			\N	2016-12-22	2017-01-12	11626	165	\N	jquewell	0		\N	\N	ereimer	2016-12-22 08:50:40.16	7	11626	0	1
51892	1041	2016-12-22	14760	0	0	30	dthiessen	Jake			\N	2016-12-22	2017-01-12	12861	48	\N	jquewell	0		\N	\N	dthiessen	2016-12-22 09:37:01.941	7	12861	0	1
51910	1041	2016-12-26	11700	0	0	30	ereimer	Jake			\N	2016-12-26	2017-01-16	10047	50	\N	jquewell	0		\N	\N	ereimer	2016-12-29 10:24:13.332	7	10047	0	1
51904	1033	2016-12-26	6660	0	0	54	ereimer	Paul			\N	2016-12-26	2017-01-16	5017	69	\N	jquewell	0		\N	\N	ereimer	2016-12-29 09:58:07.113	7	5017	0	1
51903	1032	2016-12-26	4320	0	0	56	ereimer	Edward			\N	2016-12-26	2017-01-16	2704	81	\N	jguenther	0		\N	\N	ereimer	2016-12-29 09:57:51.207	7	2704	0	1
51905	1034	2016-12-26	7740	0	0	51	ereimer	Carlos			\N	2016-12-26	2017-01-16	4828	188	\N	jquewell	0		\N	\N	ereimer	2016-12-29 10:21:56.91	1	4828	0	1
51906	1038	2016-12-26	13500	0	0	47	ereimer	Otto			\N	2016-12-26	2017-01-16	9860	84	\N	jquewell	0		\N	\N	ereimer	2016-12-29 10:22:14.191	7	9860	0	1
51907	1039	2016-12-26	10800	0	0	47	ereimer	Abe	\N		\N	2016-12-26	2017-01-16	8637	99	\N	jquewell	0		\N	\N	ereimer	2016-12-29 10:22:28.644	7	8637	0	1
51897	1031	2016-12-29	9000	0	0	61	ereimer	Tim			\N	2016-12-29	2017-01-19	5858	67	\N	jquewell	0		\N	\N	ereimer	2016-12-29 08:21:31.988	7	5858	0	1
51900	1032	2016-12-29	5040	0	0	57	ereimer	Edward			\N	2016-12-29	2017-01-19	3130	60	\N	jquewell	0		\N	\N	ereimer	2016-12-29 09:39:12.878	7	3130	0	1
51899	1034	2016-12-29	9720	0	0	52	ereimer	Carlos			\N	2016-12-29	2017-01-19	6753	76	\N	jquewell	0		\N	\N	ereimer	2016-12-29 09:17:14.175	1	6753	0	1
51901	1038	2016-12-29	17100	0	0	48	ereimer	Otto			\N	2016-12-29	2017-01-19	12363	100	\N	jquewell	0		\N	\N	ereimer	2016-12-29 09:55:03.707	7	12363	0	1
51898	1039	2016-12-29	14040	0	0	44	ereimer	Abe			\N	2016-12-29	2017-01-19	11446	68	\N	jquewell	0		\N	\N	ereimer	2016-12-29 08:34:28.613	7	11446	0	1
51909	1041	2016-12-29	15300	0	0	31	ereimer	Jake			\N	2016-12-29	2017-01-19	13100	70	\N	jquewell	0		\N	\N	ereimer	2016-12-29 10:23:46.082	7	13100	0	1
51912	1031	2017-01-02	6480	0	0	61	ereimer	Tim			\N	2017-01-02	2017-01-23	4078	105	\N	jquewell	0		\N	\N	ereimer	2017-01-02 08:22:26.675	7	4078	0	1
51913	1032	2017-01-02	4320	0	0	57	ereimer	Edward			\N	2017-01-02	2017-01-23	2512	85	\N	jquewell	0		\N	\N	ereimer	2017-01-02 08:23:06.175	7	2512	0	1
51915	1034	2017-01-02	7380	0	0	52	ereimer	Charlos			\N	2017-01-02	2017-01-23	4753	100	\N	jquewell	0		\N	\N	ereimer	2017-01-02 08:23:40.91	1	4753	0	1
51917	1039	2017-01-02	10980	0	0	44	ereimer	Abe			\N	2017-01-02	2017-01-23	8452	165	\N	jquewell	0		\N	\N	ereimer	2017-01-02 08:25:43.832	7	8452	0	1
51916	1038	2017-01-02	12960	0	0	48	ereimer	Otto			\N	2017-01-02	2017-01-23	9119	80	\N	jquewell	0		\N	\N	ereimer	2017-01-02 08:25:23.097	7	9119	0	1
51919	1041	2017-01-02	11160	0	0	31	ereimer	Jake			\N	2017-01-02	2017-01-23	9768	71	\N	jquewell	0		\N	\N	ereimer	2017-01-02 08:26:14.722	7	9768	0	1
51920	1031	2017-01-05	8640	0	0	62	ereimer	Abram			\N	2017-01-05	2017-01-26	5492	157	\N	jquewell	0		\N	\N	ereimer	2017-01-05 08:01:06.503	7	5492	0	1
51921	1034	2017-01-05	9900	0	0	53	ereimer	Carlos			\N	2017-01-05	2017-01-26	6557	120	\N	jquewell	0		\N	\N	ereimer	2017-01-05 08:09:04.816	1	6557	0	1
51922	1041	2017-01-05	16200	0	0	32	ereimer	Jake			\N	2017-01-05	2017-01-26	14070	107	\N	jquewell	0		\N	\N	ereimer	2017-01-05 08:16:59.175	7	14070	0	1
51874	1041	2016-12-15	12960	0	0	29	dthiessen	Galen			\N	2016-12-15	2017-01-05	10265	30	\N	bmiranda	kochao		\N	\N	dthiessen	2016-12-15 09:27:26.099	7	10265	0	1
51866	1033	2016-12-12	7560	0	0	52	dthiessen	Elma			\N	2016-12-12	2017-01-02	5629	39	\N	kochao	agongora		\N	\N	dthiessen	2016-12-12 09:31:33.787	7	5629	0	1
51865	1040	2016-12-12	12780	0	0	35	dthiessen	Worker			\N	2016-12-12	2017-01-02	10646	60	\N	agongora	kochao		\N	\N	dthiessen	2016-12-12 09:29:28.396	1	10646	0	1
51869	1031	2016-12-15	9720	0	0	59	dthiessen	Tim			\N	2016-12-15	2017-01-05	6887	57	\N	kochao	agongora		\N	\N	dthiessen	2016-12-15 07:44:08.583	7	6887	0	1
51877	1032	2016-12-15	6120	0	0	55	dthiessen	Edward			\N	2016-12-15	2017-01-05	4039	53	\N	kochao	cmartinez		\N	\N	dthiessen	2016-12-15 14:21:47.802	7	4039	0	1
51876	1038	2016-12-15	17640	0	0	46	dthiessen	Otto			\N	2016-12-15	2017-01-05	13433	86	\N	kochao	jquewell		\N	\N	dthiessen	2016-12-15 10:24:56.474	7	13433	0	1
51872	1034	2016-12-15	9900	0	0	50	dthiessen	Juan			\N	2016-12-15	2017-01-05	6710	2	\N	jquewell	0		\N	\N	dthiessen	2016-12-15 09:14:06.193	1	6710	0	1
51881	1034	2016-12-19	7560	0	0	50	ereimer	Charlos			\N	2016-12-19	2017-01-09	5098	70	\N	jquewell	0		\N	\N	ereimer	2016-12-19 08:59:12.381	1	5098	0	1
51942	1042	2017-01-12	360	0	0	28	ereimer	Allen			\N	2017-01-12	2017-02-02	306	0	\N	jquewell	0		\N	\N	ereimer	2017-01-12 09:50:09.785	7	306	0	1
51887	1030	2016-12-22	540	0	0	63	ereimer	Joe			\N	2016-12-22	2017-01-12	246	4	\N	jquewell	0		\N	\N	ereimer	2016-12-22 08:02:29.3	7	246	0	1
51888	1033	2016-12-22	10080	0	0	54	ereimer	Elma			\N	2016-12-22	2017-01-12	7565	160	\N	jquewell	0		\N	\N	ereimer	2016-12-22 08:19:28.363	7	7565	0	1
51893	1040	2016-12-22	16380	0	0	37	ereimer	Kenton			\N	2016-12-22	2017-01-12	14042	172	\N	jquewell	0		\N	\N	ereimer	2016-12-22 10:42:15.582	1	14042	0	1
51902	1031	2016-12-26	6840	0	0	60	ereimer	Tim			\N	2016-12-26	2017-01-16	4594	113	\N	jquewell	0		\N	\N	ereimer	2016-12-29 09:57:32.3	7	4594	0	1
51908	1040	2016-12-26	12420	0	0	37	ereimer	Kenton			\N	2016-12-26	2017-01-16	10646	95	\N	jquewell	0		\N	\N	ereimer	2016-12-29 10:22:47.972	1	10646	0	1
51911	1040	2016-12-29	16200	0	0	38	ereimer	Kenton			\N	2016-12-29	2017-01-19	13893	120	\N	jquewell	0		\N	\N	ereimer	2016-12-29 10:36:30.66	1	13893	0	1
51896	1033	2016-12-29	10260	0	0	55	dthiessen	Paul			\N	2016-12-29	2017-01-19	7319	138	\N	jquewell	0		\N	\N	ereimer	2016-12-29 08:05:03.16	7	7319	0	1
51966	1039	2017-01-23	14940	0	0	47	ereimer	Betty			\N	2017-01-23	2017-02-13	11480	130	\N	agongora	0		\N	\N	ereimer	2017-01-23 08:49:15.944	7	11480	0	1
51924	1033	2017-01-05	9180	0	0	56	ereimer	Elma			\N	2017-01-05	2017-01-26	6500	99	\N	jquewell	0		\N	\N	ereimer	2017-01-05 08:50:36.285	7	6500	0	1
51929	1031	2017-01-09	8460	0	0	62	ereimer	TIm			\N	2017-01-09	2017-01-30	5027	78	\N	jquewell	0		\N	\N	ereimer	2017-01-09 08:42:19.582	7	5027	0	1
51926	1040	2017-01-05	16200	0	0	39	ereimer	Kenton			\N	2017-01-05	2017-01-26	13871	112	\N	jquewell	0		\N	\N	ereimer	2017-01-05 09:41:51.16	1	13871	0	1
51933	1032	2017-01-09	5400	0	0	58	ereimer	Edward			\N	2017-01-09	2017-01-30	2951	62	\N	jquewell	0		\N	\N	ereimer	2017-01-09 09:45:44.691	7	2951	0	1
51932	1034	2017-01-09	9000	0	0	53	ereimer	Carlos			\N	2017-01-09	2017-01-30	5826	115	\N	jquewell	0		\N	\N	ereimer	2017-01-09 09:26:06.863	1	5826	0	1
51935	1038	2017-01-09	16920	0	0	49	ereimer	Otto			\N	2017-01-09	2017-01-30	11760	209	\N	jquewell	0		\N	\N	ereimer	2017-01-09 10:53:51.816	7	11760	0	1
51934	1040	2017-01-09	16020	0	0	39	ereimer	Kenton			\N	2017-01-09	2017-01-30	13915	81	\N	jquewell	0		\N	\N	ereimer	2017-01-09 10:10:26.082	1	13915	0	1
51930	1041	2017-01-09	15840	0	0	32	ereimer	Galen			\N	2017-01-09	2017-01-30	13879	118	\N	jquewell	0		\N	\N	ereimer	2017-01-09 09:11:49.597	7	13879	0	1
51938	1031	2017-01-12	5940	0	0	63	ereimer	Abram			\N	2017-01-12	2017-02-02	3503	120	\N	jquewell	0		\N	\N	ereimer	2017-01-12 08:49:10.019	7	3503	0	1
51940	1032	2017-01-12	3960	0	0	59	ereimer	Edward			\N	2017-01-12	2017-02-02	2022	74	\N	jquewell	0		\N	\N	ereimer	2017-01-12 08:57:09.55	7	2022	0	1
51941	1034	2017-01-12	7200	0	0	54	ereimer	Carlos			\N	2017-01-12	2017-02-02	4833	125	\N	jquewell	0		\N	\N	ereimer	2017-01-12 09:15:53.503	1	4833	0	1
51943	1038	2017-01-12	12240	0	0	50	ereimer	Charlie			\N	2017-01-12	2017-02-02	8400	95	\N	jquewell	0		\N	\N	ereimer	2017-01-12 10:08:13.332	7	8400	0	1
51939	1039	2017-01-12	11160	0	0	46	ereimer	Abe			\N	2017-01-12	2017-02-02	8716	147	\N	jquewell	0		\N	\N	ereimer	2017-01-12 08:55:27.3	7	8716	0	1
51937	1041	2017-01-12	11700	0	0	33	ereimer	Jake	fix 12060		\N	2017-01-12	2017-02-02	10467	48	\N	jquewell	0		\N	\N	ereimer	2017-01-12 08:38:43.285	7	10467	0	1
51947	1031	2017-01-16	7740	0	0	63	ereimer	Tim			\N	2017-01-16	2017-02-06	4270	248	\N	agongora	0		\N	\N	ereimer	2017-01-16 09:07:36.944	7	4270	0	1
51946	1033	2017-01-16	8640	0	0	57	ereimer	Paul			\N	2017-01-16	2017-02-06	5403	298	\N	agongora	0		\N	\N	ereimer	2017-01-16 08:29:34.756	7	5403	0	1
51952	1034	2017-01-16	9360	0	0	54	ereimer	Carlos			\N	2017-01-16	2017-02-06	6392	215	\N	agongora	0		\N	\N	ereimer	2017-01-16 10:00:18.975	1	6392	0	1
51950	1038	2017-01-16	16560	0	0	50	dthiessen	Charlie			\N	2017-01-16	2017-02-06	11015	218	\N	agongora	0		\N	\N	ereimer	2017-01-16 09:31:39.819	7	11015	0	1
51951	1040	2017-01-16	15840	0	0	40	ereimer	Kenton			\N	2017-01-16	2017-02-06	13164	475	\N	agongora	0		\N	\N	ereimer	2017-01-16 09:50:00.756	1	13164	0	1
51948	1041	2017-01-16	16200	0	0	33	ereimer	Jake			\N	2017-01-16	2017-02-06	14033	350	\N	agongora	0		\N	\N	ereimer	2017-01-16 09:24:38.819	7	14033	0	1
51953	1042	2017-01-16	1080	0	0	28	ereimer	Allen			\N	2017-01-16	2017-02-06	943	21	\N	agongora	0		\N	\N	ereimer	2017-01-16 10:47:44.303	7	943	0	1
51963	1032	2017-01-19	3600	0	0	60	ereimer	Edward			\N	2017-01-19	2017-02-09	1834	50	\N	jquewell	0		\N	\N	ereimer	2017-01-19 10:25:22.225	7	1834	0	1
51956	1033	2017-01-19	6660	0	0	58	ereimer	Elma			\N	2017-01-19	2017-02-09	4091	216	\N	jquewell	0		\N	\N	ereimer	2017-01-19 08:18:15.428	7	4091	0	1
51961	1034	2017-01-19	6840	0	0	55	ereimer	Carlos			\N	2017-01-19	2017-02-09	4789	54	\N	jquewell	0		\N	\N	ereimer	2017-01-19 09:30:54.006	1	4789	0	1
51960	1040	2017-01-19	12060	0	0	41	ereimer	Kenton			\N	2017-01-19	2017-02-09	10152	255	\N	jquewell	0		\N	\N	ereimer	2017-01-19 09:24:30.709	1	10152	0	1
51954	1041	2017-01-19	11880	0	0	34	ereimer	Galen			\N	2017-01-19	2017-02-09	10941	33	\N	jquewell	0		\N	\N	ereimer	2017-01-19 07:55:07.881	7	10941	0	1
51959	1042	2017-01-19	2160	0	0	29	ereimer	Allen			\N	2017-01-19	2017-02-09	1840	4	\N	jquewell	0		\N	\N	ereimer	2017-01-19 09:11:27.1	7	1840	0	1
51957	1039	2017-01-19	3960	0	0	47	ereimer	Abe			\N	2017-01-19	2017-02-09	3317	29	\N	jquewell	0		\N	\N	ereimer	2017-01-19 09:09:46.163	7	3317	0	1
51967	1031	2017-01-23	7200	0	0	64	ereimer	Abram			\N	2017-01-23	2017-02-13	3812	69	\N	agongora	0		\N	\N	ereimer	2017-01-23 09:21:09.35	7	3812	0	1
51968	1032	2017-01-23	5040	0	0	60	ereimer	Edward			\N	2017-01-23	2017-02-13	2344	60	\N	agongora	0		\N	\N	ereimer	2017-01-23 09:34:15.694	7	2344	0	1
51969	1034	2017-01-23	9180	0	0	55	ereimer	Carlos			\N	2017-01-23	2017-02-13	6308	167	\N	agongora	0		\N	\N	ereimer	2017-01-23 09:50:54.459	1	6308	0	1
51970	1038	2017-01-23	16560	0	0	51	ereimer	Otto	fix 16200		\N	2017-01-23	2017-02-13	11690	209	\N	agongora	0		\N	\N	ereimer	2017-01-23 10:31:14.913	7	11690	0	1
51964	1041	2017-01-23	15660	0	0	34	ereimer	Galen			\N	2017-01-23	2017-02-13	13652	60	\N	agongora	0		\N	\N	ereimer	2017-01-23 08:10:28.741	7	13652	0	1
51972	1042	2017-01-23	4320	0	0	29	ereimer	Allen 			\N	2017-01-23	2017-02-13	3804	37	\N	agongora	0		\N	\N	ereimer	2017-01-23 10:41:23.881	7	3804	0	1
51977	1039	2017-01-26	10980	0	0	48	ealergria	Abe			\N	2017-01-26	2017-02-16	8546	54	\N	jquewell	0		\N	\N	ereimer	2017-01-26 09:14:29.262	7	8546	0	1
51976	1033	2017-01-26	6480	0	0	59	ereimer	Paul			\N	2017-01-26	2017-02-16	4117	125	\N	jquewell	0		\N	\N	ereimer	2017-01-26 08:59:22.075	7	4117	0	1
51973	1031	2017-01-26	5220	0	0	65	ereimer	Tim			\N	2017-01-26	2017-02-16	2311	96	\N	jquewell	0		\N	\N	ereimer	2017-01-26 07:55:19.575	7	2311	0	1
51974	1041	2017-01-26	11880	0	0	35	ereimer	Jake			\N	2017-01-26	2017-02-16	10571	41	\N	jquewell	0		\N	\N	ereimer	2017-01-26 08:14:11.356	7	10571	0	1
51914	1033	2017-01-02	7380	0	0	55	ereimer	Paul			\N	2017-01-02	2017-01-23	4825	264	\N	jquewell	0		\N	\N	ereimer	2017-01-02 08:23:22.191	7	4825	0	1
51918	1040	2017-01-02	12420	0	0	38	ereimer	Kenton			\N	2017-01-02	2017-01-23	10352	190	\N	jquewell	0		\N	\N	ereimer	2017-01-02 08:25:58.035	1	10352	0	1
51925	1032	2017-01-05	5040	0	0	58	ereimer	Edward			\N	2017-01-05	2017-01-26	2874	63	\N	jquewell	0		\N	\N	ereimer	2017-01-05 09:05:13.003	7	2874	0	1
51927	1038	2017-01-05	16740	0	0	49	dthiessen	Otto			\N	2017-01-05	2017-01-26	11898	127	\N	jquewell	0		\N	\N	ereimer	2017-01-05 10:09:36.832	7	11898	0	1
51923	1039	2017-01-05	14220	0	0	45	ereimer	Abe			\N	2017-01-05	2017-01-26	11507	85	\N	jquewell	0		\N	\N	ereimer	2017-01-05 08:31:39.707	7	11507	0	1
51931	1033	2017-01-09	9180	0	0	56	ereimer	Candace			\N	2017-01-09	2017-01-30	6430	219	\N	jquewell	0		\N	\N	ereimer	2017-01-09 09:19:52.55	7	6430	0	1
51928	1039	2017-01-09	14760	0	0	45	ereimer	Eric			\N	2017-01-09	2017-01-30	11838	82	\N	jquewell	0		\N	\N	ereimer	2017-01-09 08:18:26.832	7	11838	0	1
51944	1033	2017-01-12	6840	0	0	57	ereimer	Lavern			\N	2017-01-12	2017-02-02	4470	284	\N	jquewell	0		\N	\N	ereimer	2017-01-12 10:33:37.097	7	4470	0	1
51936	1040	2017-01-12	12060	0	0	40	ereimer	Kenton			\N	2017-01-12	2017-02-02	10414	114	\N	jquewell	0		\N	\N	ereimer	2017-01-12 08:24:08.972	1	10414	0	1
51988	1034	2017-01-30	8640	0	0	56	ereimer	Carlos			\N	2017-01-30	2017-02-20	5928	60	\N	jquewell	0		\N	\N	ereimer	2017-01-30 09:48:38.528	1	5928	0	1
52005	1043	2017-02-06	5220	0	0	26	dthiessen	Richard			\N	2017-02-06	2017-02-27	3735	15	\N	jquewell	0		\N	\N	ereimer	2017-02-06 08:41:07.689	7	3735	0	1
51985	1043	2017-01-30	720	0	0	25	ereimer	Richard			\N	2017-01-30	2017-02-20	575	11	\N	jquewell	0		\N	\N	ereimer	2017-01-30 08:53:20.247	7	575	0	1
52001	1031	2017-02-02	3240	0	0	66	ereimer	Tim			\N	2017-02-02	2017-02-23	1711	42	\N	jquewell	0		\N	\N	ereimer	2017-02-02 09:51:57.403	7	1711	0	1
51949	1032	2017-01-16	5040	0	0	59	ereimer	Jake			\N	2017-01-16	2017-02-06	2583	130	\N	agongora	0		\N	\N	ereimer	2017-01-16 09:26:57.006	7	2583	0	1
51945	1039	2017-01-16	14760	0	0	46	ereimer	Betty			\N	2017-01-16	2017-02-06	11424	213	\N	agongora	0		\N	\N	ereimer	2017-01-16 08:21:22.834	7	11424	0	1
51955	1031	2017-01-19	5400	0	0	64	ereimer	Tim			\N	2017-01-19	2017-02-09	2917	70	\N	jquewell	0		\N	\N	ereimer	2017-01-19 08:08:01.147	7	2917	0	1
51962	1038	2017-01-19	12060	0	0	51	ereimer	Otto			\N	2017-01-19	2017-02-09	8755	75	\N	jquewell	0		\N	\N	ereimer	2017-01-19 09:49:37.803	7	8755	0	1
51958	1039	2017-01-19	7200	0	0	47	ereimer	Abe			\N	2017-01-19	2017-02-09	5483	30	\N	jquewell	0		\N	\N	ereimer	2017-01-19 09:10:05.381	7	5483	0	1
51981	1038	2017-01-26	12240	0	0	52	ereimer	Otto			\N	2017-01-26	2017-02-16	9091	139	\N	jquewell	0		\N	\N	ereimer	2017-01-26 10:03:31.997	7	9091	0	1
51978	1042	2017-01-26	4860	0	0	30	ereimer	Allen			\N	2017-01-26	2017-02-16	3885	30	\N	jquewell	0		\N	\N	ereimer	2017-01-26 09:16:41.09	7	3885	0	1
51979	1040	2017-01-26	11700	0	0	42	ereimer	Kenton			\N	2017-01-26	2017-02-16	9829	159	\N	jquewell	0		\N	\N	ereimer	2017-01-26 09:39:40.997	1	9829	0	1
51986	1031	2017-01-30	6840	0	0	65	ereimer	Jerry			\N	2017-01-30	2017-02-20	3682	70	\N	jquewell	0		\N	\N	ereimer	2017-01-30 09:19:28.09	7	3682	0	1
51984	1033	2017-01-30	8460	0	0	59	ereimer	Paul	fix 9900		\N	2017-01-30	2017-02-20	5302	62	\N	jquewell	0		\N	\N	ereimer	2017-01-30 08:47:34.778	7	5302	0	1
51989	1038	2017-01-30	16560	0	0	52	ereimer	Otto			\N	2017-01-30	2017-02-20	12075	57	\N	jquewell	0		\N	\N	ereimer	2017-01-30 09:55:10.59	7	12075	0	1
51991	1040	2017-01-30	15300	0	0	42	ereimer	Kenton			\N	2017-01-30	2017-02-20	13401	68	\N	jquewell	0		\N	\N	ereimer	2017-01-30 13:08:56.418	1	13401	0	1
51982	1041	2017-01-30	15660	0	0	35	ereimer	Galen	fix 1/26/2017		\N	2017-01-30	2017-02-20	13866	40	\N	jquewell	0		\N	\N	ereimer	2017-01-30 08:05:21.293	7	13866	0	1
51999	1032	2017-02-02	3240	0	0	62	ereimer	Edward			\N	2017-02-02	2017-02-23	1503	11	\N	jquewell	0		\N	\N	ereimer	2017-02-02 09:09:23.465	7	1503	0	1
51994	1033	2017-02-02	5940	0	0	60	ereimer	Veranica			\N	2017-02-02	2017-02-23	3929	15	\N	jquewell	0		\N	\N	ereimer	2017-02-02 08:36:39.075	7	3929	0	1
52002	1038	2017-02-02	11880	0	0	53	ereimer	Otto			\N	2017-02-02	2017-02-23	9011	40	\N	jquewell	0		\N	\N	ereimer	2017-02-02 09:56:09.215	7	9011	0	1
51996	1039	2017-02-02	10800	0	0	49	ereimer	Abe			\N	2017-02-02	2017-02-23	8411	27	\N	jquewell	0		\N	\N	ereimer	2017-02-02 08:54:51.278	7	8411	0	1
52013	1054	2017-02-06	5760	720	0	23	dthiessen	JAKE			\N	2017-02-06	2017-02-27	1976	20	\N	jquewell	0		\N	\N	ereimer	2017-02-06 14:07:49.986	6	3896	1920	2
51995	1042	2017-02-02	7200	0	0	31	ereimer	Allen			\N	2017-02-02	2017-02-23	6181	30	\N	jquewell	0		\N	\N	ereimer	2017-02-02 08:49:03.418	7	6181	0	1
51998	1043	2017-02-02	1980	0	0	26	ereimer	Richard			\N	2017-02-02	2017-02-23	1581	5	\N	jquewell	0		\N	\N	ereimer	2017-02-02 09:03:54.543	7	1581	0	1
52000	1040	2017-02-02	11340	0	0	43	ereimer	Kenton			\N	2017-02-02	2017-02-23	9813	52	\N	jquewell	0		\N	\N	ereimer	2017-02-02 09:46:15.965	1	9813	0	1
52012	1032	2017-02-06	4680	0	0	62	ereimer	Edward			\N	2017-02-06	2017-02-27	2004	107	\N	jquewell	0		\N	\N	ereimer	2017-02-06 10:41:27.001	7	2004	0	1
52006	1033	2017-02-06	7560	0	0	60	dthiessen	Paul			\N	2017-02-06	2017-02-27	4609	110	\N	jquewell	0		\N	\N	ereimer	2017-02-06 08:50:00.564	7	4609	0	1
52009	1034	2017-02-06	8280	0	0	57	ereimer	Carlos			\N	2017-02-06	2017-02-27	5663	194	\N	jquewell	0		\N	\N	ereimer	2017-02-06 09:50:38.642	1	5663	0	1
52007	1039	2017-02-06	14940	0	0	49	ereimer	Betty			\N	2017-02-06	2017-02-27	11341	118	\N	jquewell	0		\N	\N	ereimer	2017-02-06 09:17:40.47	7	11341	0	1
52003	1040	2017-02-06	14940	0	0	43	dthiessen	Kenton			\N	2017-02-06	2017-02-27	12699	178	\N	jquewell	0		\N	\N	ereimer	2017-02-06 08:12:00.689	1	12699	0	1
52004	1041	2017-02-06	15300	0	0	36	dthiessen	Jake	fix 15120		\N	2017-02-06	2017-02-27	13873	80	\N	jquewell	0		\N	\N	ereimer	2017-02-06 08:18:46.705	7	13873	0	1
52015	1054	2017-02-09	6120	0	0	23	ereimer	Jake			\N	2017-02-09	2017-03-02	2122	50	\N	jquewell	0		\N	\N	ereimer	2017-02-09 08:08:10.845	6	4228	2106	2
52028	1054	2017-02-13	8280	0	0	24	ereimer	Jake			\N	2017-02-13	2017-03-06	3023	30	\N	jquewell	0		\N	\N	ereimer	2017-02-13 08:31:07.558	6	6055	3032	2
52020	1032	2017-02-09	3600	0	0	63	ereimer	Edward			\N	2017-02-09	2017-03-02	1700	36	\N	jquewell	0		\N	\N	ereimer	2017-02-09 09:11:15.876	7	1700	0	1
52016	1033	2017-02-09	5580	0	0	61	ereimer	Paul			\N	2017-02-09	2017-03-02	3512	76	\N	jquewell	0		\N	\N	ereimer	2017-02-09 08:14:42.08	7	3512	0	1
52022	1034	2017-02-09	6120	0	0	58	ereimer	Carlos			\N	2017-02-09	2017-03-02	4334	94	\N	jquewell	0		\N	\N	ereimer	2017-02-09 09:41:20.533	1	4334	0	1
52018	1039	2017-02-09	10440	0	0	50	dthiessen	Abe			\N	2017-02-09	2017-03-02	8212	44	\N	jquewell	0		\N	\N	ereimer	2017-02-09 08:51:03.798	7	8212	0	1
52021	1040	2017-02-09	11340	0	0	44	ereimer	Luis			\N	2017-02-09	2017-03-02	10156	107	\N	jquewell	0		\N	\N	ereimer	2017-02-09 09:33:52.595	1	10156	0	1
52014	1041	2017-02-09	11340	0	0	37	ereimer	Galen			\N	2017-02-09	2017-03-02	10198	86	\N	jquewell	0		\N	\N	ereimer	2017-02-09 07:48:53.017	7	10198	0	1
52019	1043	2017-02-09	7380	0	0	27	ereimer	Richard			\N	2017-02-09	2017-03-02	6168	22	\N	jquewell	0		\N	\N	ereimer	2017-02-09 08:56:47.033	7	6168	0	1
52025	1033	2017-02-13	5400	0	0	61	ereimer	Jose Perez			\N	2017-02-13	2017-03-06	3400	55	\N	jquewell	0		\N	\N	ereimer	2017-02-13 07:51:04.449	7	3400	0	1
52026	1040	2017-02-13	11520	3600	0	44	ereimer	Kenton			\N	2017-02-13	2017-03-06	9949	140	\N	jquewell	0		\N	\N	ereimer	2017-02-13 07:54:47.261	1	9949	0	1
52027	1041	2017-02-13	11520	3960	0	37	ereimer	Galen			\N	2017-02-13	2017-03-06	10273	25	\N	jquewell	0		\N	\N	ereimer	2017-02-13 08:18:00.98	7	10273	0	1
52031	1042	2017-02-13	8280	2520	0	37	ereimer	Allan	fix 1041 to 1042		\N	2017-02-13	2017-03-06	7240	11	\N	jquewell	0		\N	\N	ereimer	2017-02-13 08:52:56.371	7	7240	0	1
51965	1033	2017-01-23	8640	0	0	58	ereimer	Henry			\N	2017-01-23	2017-02-13	5485	124	\N	agongora	0		\N	\N	ereimer	2017-01-23 08:35:35.116	7	5485	0	1
51971	1040	2017-01-23	15660	0	0	41	ereimer	Kenton			\N	2017-01-23	2017-02-13	13495	97	\N	agongora	0		\N	\N	ereimer	2017-01-23 10:32:30.944	1	13495	0	1
52038	1054	2017-02-16	6840	0	0	24	ereimer	jake			\N	2017-02-16	2017-03-09	2614	50	\N	jquewell	0		\N	\N	ereimer	2017-02-16 08:28:01.777	6	5244	2630	2
51980	1034	2017-01-26	6660	0	0	56	ereimer	Carlos			\N	2017-01-26	2017-02-16	4690	113	\N	jquewell	0		\N	\N	ereimer	2017-01-26 09:44:51.231	1	4690	0	1
52041	1039	2017-02-16	10800	3420	0	51	ereimer	Abe			\N	2017-02-16	2017-03-09	8127	72	\N	jquewell	0		\N	\N	ereimer	2017-02-16 08:57:44.308	7	8127	0	1
52048	1039	2017-02-20	10440	6840	0	51	ereimer	Eric			\N	2017-02-20	2017-03-13	7606	93	\N	jquewell	0		\N	\N	ereimer	2017-02-20 08:11:04.167	7	7606	0	1
52010	1042	2017-02-06	10260	0	0	31	ereimer	Allen			\N	2017-02-06	2017-02-27	9486	19	\N	jquewell	0		\N	\N	ereimer	2017-02-06 09:57:57.642	7	9486	0	1
51990	1032	2017-01-30	4680	0	0	61	ereimer	Edwrad			\N	2017-01-30	2017-02-20	1928	110	\N	jquewell	0		\N	\N	ereimer	2017-01-30 10:06:39.575	7	1928	0	1
51987	1039	2017-01-30	14760	0	0	48	ereimer	Betty			\N	2017-01-30	2017-02-20	11292	25	\N	jquewell	0		\N	\N	ereimer	2017-01-30 09:37:32.418	7	11292	0	1
51983	1042	2017-01-30	7920	0	0	30	ereimer	Peter	fix 1/26/2017		\N	2017-01-30	2017-02-20	6816	4	\N	jquewell	0		\N	\N	ereimer	2017-01-30 08:21:21.59	7	6816	0	1
51997	1034	2017-02-02	6120	0	0	57	ereimer	Carlos			\N	2017-02-02	2017-02-23	4248	24	\N	jquewell	0		\N	\N	ereimer	2017-02-02 09:00:14.293	1	4248	0	1
51992	1041	2017-02-02	11700	0	0	36	ereimer	Galen			\N	2017-02-02	2017-02-23	10617	10	\N	jquewell	0		\N	\N	ereimer	2017-02-02 08:17:21.465	7	10617	0	1
52075	1042	2017-02-27	8280	7560	0	34	ereimer	Elizabeth			\N	2017-02-27	2017-03-20	7141	12	\N	jquewell	0		\N	\N	ereimer	2017-02-27 09:29:18.574	7	7141	0	1
51975	1032	2017-01-26	3600	0	0	61	ereimer	Edward			\N	2017-01-26	2017-02-16	1937	25	\N	jquewell	0		\N	\N	ereimer	2017-01-26 08:39:34.668	7	1937	0	1
52008	1031	2017-02-06	4140	0	0	66	ereimer	Abram			\N	2017-02-06	2017-02-27	2240	60	\N	jquewell	0		\N	\N	ereimer	2017-02-06 09:23:01.689	7	2240	0	1
52011	1038	2017-02-06	16200	0	0	53	ereimer	Charlie			\N	2017-02-06	2017-02-27	11888	221	\N	jquewell	0		\N	\N	ereimer	2017-02-06 10:17:55.501	7	11888	0	1
52017	1031	2017-02-09	1980	0	0	67	dthiessen	Timmy			\N	2017-02-09	2017-03-02	1061	26	\N	jquewell	0		\N	\N	ereimer	2017-02-09 08:23:43.736	7	1061	0	1
52033	1032	2017-02-13	3240	1080	0	63	ereimer	Edward			\N	2017-02-13	2017-03-06	1432	14	\N	jquewell	0		\N	\N	ereimer	2017-02-13 09:00:49.542	7	1432	0	1
52035	1034	2017-02-13	6120	2880	0	58	ereimer	Carlos			\N	2017-02-13	2017-03-06	4355	32	\N	jquewell	0		\N	\N	ereimer	2017-02-13 09:36:37.667	1	4355	0	1
52034	1038	2017-02-13	11880	3960	0	54	ereimer	Charlie			\N	2017-02-13	2017-03-06	8364	151	\N	jquewell	0		\N	\N	ereimer	2017-02-13 09:10:07.183	7	8364	0	1
52039	1031	2017-02-16	900	0	0	68	ereimer	Tim			\N	2017-02-16	2017-03-09	479	12	\N	jquewell	0		\N	\N	ereimer	2017-02-16 08:30:32.855	7	479	0	1
52043	1032	2017-02-16	3240	1080	0	64	dthiessen	Jake			\N	2017-02-16	2017-03-09	1407	16	\N	jquewell	0		\N	\N	ereimer	2017-02-16 09:09:45.464	7	1407	0	1
52045	1034	2017-02-16	6480	0	0	59	ereimer	Rene			\N	2017-02-16	2017-03-09	4729	45	\N	jquewell	0		\N	\N	ereimer	2017-02-16 09:44:49.886	1	4729	0	1
52047	1038	2017-02-16	11880	3960	0	55	ereimer	Otto	fix 11700		\N	2017-02-16	2017-03-09	8783	55	\N	jquewell	0		\N	\N	ereimer	2017-02-16 09:51:25.652	7	8783	0	1
52037	1041	2017-02-16	11520	0	0	38	ereimer	jake			\N	2017-02-16	2017-03-09	10163	43	\N	jquewell	0		\N	\N	ereimer	2017-02-16 08:27:34.98	7	10163	0	1
52042	1042	2017-02-16	8100	0	0	33	ereimer	Elizabeth			\N	2017-02-16	2017-03-09	6870	32	\N	jquewell	0		\N	\N	ereimer	2017-02-16 09:06:53.136	7	6870	0	1
52044	1043	2017-02-16	12060	0	0	28	dthiessen	Richard			\N	2017-02-16	2017-03-09	10494	9	\N	jquewell	0		\N	\N	ereimer	2017-02-16 09:17:41.839	7	10494	0	1
52057	1032	2017-02-20	3240	2160	0	64	dthiessen	Jake			\N	2017-02-20	2017-03-13	1321	60	\N	jquewell	0		\N	\N	ereimer	2017-02-20 09:39:34.48	7	1321	0	1
52053	1033	2017-02-20	5760	0	0	62	ereimer	Veranica			\N	2017-02-20	2017-03-13	3403	94	\N	jquewell	0		\N	\N	ereimer	2017-02-20 08:49:30.761	7	3403	0	1
52052	1034	2017-02-20	6480	4140	0	59	ereimer	Carlos			\N	2017-02-20	2017-03-13	4427	95	\N	jquewell	0		\N	\N	ereimer	2017-02-20 08:45:46.089	1	4427	0	1
52056	1040	2017-02-20	11160	7560	0	45	ereimer	Charlie			\N	2017-02-20	2017-03-13	9455	421	\N	jquewell	0		\N	\N	ereimer	2017-02-20 09:11:17.183	1	9455	0	1
52050	1041	2017-02-20	11520	7200	0	38	dthiessen	Jake			\N	2017-02-20	2017-03-13	10266	118	\N	jquewell	0		\N	\N	ereimer	2017-02-20 08:40:55.449	7	10266	0	1
52055	1042	2017-02-20	8460	5040	0	33	ereimer	Allen			\N	2017-02-20	2017-03-13	7267	54	\N	jquewell	0		\N	\N	ereimer	2017-02-20 09:00:19.292	7	7267	0	1
52058	1054	2017-02-23	7200	0	0	25	ereimer	Jake			\N	2017-02-23	2017-03-16	2756	85	\N	jquewell	0		\N	\N	ereimer	2017-02-23 08:01:53.886	6	5341	2585	2
52067	1032	2017-02-23	3240	0	0	65	dthiessen	Edward			\N	2017-02-23	2017-03-16	1282	33	\N	jquewell	0		\N	\N	ereimer	2017-02-23 10:03:59.621	7	1282	0	1
52061	1033	2017-02-23	5040	0	0	63	ereimer	Veranica			\N	2017-02-23	2017-03-16	3059	44	\N	jquewell	0		\N	\N	ereimer	2017-02-23 08:42:11.761	7	3059	0	1
52062	1038	2017-02-23	11520	7560	0	56	ereimer	Carlie			\N	2017-02-23	2017-03-16	8106	60	\N	jquewell	0		\N	\N	ereimer	2017-02-23 09:00:30.261	7	8106	0	1
52060	1039	2017-02-23	10080	7020	0	52	ereimer	Abe			\N	2017-02-23	2017-03-16	7469	42	\N	jquewell	0		\N	\N	ereimer	2017-02-23 08:35:01.667	7	7469	0	1
52063	1040	2017-02-23	11340	7380	0	46	dthiessen	Charlie			\N	2017-02-23	2017-03-16	9762	60	\N	jquewell	0		\N	\N	ereimer	2017-02-23 09:27:05.746	1	9762	0	1
52065	1042	2017-02-23	7920	5220	0	34	dthiessen	Alan			\N	2017-02-23	2017-03-16	6989	45	\N	jquewell	0		\N	\N	ereimer	2017-02-23 09:47:53.058	7	6989	0	1
52064	1043	2017-02-23	14400	0	0	29	dthiessen	Richard			\N	2017-02-23	2017-03-16	12905	78	\N	jquewell	0		\N	\N	ereimer	2017-02-23 09:33:28.98	7	12905	0	1
52069	1054	2017-02-27	9000	0	0	26	ereimer	Jake			\N	2017-02-27	2017-03-20	3447	100	\N	jquewell	0		\N	\N	ereimer	2017-02-27 08:11:20.167	6	6929	3482	2
52073	1034	2017-02-27	6480	5400	0	60	ereimer	Carlos			\N	2017-02-27	2017-03-20	4231	111	\N	jquewell	0		\N	\N	ereimer	2017-02-27 09:08:08.808	1	4231	0	1
52074	1038	2017-02-27	9900	2160	0	56	ereimer	Annie			\N	2017-02-27	2017-03-20	6828	70	\N	jquewell	0		\N	\N	ereimer	2017-02-27 09:20:23.105	7	6828	0	1
52070	1039	2017-02-27	10440	10080	0	52	ereimer	Eric			\N	2017-02-27	2017-03-20	7696	22	\N	jquewell	0		\N	\N	ereimer	2017-02-27 08:17:20.292	7	7696	0	1
52068	1041	2017-02-27	11160	11160	0	46	ereimer	Jake	fix 1040		\N	2017-02-27	2017-03-20	9992	31	\N	jquewell	0		\N	\N	ereimer	2017-02-27 08:10:16.964	1	9992	0	1
52076	1043	2017-02-27	14760	14760	0	29	ereimer	Vange			\N	2017-02-27	2017-03-20	13467	22	\N	jquewell	0		\N	\N	ereimer	2017-02-27 09:38:39.98	7	13467	0	1
52085	1034	2017-03-02	7200	4320	0	61	ereimer	Carlos			\N	2017-03-02	2017-03-23	5063	70	\N	jquewell	0		\N	\N	ereimer	2017-03-02 09:51:55.714	1	5063	0	1
52078	1038	2017-03-02	10800	12600	0	57	dthiessen	Richard			\N	2017-03-02	2017-03-23	7838	52	\N	jquewell	0		\N	\N	ereimer	2017-03-02 08:40:25.371	7	7838	0	1
52077	1039	2017-03-02	10800	9540	0	53	dthiessen	Eric			\N	2017-03-02	2017-03-23	8097	35	\N	jquewell	0		\N	\N	ereimer	2017-03-02 08:17:27.042	7	8097	0	1
52084	1041	2017-03-02	11880	0	0	40	edueck	Galen			\N	2017-03-02	2017-03-23	10641	40	\N	jquewell	0		\N	\N	ereimer	2017-03-02 09:38:24.964	7	10641	0	1
52083	1042	2017-03-02	9000	6480	0	35	ereimer	Allen			\N	2017-03-02	2017-03-23	7925	49	\N	jquewell	0		\N	\N	ereimer	2017-03-02 09:24:33.73	7	7925	0	1
52086	1043	2017-03-02	16200	14040	0	30	ereimer	Vange			\N	2017-03-02	2017-03-23	14668	25	\N	jquewell	0		\N	\N	ereimer	2017-03-02 10:03:55.105	7	14668	0	1
52024	1038	2017-02-09	11880	0	0	54	ereimer	Otto			\N	2017-02-09	2017-03-02	8941	125	\N	jquewell	0		\N	\N	ereimer	2017-02-09 10:13:47.345	7	8941	0	1
52023	1042	2017-02-09	7740	0	0	32	ereimer	Elizabeth			\N	2017-02-09	2017-03-02	7025	23	\N	jquewell	0		\N	\N	ereimer	2017-02-09 09:51:39.205	7	7025	0	1
52096	1033	2017-03-09	3960	3060	0	65	dthiessen	Paul			\N	2017-03-09	2017-03-30	2146	36	\N	jquewell	0		\N	\N	dthiessen	2017-03-09 07:58:06.199	7	2146	0	1
52093	1043	2017-03-06	16560	15120	0	30	dthiessen	Vange	added home eggs		\N	2017-03-06	2017-03-27	14674	36	\N	jquewell	0		\N	\N	ereimer	2017-03-06 09:40:59.605	7	14674	0	1
52032	1031	2017-02-13	1620	360	0	67	ereimer	Tim			\N	2017-02-13	2017-03-06	874	22	\N	jquewell	0		\N	\N	ereimer	2017-02-13 08:57:56.542	7	874	0	1
52029	1039	2017-02-13	11160	0	0	50	ereimer	Eric			\N	2017-02-13	2017-03-06	8344	73	\N	jquewell	0		\N	\N	ereimer	2017-02-13 08:45:09.292	7	8344	0	1
52036	1043	2017-02-13	9540	0	0	27	ereimer	Richard	fix 9360		\N	2017-02-13	2017-03-06	8366	36	\N	jquewell	0		\N	\N	ereimer	2017-02-13 10:08:52.48	7	8366	0	1
52099	1042	2017-03-09	7560	9720	0	36	dthiessen	Allan			\N	2017-03-09	2017-03-30	6374	14	\N	jquewell	0		\N	\N	dthiessen	2017-03-09 08:46:00.605	7	6374	0	1
52040	1033	2017-02-16	5760	0	0	62	ereimer	Elma			\N	2017-02-16	2017-03-09	3722	29	\N	jquewell	0		\N	\N	ereimer	2017-02-16 08:48:48.324	7	3722	0	1
52046	1040	2017-02-16	11340	0	0	45	dthiessen	Charlie			\N	2017-02-16	2017-03-09	9828	60	\N	jquewell	0		\N	\N	ereimer	2017-02-16 09:48:53.683	1	9828	0	1
52110	1042	2017-03-13	9720	10620	0	36	admin	Allan			\N	2017-03-13	2017-04-03	8308	37	\N	cmartinez	0		\N	\N	dthiessen	2017-03-13 09:40:49.511	7	8308	0	1
52120	1043	2017-03-16	15840	20880	0	32	dthiessen	Richard			\N	2017-03-16	2017-04-06	14387	16	\N	cmartinez	0		\N	\N	dthiessen	2017-03-16 09:16:24.214	7	14387	0	1
52049	1038	2017-02-20	11700	7560	0	55	ereimer	Carlie	fix 14040		\N	2017-02-20	2017-03-13	8541	288	\N	jquewell	0		\N	\N	ereimer	2017-02-20 08:20:24.902	7	8541	0	1
52054	1043	2017-02-20	12960	9720	0	28	ereimer	Richard			\N	2017-02-20	2017-03-13	11404	83	\N	jquewell	0		\N	\N	ereimer	2017-02-20 08:54:38.246	7	11404	0	1
52066	1034	2017-02-23	6300	4320	0	60	dthiessen	Carlos			\N	2017-02-23	2017-03-16	4378	50	\N	jquewell	0		\N	\N	ereimer	2017-02-23 09:56:34.464	1	4378	0	1
52059	1041	2017-02-23	11160	7200	0	39	ereimer	Galen			\N	2017-02-23	2017-03-16	9904	83	\N	jquewell	0		\N	\N	ereimer	2017-02-23 08:10:25.933	7	9904	0	1
1054	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2017-03-20 14:04:12.746	\N	\N	\N	\N
51993	1054	2017-02-02	2880	0	0	22	ereimer	Galen			\N	2017-02-02	2017-02-23	831	16	\N	jquewell	0		\N	\N	ereimer	2017-02-02 08:17:47.153	6	1705	874	2
52091	1034	2017-03-06	5400	7920	0	61	dthiessen	Carlos			\N	2017-03-06	2017-03-27	3469	98	\N	jquewell	0		\N	\N	ereimer	2017-03-06 09:07:45.464	1	3469	0	1
52051	1054	2017-02-20	9720	0	0	25	dthiessen	Jake			\N	2017-02-20	2017-03-13	3718	50	\N	jquewell	0		\N	\N	ereimer	2017-02-20 08:42:19.886	6	7398	3680	2
52112	1034	2017-03-13	6840	7740	0	62	admin	Carlos			\N	2017-03-13	2017-04-03	3848	120	\N	cmartinez	0		\N	\N	dthiessen	2017-03-13 10:10:59.292	1	3848	0	1
52125	1038	2017-03-20	9360	19080	0	59	dthiessen	Julia			\N	2017-03-20	2017-04-10	5384	78	\N	cmartinez	0		\N	\N	dthiessen	2017-03-20 08:33:41.214	7	5384	0	1
52107	1054	2017-03-13	6120	0	0	28	dthiessen	Jake			\N	2017-03-13	2017-04-03	2517	30	\N	jquewell	0		\N	\N	dthiessen	2017-03-13 08:53:07.777	6	4916	2399	2
52124	1039	2017-03-20	10080	16560	0	55	dthiessen	Eric	added home eggs		\N	2017-03-20	2017-04-10	6986	55	\N	cmartinez	0		\N	\N	dthiessen	2017-03-20 08:21:18.027	7	6986	0	1
52071	1033	2017-02-27	5220	5580	0	63	ereimer	Veranica			\N	2017-02-27	2017-03-20	2850	78	\N	jquewell	0		\N	\N	ereimer	2017-02-27 08:37:59.605	7	2850	0	1
52133	1040	2017-03-23	10800	0	0	50	dthiessen	Kenton			\N	2017-03-23	2017-04-13	8922	95	\N	cmartinez	0		\N	\N	ereimer	2017-03-23 07:40:23.011	1	8922	0	1
52072	1040	2017-02-27	11340	10620	0	46	ereimer	Carlie			\N	2017-02-27	2017-03-20	9600	60	\N	jquewell	0		\N	\N	ereimer	2017-02-27 09:03:36.605	1	9600	0	1
52089	1054	2017-03-06	3600	5040	0	27	dthiessen	Jake			\N	2017-03-06	2017-03-27	1467	28	\N	jquewell	0		\N	\N	ereimer	2017-03-06 08:50:09.902	6	2909	1442	2
52095	1038	2017-03-06	16200	12960	0	57	dthiessen	Richard			\N	2017-03-06	2017-03-27	10947	214	\N	jquewell	0		\N	\N	ereimer	2017-03-06 10:34:28.949	7	10947	0	1
52088	1039	2017-03-06	11160	12060	0	53	ereimer	Eric			\N	2017-03-06	2017-03-27	7846	100	\N	jquewell	0		\N	\N	ereimer	2017-03-06 08:06:21.152	7	7846	0	1
52094	1040	2017-03-06	10800	12780	0	47	dthiessen	Kenton			\N	2017-03-06	2017-03-27	8823	96	\N	jquewell	0		\N	\N	ereimer	2017-03-06 10:27:52.98	1	8823	0	1
52092	1042	2017-03-06	7920	8820	0	35	dthiessen	Elisabeth	added home eggs		\N	2017-03-06	2017-03-27	6719	29	\N	jquewell	0		\N	\N	ereimer	2017-03-06 09:19:59.683	7	6719	0	1
52104	1038	2017-03-09	11160	13680	0	58	dthiessen	Julia			\N	2017-03-09	2017-03-30	7552	44	\N	jquewell	0		\N	\N	dthiessen	2017-03-09 09:37:32.667	7	7552	0	1
52100	1039	2017-03-09	10440	11880	0	54	dthiessen	Abe			\N	2017-03-09	2017-03-30	7601	84	\N	jquewell	0		\N	\N	dthiessen	2017-03-09 08:53:57.027	7	7601	0	1
52102	1040	2017-03-09	11160	12420	0	48	dthiessen	Luis			\N	2017-03-09	2017-03-30	9375	60	\N	jquewell	0		\N	\N	dthiessen	2017-03-09 09:27:17.402	1	9375	0	1
52101	1043	2017-03-09	15840	18000	0	31	dthiessen	Richard			\N	2017-03-09	2017-03-30	14098	65	\N	jquewell	0		\N	\N	dthiessen	2017-03-09 09:10:40.808	7	14098	0	1
52097	1054	2017-03-09	7200	5040	0	27	dthiessen	Jake			\N	2017-03-09	2017-03-30	3012	15	\N	jquewell	0		\N	\N	dthiessen	2017-03-09 08:32:28.433	6	5966	2954	2
52113	1038	2017-03-13	13680	14040	0	58	admin	Julia			\N	2017-03-13	2017-04-03	8602	128	\N	cmartinez	0		\N	\N	dthiessen	2017-03-13 10:25:49.292	7	8602	0	1
52105	1039	2017-03-13	11880	13320	0	54	dthiessen	Eric			\N	2017-03-13	2017-04-03	8427	56	\N	cmartinez	0		\N	\N	dthiessen	2017-03-13 08:21:43.074	7	8427	0	1
52106	1041	2017-03-13	12600	14580	0	41	dthiessen	Jake	added home eggs		\N	2017-03-13	2017-04-03	10142	26	\N	cmartinez	0		\N	\N	dthiessen	2017-03-13 08:52:41.277	7	10142	0	1
52109	1043	2017-03-13	18000	20880	0	31	admin	Richard			\N	2017-03-13	2017-04-03	16274	105	\N	cmartinez	0		\N	\N	dthiessen	2017-03-13 09:27:16.246	7	16274	0	1
52122	1034	2017-03-16	5760	7200	0	63	dthiessen	Melvin			\N	2017-03-16	2017-04-06	3397	48	\N	cmartinez	0		\N	\N	dthiessen	2017-03-16 09:41:50.746	1	3397	0	1
52121	1038	2017-03-16	10800	12240	0	59	dthiessen	Richard			\N	2017-03-16	2017-04-06	7423	73	\N	cmartinez	0		\N	\N	dthiessen	2017-03-16 09:20:30.042	7	7423	0	1
52116	1039	2017-03-16	10080	13320	0	55	dthiessen	Eric			\N	2017-03-16	2017-04-06	6985	35	\N	cmartinez	0		\N	\N	dthiessen	2017-03-16 08:26:15.792	7	6985	0	1
52117	1040	2017-03-16	10800	14220	0	49	dthiessen	Kenton			\N	2017-03-16	2017-04-06	9162	8	\N	cmartinez	0		\N	\N	dthiessen	2017-03-16 08:38:09.917	1	9162	0	1
52118	1042	2017-03-16	8280	11160	0	37	dthiessen	.	added home eggs		\N	2017-03-16	2017-04-06	7092	15	\N	cmartinez	0		\N	\N	dthiessen	2017-03-16 08:46:06.214	7	7092	0	1
52115	1054	2017-03-16	5040	11160	0	28	dthiessen	Helena			\N	2017-03-16	2017-04-06	2090	40	\N	cmartinez	0		\N	\N	dthiessen	2017-03-16 08:17:25.761	6	4090	2000	2
52128	1040	2017-03-20	10800	17640	0	49	dthiessen	Kenton			\N	2017-03-20	2017-04-10	8864	95	\N	cmartinez	0		\N	\N	dthiessen	2017-03-20 10:07:43.277	1	8864	0	1
52127	1042	2017-03-20	8280	12600	0	37	dthiessen	Elisabeth			\N	2017-03-20	2017-04-10	7067	28	\N	cmartinez	0		\N	\N	dthiessen	2017-03-20 09:06:27.214	7	7067	0	1
52130	1043	2017-03-20	15840	26280	0	32	admin	Richard			\N	2017-03-20	2017-04-10	14597	35	\N	cmartinez	0		\N	\N	dthiessen	2017-03-20 10:22:39.386	7	14597	0	1
52129	1044	2017-03-20	3420	0	0	26	admin	William	fix eggs brought		\N	2017-03-20	2017-04-10	2724	5	\N	cmartinez	0		\N	\N	dthiessen	2017-03-20 10:21:29.871	7	2724	0	1
52132	1044	2017-03-23	1800	3960	0	27	dthiessen	William			\N	2017-03-23	2017-04-13	1439	10	\N	cmartinez	0		\N	\N	ereimer	2017-03-23 07:33:11.839	7	1439	0	1
52135	1054	2017-03-23	10440	2520	0	30	ereimer	jake	fix date		\N	2017-03-23	2017-04-13	4526	20	\N	cmartinez	0		\N	\N	ereimer	2017-03-23 08:42:36.714	6	8855	4329	2
52111	1040	2017-03-13	12600	14400	0	48	admin	Kenton			\N	2017-03-13	2017-04-03	10538	101	\N	cmartinez	0		\N	\N	dthiessen	2017-03-13 09:44:08.73	1	10538	0	1
52137	1043	2017-03-23	15840	26280	0	33	ereimer	Vange			\N	2017-03-23	2017-04-13	13515	183	\N	cmartinez	0		\N	\N	ereimer	2017-03-23 09:39:10.121	7	13515	0	1
52080	1033	2017-03-02	5760	4140	0	64	dthiessen	Veronica			\N	2017-03-02	2017-03-23	3168	41	\N	jquewell	0		\N	\N	ereimer	2017-03-02 08:53:39.386	7	3168	0	1
52081	1040	2017-03-02	12240	9180	0	47	ereimer	Kenton			\N	2017-03-02	2017-03-23	10460	60	\N	jquewell	0		\N	\N	ereimer	2017-03-02 09:09:00.996	1	10460	0	1
52079	1054	2017-03-02	6480	0	0	26	dthiessen	Jakw			\N	2017-03-02	2017-03-23	2606	32	\N	jquewell	0		\N	\N	ereimer	2017-03-02 08:46:07.761	6	5054	2448	2
52146	1043	2017-03-27	21240	25920	0	33	dthiessen	Vange	added home eggs		\N	2017-03-27	2017-04-17	19267	85	\N	agongora	0		\N	\N	ereimer	2017-03-27 09:54:56.074	7	19267	0	1
52148	1041	2017-03-23	11160	0	0	43	dthiessen	Jake			\N	2017-03-23	2017-04-13	9561	89	\N	cmartinez	0		\N	\N	dthiessen	2017-03-27 14:49:30.746	7	9561	0	1
52141	1042	2017-03-27	9720	13680	0	38	dthiessen	Allan			\N	2017-03-27	2017-04-17	7921	27	\N	agongora	0		\N	\N	ereimer	2017-03-27 09:05:40.308	7	7921	0	1
52090	1033	2017-03-06	3960	4500	0	64	dthiessen	Veronica			\N	2017-03-06	2017-03-27	2038	41	\N	jquewell	0		\N	\N	ereimer	2017-03-06 08:55:53.777	7	2038	0	1
52087	1041	2017-03-06	10800	13320	0	40	dthiessen	Helena			\N	2017-03-06	2017-03-27	9232	84	\N	jquewell	0		\N	\N	ereimer	2017-03-06 08:02:50.902	7	9232	0	1
52103	1034	2017-03-09	7200	6660	0	62	dthiessen	Carlos			\N	2017-03-09	2017-03-30	4673	68	\N	jquewell	0		\N	\N	dthiessen	2017-03-09 09:34:09.574	1	4673	0	1
52098	1041	2017-03-09	11520	12600	0	41	dthiessen	Jake	added home eggs		\N	2017-03-09	2017-03-30	9794	29	\N	jquewell	0		\N	\N	dthiessen	2017-03-09 08:33:50.402	7	9794	0	1
52161	1041	2017-04-03	14040	16920	0	44	admin	jake			\N	2017-04-03	2017-04-24	11298	74	\N	agongora	0		\N	\N	ereimer	2017-04-03 09:07:57.621	7	11298	0	1
52162	1054	2017-04-03	2880	4680	0	31	admin	jake			\N	2017-04-03	2017-04-24	1252	55	\N	agongora	0		\N	\N	ereimer	2017-04-03 09:09:34.339	6	2438	1186	2
52165	1043	2017-04-03	20520	25560	0	35	admin	vange			\N	2017-04-03	2017-04-24	16996	58	\N	agongora	0		\N	\N	ereimer	2017-04-03 09:36:28.683	7	16996	0	1
52170	1034	2017-04-06	3240	4320	0	66	tneufeld	rene			\N	2017-04-06	2017-04-27	1557	70	\N	agongora	0		\N	\N	tneufeld	2017-04-06 08:57:37.027	1	1557	0	1
52175	1042	2017-04-06	7920	11880	0	40	tneufeld	elizabeth			\N	2017-04-06	2017-04-27	6770	25	\N	agongora	0		\N	\N	tneufeld	2017-04-06 10:15:47.917	7	6770	0	1
52168	1044	2017-04-06	13320	23940	0	29	tneufeld	william			\N	2017-04-06	2017-04-27	10735	59	\N	agongora	0		\N	\N	tneufeld	2017-04-06 08:11:19.23	7	10735	0	1
52119	1033	2017-03-16	3420	0	0	66	dthiessen	Veronica			\N	2017-03-16	2017-04-06	1923	30	\N	cmartinez	0		\N	\N	dthiessen	2017-03-16 08:50:22.48	7	1923	0	1
52114	1041	2017-03-16	11160	14400	0	42	dthiessen	Helena			\N	2017-03-16	2017-04-06	9654	22	\N	cmartinez	0		\N	\N	dthiessen	2017-03-16 07:51:17.152	7	9654	0	1
52164	1042	2017-04-03	10800	12600	0	40	admin	elizabeth			\N	2017-04-03	2017-04-24	8934	73	\N	agongora	0		\N	\N	ereimer	2017-04-03 09:26:46.558	7	8934	0	1
52167	1038	2017-04-03	13680	18000	0	61	admin	julia			\N	2017-04-03	2017-04-24	7713	163	\N	agongora	0		\N	\N	ereimer	2017-04-03 09:45:37.152	7	7713	0	1
52108	1033	2017-03-13	3240	2700	0	65	dthiessen	Paul			\N	2017-03-13	2017-04-03	1616	28	\N	cmartinez	0		\N	\N	dthiessen	2017-03-13 08:56:15.136	7	1616	0	1
52131	1034	2017-03-20	5760	9720	0	63	dthiessen	Carlos			\N	2017-03-20	2017-04-10	3435	68	\N	cmartinez	0		\N	\N	dthiessen	2017-03-20 16:12:15.058	1	3435	0	1
52123	1041	2017-03-20	10800	17640	0	42	dthiessen	Helena			\N	2017-03-20	2017-04-10	8529	53	\N	cmartinez	0		\N	\N	dthiessen	2017-03-20 07:56:11.98	7	8529	0	1
52180	1040	2017-04-10	13320	16200	0	52	tneufeld	kenton			\N	2017-04-10	2017-05-01	10392	170	\N	jquewell	0		\N	\N	tneufeld	2017-04-10 09:31:54.839	1	10392	0	1
52126	1054	2017-03-20	16200	4860	0	29	dthiessen	Jake			\N	2017-03-20	2017-04-10	6932	30	\N	cmartinez	0		\N	\N	dthiessen	2017-03-20 09:01:21.042	6	13591	6659	2
52139	1038	2017-03-23	13320	15120	0	60	ereimer	Juila	fix 12960		\N	2017-03-23	2017-04-13	8018	154	\N	cmartinez	0		\N	\N	ereimer	2017-03-23 09:52:20.183	7	8018	0	1
52134	1042	2017-03-23	7920	11880	0	38	ereimer	Peter	fix date		\N	2017-03-23	2017-04-13	6408	55	\N	cmartinez	0		\N	\N	ereimer	2017-03-23 08:33:00.308	7	6408	0	1
52147	1034	2017-03-27	10800	6300	0	64	ereimer	Carlos			\N	2017-03-27	2017-04-17	6111	159	\N	agongora	0		\N	\N	ereimer	2017-03-27 10:57:21.667	1	6111	0	1
52142	1038	2017-03-27	12240	18000	0	60	ereimer	Richard			\N	2017-03-27	2017-04-17	7579	187	\N	agongora	0		\N	\N	ereimer	2017-03-27 09:23:33.621	7	7579	0	1
52153	1034	2017-03-30	2520	7560	0	65	ereimer	Carlos			\N	2017-03-30	2017-04-20	1505	26	\N	agongora	0		\N	\N	ereimer	2017-03-30 08:36:58.386	1	1505	0	1
52143	1041	2017-03-27	14040	17280	0	43	ereimer	jake	fix 14400		\N	2017-03-27	2017-04-17	11771	98	\N	agongora	0		\N	\N	ereimer	2017-03-27 09:24:32.511	7	11771	0	1
52140	1039	2017-03-27	13320	15480	0	56	ereimer	Eric			\N	2017-03-27	2017-04-17	9166	179	\N	agongora	0		\N	\N	ereimer	2017-03-27 08:43:10.855	7	9166	0	1
52158	1038	2017-03-30	11160	17280	0	61	ereimer	Vange			\N	2017-03-30	2017-04-20	6870	124	\N	agongora	0		\N	\N	ereimer	2017-03-30 11:39:38.371	7	6870	0	1
52151	1039	2017-03-30	9360	16560	0	57	ereimer	Abe			\N	2017-03-30	2017-04-20	6355	148	\N	agongora	0		\N	\N	ereimer	2017-03-30 08:15:42.886	7	6355	0	1
52154	1041	2017-03-30	10440	17460	0	44	ereimer	Galen			\N	2017-03-30	2017-04-20	8827	37	\N	agongora	0		\N	\N	ereimer	2017-03-30 08:49:45.808	7	8827	0	1
52155	1042	2017-03-30	8280	13680	0	39	ereimer	Elizabeth			\N	2017-03-30	2017-04-20	6882	56	\N	agongora	0		\N	\N	ereimer	2017-03-30 09:26:46.011	7	6882	0	1
52157	1043	2017-03-30	15840	25920	0	34	ereimer	Vange			\N	2017-03-30	2017-04-20	13822	68	\N	agongora	0		\N	\N	ereimer	2017-03-30 09:44:08.371	7	13822	0	1
52152	1054	2017-03-30	8280	2880	0	31	ereimer	Jake			\N	2017-03-30	2017-04-20	3594	95	\N	nreimer	0		\N	\N	ereimer	2017-03-30 08:24:07.558	6	7072	3478	2
52179	1034	2017-04-10	4140	0	0	66	tneufeld	carlos			\N	2017-04-10	2017-05-01	1652	95	\N	jquewell	0		\N	\N	tneufeld	2017-04-10 09:14:42.199	1	1652	0	1
52160	1039	2017-04-03	13320	15480	0	57	admin	erik			\N	2017-04-03	2017-04-24	8951	112	\N	agongora	0		\N	\N	ereimer	2017-04-03 08:36:45.886	7	8951	0	1
52171	1038	2017-04-06	10800	17640	0	62	tneufeld	johan			\N	2017-04-06	2017-04-27	6645	80	\N	agongora	0		\N	\N	tneufeld	2017-04-06 09:22:09.042	7	6645	0	1
52174	1040	2017-04-06	10080	16740	0	52	tneufeld	louis			\N	2017-04-06	2017-04-27	8460	98	\N	agongora	0		\N	\N	tneufeld	2017-04-06 10:09:31.121	1	8460	0	1
52172	1041	2017-04-06	10440	17280	0	45	tneufeld	gallen			\N	2017-04-06	2017-04-27	8741	19	\N	agongora	0		\N	\N	tneufeld	2017-04-06 09:36:37.855	7	8741	0	1
52166	1034	2017-04-03	6120	5040	0	66	admin	carlos			\N	2017-04-03	2017-04-24	3100	93	\N	agongora	0		\N	\N	ereimer	2017-04-03 09:39:53.98	1	3100	0	1
52184	1038	2017-04-10	14040	17460	0	62	tneufeld	richard			\N	2017-04-10	2017-05-01	8174	125	\N	jquewell	0		\N	\N	tneufeld	2017-04-10 09:59:59.902	7	8174	0	1
52181	1041	2017-04-10	13680	17460	0	45	tneufeld	galen			\N	2017-04-10	2017-05-01	10501	40	\N	jquewell	0		\N	\N	tneufeld	2017-04-10 09:43:54.308	7	10501	0	1
52178	1042	2017-04-10	9360	11520	0	40	tneufeld	p&a lowen			\N	2017-04-10	2017-05-01	7491	43	\N	jquewell	0		\N	\N	tneufeld	2017-04-10 08:36:32.98	7	7491	0	1
52183	1043	2017-04-10	20160	26640	0	35	tneufeld	vange			\N	2017-04-10	2017-05-01	16248	19	\N	jquewell	0		\N	\N	tneufeld	2017-04-10 09:55:19.652	7	16248	0	1
52182	1054	2017-04-10	5760	7200	0	32	tneufeld	galen			\N	2017-04-10	2017-05-01	2522	50	\N	jquewell	0		\N	\N	tneufeld	2017-04-10 09:44:30.464	6	4878	2356	2
52186	1041	2017-04-13	10440	17280	0	46	tneufeld	galen			\N	2017-04-13	2017-05-04	8797	29	\N	jquewell	0		\N	\N	ereimer	2017-04-13 08:14:53.574	7	8797	0	1
52185	1044	2017-04-13	15120	25560	0	30	tneufeld	william			\N	2017-04-13	2017-05-04	13091	31	\N	jquewell	0		\N	\N	ereimer	2017-04-13 08:08:04.074	7	13091	0	1
52190	1042	2017-04-13	7200	11520	0	41	tneufeld	allan	added home		\N	2017-04-13	2017-05-04	5810	15	\N	jquewell	0		\N	\N	ereimer	2017-04-13 09:47:51.355	7	5810	0	1
52191	1043	2017-04-13	16200	25920	0	36	tneufeld	vange			\N	2017-04-13	2017-05-04	14285	29	\N	jquewell	0		\N	\N	ereimer	2017-04-13 10:20:31.121	7	14285	0	1
52138	1034	2017-03-23	5400	9720	0	64	dthiessen	Carlos			\N	2017-03-23	2017-04-13	3196	49	\N	cmartinez	0		\N	\N	ereimer	2017-03-23 09:45:00.886	1	3196	0	1
52136	1039	2017-03-23	10080	16560	0	56	ereimer	Abe			\N	2017-03-23	2017-04-13	7143	76	\N	cmartinez	0		\N	\N	ereimer	2017-03-23 09:30:00.652	7	7143	0	1
52144	1054	2017-03-27	10080	3240	0	30	ereimer	Jake			\N	2017-03-27	2017-04-17	4398	45	\N	cmartinez	0		\N	\N	ereimer	2017-03-27 09:25:07.621	6	8518	4120	2
52145	1040	2017-03-27	14400	16560	0	50	dthiessen	Kenton			\N	2017-03-27	2017-04-17	11393	211	\N	agongora	0		\N	\N	ereimer	2017-03-27 09:40:55.027	1	11393	0	1
52149	1044	2017-03-27	2160	14040	0	27	dthiessen	.			\N	2017-03-27	2017-04-17	1762	6	\N	agongora	0		\N	\N	dthiessen	2017-03-28 10:29:21.386	7	1762	0	1
52156	1040	2017-03-30	9720	16920	0	51	ereimer	Kenton			\N	2017-03-30	2017-04-20	7983	37	\N	agongora	0		\N	\N	ereimer	2017-03-30 09:37:30.011	1	7983	0	1
52150	1044	2017-03-30	6840	22680	0	28	ereimer	William			\N	2017-03-30	2017-04-20	5067	15	\N	agongora	0		\N	\N	ereimer	2017-03-30 08:04:54.777	7	5067	0	1
52163	1040	2017-04-03	13680	16740	0	51	admin	kenton			\N	2017-04-03	2017-04-24	10481	142	\N	agongora	0		\N	\N	ereimer	2017-04-03 09:17:28.824	1	10481	0	1
52159	1044	2017-04-03	13680	22680	0	28	ereimer	william			\N	2017-04-03	2017-04-24	11017	35	\N	agongora	0		\N	\N	ereimer	2017-04-03 07:55:51.589	7	11017	0	1
52169	1039	2017-04-06	9360	13680	0	58	tneufeld	abe			\N	2017-04-06	2017-04-27	6373	50	\N	agongora	0		\N	\N	tneufeld	2017-04-06 08:15:26.136	7	6373	0	1
52173	1043	2017-04-06	15480	25560	0	35	tneufeld	vange			\N	2017-04-06	2017-04-27	13536	47	\N	agongora	0		\N	\N	tneufeld	2017-04-06 09:45:23.183	7	13536	0	1
52200	1039	2017-04-20	8640	14760	0	60	tneufeld	abe			\N	2017-04-20	2017-05-11	4728	23	\N	cmartinez	0		\N	\N	tneufeld	2017-04-20 08:16:00.964	7	4728	0	1
52215	1043	2017-04-24	20520	25200	0	37	tneufeld	richard			\N	2017-04-24	2017-05-15	17499	72	\N	cmartinez	0		\N	\N	tneufeld	2017-04-24 09:49:58.527	7	17499	0	1
52207	1054	2017-04-24	5760	0	0	34	tneufeld	jake			\N	2017-04-24	2017-05-15	2432	70	\N	cmartinez	0		\N	\N	tneufeld	2017-04-24 08:11:08.292	6	4843	2411	2
52229	1039	2017-05-01	10800	12600	0	61	tneufeld	eric			\N	2017-05-01	2017-05-22	5882	95	\N	agongora	0		\N	\N	tneufeld	2017-05-01 09:04:45.23	7	5882	0	1
52203	1042	2017-04-20	6840	11160	0	42	tneufeld	elizabeth			\N	2017-04-20	2017-05-11	5701	51	\N	cmartinez	0		\N	\N	tneufeld	2017-04-20 09:43:28.73	7	5701	0	1
52221	1042	2017-04-27	6480	13320	0	43	tneufeld	allan			\N	2017-04-27	2017-05-18	5278	26	\N	cmartinez	0		\N	\N	tneufeld	2017-04-27 09:01:18.855	7	5278	0	1
52177	1039	2017-04-10	10800	13860	0	58	tneufeld	erik	added home eggs		\N	2017-04-10	2017-05-01	6575	47	\N	jquewell	0		\N	\N	tneufeld	2017-04-10 08:31:57.23	7	6575	0	1
52176	1044	2017-04-10	18720	25560	0	29	tneufeld	william			\N	2017-04-10	2017-05-01	16117	53	\N	jquewell	0		\N	\N	tneufeld	2017-04-10 08:02:32.949	7	16117	0	1
52187	1039	2017-04-13	8280	14220	0	59	tneufeld	abe			\N	2017-04-13	2017-05-04	4683	40	\N	jquewell	0		\N	\N	ereimer	2017-04-13 09:01:10.308	7	4683	0	1
52192	1038	2017-04-17	12960	11880	0	63	tneufeld	otto			\N	2017-04-17	2017-05-08	6255	54	\N	cmartinez	0		\N	\N	tneufeld	2017-04-18 09:12:55.058	7	6255	0	1
52194	1040	2017-04-17	13680	15660	0	53	tneufeld	kenton			\N	2017-04-17	2017-05-08	10394	111	\N	cmartinez	0		\N	\N	tneufeld	2017-04-18 09:16:13.855	1	10394	0	1
52195	1041	2017-04-17	14040	16920	0	46	tneufeld	jake			\N	2017-04-17	2017-05-08	11217	55	\N	cmartinez	0		\N	\N	tneufeld	2017-04-18 09:17:41.683	7	11217	0	1
52205	1038	2017-04-20	6480	10080	0	64	tneufeld	otto	added home eggs		\N	2017-04-20	2017-05-11	3668	21	\N	cmartinez	0		\N	\N	tneufeld	2017-04-20 10:00:52.886	7	3668	0	1
52198	1044	2017-04-17	20160	27000	0	30	tneufeld	joe			\N	2017-04-17	2017-05-08	17689	26	\N	cmartinez	0		\N	\N	tneufeld	2017-04-18 09:20:41.964	7	17689	0	1
52196	1042	2017-04-17	9360	11340	0	41	tneufeld	allan			\N	2017-04-17	2017-05-08	7923	25	\N	cmartinez	0		\N	\N	tneufeld	2017-04-18 09:18:48.917	7	7923	0	1
52201	1041	2017-04-20	10080	16920	0	47	tneufeld	jake	fix 9000, added home eggs		\N	2017-04-20	2017-05-11	8689	17	\N	cmartinez	0		\N	\N	tneufeld	2017-04-20 08:25:56.152	7	8689	0	1
52204	1043	2017-04-20	15120	25560	0	37	tneufeld	richard			\N	2017-04-20	2017-05-11	13118	45	\N	cmartinez	0		\N	\N	tneufeld	2017-04-20 09:49:52.98	7	13118	0	1
52199	1044	2017-04-20	15840	28440	0	31	tneufeld	william			\N	2017-04-20	2017-05-11	13719	28	\N	cmartinez	0		\N	\N	tneufeld	2017-04-20 08:04:46.417	7	13719	0	1
52213	1038	2017-04-24	9000	6840	0	64	ereimer	Juiie			\N	2017-04-24	2017-05-15	4340	43	\N	cmartinez	0		\N	\N	tneufeld	2017-04-24 09:23:33.292	7	4340	0	1
52209	1039	2017-04-24	11880	14400	0	60	tneufeld	eric			\N	2017-04-24	2017-05-15	6634	59	\N	cmartinez	0		\N	\N	tneufeld	2017-04-24 08:33:34.949	7	6634	0	1
52212	1041	2017-04-24	13320	16920	0	47	tneufeld	gallen			\N	2017-04-24	2017-05-15	10646	126	\N	cmartinez	0		\N	\N	tneufeld	2017-04-24 09:06:41.23	7	10646	0	1
52210	1042	2017-04-24	9000	11000	0	42	tneufeld	allan	guessed home eggs		\N	2017-04-24	2017-05-15	7369	61	\N	cmartinez	0		\N	\N	tneufeld	2017-04-24 08:34:26.105	7	7369	0	1
52223	1038	2017-04-27	7380	0	0	65	tneufeld	julia			\N	2017-04-27	2017-05-18	4300	79	\N	cmartinez	0		\N	\N	tneufeld	2017-04-27 09:29:44.199	7	4300	0	1
52222	1039	2017-04-27	8640	13680	0	61	tneufeld	abe			\N	2017-04-27	2017-05-18	4786	43	\N	cmartinez	0		\N	\N	tneufeld	2017-04-27 09:11:35.074	7	4786	0	1
52218	1040	2017-04-27	9720	16200	0	55	tneufeld	kenton			\N	2017-04-27	2017-05-18	8068	70	\N	cmartinez	0		\N	\N	tneufeld	2017-04-27 08:36:07.792	1	8068	0	1
52224	1043	2017-04-27	15120	25200	0	38	tneufeld	vange			\N	2017-04-27	2017-05-18	13206	50	\N	cmartinez	0		\N	\N	tneufeld	2017-04-27 09:45:16.152	7	13206	0	1
52216	1044	2017-04-27	17280	26280	0	32	tneufeld	william			\N	2017-04-27	2017-05-18	15426	29	\N	cmartinez	0		\N	\N	tneufeld	2017-04-27 08:16:44.121	7	15426	0	1
52220	1047	2017-04-27	1260	6480	0	26	tneufeld	tim	added home eggs		\N	2017-04-27	2017-05-18	862	4	\N	cmartinez	0		\N	\N	tneufeld	2017-04-27 08:51:52.074	2	862	0	1
52225	1040	2017-05-01	12960	15660	0	55	tneufeld	kenton			\N	2017-05-01	2017-05-22	9628	128	\N	agongora	0		\N	\N	tneufeld	2017-05-01 08:06:47.433	1	9628	0	1
52227	1041	2017-05-01	13680	16560	0	48	tneufeld	jake			\N	2017-05-01	2017-05-22	10303	142	\N	agongora	0		\N	\N	tneufeld	2017-05-01 08:41:31.949	7	10303	0	1
52232	1043	2017-05-01	20160	24480	0	38	tneufeld	vange			\N	2017-05-01	2017-05-22	17882	50	\N	agongora	0		\N	\N	tneufeld	2017-05-01 10:04:30.777	7	17882	0	1
52226	1044	2017-05-01	20880	24840	0	32	tneufeld	william			\N	2017-05-01	2017-05-22	17454	59	\N	agongora	0		\N	\N	tneufeld	2017-05-01 08:19:25.808	7	17454	0	1
52230	1047	2017-05-01	5400	10260	0	26	tneufeld	tim			\N	2017-05-01	2017-05-22	4272	20	\N	agongora	0		\N	\N	tneufeld	2017-05-01 09:38:57.199	2	4272	0	1
52228	1054	2017-05-01	2880	2880	0	35	tneufeld	jake			\N	2017-05-01	2017-05-22	1167	30	\N	agongora	0		\N	\N	tneufeld	2017-05-01 08:42:48.355	6	2307	1140	2
52238	1039	2017-05-04	7920	11700	0	62	dthiessen	Abe			\N	2017-05-04	2017-05-25	3816	44	\N	jquewell	0		\N	\N	tneufeld	2017-05-04 09:02:00.542	7	3816	0	1
52234	1040	2017-05-04	9360	15300	0	56	tneufeld	louis			\N	2017-05-04	2017-05-25	7009	99	\N	jquewell	0		\N	\N	tneufeld	2017-05-04 08:22:13.027	1	7009	0	1
52236	1041	2017-05-04	10080	16740	0	49	tneufeld	jake			\N	2017-05-04	2017-05-25	6947	105	\N	jquewell	0		\N	\N	tneufeld	2017-05-04 08:44:06.621	7	6947	0	1
52239	1043	2017-05-04	14400	24480	0	39	tneufeld	richard			\N	2017-05-04	2017-05-25	12423	75	\N	jquewell	0		\N	\N	tneufeld	2017-05-04 09:32:52.855	7	12423	0	1
52233	1044	2017-05-04	14400	25920	0	33	tneufeld	william			\N	2017-05-04	2017-05-25	11618	19	\N	jquewell	0		\N	\N	tneufeld	2017-05-04 08:16:36.652	7	11618	0	1
52188	1038	2017-04-13	10440	15480	0	63	tneufeld	julia			\N	2017-04-13	2017-05-04	5648	65	\N	jquewell	0		\N	\N	ereimer	2017-04-13 09:25:55.683	7	5648	0	1
52189	1040	2017-04-13	9720	16560	0	53	tneufeld	louis	fix 17460 home		\N	2017-04-13	2017-05-04	7830	64	\N	jquewell	0		\N	\N	ereimer	2017-04-13 09:37:56.73	1	7830	0	1
52241	1044	2017-05-08	20880	25560	0	33	tneufeld	william			\N	2017-05-08	2017-05-29	17227	136	\N	jquewell	0		\N	\N	tneufeld	2017-05-08 08:12:39.933	7	17227	0	1
52247	1054	2017-05-08	7560	2880	0	36	tneufeld	jake			\N	2017-05-08	2017-05-29	3124	82	\N	nreimer	0		\N	\N	tneufeld	2017-05-08 10:14:45.667	6	6225	3101	2
52197	1043	2017-04-17	20880	25200	0	36	tneufeld	richard			\N	2017-04-17	2017-05-08	18154	60	\N	cmartinez	0		\N	\N	tneufeld	2017-04-18 09:19:44.839	7	18154	0	1
52193	1039	2017-04-17	11160	14580	0	59	tneufeld	abe			\N	2017-04-17	2017-05-08	5968	55	\N	cmartinez	0		\N	\N	tneufeld	2017-04-18 09:14:55.746	7	5968	0	1
52249	1054	2017-04-17	6480	0	0	33	dthiessen	Jake			\N	2017-04-17	2017-05-08	2664	85	\N	cmartinez	0		\N	\N	dthiessen	2017-05-09 10:14:19.339	6	5434	2770	2
52250	1054	2017-04-20	9000	0	0	34	dthiessen	Jake			\N	2017-04-20	2017-05-11	3855	70	\N	cmartinez	0		\N	\N	dthiessen	2017-05-09 10:15:19.074	6	7747	3892	2
52202	1040	2017-04-20	9720	15480	0	54	tneufeld	charlie			\N	2017-04-20	2017-05-11	7863	47	\N	cmartinez	0		\N	\N	tneufeld	2017-04-20 08:58:36.308	1	7863	0	1
52206	1047	2017-04-20	720	0	0	25	tneufeld	margareth	fix 1080		\N	2017-04-20	2017-05-11	528	3	\N	cmartinez	0		\N	\N	tneufeld	2017-04-20 11:29:19.996	2	528	0	1
52269	1039	2017-05-18	9720	6480	0	64	tneufeld	abe 			\N	2017-05-18	2017-06-08	4336	33	\N	cmartinez	0		\N	\N	tneufeld	2017-05-18 08:36:35.98	7	4336	0	1
52214	1040	2017-04-24	12240	16200	0	54	tneufeld	kenton			\N	2017-04-24	2017-05-15	9040	204	\N	cmartinez	0		\N	\N	tneufeld	2017-04-24 09:45:30.152	1	9040	0	1
52211	1044	2017-04-24	22680	27000	0	31	tneufeld	william			\N	2017-04-24	2017-05-15	19306	20	\N	cmartinez	0		\N	\N	tneufeld	2017-04-24 08:47:11.261	7	19306	0	1
52219	1041	2017-04-27	10080	17460	0	48	tneufeld	galen	added home eggs		\N	2017-04-27	2017-05-18	8707	24	\N	cmartinez	0		\N	\N	tneufeld	2017-04-27 08:44:30.402	7	8707	0	1
52217	1054	2017-04-27	5040	3240	0	35	tneufeld	jake			\N	2017-04-27	2017-05-18	2184	10	\N	cmartinez	0		\N	\N	tneufeld	2017-04-27 08:21:36.746	6	4313	2129	2
52271	1043	2017-05-18	14400	24120	0	41	tneufeld	vange			\N	2017-05-18	2017-06-08	12745	20	\N	cmartinez	0		\N	\N	tneufeld	2017-05-18 09:53:36.761	7	12745	0	1
52289	1039	2017-05-25	7200	0	0	65	tneufeld	abe			\N	2017-05-25	2017-06-15	3414	44	\N	cmartinez	0		\N	\N	tneufeld	2017-05-25 09:35:57.088	7	3414	0	1
52281	1040	2017-05-22	12240	15660	0	58	tneufeld	kenton			\N	2017-05-22	2017-06-12	7569	174	\N	cmartinez	0		\N	\N	tneufeld	2017-05-22 10:25:46.635	1	7569	0	1
52231	1042	2017-05-01	10800	10440	0	43	tneufeld	elizabeth			\N	2017-05-01	2017-05-22	8655	64	\N	agongora	0		\N	\N	tneufeld	2017-05-01 09:42:03.746	7	8655	0	1
52285	1043	2017-05-25	14040	23760	0	42	tneufeld	richard			\N	2017-05-25	2017-06-15	12329	65	\N	cmartinez	0		\N	\N	tneufeld	2017-05-25 08:19:57.432	7	12329	0	1
52283	1041	2017-05-25	10080	15480	0	52	tneufeld	jake 			\N	2017-05-25	2017-06-15	5872	32	\N	cmartinez	0		\N	\N	tneufeld	2017-05-25 07:56:12.229	7	5872	0	1
52235	1054	2017-05-04	6120	4320	0	36	tneufeld	jake			\N	2017-05-04	2017-05-25	2527	50	\N	agongora	0		\N	\N	tneufeld	2017-05-04 08:43:29.527	6	5026	2499	2
52237	1042	2017-05-04	6120	10260	0	44	tneufeld	elizabeth			\N	2017-05-04	2017-05-25	4880	9	\N	jquewell	0		\N	\N	tneufeld	2017-05-04 08:50:39.386	7	4880	0	1
52244	1039	2017-05-08	9360	11700	0	62	tneufeld	eric			\N	2017-05-08	2017-05-29	4231	68	\N	jquewell	0		\N	\N	tneufeld	2017-05-08 08:48:13.23	7	4231	0	1
52246	1041	2017-05-08	13320	15840	0	49	tneufeld	jake			\N	2017-05-08	2017-05-29	7407	77	\N	jquewell	0		\N	\N	tneufeld	2017-05-08 10:13:53.636	7	7407	0	1
52242	1042	2017-05-08	8280	9720	0	44	tneufeld	elizabeth			\N	2017-05-08	2017-05-29	5838	69	\N	jquewell	0		\N	\N	tneufeld	2017-05-08 08:29:10.699	7	5838	0	1
52245	1043	2017-05-08	19800	24480	0	39	tneufeld	vange	fix home eggs		\N	2017-05-08	2017-05-29	17326	78	\N	jquewell	0		\N	\N	tneufeld	2017-05-08 09:24:03.949	7	17326	0	1
52254	1039	2017-05-11	7560	11520	0	63	tneufeld	abe			\N	2017-05-11	2017-06-01	3400	56	\N	jquewell	0		\N	\N	tneufeld	2017-05-11 09:06:01.277	7	3400	0	1
52256	1040	2017-05-11	10080	14760	0	57	tneufeld	louis			\N	2017-05-11	2017-06-01	7595	134	\N	jquewell	0		\N	\N	tneufeld	2017-05-11 10:09:13.824	1	7595	0	1
52252	1041	2017-05-11	10080	15300	0	50	tneufeld	jake			\N	2017-05-11	2017-06-01	7711	52	\N	jquewell	0		\N	\N	tneufeld	2017-05-11 08:11:31.558	7	7711	0	1
52255	1043	2017-05-11	16200	22680	0	40	tneufeld	vange			\N	2017-05-11	2017-06-01	14102	43	\N	jquewell	0		\N	\N	tneufeld	2017-05-11 09:39:36.027	7	14102	0	1
52251	1044	2017-05-11	16560	24840	0	34	tneufeld	william			\N	2017-05-11	2017-06-01	14914	88	\N	jquewell	0		\N	\N	tneufeld	2017-05-11 07:56:47.433	7	14914	0	1
52258	1047	2017-05-11	13680	18360	0	28	tneufeld	tim			\N	2017-05-11	2017-06-01	10489	72	\N	jquewell	0		\N	\N	tneufeld	2017-05-11 11:04:45.386	2	10489	0	1
52259	1039	2017-05-15	9360	11520	0	63	tneufeld	abe			\N	2017-05-15	2017-06-05	4039	75	\N	cmartinez	0		\N	\N	tneufeld	2017-05-15 07:55:17.386	7	4039	0	1
52266	1054	2017-05-15	12960	2880	0	37	tneufeld	jake			\N	2017-05-15	2017-06-05	5346	170	\N	cmartinez	0		\N	\N	tneufeld	2017-05-15 10:42:53.964	6	10719	5373	2
52261	1040	2017-05-15	11520	15660	0	57	tneufeld	charlie			\N	2017-05-15	2017-06-05	8399	195	\N	cmartinez	0		\N	\N	tneufeld	2017-05-15 08:49:23.652	1	8399	0	1
52262	1042	2017-05-15	7920	10080	0	45	tneufeld	elizabeth			\N	2017-05-15	2017-06-05	6248	40	\N	cmartinez	0		\N	\N	tneufeld	2017-05-15 09:01:42.667	7	6248	0	1
52264	1043	2017-05-15	18000	24120	0	40	tneufeld	richard			\N	2017-05-15	2017-06-05	15866	34	\N	cmartinez	0		\N	\N	tneufeld	2017-05-15 09:55:50.605	7	15866	0	1
52260	1044	2017-05-15	19440	25560	0	34	tneufeld	william			\N	2017-05-15	2017-06-05	16569	68	\N	cmartinez	0		\N	\N	tneufeld	2017-05-15 08:31:36.964	7	16569	0	1
52272	1040	2017-05-18	9360	15660	0	58	tneufeld	kenton			\N	2017-05-18	2017-06-08	6950	82	\N	cmartinez	0		\N	\N	tneufeld	2017-05-18 10:27:26.886	1	6950	0	1
52268	1054	2017-05-18	6840	5760	0	38	tneufeld	jake			\N	2017-05-18	2017-06-08	2907	46	\N	cmartinez	0		\N	\N	tneufeld	2017-05-18 08:24:39.246	6	5716	2809	2
52267	1044	2017-05-18	15480	24480	0	35	tneufeld	william			\N	2017-05-18	2017-06-08	13298	31	\N	cmartinez	0		\N	\N	tneufeld	2017-05-18 08:18:18.324	7	13298	0	1
52277	1054	2017-05-22	3600	4680	0	38	tneufeld	jake			\N	2017-05-22	2017-06-12	1386	22	\N	cmartinez	0		\N	\N	tneufeld	2017-05-22 08:19:57.916	6	2802	1416	2
52274	1041	2017-05-18	9000	16920	0	51	dthiessen	Jake			\N	2017-05-18	2017-06-08	6964	27	\N	cmartinez	0		\N	\N	dthiessen	2017-05-19 10:37:54.438	7	6964	0	1
52275	1039	2017-05-22	5040	5760	0	64	tneufeld	abe	fix 5400		\N	2017-05-22	2017-06-12	2054	41	\N	cmartinez	0		\N	\N	tneufeld	2017-05-22 07:55:10.198	7	2054	0	1
52276	1041	2017-05-22	13680	16020	0	51	tneufeld	jake			\N	2017-05-22	2017-06-12	10627	144	\N	cmartinez	0		\N	\N	tneufeld	2017-05-22 08:16:35.479	7	10627	0	1
52280	1043	2017-05-22	19440	23400	0	41	tneufeld	vange			\N	2017-05-22	2017-06-12	18607	169	\N	cmartinez	0		\N	\N	tneufeld	2017-05-22 09:28:24.932	7	18607	0	1
52278	1044	2017-05-22	19800	25920	0	35	tneufeld	william			\N	2017-05-22	2017-06-12	16926	65	\N	cmartinez	0		\N	\N	tneufeld	2017-05-22 08:40:21.666	7	16926	0	1
52282	1047	2017-05-22	19440	24840	0	29	tneufeld	tim	fix 12240		\N	2017-05-22	2017-06-12	16831	43	\N	cmartinez	0		\N	\N	tneufeld	2017-05-22 10:32:54.682	2	16831	0	1
52288	1040	2017-05-25	9360	15300	0	59	tneufeld	kenton			\N	2017-05-25	2017-06-15	6875	201	\N	cmartinez	0		\N	\N	tneufeld	2017-05-25 09:35:18.76	1	6875	0	1
52286	1044	2017-05-25	15480	25920	0	36	tneufeld	william			\N	2017-05-25	2017-06-15	13300	78	\N	cmartinez	0		\N	\N	tneufeld	2017-05-25 08:35:26.807	7	13300	0	1
52287	1047	2017-05-25	14760	24840	0	30	tneufeld	abram			\N	2017-05-25	2017-06-15	12593	96	\N	cmartinez	0		\N	\N	tneufeld	2017-05-25 08:49:19.745	2	12593	0	1
52240	1047	2017-05-04	5760	14040	0	27	tneufeld	ABRAM	added home eggs		\N	2017-05-04	2017-05-25	4158	38	\N	jquewell	0		\N	\N	tneufeld	2017-05-04 10:06:47.23	2	4158	0	1
52248	1040	2017-05-08	12240	15480	0	56	tneufeld	louis			\N	2017-05-08	2017-05-29	9380	172	\N	jquewell	0		\N	\N	tneufeld	2017-05-08 10:15:28.636	1	9380	0	1
52243	1047	2017-05-08	10080	20160	0	27	tneufeld	tim			\N	2017-05-08	2017-05-29	7922	26	\N	jquewell	0		\N	\N	tneufeld	2017-05-08 08:37:28.355	2	7922	0	1
52253	1042	2017-05-11	6120	10260	0	45	tneufeld	allan			\N	2017-05-11	2017-06-01	4792	36	\N	jquewell	0		\N	\N	tneufeld	2017-05-11 09:05:02.339	7	4792	0	1
52257	1054	2017-05-11	1800	0	0	37	tneufeld	linda			\N	2017-05-11	2017-06-01	765	25	\N	jquewell	0		\N	\N	tneufeld	2017-05-11 10:16:39.636	6	1486	721	2
52321	1040	2017-06-05	12600	10980	0	60	tneufeld	kenton			\N	2017-06-05	2017-06-26	9105	157	\N	jquewell	0		\N	\N	tneufeld	2017-06-05 10:01:15.036	1	9105	0	1
52314	1047	2017-06-01	20520	18720	0	31	tneufeld	tim			\N	2017-06-01	2017-06-22	17566	20	\N	jquewell	0		\N	\N	tneufeld	2017-06-01 09:28:44.328	2	17566	0	1
52265	1041	2017-05-15	12240	14940	0	50	tneufeld	jake			\N	2017-05-15	2017-06-05	8233	95	\N	cmartinez	0		\N	\N	tneufeld	2017-05-15 10:42:08.402	7	8233	0	1
52263	1047	2017-05-15	14040	25200	0	28	tneufeld	abram			\N	2017-05-15	2017-06-05	11863	13	\N	cmartinez	0		\N	\N	tneufeld	2017-05-15 09:12:52.902	2	11863	0	1
52270	1042	2017-05-18	6120	10620	0	46	tneufeld	elizabeth	fix 6300		\N	2017-05-18	2017-06-08	4734	13	\N	cmartinez	0		\N	\N	tneufeld	2017-05-18 08:45:29.699	7	4734	0	1
52273	1047	2017-05-18	15480	24480	0	29	tneufeld	abram			\N	2017-05-18	2017-06-08	12506	48	\N	cmartinez	0		\N	\N	tneufeld	2017-05-18 11:01:24.371	2	12506	0	1
52279	1042	2017-05-22	8640	9540	0	46	tneufeld	allan			\N	2017-05-22	2017-06-12	6005	84	\N	cmartinez	0		\N	\N	tneufeld	2017-05-22 08:57:19.338	7	6005	0	1
52291	1041	2017-05-29	12600	13140	0	52	tneufeld	jake			\N	2017-05-29	2017-06-19	9376	55	\N	jquewell	0		\N	\N	tneufeld	2017-05-29 08:11:22.5	7	9376	0	1
52297	1043	2017-05-29	19440	12960	0	42	tneufeld	vange			\N	2017-05-29	2017-06-19	16052	94	\N	jquewell	0		\N	\N	tneufeld	2017-05-29 10:10:56.437	7	16052	0	1
52293	1044	2017-05-29	21240	23040	0	36	tneufeld	william			\N	2017-05-29	2017-06-19	18681	8	\N	jquewell	0		\N	\N	tneufeld	2017-05-29 08:25:52.406	7	18681	0	1
52296	1047	2017-05-29	20160	24840	0	30	tneufeld	tim			\N	2017-05-29	2017-06-19	16744	25	\N	jquewell	0		\N	\N	tneufeld	2017-05-29 09:49:28.937	2	16744	0	1
52292	1054	2017-05-29	3240	5760	0	39	tneufeld	jake			\N	2017-05-29	2017-06-19	1322	30	\N	jquewell	0		\N	\N	tneufeld	2017-05-29 08:12:03.703	6	2595	1273	2
52316	1040	2017-06-01	11520	11700	0	60	tneufeld	louis			\N	2017-06-01	2017-06-22	8167	120	\N	jquewell	0		\N	\N	tneufeld	2017-06-01 09:57:27.953	1	8167	0	1
52312	1041	2017-06-01	12600	11880	0	53	tneufeld	galen	fix 13320, added home eggs		\N	2017-06-01	2017-06-22	8445	125	\N	jquewell	0		\N	\N	tneufeld	2017-06-01 08:15:23.25	7	8445	0	1
52313	1042	2017-06-01	7920	7200	0	48	tneufeld	allan			\N	2017-06-01	2017-06-22	6164	43	\N	jquewell	0		\N	\N	tneufeld	2017-06-01 08:45:05.812	7	6164	0	1
52315	1043	2017-06-01	18720	18000	0	43	tneufeld	vange			\N	2017-06-01	2017-06-22	15941	58	\N	jquewell	0		\N	\N	tneufeld	2017-06-01 09:39:13.437	7	15941	0	1
52311	1044	2017-06-01	19080	18360	0	37	tneufeld	william			\N	2017-06-01	2017-06-22	16535	71	\N	jquewell	0		\N	\N	tneufeld	2017-06-01 08:06:16.672	7	16535	0	1
52317	1048	2017-06-01	1440	0	0	26	tneufeld	tina	fix 1800 took out small eggs		\N	2017-06-01	2017-06-22	1000	5	\N	jquewell	0		\N	\N	tneufeld	2017-06-01 11:31:23.687	1	1000	0	1
52310	1054	2017-06-01	5760	3600	0	40	tneufeld	jake			\N	2017-06-01	2017-06-22	2413	14	\N	jquewell	0		\N	\N	tneufeld	2017-06-01 07:51:04.156	6	4729	2316	2
52319	1041	2017-06-05	12600	11160	0	53	tneufeld	jake			\N	2017-06-05	2017-06-26	9286	58	\N	jquewell	0		\N	\N	tneufeld	2017-06-05 08:35:10.52	7	9286	0	1
52324	1042	2017-06-05	7920	6660	0	48	tneufeld	elizabeth			\N	2017-06-05	2017-06-26	5515	40	\N	jquewell	0		\N	\N	tneufeld	2017-06-05 10:34:42.27	7	5515	0	1
52323	1043	2017-06-05	18720	17640	0	43	tneufeld	richard			\N	2017-06-05	2017-06-26	16100	130	\N	jquewell	0		\N	\N	tneufeld	2017-06-05 10:09:38.723	7	16100	0	1
52320	1044	2017-06-05	19800	17640	0	37	tneufeld	william			\N	2017-06-05	2017-06-26	17453	24	\N	jquewell	0		\N	\N	tneufeld	2017-06-05 08:36:23.27	7	17453	0	1
52322	1047	2017-06-05	19440	19080	0	31	tneufeld	tim			\N	2017-06-05	2017-06-26	16578	55	\N	jquewell	0		\N	\N	tneufeld	2017-06-05 10:01:37.364	2	16578	0	1
52318	1054	2017-06-05	7560	2520	0	40	tneufeld	jake			\N	2017-06-05	2017-06-26	3084	62	\N	jquewell	0		\N	\N	tneufeld	2017-06-05 08:34:26.458	6	6061	2977	2
52326	1040	2017-06-08	10080	9540	0	61	tneufeld	kenton			\N	2017-06-08	2017-06-29	7542	283	\N	jquewell	0		\N	\N	tneufeld	2017-06-08 08:42:09.312	1	7542	0	1
52331	1041	2017-06-08	11160	9000	0	54	tneufeld	jake			\N	2017-06-08	2017-06-29	7440	69	\N	jquewell	0		\N	\N	tneufeld	2017-06-08 10:14:26.437	7	7440	0	1
52328	1042	2017-06-08	6840	5400	0	49	tneufeld	allan			\N	2017-06-08	2017-06-29	5541	35	\N	jquewell	0		\N	\N	tneufeld	2017-06-08 08:53:33.906	7	5541	0	1
52330	1043	2017-06-08	17640	13680	0	44	tneufeld	richard			\N	2017-06-08	2017-06-29	15315	63	\N	jquewell	0		\N	\N	tneufeld	2017-06-08 09:49:36.765	7	15315	0	1
52325	1044	2017-06-08	17640	14040	0	38	tneufeld	william			\N	2017-06-08	2017-06-29	15058	95	\N	jquewell	0		\N	\N	tneufeld	2017-06-08 08:02:03.437	7	15058	0	1
52329	1047	2017-06-08	19080	14760	0	32	tneufeld	abram			\N	2017-06-08	2017-06-29	16573	83	\N	jquewell	0		\N	\N	tneufeld	2017-06-08 09:43:36.187	2	16573	0	1
52327	1048	2017-06-08	1800	2880	0	27	tneufeld	mark			\N	2017-06-08	2017-06-29	1279	36	\N	jquewell	0		\N	\N	tneufeld	2017-06-08 08:48:37.312	1	1279	0	1
52334	1040	2017-06-12	12600	8640	0	61	tneufeld	louis			\N	2017-06-12	2017-07-03	8625	241	\N	cmartinez	0		\N	\N	tneufeld	2017-06-12 09:04:40.187	1	8625	0	1
52335	1041	2017-06-12	12240	9360	0	54	tneufeld	linda			\N	2017-06-12	2017-07-03	9196	70	\N	cmartinez	0		\N	\N	tneufeld	2017-06-12 09:45:22.077	7	9196	0	1
52339	1042	2017-06-12	4320	8460	0	49	dthiessen	Andy			\N	2017-06-12	2017-07-03	3099	17	\N	cmartinez	0		\N	\N	dthiessen	2017-06-12 13:49:24.374	7	3099	0	1
52337	1043	2017-06-12	18360	13320	0	44	tneufeld	vange			\N	2017-06-12	2017-07-03	15462	101	\N	cmartinez	0		\N	\N	tneufeld	2017-06-12 09:52:38.03	7	15462	0	1
52333	1044	2017-06-12	18720	14400	0	38	tneufeld	william			\N	2017-06-12	2017-07-03	16315	36	\N	cmartinez	0		\N	\N	tneufeld	2017-06-12 08:37:31.905	7	16315	0	1
52338	1047	2017-06-12	19800	15300	0	32	tneufeld	abram			\N	2017-06-12	2017-07-03	16856	63	\N	cmartinez	0		\N	\N	tneufeld	2017-06-12 10:01:39.859	2	16856	0	1
52332	1048	2017-06-12	4320	2520	0	27	tneufeld	anton			\N	2017-06-12	2017-07-03	3408	11	\N	cmartinez	0		\N	\N	tneufeld	2017-06-12 08:25:32.03	1	3408	0	1
52336	1054	2017-06-12	11160	0	0	41	tneufeld	linda			\N	2017-06-12	2017-07-03	4186	110	\N	cmartinez	0		\N	\N	tneufeld	2017-06-12 09:45:44.327	6	8244	4058	2
52346	1040	2017-06-15	11520	5760	0	62	tneufeld	charlie			\N	2017-06-15	2017-07-06	8445	137	\N	cmartinez	0		\N	\N	tneufeld	2017-06-15 10:20:08.218	1	8445	0	1
52343	1054	2017-06-15	9720	0	0	42	tneufeld	GALEN			\N	2017-06-15	2017-07-06	3828	140	\N	cmartinez	0		\N	\N	tneufeld	2017-06-15 09:57:08.593	6	7536	3708	2
52344	1041	2017-06-15	12600	5580	0	55	tneufeld	galen			\N	2017-06-15	2017-07-06	9829	61	\N	cmartinez	0		\N	\N	tneufeld	2017-06-15 09:57:45.718	7	9829	0	1
52347	1042	2017-06-15	10440	3960	0	50	tneufeld	andy			\N	2017-06-15	2017-07-06	8415	49	\N	cmartinez	0		\N	\N	tneufeld	2017-06-15 10:32:52.702	7	8415	0	1
52342	1043	2017-06-15	17640	9000	0	45	tneufeld	richard			\N	2017-06-15	2017-07-06	15130	91	\N	cmartinez	0		\N	\N	tneufeld	2017-06-15 09:52:16.687	7	15130	0	1
52345	1047	2017-06-15	20520	9720	0	33	tneufeld	tim			\N	2017-06-15	2017-07-06	17238	46	\N	cmartinez	0		\N	\N	tneufeld	2017-06-15 10:05:30.78	2	17238	0	1
52340	1048	2017-06-15	3600	3600	0	28	tneufeld	mark			\N	2017-06-15	2017-07-06	3357	6	\N	cmartinez	0		\N	\N	tneufeld	2017-06-15 08:00:10.14	1	3357	0	1
52284	1054	2017-05-25	8640	2520	0	39	tneufeld	jake			\N	2017-05-25	2017-06-15	3591	38	\N	cmartinez	0		\N	\N	tneufeld	2017-05-25 07:57:13.791	6	7196	3605	2
52290	1042	2017-05-25	9360	6300	0	47	tneufeld	allan	fix 6480		\N	2017-05-25	2017-06-15	7329	55	\N	cmartinez	0		\N	\N	tneufeld	2017-05-25 09:47:10.291	7	7329	0	1
52352	1043	2017-06-19	18000	9000	0	45	tneufeld	richard			\N	2017-06-19	2017-07-10	15283	121	\N	cmartinez	0		\N	\N	tneufeld	2017-06-19 09:53:32.53	7	15283	0	1
52294	1040	2017-05-29	12600	14400	0	59	tneufeld	kenton			\N	2017-05-29	2017-06-19	8867	147	\N	jquewell	0		\N	\N	tneufeld	2017-05-29 08:58:03.015	1	8867	0	1
52295	1042	2017-05-29	4680	9180	0	47	tneufeld	elizabeth			\N	2017-05-29	2017-06-19	3245	30	\N	jquewell	0		\N	\N	tneufeld	2017-05-29 09:24:12.75	7	3245	0	1
52368	1043	2017-06-26	17640	2880	0	46	tneufeld	vange			\N	2017-06-26	2017-07-17	15097	69	\N	agongora	0		\N	\N	tneufeld	2017-06-26 09:26:42.071	7	15097	0	1
52393	1040	2017-07-06	8100	0	0	65	tneufeld	louis			\N	2017-07-06	2017-07-27	6165	96	\N	agongora	0		\N	\N	tneufeld	2017-07-06 09:44:57.312	1	6165	0	1
52382	1044	2017-07-03	18180	0	0	41	tneufeld	william			\N	2017-07-03	2017-07-24	15858	25	\N	agongora	0		\N	\N	tneufeld	2017-07-03 08:22:34.53	7	15858	0	1
52392	1042	2017-07-06	5400	0	0	53	tneufeld	alan			\N	2017-07-06	2017-07-27	4341	31	\N	agongora	0		\N	\N	tneufeld	2017-07-06 09:28:47.687	7	4341	0	1
52341	1044	2017-06-15	19080	9000	0	39	tneufeld	william			\N	2017-06-15	2017-07-06	16297	53	\N	cmartinez	0		\N	\N	tneufeld	2017-06-15 08:15:59.327	7	16297	0	1
52405	1054	2017-07-10	10080	0	0	45	tneufeld	jake			\N	2017-07-10	2017-07-31	4774	150	\N	cmartinez	0		\N	\N	tneufeld	2017-07-10 09:48:23.64	6	9283	4509	2
52355	1040	2017-06-19	11520	5400	0	62	tneufeld	charlie			\N	2017-06-19	2017-07-10	8338	294	\N	cmartinez	0		\N	\N	tneufeld	2017-06-19 10:32:45.546	1	8338	0	1
52351	1041	2017-06-19	11880	5760	0	55	tneufeld	galen			\N	2017-06-19	2017-07-10	8978	103	\N	cmartinez	0		\N	\N	tneufeld	2017-06-19 09:50:18.687	7	8978	0	1
52350	1042	2017-06-19	7920	3600	0	50	tneufeld	allan			\N	2017-06-19	2017-07-10	5825	58	\N	cmartinez	0		\N	\N	tneufeld	2017-06-19 09:43:01.265	7	5825	0	1
52353	1047	2017-06-19	20160	9000	0	33	tneufeld	tim			\N	2017-06-19	2017-07-10	17639	71	\N	cmartinez	0		\N	\N	tneufeld	2017-06-19 10:08:40.577	2	17639	0	1
52354	1048	2017-06-19	6120	2160	0	28	tneufeld	mark			\N	2017-06-19	2017-07-10	5121	30	\N	cmartinez	0		\N	\N	tneufeld	2017-06-19 10:15:59.952	1	5121	0	1
52361	1040	2017-06-22	11880	2160	0	63	tneufeld	kenton			\N	2017-06-22	2017-07-13	8899	301	\N	cmartinez	0		\N	\N	tneufeld	2017-06-22 10:30:11.962	1	8899	0	1
52357	1042	2017-06-22	7920	1980	0	51	tneufeld	allan			\N	2017-06-22	2017-07-13	6678	42	\N	cmartinez	0		\N	\N	tneufeld	2017-06-22 09:27:04.665	7	6678	0	1
52359	1043	2017-06-22	19080	3240	0	46	tneufeld	richard			\N	2017-06-22	2017-07-13	16341	85	\N	cmartinez	0		\N	\N	tneufeld	2017-06-22 09:54:14.071	7	16341	0	1
52356	1044	2017-06-22	19440	3600	0	40	tneufeld	william			\N	2017-06-22	2017-07-13	17306	102	\N	cmartinez	0		\N	\N	tneufeld	2017-06-22 08:10:49.274	7	17306	0	1
52363	1048	2017-06-22	6120	0	0	29	tneufeld	tina			\N	2017-06-22	2017-07-13	5122	22	\N	cmartinez	0		\N	\N	tneufeld	2017-06-22 11:16:41.384	1	5122	0	1
52358	1054	2017-06-22	4320	0	0	43	tneufeld	jake			\N	2017-06-22	2017-07-13	1794	23	\N	cmartinez	0		\N	\N	tneufeld	2017-06-22 09:47:03.337	6	3563	1769	2
52369	1040	2017-06-26	11520	2160	0	63	tneufeld	kenton			\N	2017-06-26	2017-07-17	8681	90	\N	agongora	0		\N	\N	tneufeld	2017-06-26 09:50:49.821	1	8681	0	1
52367	1042	2017-06-26	7920	1440	0	51	tneufeld	allan	fix 1080		\N	2017-06-26	2017-07-17	6367	32	\N	agongora	0		\N	\N	tneufeld	2017-06-26 08:50:05.477	7	6367	0	1
52364	1044	2017-06-26	18720	3240	0	40	tneufeld	william			\N	2017-06-26	2017-07-17	16479	22	\N	agongora	0		\N	\N	tneufeld	2017-06-26 08:05:05.586	7	16479	0	1
52371	1048	2017-06-26	4320	2160	0	29	tneufeld	mark			\N	2017-06-26	2017-07-17	3771	6	\N	agongora	0		\N	\N	tneufeld	2017-06-26 10:14:55.258	1	3771	0	1
52373	1054	2017-06-29	5760	0	0	44	tneufeld	jake			\N	2017-06-29	2017-07-20	2392	25	\N	agongora	0		\N	\N	tneufeld	2017-06-29 08:30:29.155	6	4708	2316	2
52376	1040	2017-06-29	10080	0	0	64	tneufeld	kenton			\N	2017-06-29	2017-07-20	7545	69	\N	agongora	0		\N	\N	tneufeld	2017-06-29 09:10:23.687	1	7545	0	1
52375	1042	2017-06-29	7200	0	0	52	tneufeld	allan			\N	2017-06-29	2017-07-20	5937	50	\N	agongora	0		\N	\N	tneufeld	2017-06-29 08:40:24.249	7	5937	0	1
52377	1043	2017-06-29	16200	0	0	47	tneufeld	vange			\N	2017-06-29	2017-07-20	14190	51	\N	agongora	0		\N	\N	tneufeld	2017-06-29 09:17:48.687	7	14190	0	1
52372	1044	2017-06-29	17280	0	0	41	tneufeld	william			\N	2017-06-29	2017-07-20	15187	28	\N	agongora	0		\N	\N	tneufeld	2017-06-29 08:12:08.577	7	15187	0	1
52378	1048	2017-06-29	7020	0	0	30	tneufeld	mark			\N	2017-06-29	2017-07-20	5674	18	\N	agongora	0		\N	\N	tneufeld	2017-06-29 09:28:11.609	1	5674	0	1
52366	1054	2017-06-26	5760	0	0	43	tneufeld	jake			\N	2017-06-26	2017-07-17	2318	100	\N	admin	0		\N	\N	tneufeld	2017-06-26 08:15:00.992	6	4593	2275	2
52386	1040	2017-07-03	10980	0	0	64	tneufeld	kenton			\N	2017-07-03	2017-07-24	8284	58	\N	agongora	0		\N	\N	tneufeld	2017-07-03 09:57:25.702	1	8284	0	1
52381	1041	2017-07-03	11520	0	0	57	tneufeld	jake			\N	2017-07-03	2017-07-24	8803	50	\N	agongora	0		\N	\N	tneufeld	2017-07-03 08:09:58.921	7	8803	0	1
52385	1043	2017-07-03	17100	0	0	47	tneufeld	richard	fix 9900		\N	2017-07-03	2017-07-24	14709	90	\N	agongora	0		\N	\N	tneufeld	2017-07-03 09:42:48.905	7	14709	0	1
52384	1047	2017-07-03	19440	0	0	35	tneufeld	tim	fix 19080		\N	2017-07-03	2017-07-24	17231	42	\N	agongora	0		\N	\N	tneufeld	2017-07-03 09:36:02.202	2	17231	0	1
52397	1040	2017-07-06	1980	0	1980	65	tneufeld	louis			\N	2017-07-06	2017-07-27	1430	35	\N	agongora	0		\N	\N	tneufeld	2017-07-06 14:05:49.312	1	1430	0	1
52389	1041	2017-07-06	8460	0	0	58	tneufeld	jake	fix 9180		\N	2017-07-06	2017-07-27	6422	40	\N	agongora	0		\N	\N	tneufeld	2017-07-06 08:17:54.687	7	6422	0	1
52399	1042	2017-07-06	1260	0	1260	53	tneufeld	alan			\N	2017-07-06	2017-07-27	1115	8	\N	agongora	0		\N	\N	tneufeld	2017-07-06 14:32:04.89	7	1115	0	1
52391	1043	2017-07-06	12600	0	0	48	tneufeld	vange 			\N	2017-07-06	2017-07-27	11149	45	\N	agongora	0		\N	\N	tneufeld	2017-07-06 08:47:05.452	7	11149	0	1
52388	1044	2017-07-06	13680	0	0	42	tneufeld	william			\N	2017-07-06	2017-07-27	11956	37	\N	agongora	0		\N	\N	tneufeld	2017-07-06 07:56:36.89	7	11956	0	1
52396	1044	2017-07-06	3960	0	3960	42	tneufeld	william			\N	2017-07-06	2017-07-27	3484	0	\N	agongora	0		\N	\N	tneufeld	2017-07-06 13:48:51.077	7	3484	0	1
52390	1047	2017-07-06	14220	0	0	36	tneufeld	tim			\N	2017-07-06	2017-07-27	12473	83	\N	agongora	0		\N	\N	tneufeld	2017-07-06 08:27:23.859	2	12473	0	1
52395	1047	2017-07-06	3600	0	3600	36	tneufeld	tim			\N	2017-07-06	2017-07-27	3236	12	\N	agongora	0		\N	\N	tneufeld	2017-07-06 13:36:17.937	2	3236	0	1
52380	1054	2017-07-03	3240	0	0	44	tneufeld	jake			\N	2017-07-03	2017-07-24	1373	15	\N	agongora	0		\N	\N	tneufeld	2017-07-03 08:05:55.843	6	2625	1252	2
52404	1040	2017-07-10	8640	0	0	65	tneufeld	louis			\N	2017-07-10	2017-07-31	6532	156	\N	cmartinez	0		\N	\N	tneufeld	2017-07-10 09:28:14.984	1	6532	0	1
52410	1040	2017-07-10	2340	0	2340	65	tneufeld	louis			\N	2017-07-10	2017-07-31	1697	54	\N	cmartinez	0		\N	\N	tneufeld	2017-07-10 14:13:23.624	1	1697	0	1
52409	1043	2017-07-10	3420	0	3420	48	tneufeld	richard			\N	2017-07-10	2017-07-31	2889	8	\N	cmartinez	0		\N	\N	tneufeld	2017-07-10 14:12:26.593	7	2889	0	1
52402	1044	2017-07-10	14760	0	0	42	tneufeld	william			\N	2017-07-10	2017-07-31	13073	90	\N	cmartinez	0		\N	\N	tneufeld	2017-07-10 08:11:22.577	7	13073	0	1
52408	1044	2017-07-10	3600	0	3600	42	dthiessen	WIlliam			\N	2017-07-10	2017-07-31	3068	0	\N	cmartinez	0		\N	\N	tneufeld	2017-07-10 13:48:55.093	7	3068	0	1
52406	1048	2017-07-10	6840	0	0	31	tneufeld	tina	fix 7200		\N	2017-07-10	2017-07-31	5883	20	\N	cmartinez	0		\N	\N	tneufeld	2017-07-10 10:03:56.28	1	5883	0	1
52413	1054	2017-07-10	1800	0	0	45	tneufeld	JAKE			\N	2017-07-10	\N	\N	\N	\N	\N	\N	\N	\N	\N	tneufeld	2017-07-10 14:20:44.874	6	\N	\N	2
52411	1047	2017-07-10	3600	0	3600	36	tneufeld	tim			\N	2017-07-10	2017-07-31	3236	13	\N	cmartinez	0		\N	\N	tneufeld	2017-07-10 14:14:14.718	2	3236	0	1
52348	1054	2017-06-19	7200	0	0	42	tneufeld	jake			\N	2017-06-19	2017-07-10	2954	90	\N	cmartinez	0		\N	\N	tneufeld	2017-06-19 08:10:45.499	6	5735	2781	2
52349	1044	2017-06-19	18360	9000	0	39	tneufeld	william			\N	2017-06-19	2017-07-10	16010	63	\N	cmartinez	0		\N	\N	tneufeld	2017-06-19 08:36:55.655	7	16010	0	1
52415	1042	2017-07-10	1440	0	1440	53	dthiessen	Allan			\N	2017-07-10	2017-07-31	1255	8	\N	cmartinez	0		\N	\N	dthiessen	2017-07-11 09:01:31.765	7	1255	0	1
52418	1047	2017-07-13	5040	5760	0	37	tneufeld	abram	added home		\N	2017-07-13	2017-08-03	4300	23	\N	cmartinez	0		\N	\N	tneufeld	2017-07-13 08:30:13.968	2	4300	0	1
52420	1042	2017-07-13	1800	2340	0	54	tneufeld	allan			\N	2017-07-13	2017-08-03	1465	7	\N	cmartinez	0		\N	\N	tneufeld	2017-07-13 08:45:36.046	7	1465	0	1
52419	1048	2017-07-13	1800	3600	0	32	tneufeld	mark			\N	2017-07-13	2017-08-03	1566	3	\N	cmartinez	0		\N	\N	tneufeld	2017-07-13 08:37:25.499	1	1566	0	1
52362	1041	2017-06-22	12600	1980	0	56	tneufeld	galen			\N	2017-06-22	2017-07-13	9537	60	\N	cmartinez	0		\N	\N	tneufeld	2017-06-22 10:32:15.29	7	9537	0	1
52360	1047	2017-06-22	20520	3060	0	34	tneufeld	gerry			\N	2017-06-22	2017-07-13	18161	114	\N	cmartinez	0		\N	\N	tneufeld	2017-06-22 10:04:08.228	2	18161	0	1
52431	1041	2017-07-17	11520	2700	0	59	tneufeld	galen 			\N	2017-07-17	2017-08-07	8465	115	\N	cmartinez	0		\N	\N	tneufeld	2017-07-17 09:55:53.118	7	8465	0	1
52365	1041	2017-06-26	11520	2520	0	56	tneufeld	jake			\N	2017-06-26	2017-07-17	8460	29	\N	agongora	0		\N	\N	tneufeld	2017-06-26 08:14:37.789	7	8460	0	1
52370	1047	2017-06-26	19080	3240	0	34	tneufeld	tim			\N	2017-06-26	2017-07-17	16700	13	\N	agongora	0		\N	\N	tneufeld	2017-06-26 10:01:01.164	2	16700	0	1
52374	1041	2017-06-29	11160	0	0	57	tneufeld	jake			\N	2017-06-29	2017-07-20	8592	65	\N	agongora	0		\N	\N	tneufeld	2017-06-29 08:30:52.859	7	8592	0	1
52379	1047	2017-06-29	17640	0	0	35	tneufeld	margaret			\N	2017-06-29	2017-07-20	15158	40	\N	agongora	0		\N	\N	tneufeld	2017-06-29 09:59:11.468	2	15158	0	1
52443	1041	2017-07-24	10980	0	0	60	tneufeld	galen			\N	2017-07-24	2017-08-14	7707	62	\N	cmanzanero	0		\N	\N	tneufeld	2017-07-24 08:33:59.258	7	7707	0	1
52383	1042	2017-07-03	7380	0	0	52	tneufeld	allan			\N	2017-07-03	2017-07-24	6115	22	\N	agongora	0		\N	\N	tneufeld	2017-07-03 09:28:36.359	7	6115	0	1
52387	1048	2017-07-03	6480	0	0	30	dthiessen	Mark			\N	2017-07-03	2017-07-24	5710	15	\N	agongora	0		\N	\N	tneufeld	2017-07-03 10:10:39.952	1	5710	0	1
52400	1041	2017-07-06	2340	0	2340	58	tneufeld	jake			\N	2017-07-06	2017-07-27	1814	17	\N	agongora	0		\N	\N	tneufeld	2017-07-06 14:45:45.89	7	1814	0	1
52398	1043	2017-07-06	3060	0	3060	48	tneufeld	vange			\N	2017-07-06	2017-07-27	2543	27	\N	agongora	0		\N	\N	tneufeld	2017-07-06 14:16:23.062	7	2543	0	1
52394	1048	2017-07-06	5220	0	0	31	dthiessen	Edward Reimer			\N	2017-07-06	2017-07-27	4520	15	\N	agongora	0		\N	\N	dthiessen	2017-07-06 11:18:16.905	1	4520	0	1
52403	1043	2017-07-10	13320	0	0	48	tneufeld	richard	\N		\N	2017-07-10	2017-07-31	11369	46	\N	cmartinez	0		\N	\N	tneufeld	2017-07-10 08:41:06.499	7	11369	0	1
52417	1041	2017-07-13	2880	3060	0	58	tneufeld	galen	fix 2017-07-10		\N	2017-07-13	2017-08-03	2288	7	\N	cmartinez	0		\N	\N	tneufeld	2017-07-13 07:49:31.343	7	2288	0	1
52421	1043	2017-07-13	4320	5400	0	49	tneufeld	richard			\N	2017-07-13	2017-08-03	3773	14	\N	cmartinez	0		\N	\N	tneufeld	2017-07-13 09:08:24.062	7	3773	0	1
52424	1027	2017-07-13	41400	0	0	36	tneufeld	ocean		619	\N	2017-07-13	2017-08-03	33441	265	\N	cmartinez	0		\N	\N	tneufeld	2017-07-13 09:31:01.765	4	33441	0	1
52423	1027	2017-07-13	15480	0	0	40	tneufeld	ocean		608	\N	2017-07-13	2017-08-03	13168	60	\N	cmartinez	0		\N	\N	tneufeld	2017-07-13 09:30:27.64	4	13168	0	1
52426	1054	2017-07-17	6480	0	0	46	tneufeld	jake 			\N	2017-07-17	2017-08-07	2708	71	\N	cmartinez	0		\N	\N	tneufeld	2017-07-17 07:49:46.539	6	5297	2589	2
52428	1040	2017-07-17	6300	1440	0	66	tneufeld	louis	fix 2700		\N	2017-07-17	2017-08-07	4504	42	\N	cmartinez	0		\N	\N	tneufeld	2017-07-17 08:41:22.118	1	4504	0	1
52429	1043	2017-07-17	17820	3960	0	49	tneufeld	vange			\N	2017-07-17	2017-08-07	14761	113	\N	cmartinez	0		\N	\N	tneufeld	2017-07-17 09:34:05.774	7	14761	0	1
52427	1044	2017-07-17	18900	3960	0	43	tneufeld	william			\N	2017-07-17	2017-08-07	15954	65	\N	cmartinez	0		\N	\N	tneufeld	2017-07-17 08:21:15.586	7	15954	0	1
52433	1047	2017-07-17	19980	4500	0	37	tneufeld	abram			\N	2017-07-17	2017-08-07	17730	15	\N	cmartinez	0		\N	\N	tneufeld	2017-07-17 10:49:52.008	2	17730	0	1
52439	1040	2017-07-20	5760	0	0	67	tneufeld	kenton			\N	2017-07-20	2017-08-10	3884	64	\N	cmartinez	0		\N	\N	tneufeld	2017-07-20 10:00:26.446	1	3884	0	1
52436	1041	2017-07-20	10980	0	0	60	tneufeld	jake			\N	2017-07-20	2017-08-10	8115	117	\N	cmartinez	0		\N	\N	tneufeld	2017-07-20 09:15:32.727	7	8115	0	1
52438	1042	2017-07-20	7380	0	0	55	tneufeld	allan			\N	2017-07-20	2017-08-10	6162	64	\N	cmartinez	0		\N	\N	tneufeld	2017-07-20 09:35:32.789	7	6162	0	1
52434	1044	2017-07-20	17640	0	0	44	tneufeld	emory			\N	2017-07-20	2017-08-10	15361	84	\N	cmartinez	0		\N	\N	tneufeld	2017-07-20 08:29:34.883	7	15361	0	1
52440	1047	2017-07-20	18540	0	0	38	tneufeld	abram 			\N	2017-07-20	2017-08-10	16513	32	\N	cmartinez	0		\N	\N	tneufeld	2017-07-20 10:37:26.321	2	16513	0	1
52435	1048	2017-07-20	7740	0	0	33	tneufeld	mark			\N	2017-07-20	2017-08-10	6372	40	\N	cmartinez	0		\N	\N	tneufeld	2017-07-20 09:06:18.493	1	6372	0	1
52446	1042	2017-07-24	7020	0	0	55	tneufeld	allan			\N	2017-07-24	2017-08-14	5697	75	\N	cmartinez	0		\N	\N	tneufeld	2017-07-24 09:47:27.305	7	5697	0	1
52445	1043	2017-07-24	15840	0	0	50	dthiessen	Vange			\N	2017-07-24	2017-08-14	12380	180	\N	cmartinez	0		\N	\N	tneufeld	2017-07-24 09:40:20.133	7	12380	0	1
52441	1044	2017-07-24	18000	0	0	44	tneufeld	william			\N	2017-07-24	2017-08-14	15113	64	\N	cmartinez	0		\N	\N	tneufeld	2017-07-24 08:08:40.305	7	15113	0	1
52442	1048	2017-07-24	6840	0	0	33	tneufeld	carson			\N	2017-07-24	2017-08-14	5934	51	\N	cmartinez	0		\N	\N	tneufeld	2017-07-24 08:26:31.773	1	5934	0	1
52455	1040	2017-07-27	2880	0	0	68	tneufeld	louis			\N	2017-07-27	2017-08-17	2135	35	\N	cmartinez	0		\N	\N	tneufeld	2017-07-27 09:38:00.68	1	2135	0	1
52449	1041	2017-07-27	2880	5220	0	61	tneufeld	galen			\N	2017-07-27	2017-08-17	2084	37	\N	cmartinez	0		\N	\N	tneufeld	2017-07-27 07:41:16.461	7	2084	0	1
52451	1043	2017-07-27	3780	8100	0	51	tneufeld	richard			\N	2017-07-27	2017-08-17	3112	35	\N	cmartinez	0		\N	\N	tneufeld	2017-07-27 07:54:48.836	7	3112	0	1
52450	1044	2017-07-27	4500	9000	0	45	tneufeld	william			\N	2017-07-27	2017-08-17	3904	22	\N	cmartinez	0		\N	\N	tneufeld	2017-07-27 07:50:27.898	7	3904	0	1
52453	1047	2017-07-27	4680	9000	0	39	tneufeld	tim			\N	2017-07-27	2017-08-17	4170	63	\N	cmartinez	0		\N	\N	tneufeld	2017-07-27 09:05:51.523	2	4170	0	1
52456	1049	2017-07-27	180	0	0	21	tneufeld	otto			\N	2017-07-27	2017-08-17	116	0	\N	cmartinez	0		\N	\N	tneufeld	2017-07-27 09:57:15.445	2	116	0	1
52448	1054	2017-07-27	13680	0	0	48	tneufeld	jake			\N	2017-07-27	2017-08-17	5634	120	\N	cmartinez	0		\N	\N	tneufeld	2017-07-27 07:34:50.226	6	11213	5579	2
52458	1054	2017-07-31	8640	0	0	48	tneufeld	gallen			\N	2017-07-31	2017-08-21	3525	80	\N	cmartinez	0		\N	\N	tneufeld	2017-07-31 08:58:09.351	6	7057	3532	2
52460	1042	2017-07-31	8820	1800	0	56	tneufeld	allan			\N	2017-07-31	2017-08-21	6810	83	\N	cmartinez	0		\N	\N	tneufeld	2017-07-31 09:10:26.038	7	6810	0	1
52457	1044	2017-07-31	21960	4320	0	45	tneufeld	wiliam			\N	2017-07-31	2017-08-21	17719	117	\N	cmartinez	0		\N	\N	tneufeld	2017-07-31 08:43:19.117	7	17719	0	1
52462	1047	2017-07-31	23040	4500	0	39	tneufeld	tim			\N	2017-07-31	2017-08-21	20018	152	\N	cmartinez	0		\N	\N	tneufeld	2017-07-31 10:10:35.273	2	20018	0	1
52414	1041	2017-07-10	9000	0	0	58	dthiessen	Galen			\N	2017-07-10	2017-07-31	6428	68	\N	cmartinez	0		\N	\N	tneufeld	2017-07-10 14:23:17.999	7	6428	0	1
52412	1041	2017-07-10	2520	0	2520	58	tneufeld	JAKE	\N		\N	2017-07-10	2017-07-31	2361	13	\N	cmartinez	0		\N	\N	tneufeld	2017-07-10 14:20:11.109	7	2361	0	1
52401	1042	2017-07-10	6120	0	0	53	tneufeld	allan			\N	2017-07-10	2017-07-31	5026	34	\N	cmartinez	0		\N	\N	tneufeld	2017-07-10 07:36:32.859	7	5026	0	1
52407	1047	2017-07-10	15840	0	0	36	tneufeld	abram			\N	2017-07-10	2017-07-31	14190	50	\N	cmartinez	0		\N	\N	tneufeld	2017-07-10 10:27:49.171	2	14190	0	1
52425	1040	2017-07-13	2520	1800	0	66	tneufeld	louis			\N	2017-07-13	2017-08-03	1973	26	\N	cmartinez	0		\N	\N	tneufeld	2017-07-13 09:45:01.984	1	1973	0	1
52416	1044	2017-07-13	4680	5040	0	42	tneufeld	william	fix 2017-07-10		\N	2017-07-13	2017-08-03	4036	23	\N	cmartinez	0		\N	\N	tneufeld	2017-07-13 07:42:29.296	7	4036	0	1
52422	1027	2017-07-13	11520	0	0	44	tneufeld	ocean		590	\N	2017-07-13	2017-08-03	9353	50	\N	cmartinez	0		\N	\N	tneufeld	2017-07-13 09:29:55.577	4	9353	0	1
52430	1042	2017-07-17	8100	1800	0	54	tneufeld	allan			\N	2017-07-17	2017-08-07	6684	42	\N	cmartinez	0		\N	\N	tneufeld	2017-07-17 09:38:11.899	7	6684	0	1
52432	1048	2017-07-17	7560	2700	0	32	tneufeld	tina			\N	2017-07-17	2017-08-07	6051	19	\N	cmartinez	0		\N	\N	tneufeld	2017-07-17 10:28:18.133	1	6051	0	1
52437	1043	2017-07-20	16200	0	0	50	tneufeld	richard			\N	2017-07-20	2017-08-10	13519	117	\N	cmartinez	0		\N	\N	tneufeld	2017-07-20 09:25:30.414	7	13519	0	1
52444	1040	2017-07-24	5580	0	0	67	tneufeld	louis	fix 18180		\N	2017-07-24	2017-08-14	4024	136	\N	cmartinez	0		\N	\N	tneufeld	2017-07-24 09:30:06.726	1	4024	0	1
52447	1047	2017-07-24	18720	0	0	38	tneufeld	abram			\N	2017-07-24	2017-08-14	16746	166	\N	cmartinez	0		\N	\N	tneufeld	2017-07-24 10:14:29.758	2	16746	0	1
52508	1043	2017-08-14	19980	3600	0	53	tneufeld	richard			\N	2017-08-14	2017-09-04	14956	109	\N	agongora	0		\N	\N	tneufeld	2017-08-14 10:03:48.538	7	14956	0	1
52504	1044	2017-08-14	21960	3960	0	47	tneufeld	william			\N	2017-08-14	2017-09-04	17849	68	\N	agongora	0		\N	\N	tneufeld	2017-08-14 08:38:05.851	7	17849	0	1
52510	1049	2017-08-14	4500	2880	0	24	tneufeld	otto			\N	2017-08-14	2017-09-04	3460	33	\N	agongora	0		\N	\N	tneufeld	2017-08-14 11:28:17.069	2	3460	0	1
52466	1027	2017-07-27	22320	0	0	42	dthiessen	ocean		608	\N	2017-07-27	2017-08-17	18079	62	\N	cmartinez	0		\N	\N	dthiessen	2017-08-01 09:32:10.445	4	18079	0	1
52465	1027	2017-07-27	9720	0	0	46	dthiessen	ocean		590	\N	2017-07-27	2017-08-17	7790	44	\N	cmartinez	0		\N	\N	dthiessen	2017-08-01 09:31:45.023	4	7790	0	1
52463	1043	2017-07-31	19800	3960	0	51	tneufeld	richard			\N	2017-07-31	2017-08-21	15537	124	\N	cmartinez	0		\N	\N	tneufeld	2017-07-31 10:17:28.601	7	15537	0	1
52464	1049	2017-07-31	360	0	0	22	tneufeld	otto			\N	2017-07-31	2017-08-21	261	0	\N	cmartinez	0		\N	\N	tneufeld	2017-07-31 10:23:19.617	2	261	0	1
52476	1041	2017-08-03	10620	0	0	62	tneufeld	galen			\N	2017-08-03	2017-08-24	7378	102	\N	cmartinez	0		\N	\N	tneufeld	2017-08-03 10:20:16.538	7	7378	0	1
52494	1041	2017-08-03	2340	0	2340	62	dthiessen	Jake			\N	2017-08-03	2017-08-24	1488	33	\N	cmartinez	0		\N	\N	dthiessen	2017-08-07 16:02:34.101	7	1488	0	1
52473	1042	2017-08-03	7200	0	0	57	tneufeld	allan			\N	2017-08-03	2017-08-24	5854	20	\N	cmartinez	0		\N	\N	tneufeld	2017-08-03 09:11:48.788	7	5854	0	1
52474	1043	2017-08-03	15660	0	0	52	tneufeld	vange 			\N	2017-08-03	2017-08-24	12856	43	\N	cmartinez	0		\N	\N	tneufeld	2017-08-03 09:25:21.476	7	12856	0	1
52479	1043	2017-08-03	2520	0	2520	52	tneufeld	vange 			\N	2017-08-03	2017-08-24	2260	40	\N	cmartinez	0		\N	\N	tneufeld	2017-08-03 13:54:30.882	7	2260	0	1
52470	1044	2017-08-03	17460	0	0	46	tneufeld	william			\N	2017-08-03	2017-08-24	15194	72	\N	cmartinez	0		\N	\N	tneufeld	2017-08-03 08:33:22.867	7	15194	0	1
52471	1047	2017-08-03	17820	0	0	40	tneufeld	abram			\N	2017-08-03	2017-08-24	15644	127	\N	cmartinez	0		\N	\N	tneufeld	2017-08-03 08:53:00.663	2	15644	0	1
52478	1047	2017-08-03	3420	0	3420	40	tneufeld	tim			\N	2017-08-03	2017-08-24	3094	4	\N	cmartinez	0		\N	\N	tneufeld	2017-08-03 13:44:03.117	2	3094	0	1
52472	1048	2017-08-03	6660	0	0	35	tneufeld	mark			\N	2017-08-03	2017-08-24	5516	74	\N	cmartinez	0		\N	\N	tneufeld	2017-08-03 09:02:29.57	1	5516	0	1
52484	1041	2017-08-07	8280	0	0	62	tneufeld	gallen			\N	2017-08-07	2017-08-28	5506	60	\N	agongora	0		\N	\N	tneufeld	2017-08-07 08:22:04.71	7	5506	0	1
52495	1041	2017-08-07	2160	0	2160	62	dthiessen	Jake			\N	2017-08-07	2017-08-28	1416	13	\N	agongora	0		\N	\N	dthiessen	2017-08-07 16:04:50.226	7	1416	0	1
52481	1042	2017-08-07	5760	0	0	57	tneufeld	allan			\N	2017-08-07	2017-08-28	4470	72	\N	agongora	0		\N	\N	tneufeld	2017-08-07 07:47:35.507	7	4470	0	1
52486	1043	2017-08-07	12960	0	0	52	tneufeld	vange 			\N	2017-08-07	2017-08-28	9269	121	\N	agongora	0		\N	\N	tneufeld	2017-08-07 10:06:43.195	7	9269	0	1
52489	1043	2017-08-07	2520	0	2520	52	tneufeld	vange			\N	2017-08-07	2017-08-28	1972	27	\N	agongora	0		\N	\N	tneufeld	2017-08-07 13:50:07.117	7	1972	0	1
52482	1044	2017-08-07	13680	0	0	46	tneufeld	william			\N	2017-08-07	2017-08-28	11627	245	\N	agongora	0		\N	\N	tneufeld	2017-08-07 07:59:51.335	7	11627	0	1
52485	1047	2017-08-07	14580	0	0	40	tneufeld	tim			\N	2017-08-07	2017-08-28	12771	130	\N	agongora	0		\N	\N	tneufeld	2017-08-07 08:36:38.867	2	12771	0	1
52491	1047	2017-08-07	2880	0	2880	40	tneufeld	tim			\N	2017-08-07	2017-08-28	2212	70	\N	agongora	0		\N	\N	tneufeld	2017-08-07 14:13:02.929	2	2212	0	1
52487	1048	2017-08-07	6840	0	0	35	tneufeld	mark			\N	2017-08-07	2017-08-28	5799	54	\N	agongora	0		\N	\N	tneufeld	2017-08-07 10:31:17.71	1	5799	0	1
52492	1048	2017-08-07	1440	0	1440	35	tneufeld	mark			\N	2017-08-07	2017-08-28	1115	10	\N	agongora	0		\N	\N	tneufeld	2017-08-07 15:37:18.382	1	1115	0	1
52503	1054	2017-08-14	7920	0	0	50	tneufeld	jake			\N	2017-08-14	2017-09-04	3213	55	\N	agongora	0		\N	\N	tneufeld	2017-08-14 07:50:17.538	6	6363	3150	2
52502	1027	2017-08-10	7560	0	0	34	tneufeld	ship		631	\N	2017-08-10	2017-08-31	6585	15	\N	agongora	0		\N	\N	tneufeld	2017-08-10 15:14:08.085	4	6585	0	1
52501	1027	2017-08-10	12960	0	0	34	tneufeld	ship		630	\N	2017-08-10	2017-08-31	10875	77	\N	agongora	0		\N	\N	tneufeld	2017-08-10 15:13:34.867	4	10875	0	1
52499	1027	2017-08-10	22320	0	0	44	tneufeld	ship		611	\N	2017-08-10	2017-08-31	18766	59	\N	agongora	0		\N	\N	tneufeld	2017-08-10 15:12:38.976	4	18766	0	1
52498	1027	2017-08-10	8640	0	0	44	tneufeld	ship		609	\N	2017-08-10	2017-08-31	6956	62	\N	agongora	0		\N	\N	tneufeld	2017-08-10 15:12:14.648	4	6956	0	1
52497	1027	2017-08-10	7920	0	0	44	tneufeld	ship		608	\N	2017-08-10	2017-08-31	5860	27	\N	agongora	0		\N	\N	tneufeld	2017-08-10 15:11:51.163	4	5860	0	1
52483	1054	2017-08-07	7920	0	0	49	tneufeld	jake			\N	2017-08-07	2017-08-28	3206	60	\N	agongora	0		\N	\N	tneufeld	2017-08-07 08:09:52.257	6	6426	3220	2
52509	1041	2017-08-14	13320	2520	0	63	tneufeld	jake	added home		\N	2017-08-14	2017-09-04	8739	42	\N	agongora	0		\N	\N	tneufeld	2017-08-14 10:12:35.101	7	8739	0	1
52507	1047	2017-08-14	23760	4500	0	41	tneufeld	tim			\N	2017-08-14	2017-09-04	20841	65	\N	agongora	0		\N	\N	tneufeld	2017-08-14 09:57:23.819	2	20841	0	1
52505	1048	2017-08-14	8640	1620	0	36	tneufeld	anton	added home		\N	2017-08-14	2017-09-04	7417	53	\N	agongora	0		\N	\N	tneufeld	2017-08-14 08:44:31.444	1	7417	0	1
52513	1043	2017-08-17	14760	0	0	54	tneufeld	vange			\N	2017-08-17	2017-09-07	11992	70	\N	agongora	0		\N	\N	tneufeld	2017-08-17 09:03:19.398	7	11992	0	1
52514	1054	2017-08-17	10800	0	0	51	tneufeld	galen			\N	2017-08-17	2017-09-07	4294	93	\N	agongora	0		\N	\N	tneufeld	2017-08-17 09:19:45.616	6	8336	4042	2
52511	1044	2017-08-17	15840	0	0	48	tneufeld	william			\N	2017-08-17	2017-09-07	13643	22	\N	agongora	0		\N	\N	tneufeld	2017-08-17 08:14:35.444	7	13643	0	1
52516	1048	2017-08-17	6480	0	0	37	tneufeld	tina 			\N	2017-08-17	2017-09-07	5443	38	\N	agongora	0		\N	\N	tneufeld	2017-08-17 09:58:58.241	1	5443	0	1
52452	1042	2017-07-27	1800	3600	0	56	tneufeld	allan			\N	2017-07-27	2017-08-17	1522	10	\N	cmartinez	0		\N	\N	tneufeld	2017-07-27 08:53:24.898	7	1522	0	1
52454	1048	2017-07-27	1800	3240	0	34	tneufeld	carson			\N	2017-07-27	2017-08-17	1619	8	\N	cmartinez	0		\N	\N	tneufeld	2017-07-27 09:12:15.336	1	1619	0	1
52468	1027	2017-07-27	36360	0	0	38	dthiessen	ocean		619	\N	2017-07-27	2017-08-17	27548	235	\N	cmartinez	0		\N	\N	dthiessen	2017-08-01 09:32:59.773	4	27548	0	1
52467	1027	2017-07-27	21600	0	0	42	dthiessen	ocean		609	\N	2017-07-27	2017-08-17	17922	105	\N	cmartinez	0		\N	\N	dthiessen	2017-08-01 09:32:35.976	4	17922	0	1
52459	1041	2017-07-31	13320	2700	0	61	tneufeld	gallen			\N	2017-07-31	2017-08-21	9295	74	\N	cmartinez	0		\N	\N	tneufeld	2017-07-31 08:58:24.476	7	9295	0	1
52461	1048	2017-07-31	8640	0	0	34	tneufeld	mark			\N	2017-07-31	2017-08-21	7281	60	\N	cmartinez	0		\N	\N	tneufeld	2017-07-31 09:51:06.117	1	7281	0	1
52527	1044	2017-08-24	3960	8280	0	49	tneufeld	william			\N	2017-08-24	2017-09-14	3333	27	\N	cmartinez	0		\N	\N	tneufeld	2017-08-24 07:43:22.71	7	3333	0	1
52535	1049	2017-08-24	3420	6840	0	25	tneufeld	otto			\N	2017-08-24	2017-09-14	3011	12	\N	cmartinez	0		\N	\N	tneufeld	2017-08-24 10:30:55.475	2	3011	0	1
52480	1042	2017-08-03	1260	0	1260	57	tneufeld	allen			\N	2017-08-03	2017-08-24	1039	4	\N	cmartinez	0		\N	\N	tneufeld	2017-08-03 14:26:20.195	7	1039	0	1
52477	1044	2017-08-03	2880	0	2880	46	tneufeld	william			\N	2017-08-03	2017-08-24	2442	16	\N	cmartinez	0		\N	\N	tneufeld	2017-08-03 13:40:09.882	7	2442	0	1
52475	1049	2017-08-03	900	0	0	22	tneufeld	otto			\N	2017-08-03	2017-08-24	681	4	\N	cmartinez	0		\N	\N	tneufeld	2017-08-03 09:29:29.695	2	681	0	1
52469	1054	2017-08-03	6840	0	0	49	tneufeld	jake 			\N	2017-08-03	2017-08-24	2923	14	\N	cmartinez	0		\N	\N	tneufeld	2017-08-03 08:07:07.398	6	5656	2733	2
52493	1042	2017-08-07	1800	0	1800	57	tneufeld	allan			\N	2017-08-07	2017-08-28	1464	26	\N	agongora	0		\N	\N	tneufeld	2017-08-07 15:59:13.398	7	1464	0	1
52490	1044	2017-08-07	3600	0	3600	46	tneufeld	william			\N	2017-08-07	2017-08-28	2608	68	\N	agongora	0		\N	\N	tneufeld	2017-08-07 14:04:27.007	7	2608	0	1
52488	1049	2017-08-07	2160	0	0	23	tneufeld	otto			\N	2017-08-07	2017-08-28	1387	5	\N	agongora	0		\N	\N	tneufeld	2017-08-07 10:48:10.804	2	1387	0	1
52500	1027	2017-08-10	42480	0	0	40	tneufeld	ship		619	\N	2017-08-10	2017-08-31	33183	260	\N	agongora	0		\N	\N	tneufeld	2017-08-10 15:13:05.46	4	33183	0	1
52496	1027	2017-08-10	13320	0	0	48	tneufeld	ship		590	\N	2017-08-10	2017-08-31	9973	73	\N	agongora	0		\N	\N	tneufeld	2017-08-10 15:10:58.507	4	9973	0	1
52547	1049	2017-08-31	17100	0	0	26	tneufeld	otto			\N	2017-08-31	2017-09-21	14216	63	\N	cmartinez	0		\N	\N	tneufeld	2017-08-31 09:51:32.084	2	14216	0	1
52506	1042	2017-08-14	8820	1620	0	58	tneufeld	elizabeth	fix 8640		\N	2017-08-14	2017-09-04	6361	65	\N	agongora	0		\N	\N	tneufeld	2017-08-14 09:24:14.913	7	6361	0	1
52563	1044	2017-09-07	3960	7920	0	51	tneufeld	wiiliam	fix 1080		\N	2017-09-07	2017-09-28	3308	14	\N	agongora	0		\N	\N	tneufeld	2017-09-07 08:53:36.198	7	3308	0	1
52561	1047	2017-09-07	4320	8460	0	45	tneufeld	tim			\N	2017-09-07	2017-09-28	3862	7	\N	agongora	0		\N	\N	tneufeld	2017-09-07 08:29:11.073	2	3862	0	1
52519	1054	2017-08-21	5400	0	0	51	tneufeld	jake			\N	2017-08-21	2017-09-11	2101	70	\N	cmartinez	0		\N	\N	tneufeld	2017-08-21 07:53:47.147	6	4210	2109	2
52526	1041	2017-08-21	10080	0	0	64	tneufeld	jake			\N	2017-08-21	2017-09-11	6682	69	\N	cmartinez	0		\N	\N	tneufeld	2017-08-21 10:40:23.132	7	6682	0	1
52521	1042	2017-08-21	6300	0	0	59	tneufeld	allan			\N	2017-08-21	2017-09-11	4711	73	\N	cmartinez	0		\N	\N	tneufeld	2017-08-21 09:28:33.913	7	4711	0	1
52520	1044	2017-08-21	16740	0	0	48	tneufeld	william			\N	2017-08-21	2017-09-11	13986	175	\N	cmartinez	0		\N	\N	tneufeld	2017-08-21 08:47:04.554	7	13986	0	1
52524	1047	2017-08-21	17640	0	0	42	tneufeld	tim			\N	2017-08-21	2017-09-11	15345	159	\N	cmartinez	0		\N	\N	tneufeld	2017-08-21 10:00:05.804	2	15345	0	1
52523	1048	2017-08-21	6660	0	0	37	tneufeld	anton			\N	2017-08-21	2017-09-11	5673	50	\N	cmartinez	0		\N	\N	tneufeld	2017-08-21 09:52:28.491	1	5673	0	1
52528	1054	2017-08-24	8280	0	0	52	tneufeld	jake			\N	2017-08-24	2017-09-14	3352	52	\N	cmartinez	0		\N	\N	tneufeld	2017-08-24 08:08:14.819	6	6730	3378	2
52533	1041	2017-08-24	2520	4680	0	65	tneufeld	galen			\N	2017-08-24	2017-09-14	1595	32	\N	cmartinez	0		\N	\N	tneufeld	2017-08-24 09:09:20.038	7	1595	0	1
52529	1042	2017-08-24	1800	3420	0	60	tneufeld	allan			\N	2017-08-24	2017-09-14	1349	87	\N	cmartinez	0		\N	\N	tneufeld	2017-08-24 08:18:15.71	7	1349	0	1
52530	1047	2017-08-24	4320	8640	0	43	tneufeld	tim			\N	2017-08-24	2017-09-14	3768	19	\N	cmartinez	0		\N	\N	tneufeld	2017-08-24 08:30:19.632	2	3768	0	1
52531	1048	2017-08-24	1800	2880	0	38	tneufeld	mark			\N	2017-08-24	2017-09-14	1517	14	\N	cmartinez	0		\N	\N	tneufeld	2017-08-24 08:32:52.96	1	1517	0	1
52542	1041	2017-08-28	12960	2520	0	65	tneufeld	galen			\N	2017-08-28	2017-09-18	7543	80	\N	cmartinez	0		\N	\N	tneufeld	2017-08-28 10:25:26.506	7	7543	0	1
52537	1042	2017-08-28	8280	1620	0	60	tneufeld	allan			\N	2017-08-28	2017-09-18	6318	48	\N	cmartinez	0		\N	\N	tneufeld	2017-08-28 08:39:23.521	7	6318	0	1
52541	1043	2017-08-28	18360	3420	0	55	tneufeld	richard			\N	2017-08-28	2017-09-18	14819	113	\N	cmartinez	0		\N	\N	tneufeld	2017-08-28 10:18:07.771	7	14819	0	1
52540	1047	2017-08-28	21600	0	0	43	tneufeld	abram			\N	2017-08-28	2017-09-18	18500	81	\N	cmartinez	0		\N	\N	tneufeld	2017-08-28 10:00:45.396	2	18500	0	1
52539	1048	2017-08-28	8280	0	0	38	tneufeld	tina			\N	2017-08-28	2017-09-18	6951	15	\N	cmartinez	0		\N	\N	tneufeld	2017-08-28 09:36:24.459	1	6951	0	1
52543	1049	2017-08-28	19620	7200	0	26	tneufeld	otto			\N	2017-08-28	2017-09-18	16812	24	\N	cmartinez	0		\N	\N	tneufeld	2017-08-28 11:30:28.928	2	16812	0	1
52545	1042	2017-08-31	6480	0	0	61	tneufeld	allan			\N	2017-08-31	2017-09-21	4850	114	\N	cmartinez	0		\N	\N	tneufeld	2017-08-31 09:21:18.803	7	4850	0	1
52549	1043	2017-08-31	14040	0	0	56	tneufeld	richard			\N	2017-08-31	2017-09-21	11167	114	\N	cmartinez	0		\N	\N	tneufeld	2017-08-31 10:15:29.678	7	11167	0	1
52544	1044	2017-08-31	15480	0	0	50	tneufeld	william			\N	2017-08-31	2017-09-21	12256	90	\N	cmartinez	0		\N	\N	tneufeld	2017-08-31 08:51:58.678	7	12256	0	1
52548	1048	2017-08-31	6480	0	0	39	tneufeld	tina	fix 7200		\N	2017-08-31	2017-09-21	5128	88	\N	cmartinez	0		\N	\N	tneufeld	2017-08-31 10:09:09.303	1	5128	0	1
52551	1054	2017-09-04	8280	0	0	53	tneufeld	galen			\N	2017-09-04	2017-09-25	3172	170	\N	agongora	0		\N	\N	tneufeld	2017-09-04 08:24:43.458	6	6365	3193	2
52553	1042	2017-09-04	6480	0	0	61	tneufeld	allan			\N	2017-09-04	2017-09-25	4934	36	\N	agongora	0		\N	\N	tneufeld	2017-09-04 09:16:32.615	7	4934	0	1
52557	1043	2017-09-04	14220	0	0	56	tneufeld	vange			\N	2017-09-04	2017-09-25	11402	125	\N	agongora	0		\N	\N	tneufeld	2017-09-04 10:09:53.724	7	11402	0	1
52552	1044	2017-09-04	16560	0	0	50	tneufeld	wiiliam			\N	2017-09-04	2017-09-25	13218	124	\N	agongora	0		\N	\N	tneufeld	2017-09-04 08:47:51.333	7	13218	0	1
52555	1047	2017-09-04	17280	0	0	44	tneufeld	abram			\N	2017-09-04	2017-09-25	14321	119	\N	agongora	0		\N	\N	tneufeld	2017-09-04 09:56:37.208	2	14321	0	1
52554	1049	2017-09-04	18900	0	0	27	tneufeld	otto			\N	2017-09-04	2017-09-25	16108	193	\N	agongora	0		\N	\N	tneufeld	2017-09-04 09:50:17.943	2	16108	0	1
52560	1041	2017-09-07	2160	3600	0	67	tneufeld	jake			\N	2017-09-07	2017-09-28	1330	7	\N	agongora	0		\N	\N	tneufeld	2017-09-07 08:21:17.698	7	1330	0	1
52564	1042	2017-09-07	1620	3240	0	62	tneufeld	allan			\N	2017-09-07	2017-09-28	1301	8	\N	agongora	0		\N	\N	tneufeld	2017-09-07 09:11:13.12	7	1301	0	1
52565	1048	2017-09-07	1800	3240	0	40	tneufeld	anton			\N	2017-09-07	2017-09-28	1415	26	\N	agongora	0		\N	\N	tneufeld	2017-09-07 09:14:35.073	1	1415	0	1
52559	1054	2017-09-07	5400	0	0	54	tneufeld	jake			\N	2017-09-07	2017-09-28	2202	38	\N	agongora	0		\N	\N	tneufeld	2017-09-07 08:19:52.916	6	4310	2108	2
52515	1041	2017-08-17	10080	0	0	64	tneufeld	galen			\N	2017-08-17	2017-09-07	6666	43	\N	agongora	0		\N	\N	tneufeld	2017-08-17 09:20:04.726	7	6666	0	1
52518	1042	2017-08-17	7200	0	0	59	tneufeld	allan			\N	2017-08-17	2017-09-07	5665	45	\N	agongora	0		\N	\N	tneufeld	2017-08-17 11:28:19.585	7	5665	0	1
52512	1047	2017-08-17	17460	0	0	42	tneufeld	abram			\N	2017-08-17	2017-09-07	15077	41	\N	agongora	0		\N	\N	tneufeld	2017-08-17 08:40:16.96	2	15077	0	1
52517	1049	2017-08-17	8820	0	0	24	dthiessen	.			\N	2017-08-17	2017-09-07	7006	40	\N	agongora	0		\N	\N	dthiessen	2017-08-17 10:25:07.491	2	7006	0	1
52525	1043	2017-08-21	15120	0	0	54	tneufeld	vange			\N	2017-08-21	2017-09-11	11476	353	\N	cmartinez	0		\N	\N	tneufeld	2017-08-21 10:28:17.522	7	11476	0	1
52522	1049	2017-08-21	11160	0	0	25	tneufeld	otto			\N	2017-08-21	2017-09-11	9315	65	\N	cmartinez	0		\N	\N	tneufeld	2017-08-21 09:41:37.569	2	9315	0	1
52538	1054	2017-08-28	4320	0	0	52	tneufeld	jake			\N	2017-08-28	2017-09-18	1650	45	\N	cmartinez	0		\N	\N	tneufeld	2017-08-28 09:09:38.865	6	3231	1581	2
52581	1047	2017-09-11	20520	4320	0	45	tneufeld	abram			\N	2017-09-11	2017-10-02	16991	201	\N	agongora	0		\N	\N	tneufeld	2017-09-11 10:26:41.712	2	16991	0	1
52580	1043	2017-09-11	17460	3780	0	57	tneufeld	richard			\N	2017-09-11	2017-10-02	13621	106	\N	agongora	0		\N	\N	tneufeld	2017-09-11 10:16:46.978	7	13621	0	1
52596	1047	2017-09-14	16920	0	0	46	tneufeld	tim			\N	2017-09-14	2017-10-05	14721	156	\N	agongora	0		\N	\N	tneufeld	2017-09-14 10:23:05.306	2	14721	0	1
52532	1043	2017-08-24	3600	7380	0	55	tneufeld	richard			\N	2017-08-24	2017-09-14	3006	32	\N	cmartinez	0		\N	\N	tneufeld	2017-08-24 09:04:05.054	7	3006	0	1
52587	1027	2017-08-24	12600	0	0	36	tneufeld	ship		630	\N	2017-08-24	2017-09-14	9846	104	\N	cmartinez	0		\N	\N	tneufeld	2017-09-12 09:53:48.853	4	9846	0	1
52585	1027	2017-08-24	21600	0	0	42	tneufeld	ship		619	\N	2017-08-24	2017-09-14	16465	53	\N	cmartinez	0		\N	\N	tneufeld	2017-09-12 09:52:45.4	4	16465	0	1
52586	1027	2017-08-24	5400	0	0	39	tneufeld	ship		625	\N	2017-08-24	2017-09-14	4342	70	\N	cmartinez	0		\N	\N	tneufeld	2017-09-12 09:53:16.228	4	4342	0	1
52588	1027	2017-08-24	14400	0	0	36	tneufeld	ship		631	\N	2017-08-24	2017-09-14	11736	53	\N	cmartinez	0		\N	\N	tneufeld	2017-09-12 09:54:19.494	4	11736	0	1
52583	1027	2017-08-24	21600	0	0	46	tneufeld	ship	fix 09/11/17	608	\N	2017-08-24	2017-09-14	17165	80	\N	cmartinez	0		\N	\N	tneufeld	2017-09-12 09:46:26.791	4	17165	0	1
52582	1027	2017-08-24	14400	0	0	50	tneufeld	ship		590	\N	2017-08-24	2017-09-14	11076	92	\N	cmartinez	0		\N	\N	tneufeld	2017-09-12 09:45:58.634	4	11076	0	1
52536	1044	2017-08-28	20880	3600	0	49	tneufeld	william			\N	2017-08-28	2017-09-18	16860	70	\N	cmartinez	0		\N	\N	tneufeld	2017-08-28 08:13:30.443	7	16860	0	1
52556	1041	2017-08-31	9180	0	0	66	dthiessen	Jake			\N	2017-08-31	2017-09-21	5426	90	\N	cmartinez	0		\N	\N	ereimer	2017-09-04 10:08:37.037	7	5426	0	1
52599	1041	2017-09-18	3960	0	0	68	tneufeld	jake			\N	2017-09-18	2017-10-09	2293	31	\N	cmartinez	0		\N	\N	tneufeld	2017-09-18 08:38:14.961	7	2293	0	1
52546	1047	2017-08-31	17100	0	0	44	tneufeld	margaret 			\N	2017-08-31	2017-09-21	14395	121	\N	cmartinez	0		\N	\N	tneufeld	2017-08-31 09:31:19.803	2	14395	0	1
52568	1027	2017-09-07	3600	0	0	52	tneufeld	ocean		590	\N	2017-09-07	2017-09-28	2854	33	\N	agongora	0		\N	\N	tneufeld	2017-09-07 13:16:35.245	4	2854	0	1
52575	1054	2017-09-11	4320	0	0	54	tneufeld	jake			\N	2017-09-11	2017-10-02	1697	76	\N	agongora	0		\N	\N	tneufeld	2017-09-11 08:21:29.087	6	3308	1611	2
52567	1027	2017-09-07	9000	0	0	54	tneufeld	ocean		586	\N	2017-09-07	2017-09-28	6972	25	\N	agongora	0		\N	\N	tneufeld	2017-09-07 13:15:55.979	4	6972	0	1
52570	1027	2017-09-07	27000	0	0	44	tneufeld	ocean		619	\N	2017-09-07	2017-09-28	20726	236	\N	agongora	0		\N	\N	tneufeld	2017-09-07 13:17:33.135	4	20726	0	1
52572	1027	2017-09-07	6480	0	0	38	tneufeld	ocean		631	\N	2017-09-07	2017-09-28	5388	91	\N	agongora	0		\N	\N	tneufeld	2017-09-07 13:18:30.916	4	5388	0	1
52573	1027	2017-09-07	20520	0	0	32	tneufeld	ocean		650	\N	2017-09-07	2017-09-28	16931	210	\N	agongora	0		\N	\N	tneufeld	2017-09-07 13:19:01.057	4	16931	0	1
52574	1041	2017-09-11	5040	2880	0	67	tneufeld	galen			\N	2017-09-11	2017-10-02	2042	34	\N	agongora	0		\N	\N	tneufeld	2017-09-11 08:12:32.322	7	2042	0	1
52577	1044	2017-09-11	20160	3960	0	51	tneufeld	william	fix 19800		\N	2017-09-11	2017-10-02	15722	105	\N	agongora	0		\N	\N	tneufeld	2017-09-11 09:27:44.103	7	15722	0	1
52576	1048	2017-09-11	7920	1440	0	40	tneufeld	anton			\N	2017-09-11	2017-10-02	6765	57	\N	agongora	0		\N	\N	tneufeld	2017-09-11 09:13:40.103	1	6765	0	1
52593	1041	2017-09-14	5580	0	0	68	tthiessen	Galen Thiessen			\N	2017-09-14	2017-10-05	2916	103	\N	agongora	0		\N	\N	tneufeld	2017-09-14 09:09:17.587	7	2916	0	1
52594	1042	2017-09-14	6300	0	0	63	tthiessen	Allen Loewen			\N	2017-09-14	2017-10-05	4927	106	\N	agongora	0		\N	\N	tneufeld	2017-09-14 09:31:45.837	7	4927	0	1
52590	1044	2017-09-14	15660	0	0	52	tneufeld	william	fix 15300		\N	2017-09-14	2017-10-05	12705	100	\N	agongora	0		\N	\N	tneufeld	2017-09-14 08:10:13.806	7	12705	0	1
52589	1048	2017-09-14	6480	0	0	41	tneufeld	anton			\N	2017-09-14	2017-10-05	5014	177	\N	agongora	0		\N	\N	tneufeld	2017-09-14 07:52:30.978	1	5014	0	1
52591	1049	2017-09-14	20340	0	0	28	tthiessen	Otto Penner			\N	2017-09-14	2017-10-05	17862	180	\N	agongora	0		\N	\N	tneufeld	2017-09-14 08:56:42.681	2	17862	0	1
52600	1054	2017-09-18	8280	0	0	68	tneufeld	jake	fix 1041		\N	2017-09-18	2017-10-09	3037	135	\N	cmartinez	0		\N	\N	tneufeld	2017-09-18 08:38:28.523	6	6173	3136	2
52601	1042	2017-09-18	5940	0	0	63	tneufeld	allan			\N	2017-09-18	2017-10-09	4615	56	\N	cmartinez	0		\N	\N	tneufeld	2017-09-18 08:46:10.398	7	4615	0	1
52597	1044	2017-09-18	15840	0	0	52	tneufeld	william			\N	2017-09-18	2017-10-09	12286	171	\N	cmartinez	0		\N	\N	tneufeld	2017-09-18 07:53:35.226	7	12286	0	1
52604	1047	2017-09-18	16200	0	0	46	tneufeld	tim			\N	2017-09-18	2017-10-09	13624	164	\N	cmartinez	0		\N	\N	tneufeld	2017-09-18 10:43:07.539	2	13624	0	1
52603	1048	2017-09-18	6120	0	0	41	tneufeld	anton			\N	2017-09-18	2017-10-09	5058	92	\N	cmartinez	0		\N	\N	tneufeld	2017-09-18 09:41:05.633	1	5058	0	1
52605	1049	2017-09-18	20520	0	0	33	dthiessen	Otto			\N	2017-09-18	2017-10-09	17968	161	\N	cmartinez	0		\N	\N	dthiessen	2017-09-18 13:36:13.179	2	17968	0	1
52606	1041	2017-09-21	3060	0	0	69	dthiessen	Jake			\N	2017-09-21	2017-10-12	1913	20	\N	cmartinez	0		\N	\N	dthiessen	2017-09-22 08:33:23.008	7	1913	0	1
52607	1042	2017-09-21	4860	0	0	64	dthiessen	Allan			\N	2017-09-21	2017-10-12	3912	50	\N	cmartinez	0		\N	\N	dthiessen	2017-09-22 08:34:53.164	7	3912	0	1
52608	1043	2017-09-21	9720	0	0	59	dthiessen	RIchard			\N	2017-09-21	2017-10-12	7499	373	\N	cmartinez	0		\N	\N	dthiessen	2017-09-22 08:35:28.929	7	7499	0	1
52610	1047	2017-09-21	11880	0	0	47	dthiessen	Abram			\N	2017-09-21	2017-10-12	9556	133	\N	cmartinez	0		\N	\N	dthiessen	2017-09-22 08:36:12.648	2	9556	0	1
52611	1048	2017-09-21	4680	0	0	42	dthiessen	Anton			\N	2017-09-21	2017-10-12	3529	192	\N	cmartinez	0		\N	\N	dthiessen	2017-09-22 08:36:26.945	1	3529	0	1
52612	1049	2017-09-21	15480	0	0	33	dthiessen	Otto			\N	2017-09-21	2017-10-12	13609	103	\N	cmartinez	0		\N	\N	dthiessen	2017-09-22 08:36:41.804	2	13609	0	1
52616	1041	2017-09-25	3960	0	0	69	tneufeld	gallen			\N	2017-09-25	2017-10-16	2264	66	\N	cmartinez	0		\N	\N	tneufeld	2017-09-25 08:32:35.241	7	2264	0	1
52618	1042	2017-09-25	5940	0	0	64	tneufeld	allan			\N	2017-09-25	2017-10-16	4672	94	\N	cmartinez	0		\N	\N	tneufeld	2017-09-25 09:04:19.679	7	4672	0	1
52620	1043	2017-09-25	12960	0	0	59	tneufeld	richard			\N	2017-09-25	2017-10-16	9822	311	\N	cmartinez	0		\N	\N	tneufeld	2017-09-25 09:25:50.538	7	9822	0	1
52617	1049	2017-09-25	20700	0	0	34	tneufeld	otto			\N	2017-09-25	2017-10-16	17999	148	\N	cmartinez	0		\N	\N	tneufeld	2017-09-25 08:49:42.132	2	17999	0	1
52619	1050	2017-09-25	2520	0	0	30	tneufeld	eric			\N	2017-09-25	2017-10-16	1889	34	\N	cmartinez	0		\N	\N	tneufeld	2017-09-25 09:08:20.085	2	1889	0	1
52630	1054	2017-09-28	2520	0	0	57	tneufeld	galen			\N	2017-09-28	2017-10-19	1022	15	\N	cmartinez	0		\N	\N	tneufeld	2017-09-28 10:08:18.163	6	2001	979	2
52622	1047	2017-09-25	16020	0	0	47	tneufeld	tim	fix 8820		\N	2017-09-25	2017-10-16	13085	200	\N	cmartinez	0		\N	\N	tneufeld	2017-09-25 10:32:22.976	2	13085	0	1
52550	1041	2017-09-04	9540	0	0	66	tneufeld	galen			\N	2017-09-04	2017-09-25	5435	69	\N	agongora	0		\N	\N	tneufeld	2017-09-04 08:24:22.833	7	5435	0	1
52558	1048	2017-09-04	6480	0	0	39	tneufeld	anton			\N	2017-09-04	2017-09-25	5413	60	\N	agongora	0		\N	\N	tneufeld	2017-09-04 10:33:46.021	1	5413	0	1
52628	1047	2017-09-28	5760	5580	0	48	tneufeld	abram			\N	2017-09-28	2017-10-19	4879	23	\N	cmartinez	0		\N	\N	tneufeld	2017-09-28 09:17:37.397	2	4879	0	1
52626	1043	2017-09-28	4860	4500	0	60	tneufeld	richard			\N	2017-09-28	2017-10-19	3780	74	\N	cmartinez	0		\N	\N	tneufeld	2017-09-28 08:22:04.96	7	3780	0	1
52562	1043	2017-09-07	3240	6480	0	57	tneufeld	richard	added 6480		\N	2017-09-07	2017-09-28	2727	17	\N	agongora	0		\N	\N	tneufeld	2017-09-07 08:33:25.463	7	2727	0	1
52566	1049	2017-09-07	5040	10080	0	27	tneufeld	otto			\N	2017-09-07	2017-09-28	4203	38	\N	agongora	0		\N	\N	tneufeld	2017-09-07 09:46:19.026	2	4203	0	1
52569	1027	2017-09-07	7200	0	0	51	tneufeld	ocean		593	\N	2017-09-07	2017-09-28	5589	59	\N	agongora	0		\N	\N	tneufeld	2017-09-07 13:17:02.104	4	5589	0	1
52571	1027	2017-09-07	3600	0	0	38	tneufeld	ocean		630	\N	2017-09-07	2017-09-28	2969	64	\N	agongora	0		\N	\N	tneufeld	2017-09-07 13:18:01.682	4	2969	0	1
52654	1050	2017-10-02	4860	0	0	31	tneufeld	eric			\N	2017-10-02	2017-10-23	3869	48	\N	agongora	0		\N	\N	tneufeld	2017-10-02 09:44:10.554	2	3869	0	1
52656	1044	2017-10-02	18180	3600	0	54	tneufeld	william			\N	2017-10-02	2017-10-23	13896	141	\N	agongora	0		\N	\N	tneufeld	2017-10-02 10:09:20.069	7	13896	0	1
52578	1042	2017-09-11	8100	1440	0	62	tneufeld	alan	fix 5400		\N	2017-09-11	2017-10-02	6292	70	\N	agongora	0		\N	\N	tneufeld	2017-09-11 09:49:06.087	7	6292	0	1
52579	1049	2017-09-11	24840	5040	0	28	tneufeld	otto			\N	2017-09-11	2017-10-02	21830	153	\N	agongora	0		\N	\N	tneufeld	2017-09-11 10:09:58.556	2	21830	0	1
52595	1043	2017-09-14	13680	0	0	58	tthiessen	Evangeline Penner			\N	2017-09-14	2017-10-05	9760	235	\N	agongora	0		\N	\N	tneufeld	2017-09-14 09:39:36.056	7	9760	0	1
52592	1050	2017-09-14	360	0	0	28	tthiessen	Abe Thiessen			\N	2017-09-14	2017-10-05	208	0	\N	agongora	0		\N	\N	tneufeld	2017-09-14 08:57:46.416	2	208	0	1
52631	1041	2017-09-28	900	0	0	70	tneufeld	galen			\N	2017-09-28	2017-10-19	494	11	\N	cmartinez	0		\N	\N	tneufeld	2017-09-28 10:08:43.46	7	494	0	1
52627	1042	2017-09-28	2520	2160	0	65	tneufeld	elizabeth			\N	2017-09-28	2017-10-19	1896	35	\N	cmartinez	0		\N	\N	tneufeld	2017-09-28 09:08:10.585	7	1896	0	1
52624	1048	2017-09-28	2520	2160	0	43	tneufeld	anton			\N	2017-09-28	2017-10-19	2106	8	\N	cmartinez	0		\N	\N	tneufeld	2017-09-28 07:43:43.46	1	2106	0	1
52632	1049	2017-09-28	7920	7920	0	34	tneufeld	otto			\N	2017-09-28	2017-10-19	6981	28	\N	cmartinez	0		\N	\N	tneufeld	2017-09-28 10:15:18.194	2	6981	0	1
52645	1027	2017-09-28	3600	0	0	41	tneufeld	sea		630	\N	2017-09-28	2017-10-19	2933	59	\N	cmartinez	0		\N	\N	tneufeld	2017-09-28 10:28:44.304	4	2933	0	1
52646	1027	2017-09-28	3960	0	0	41	tneufeld	sea		631	\N	2017-09-28	2017-10-19	2743	21	\N	cmartinez	0		\N	\N	tneufeld	2017-09-28 10:29:15.632	4	2743	0	1
52647	1027	2017-09-28	5760	0	0	36	tneufeld	sea		650	\N	2017-09-28	2017-10-19	5656	36	\N	cmartinez	0		\N	\N	tneufeld	2017-09-28 10:29:40.335	4	5656	0	1
52648	1027	2017-09-28	4320	0	0	33	tneufeld	sea		655	\N	2017-09-28	2017-10-19	3642	12	\N	cmartinez	0		\N	\N	tneufeld	2017-09-28 10:30:21.835	4	3642	0	1
52650	1027	2017-09-28	5760	0	0	31	tneufeld	sea		657	\N	2017-09-28	2017-10-19	4924	32	\N	cmartinez	0		\N	\N	tneufeld	2017-09-28 10:31:09.304	4	4924	0	1
52643	1027	2017-09-28	1800	0	0	44	tneufeld	sea		625	\N	2017-09-28	2017-10-19	1369	34	\N	cmartinez	0		\N	\N	tneufeld	2017-09-28 10:27:23.163	4	1369	0	1
52644	1027	2017-09-28	5400	0	0	44	tneufeld	sea		626	\N	2017-09-28	2017-10-19	4539	29	\N	cmartinez	0		\N	\N	tneufeld	2017-09-28 10:27:48.694	4	4539	0	1
52641	1027	2017-09-28	3600	0	0	47	tneufeld	sea		620	\N	2017-09-28	2017-10-19	2809	33	\N	cmartinez	0		\N	\N	tneufeld	2017-09-28 10:26:18.085	4	2809	0	1
52640	1027	2017-09-28	3600	0	0	47	tneufeld	sea		619	\N	2017-09-28	2017-10-19	2750	35	\N	cmartinez	0		\N	\N	tneufeld	2017-09-28 10:25:50.882	4	2750	0	1
52639	1027	2017-09-28	3600	0	0	47	tneufeld	sea		618	\N	2017-09-28	2017-10-19	2998	18	\N	cmartinez	0		\N	\N	tneufeld	2017-09-28 10:23:53.304	4	2998	0	1
52636	1027	2017-09-28	3600	0	0	54	tneufeld	sea		601	\N	2017-09-28	2017-10-19	2752	63	\N	cmartinez	0		\N	\N	tneufeld	2017-09-28 10:22:35.569	4	2752	0	1
52637	1027	2017-09-28	3240	0	0	51	tneufeld	sea		611	\N	2017-09-28	2017-10-19	2583	22	\N	cmartinez	0		\N	\N	tneufeld	2017-09-28 10:22:59.288	4	2583	0	1
52635	1027	2017-09-28	3600	0	0	54	tneufeld	sea		600	\N	2017-09-28	2017-10-19	2826	31	\N	cmartinez	0		\N	\N	tneufeld	2017-09-28 10:22:02.804	4	2826	0	1
52633	1027	2017-09-28	4320	0	0	57	tneufeld	sea		586	\N	2017-09-28	2017-10-19	3286	19	\N	cmartinez	0		\N	\N	tneufeld	2017-09-28 10:21:08.429	4	3286	0	1
52653	1042	2017-10-02	7020	720	0	65	tneufeld	elizabeth			\N	2017-10-02	2017-10-23	5157	123	\N	agongora	0		\N	\N	tneufeld	2017-10-02 09:39:28.382	7	5157	0	1
52652	1054	2017-10-02	9360	0	0	57	tneufeld	jake			\N	2017-10-02	2017-10-23	3430	244	\N	agongora	0		\N	\N	tneufeld	2017-10-02 09:29:20.804	6	6778	3348	2
52658	1047	2017-10-02	19260	0	0	48	tneufeld	abram			\N	2017-10-02	2017-10-23	14977	444	\N	agongora	0		\N	\N	tneufeld	2017-10-02 10:33:52.085	2	14977	0	1
52657	1048	2017-10-02	7560	720	0	43	tneufeld	anton			\N	2017-10-02	2017-10-23	6323	132	\N	agongora	0		\N	\N	tneufeld	2017-10-02 10:14:23.819	1	6323	0	1
52662	1042	2017-10-05	2880	1080	0	66	tneufeld	allan			\N	2017-10-05	2017-10-26	2008	41	\N	agongora	0		\N	\N	tneufeld	2017-10-05 09:23:04.319	7	2008	0	1
52661	1043	2017-10-05	6480	4320	0	61	tneufeld	vange			\N	2017-10-05	2017-10-26	5043	108	\N	agongora	0		\N	\N	tneufeld	2017-10-05 08:58:39.601	7	5043	0	1
52665	1044	2017-10-05	7560	6840	0	55	tneufeld	william			\N	2017-10-05	2017-10-26	5927	98	\N	agongora	0		\N	\N	tneufeld	2017-10-05 10:02:26.944	7	5927	0	1
52664	1048	2017-10-05	5220	0	0	44	tneufeld	tina			\N	2017-10-05	2017-10-26	4384	30	\N	agongora	0		\N	\N	tneufeld	2017-10-05 09:39:07.241	1	4384	0	1
52663	1049	2017-10-05	10080	7560	0	35	tneufeld	otto			\N	2017-10-05	2017-10-26	8961	38	\N	agongora	0		\N	\N	tneufeld	2017-10-05 09:31:52.382	2	8961	0	1
52659	1050	2017-10-05	2700	2880	0	31	tneufeld	abe			\N	2017-10-05	2017-10-26	2204	12	\N	agongora	0		\N	\N	tneufeld	2017-10-05 08:05:18.288	2	2204	0	1
52670	1027	2017-10-05	14400	0	0	48	tneufeld	sea		619	\N	2017-10-05	2017-10-26	8371	319	\N	agongora	0		\N	\N	tneufeld	2017-10-06 09:09:39.335	4	8371	0	1
52671	1027	2017-10-05	3600	0	0	45	tneufeld	sea		625	\N	2017-10-05	2017-10-26	2808	70	\N	agongora	0		\N	\N	tneufeld	2017-10-06 09:10:05.429	4	2808	0	1
52673	1027	2017-10-05	2160	0	0	38	tneufeld	sea		647	\N	2017-10-05	2017-10-26	1836	0	\N	agongora	0		\N	\N	tneufeld	2017-10-06 09:11:34.538	4	1836	0	1
52674	1027	2017-10-05	2880	0	0	32	tneufeld	sea		657	\N	2017-10-05	2017-10-26	2416	10	\N	agongora	0		\N	\N	tneufeld	2017-10-06 09:12:13.366	4	2416	0	1
52675	1027	2017-10-05	6840	0	0	28	tneufeld	sea		670	\N	2017-10-05	2017-10-26	5106	22	\N	agongora	0		\N	\N	tneufeld	2017-10-06 09:12:42.007	4	5106	0	1
52666	1027	2017-10-05	2520	0	0	56	tneufeld	sea		590	\N	2017-10-05	2017-10-26	1404	47	\N	agongora	0		\N	\N	tneufeld	2017-10-06 09:07:53.476	4	1404	0	1
52667	1027	2017-10-05	3600	0	0	56	tneufeld	sea		592	\N	2017-10-05	2017-10-26	2421	29	\N	agongora	0		\N	\N	tneufeld	2017-10-06 09:08:26.585	4	2421	0	1
52676	1050	2017-10-09	7200	0	0	32	tneufeld	eric			\N	2017-10-09	2017-10-30	6097	58	\N	agongora	0		\N	\N	tneufeld	2017-10-09 08:12:07.834	2	6097	0	1
52602	1043	2017-09-18	13140	0	0	58	tneufeld	richard			\N	2017-09-18	2017-10-09	9964	177	\N	cmartinez	0		\N	\N	tneufeld	2017-09-18 09:28:16.711	7	9964	0	1
52598	1050	2017-09-18	540	0	0	29	tneufeld	eric			\N	2017-09-18	2017-10-09	426	3	\N	cmartinez	0		\N	\N	tneufeld	2017-09-18 08:08:24.758	2	426	0	1
52609	1044	2017-09-21	11700	0	0	53	dthiessen	Joe			\N	2017-09-21	2017-10-12	9400	70	\N	cmartinez	0		\N	\N	dthiessen	2017-09-22 08:35:47.601	7	9400	0	1
52613	1050	2017-09-21	1080	0	0	29	dthiessen	Abe			\N	2017-09-21	2017-10-12	845	17	\N	cmartinez	0		\N	\N	dthiessen	2017-09-22 08:36:53.164	2	845	0	1
52623	1054	2017-09-25	11520	0	0	56	tneufeld	jake	fix 720		\N	2017-09-25	2017-10-16	4368	84	\N	cmartinez	0		\N	\N	tneufeld	2017-09-25 11:10:19.679	6	8423	4055	2
52614	1044	2017-09-25	15300	0	0	53	tneufeld	william			\N	2017-09-25	2017-10-16	11636	152	\N	cmartinez	0		\N	\N	tneufeld	2017-09-25 08:09:15.288	7	11636	0	1
52621	1048	2017-09-25	6480	0	0	42	tneufeld	anton			\N	2017-09-25	2017-10-16	5387	50	\N	cmartinez	0		\N	\N	tneufeld	2017-09-25 10:09:29.554	1	5387	0	1
52682	1047	2017-10-09	19980	1980	0	49	tneufeld	abram			\N	2017-10-09	2017-10-30	15472	401	\N	agongora	0		\N	\N	tneufeld	2017-10-09 10:04:35.459	2	15472	0	1
52684	1048	2017-10-12	4320	0	0	45	tneufeld	anton			\N	2017-10-12	2017-11-02	3716	32	\N	agongora	0		\N	\N	tneufeld	2017-10-12 07:53:27.334	1	3716	0	1
52629	1044	2017-09-28	5760	5580	0	54	tneufeld	william	added home		\N	2017-09-28	2017-10-19	4508	39	\N	cmartinez	0		\N	\N	tneufeld	2017-09-28 09:23:18.96	7	4508	0	1
52625	1050	2017-09-28	1080	1620	0	30	tneufeld	abe			\N	2017-09-28	2017-10-19	909	4	\N	cmartinez	0		\N	\N	tneufeld	2017-09-28 08:02:47.444	2	909	0	1
52642	1027	2017-09-28	3600	0	0	47	tneufeld	sea		621	\N	2017-09-28	2017-10-19	2822	56	\N	cmartinez	0		\N	\N	tneufeld	2017-09-28 10:26:54.741	4	2822	0	1
52638	1027	2017-09-28	4320	0	0	47	tneufeld	sea		617	\N	2017-09-28	2017-10-19	3595	33	\N	cmartinez	0		\N	\N	tneufeld	2017-09-28 10:23:27.21	4	3595	0	1
52634	1027	2017-09-28	3600	0	0	55	tneufeld	sea		592	\N	2017-09-28	2017-10-19	2563	34	\N	cmartinez	0		\N	\N	tneufeld	2017-09-28 10:21:38.069	4	2563	0	1
52649	1027	2017-09-28	4320	0	0	33	tneufeld	sea		656	\N	2017-09-28	2017-10-19	3609	34	\N	cmartinez	0		\N	\N	tneufeld	2017-09-28 10:30:45.897	4	3609	0	1
52655	1043	2017-10-02	15660	1620	0	60	dthiessen	Vange	added home		\N	2017-10-02	2017-10-23	11762	287	\N	agongora	0		\N	\N	tneufeld	2017-10-02 09:51:50.772	7	11762	0	1
52651	1049	2017-10-02	25560	0	0	35	tneufeld	otto	fix 25740		\N	2017-10-02	2017-10-23	22507	320	\N	agongora	0		\N	\N	tneufeld	2017-10-02 09:14:20.679	2	22507	0	1
52678	1054	2017-10-09	7560	0	0	58	tneufeld	jake			\N	2017-10-09	2017-10-30	2664	190	\N	agongora	0		\N	\N	tneufeld	2017-10-09 08:47:50.366	6	5183	2519	2
52677	1042	2017-10-09	2340	360	0	66	tneufeld	allan			\N	2017-10-09	2017-10-30	1809	25	\N	agongora	0		\N	\N	tneufeld	2017-10-09 08:37:14.506	7	1809	0	1
52681	1044	2017-10-09	17280	4860	0	55	tneufeld	william	\N		\N	2017-10-09	2017-10-30	13377	200	\N	agongora	0		\N	\N	tneufeld	2017-10-09 09:48:15.037	7	13377	0	1
52683	1048	2017-10-09	6120	0	0	44	tneufeld	anton			\N	2017-10-09	2017-10-30	5076	126	\N	agongora	0		\N	\N	tneufeld	2017-10-09 11:02:50.116	1	5076	0	1
52687	1042	2017-10-12	1440	360	0	67	tneufeld	allan			\N	2017-10-12	2017-11-02	1005	22	\N	agongora	0		\N	\N	tneufeld	2017-10-12 09:03:18.366	7	1005	0	1
52685	1043	2017-10-12	9180	0	0	62	tneufeld	richard			\N	2017-10-12	2017-11-02	7054	177	\N	agongora	0		\N	\N	tneufeld	2017-10-12 08:27:09.741	7	7054	0	1
52686	1044	2017-10-12	11160	4320	0	56	tneufeld	william	11520		\N	2017-10-12	2017-11-02	8623	200	\N	agongora	0		\N	\N	tneufeld	2017-10-12 09:01:39.772	7	8623	0	1
52690	1049	2017-10-12	15300	2520	0	36	tneufeld	otto			\N	2017-10-12	2017-11-02	13496	43	\N	cmartinez	0		\N	\N	tneufeld	2017-10-12 09:47:05.756	2	13496	0	1
52688	1050	2017-10-12	4860	1440	0	32	tneufeld	abe			\N	2017-10-12	2017-11-02	4116	42	\N	agongora	0		\N	\N	tneufeld	2017-10-12 09:08:59.975	2	4116	0	1
52692	1027	2017-10-12	3240	0	0	35	tneufeld	sea		656	\N	2017-10-12	2017-11-02	2937	157	\N	cmartinez	0		\N	\N	tneufeld	2017-10-12 13:27:02.959	4	2937	0	1
52691	1027	2017-10-12	10080	0	0	39	tneufeld	sea		647	\N	2017-10-12	2017-11-02	7802	153	\N	agongora	0		\N	\N	tneufeld	2017-10-12 13:26:39.287	4	7802	0	1
52699	1042	2017-10-16	1800	0	0	67	tneufeld	elizabeth			\N	2017-10-16	2017-11-06	1351	21	\N	cmartinez	0		\N	\N	tneufeld	2017-10-16 09:59:29.803	7	1351	0	1
52695	1044	2017-10-16	18180	0	0	56	tneufeld	william			\N	2017-10-16	2017-11-06	12841	197	\N	cmartinez	0		\N	\N	tneufeld	2017-10-16 09:23:52.631	7	12841	0	1
52698	1047	2017-10-16	17280	0	0	50	tneufeld	tim			\N	2017-10-16	2017-11-06	13068	244	\N	cmartinez	0		\N	\N	tneufeld	2017-10-16 09:48:40.615	2	13068	0	1
52700	1048	2017-10-16	6480	0	0	45	tneufeld	anton			\N	2017-10-16	2017-11-06	5050	89	\N	cmartinez	0		\N	\N	tneufeld	2017-10-16 10:24:24.99	1	5050	0	1
52697	1049	2017-10-16	22680	0	0	37	tneufeld	otto			\N	2017-10-16	2017-11-06	19400	199	\N	cmartinez	0		\N	\N	tneufeld	2017-10-16 09:43:06.49	2	19400	0	1
52706	1042	2017-10-19	1440	0	0	68	tneufeld	allan			\N	2017-10-19	2017-11-09	1080	27	\N	cmartinez	0		\N	\N	tneufeld	2017-10-19 09:15:55.313	7	1080	0	1
52705	1054	2017-10-19	9360	0	0	60	tneufeld	jake			\N	2017-10-19	2017-11-09	3432	143	\N	cmartinez	0		\N	\N	tneufeld	2017-10-19 09:12:30.844	6	6971	3539	2
52701	1043	2017-10-19	5760	2880	0	63	tneufeld	richard			\N	2017-10-19	2017-11-09	4292	89	\N	cmartinez	0		\N	\N	tneufeld	2017-10-19 07:51:08	7	4292	0	1
52704	1047	2017-10-19	7560	3780	0	51	tneufeld	tim			\N	2017-10-19	2017-11-09	6145	61	\N	cmartinez	0		\N	\N	tneufeld	2017-10-19 08:59:34.813	2	6145	0	1
52708	1048	2017-10-19	2880	1440	0	46	tneufeld	tina			\N	2017-10-19	2017-11-09	2466	18	\N	cmartinez	0		\N	\N	tneufeld	2017-10-19 09:40:50.407	1	2466	0	1
52702	1050	2017-10-19	3420	0	0	33	tneufeld	eric			\N	2017-10-19	2017-11-09	2898	17	\N	cmartinez	0		\N	\N	tneufeld	2017-10-19 08:03:10.657	2	2898	0	1
52714	1027	2017-10-19	3600	0	0	43	tneufeld	sea		634	\N	2017-10-19	2017-11-09	3013	33	\N	cmartinez	0		\N	\N	tneufeld	2017-10-20 08:07:52.36	4	3013	0	1
52715	1027	2017-10-19	3240	0	0	34	tneufeld	sea		659	\N	2017-10-19	2017-11-09	2769	9	\N	cmartinez	0		\N	\N	tneufeld	2017-10-20 08:08:41.86	4	2769	0	1
52716	1027	2017-10-19	3600	0	0	30	tneufeld	sea		669	\N	2017-10-19	2017-11-09	2687	60	\N	cmartinez	0		\N	\N	tneufeld	2017-10-20 08:09:05.329	4	2687	0	1
52718	1027	2017-10-19	12600	0	0	28	tneufeld	sea		676	\N	2017-10-19	2017-11-09	8119	87	\N	cmartinez	0		\N	\N	tneufeld	2017-10-20 08:09:56.157	4	8119	0	1
52709	1027	2017-10-19	1800	0	0	57	tneufeld	sea		600	\N	2017-10-19	2017-11-09	1432	31	\N	cmartinez	0		\N	\N	tneufeld	2017-10-20 08:05:41.079	4	1432	0	1
52711	1027	2017-10-19	18000	0	0	50	tneufeld	sea		619	\N	2017-10-19	2017-11-09	11349	253	\N	cmartinez	0		\N	\N	tneufeld	2017-10-20 08:06:36.594	4	11349	0	1
52710	1027	2017-10-19	1800	0	0	57	tneufeld	sea		601	\N	2017-10-19	2017-11-09	1473	31	\N	cmartinez	0		\N	\N	tneufeld	2017-10-20 08:06:06.875	4	1473	0	1
52721	1043	2017-10-23	13860	0	0	63	tneufeld	richard			\N	2017-10-23	2017-11-13	10258	147	\N	cmartinez	0		\N	\N	tneufeld	2017-10-23 09:27:51.737	7	10258	0	1
52720	1044	2017-10-23	18000	0	0	57	tneufeld	william			\N	2017-10-23	2017-11-13	12857	160	\N	cmartinez	0		\N	\N	tneufeld	2017-10-23 09:14:27.956	7	12857	0	1
52722	1048	2017-10-23	7560	0	0	46	tneufeld	anton			\N	2017-10-23	2017-11-13	5997	126	\N	cmartinez	0		\N	\N	tneufeld	2017-10-23 09:39:24.222	1	5997	0	1
52723	1049	2017-10-23	25200	0	0	38	tneufeld	otto			\N	2017-10-23	2017-11-13	21261	205	\N	cmartinez	0		\N	\N	tneufeld	2017-10-23 09:57:02.55	2	21261	0	1
52719	1050	2017-10-23	8640	0	0	34	tneufeld	eric			\N	2017-10-23	2017-11-13	7415	89	\N	cmartinez	0		\N	\N	tneufeld	2017-10-23 08:48:08.753	2	7415	0	1
52726	1050	2017-10-26	3600	1800	0	34	tneufeld	abe			\N	2017-10-26	2017-11-16	3193	12	\N	cmartinez	0		\N	\N	tneufeld	2017-10-26 08:10:35.784	2	3193	0	1
52660	1047	2017-10-05	8460	5940	0	49	tneufeld	tim			\N	2017-10-05	2017-10-26	7064	57	\N	agongora	0		\N	\N	tneufeld	2017-10-05 08:23:43.694	2	7064	0	1
52669	1027	2017-10-05	7560	0	0	55	tneufeld	sea		601	\N	2017-10-05	2017-10-26	5046	242	\N	agongora	0		\N	\N	tneufeld	2017-10-06 09:09:17.819	4	5046	0	1
52672	1027	2017-10-05	3600	0	0	45	tneufeld	sea		626	\N	2017-10-05	2017-10-26	2875	42	\N	agongora	0		\N	\N	tneufeld	2017-10-06 09:10:49.022	4	2875	0	1
52668	1027	2017-10-05	6840	0	0	55	tneufeld	sea		600	\N	2017-10-05	2017-10-26	5046	78	\N	agongora	0		\N	\N	tneufeld	2017-10-06 09:08:52.757	4	5046	0	1
52680	1043	2017-10-09	15120	1620	0	61	tneufeld	richard			\N	2017-10-09	2017-10-30	11337	220	\N	agongora	0		\N	\N	tneufeld	2017-10-09 09:23:50.209	7	11337	0	1
52679	1049	2017-10-09	25560	2520	0	36	tneufeld	otto			\N	2017-10-09	2017-10-30	22528	257	\N	agongora	0		\N	\N	tneufeld	2017-10-09 09:13:51.225	2	22528	0	1
52689	1047	2017-10-12	11340	1620	0	50	tneufeld	abram			\N	2017-10-12	2017-11-02	9326	64	\N	agongora	0		\N	\N	tneufeld	2017-10-12 09:20:47.522	2	9326	0	1
52693	1027	2017-10-12	15480	0	0	33	tneufeld	sea		659	\N	2017-10-12	2017-11-02	12856	11	\N	agongora	0		\N	\N	tneufeld	2017-10-12 13:27:31.647	4	12856	0	1
52772	1054	2017-10-16	9720	0	0	59	tneufeld	jake			\N	2017-10-16	2017-11-06	3533	163	\N	cmartinez	0		\N	\N	tneufeld	2017-11-06 13:05:08.627	6	7138	3605	2
52696	1043	2017-10-16	13140	0	0	62	tneufeld	vange			\N	2017-10-16	2017-11-06	9604	227	\N	cmartinez	0		\N	\N	tneufeld	2017-10-16 09:30:28.897	7	9604	0	1
52694	1050	2017-10-16	8280	0	0	33	tneufeld	eric			\N	2017-10-16	2017-11-06	7006	71	\N	cmartinez	0		\N	\N	tneufeld	2017-10-16 08:52:01.053	2	7006	0	1
52728	1043	2017-10-26	5040	2160	0	64	tneufeld	richard			\N	2017-10-26	2017-11-16	3616	60	\N	cmartinez	0		\N	\N	tneufeld	2017-10-26 08:37:51.065	7	3616	0	1
52703	1044	2017-10-19	7380	3600	0	57	tneufeld	william			\N	2017-10-19	2017-11-09	5515	45	\N	cmartinez	0		\N	\N	tneufeld	2017-10-19 08:45:06.782	7	5515	0	1
52707	1049	2017-10-19	10080	5040	0	37	tneufeld	richard	fix 2880		\N	2017-10-19	2017-11-09	8655	50	\N	cmartinez	0		\N	\N	tneufeld	2017-10-19 09:36:00.266	2	8655	0	1
52713	1027	2017-10-19	3600	0	0	43	tneufeld	sea		633	\N	2017-10-19	2017-11-09	2881	39	\N	cmartinez	0		\N	\N	tneufeld	2017-10-20 08:07:27.204	4	2881	0	1
52717	1027	2017-10-19	1800	0	0	30	tneufeld	sea		670	\N	2017-10-19	2017-11-09	1321	18	\N	cmartinez	0		\N	\N	tneufeld	2017-10-20 08:09:31.375	4	1321	0	1
52755	1048	2017-11-02	2880	1440	0	48	tneufeld	anton			\N	2017-11-02	2017-11-23	2398	14	\N	agongora	0		\N	\N	tneufeld	2017-11-02 09:53:35.533	1	2398	0	1
52729	1044	2017-10-26	7020	3600	0	58	tneufeld	william			\N	2017-10-26	2017-11-16	5249	47	\N	cmartinez	0		\N	\N	tneufeld	2017-10-26 08:47:33.253	7	5249	0	1
52730	1047	2017-10-26	7380	3600	0	52	tneufeld	tim			\N	2017-10-26	2017-11-16	5942	91	\N	cmartinez	0		\N	\N	tneufeld	2017-10-26 08:59:02.44	2	5942	0	1
52734	1027	2017-10-26	3600	0	0	51	tneufeld	sea		617	\N	2017-10-26	2017-11-16	2825	25	\N	cmartinez	0		\N	\N	tneufeld	2017-10-27 08:49:56.034	4	2825	0	1
52735	1027	2017-10-26	3600	0	0	51	tneufeld	sea		618	\N	2017-10-26	2017-11-16	2789	36	\N	cmartinez	0		\N	\N	tneufeld	2017-10-27 08:50:18.393	4	2789	0	1
52736	1027	2017-10-26	3600	0	0	51	tneufeld	sea		620	\N	2017-10-26	2017-11-16	2736	48	\N	cmartinez	0		\N	\N	tneufeld	2017-10-27 08:50:38.706	4	2736	0	1
52738	1027	2017-10-26	16200	0	0	35	tneufeld	sea		659	\N	2017-10-26	2017-11-16	11753	99	\N	cmartinez	0		\N	\N	tneufeld	2017-10-27 08:51:32.784	4	11753	0	1
52739	1027	2017-10-26	2880	0	0	31	tneufeld	sea		669	\N	2017-10-26	2017-11-16	2368	3	\N	cmartinez	0		\N	\N	tneufeld	2017-10-27 08:51:58.175	4	2368	0	1
52740	1027	2017-10-26	3600	0	0	31	tneufeld	sea		670	\N	2017-10-26	2017-11-16	2964	17	\N	cmartinez	0		\N	\N	tneufeld	2017-10-27 08:52:19.456	4	2964	0	1
52742	1027	2017-10-26	5400	0	0	29	tneufeld	sea		678	\N	2017-10-26	2017-11-16	4666	115	\N	cmartinez	0		\N	\N	tneufeld	2017-10-27 08:53:08.534	4	4666	0	1
52732	1027	2017-10-26	4320	0	0	58	tneufeld	sea		593	\N	2017-10-26	2017-11-16	2668	20	\N	cmartinez	0		\N	\N	tneufeld	2017-10-27 08:48:58.659	4	2668	0	1
52733	1027	2017-10-26	3600	0	0	53	tneufeld	sea		612	\N	2017-10-26	2017-11-16	2453	35	\N	cmartinez	0		\N	\N	tneufeld	2017-10-27 08:49:33.128	4	2453	0	1
52746	1044	2017-10-30	18000	0	0	58	tneufeld	william			\N	2017-10-30	2017-11-20	13247	125	\N	agongora	0		\N	\N	tneufeld	2017-10-30 09:50:23.158	7	13247	0	1
52748	1047	2017-10-30	18540	0	0	52	tneufeld	tim			\N	2017-10-30	2017-11-20	13650	131	\N	agongora	0		\N	\N	tneufeld	2017-10-30 10:09:19.908	2	13650	0	1
52747	1048	2017-10-30	7200	0	0	47	tneufeld	tina			\N	2017-10-30	2017-11-20	5810	87	\N	agongora	0		\N	\N	tneufeld	2017-10-30 09:58:14.752	1	5810	0	1
52745	1050	2017-10-30	9000	0	0	35	tneufeld	eric			\N	2017-10-30	2017-11-20	7659	135	\N	agongora	0		\N	\N	tneufeld	2017-10-30 08:50:29.643	2	7659	0	1
52750	1054	2017-11-02	9360	0	0	62	tneufeld	jake			\N	2017-11-02	2017-11-23	3411	110	\N	agongora	0		\N	\N	tneufeld	2017-11-02 08:04:44.143	6	6723	3312	2
52753	1043	2017-11-02	3960	900	0	65	tneufeld	vange			\N	2017-11-02	2017-11-23	2887	71	\N	agongora	0		\N	\N	tneufeld	2017-11-02 08:29:27.283	7	2887	0	1
52749	1044	2017-11-02	6660	3600	0	59	tneufeld	william			\N	2017-11-02	2017-11-23	4919	56	\N	agongora	0		\N	\N	tneufeld	2017-11-02 07:48:02.018	7	4919	0	1
52752	1049	2017-11-02	10080	5040	0	39	tneufeld	otto			\N	2017-11-02	2017-11-23	8909	23	\N	agongora	0		\N	\N	tneufeld	2017-11-02 08:20:48.252	2	8909	0	1
52751	1050	2017-11-02	3600	1800	0	35	tneufeld	abe			\N	2017-11-02	2017-11-23	3264	26	\N	agongora	0		\N	\N	tneufeld	2017-11-02 08:16:19.611	2	3264	0	1
52762	1027	2017-11-02	5400	0	0	45	tneufeld	sea		634	\N	2017-11-02	2017-11-23	4236	95	\N	agongora	0		\N	\N	tneufeld	2017-11-03 09:02:18.846	4	4236	0	1
52763	1027	2017-11-02	6480	0	0	38	tneufeld	sea		655	\N	2017-11-02	2017-11-23	5415	129	\N	agongora	0		\N	\N	tneufeld	2017-11-03 09:03:59.877	4	5415	0	1
52764	1027	2017-11-02	3960	0	0	30	tneufeld	sea		678	\N	2017-11-02	2017-11-23	2972	9	\N	agongora	0		\N	\N	tneufeld	2017-11-03 09:04:32.33	4	2972	0	1
52759	1027	2017-11-02	2520	0	0	49	tneufeld	sea		626	\N	2017-11-02	2017-11-23	2103	19	\N	agongora	0		\N	\N	tneufeld	2017-11-03 09:00:46.033	4	2103	0	1
52758	1027	2017-11-02	4320	0	0	49	tneufeld	sea		625	\N	2017-11-02	2017-11-23	3434	101	\N	agongora	0		\N	\N	tneufeld	2017-11-03 09:00:03.565	4	3434	0	1
52757	1027	2017-11-02	5400	0	0	59	tneufeld	sea		593	\N	2017-11-02	2017-11-23	3459	140	\N	agongora	0		\N	\N	tneufeld	2017-11-03 08:58:10.502	4	3459	0	1
52769	1044	2017-11-06	16740	0	0	59	tneufeld	william			\N	2017-11-06	2017-11-27	11498	151	\N	agongora	0		\N	\N	tneufeld	2017-11-06 09:43:25.502	7	11498	0	1
52775	1047	2017-11-09	7380	3600	0	54	tneufeld	abram			\N	2017-11-09	2017-11-30	5690	24	\N	agongora	0		\N	\N	tneufeld	2017-11-09 09:19:37.393	2	5690	0	1
52770	1047	2017-11-06	17820	0	0	53	tneufeld	abram			\N	2017-11-06	2017-11-27	13044	229	\N	agongora	0		\N	\N	tneufeld	2017-11-06 09:55:26.877	2	13044	0	1
52771	1048	2017-11-06	7200	0	0	48	tneufeld	tina			\N	2017-11-06	2017-11-27	5974	97	\N	agongora	0		\N	\N	tneufeld	2017-11-06 10:37:06.205	1	5974	0	1
52768	1050	2017-11-06	9000	0	0	36	tneufeld	eric			\N	2017-11-06	2017-11-27	7780	120	\N	agongora	0		\N	\N	tneufeld	2017-11-06 09:17:53.127	2	7780	0	1
52765	1054	2017-11-06	9360	0	0	62	tneufeld	jake			\N	2017-11-06	2017-11-27	3400	0	\N	agongora	0		\N	\N	tneufeld	2017-11-06 08:34:29.268	6	6648	3248	2
52774	1043	2017-11-09	1980	0	0	66	tneufeld	vange			\N	2017-11-09	2017-11-30	1565	7	\N	agongora	0		\N	\N	tneufeld	2017-11-09 08:52:11.658	7	1565	0	1
52777	1048	2017-11-09	2880	1440	0	49	tneufeld	tina			\N	2017-11-09	2017-11-30	2446	8	\N	agongora	0		\N	\N	tneufeld	2017-11-09 09:49:19.815	1	2446	0	1
52778	1049	2017-11-09	10440	5040	0	40	tneufeld	otto			\N	2017-11-09	2017-11-30	9181	41	\N	agongora	0		\N	\N	tneufeld	2017-11-09 13:03:07.736	2	9181	0	1
52712	1027	2017-10-19	3960	0	0	44	tneufeld	sea		631	\N	2017-10-19	2017-11-09	3337	37	\N	cmartinez	0		\N	\N	tneufeld	2017-10-20 08:06:58.579	4	3337	0	1
52724	1047	2017-10-23	19080	0	0	51	tneufeld	tim			\N	2017-10-23	2017-11-13	14809	314	\N	cmartinez	0		\N	\N	tneufeld	2017-10-23 10:33:55.034	2	14809	0	1
52731	1054	2017-10-26	9720	0	0	61	tneufeld	jake			\N	2017-10-26	2017-11-16	3676	30	\N	cmartinez	0		\N	\N	tneufeld	2017-10-26 10:13:27.143	6	7221	3545	2
52725	1048	2017-10-26	2880	1440	0	47	tneufeld	anton			\N	2017-10-26	2017-11-16	2308	13	\N	cmartinez	0		\N	\N	tneufeld	2017-10-26 07:56:33.518	1	2308	0	1
52727	1049	2017-10-26	10080	4680	0	38	tneufeld	otto			\N	2017-10-26	2017-11-16	8891	40	\N	cmartinez	0		\N	\N	tneufeld	2017-10-26 08:21:37.55	2	8891	0	1
52737	1027	2017-10-26	3600	0	0	51	tneufeld	sea		621	\N	2017-10-26	2017-11-16	2466	48	\N	cmartinez	0		\N	\N	tneufeld	2017-10-27 08:51:07.159	4	2466	0	1
52741	1027	2017-10-26	5400	0	0	29	tneufeld	sea		677	\N	2017-10-26	2017-11-16	4418	49	\N	cmartinez	0		\N	\N	tneufeld	2017-10-27 08:52:41.518	4	4418	0	1
52743	1043	2017-10-30	10620	0	0	64	tneufeld	richard			\N	2017-10-30	2017-11-20	7865	156	\N	agongora	0		\N	\N	tneufeld	2017-10-30 08:19:22.971	7	7865	0	1
52744	1049	2017-10-30	24840	0	0	39	tneufeld	otto			\N	2017-10-30	2017-11-20	21538	167	\N	agongora	0		\N	\N	tneufeld	2017-10-30 08:41:00.315	2	21538	0	1
52754	1047	2017-11-02	7200	3600	0	53	tneufeld	tim			\N	2017-11-02	2017-11-23	5461	133	\N	agongora	0		\N	\N	tneufeld	2017-11-02 09:22:59.736	2	5461	0	1
52761	1027	2017-11-02	3960	0	0	46	tneufeld	sea		631	\N	2017-11-02	2017-11-23	3252	38	\N	agongora	0		\N	\N	tneufeld	2017-11-03 09:01:49.377	4	3252	0	1
52760	1027	2017-11-02	3960	0	0	46	tneufeld	sea		630	\N	2017-11-02	2017-11-23	3126	83	\N	agongora	0		\N	\N	tneufeld	2017-11-03 09:01:06.565	4	3126	0	1
52823	1051	2017-11-23	900	0	0	28	tneufeld	vanessa			\N	2017-11-23	2017-12-14	554	0	\N	cmanzanero	0		\N	\N	tneufeld	2017-11-23 09:17:46.299	2	554	0	1
52785	1027	2017-11-09	5040	0	0	31	tneufeld	sea		676	\N	2017-11-09	2017-11-30	4095	41	\N	agongora	0		\N	\N	tneufeld	2017-11-10 10:05:02.955	4	4095	0	1
52782	1027	2017-11-09	5400	0	0	37	tneufeld	sea		659	\N	2017-11-09	2017-11-30	4775	13	\N	agongora	0		\N	\N	tneufeld	2017-11-10 10:03:39.455	4	4775	0	1
52781	1027	2017-11-09	5760	0	0	57	tneufeld	sea		611	\N	2017-11-09	2017-11-30	4615	22	\N	agongora	0		\N	\N	tneufeld	2017-11-10 10:03:10.33	4	4615	0	1
52779	1027	2017-11-09	5400	0	0	63	tneufeld	sea		586	\N	2017-11-09	2017-11-30	3861	13	\N	agongora	0		\N	\N	tneufeld	2017-11-10 10:01:55.174	4	3861	0	1
52790	1054	2017-11-13	14040	0	0	63	tneufeld	jake			\N	2017-11-13	2017-12-04	4825	60	\N	cmartinez	0		\N	\N	tneufeld	2017-11-13 10:02:31.736	6	9563	4738	2
52786	1043	2017-11-13	2700	0	0	66	tneufeld	vange			\N	2017-11-13	2017-12-04	1870	37	\N	cmartinez	0		\N	\N	tneufeld	2017-11-13 08:23:25.377	7	1870	0	1
52792	1047	2017-11-13	18000	0	0	54	tneufeld	gerry			\N	2017-11-13	2017-12-04	13256	155	\N	cmartinez	0		\N	\N	tneufeld	2017-11-13 10:38:50.752	2	13256	0	1
52789	1048	2017-11-13	7200	0	0	49	tneufeld	anton			\N	2017-11-13	2017-12-04	6100	47	\N	cmartinez	0		\N	\N	tneufeld	2017-11-13 09:55:13.877	1	6100	0	1
52788	1049	2017-11-13	24120	0	0	41	tneufeld	otto			\N	2017-11-13	2017-12-04	20703	171	\N	cmartinez	0		\N	\N	tneufeld	2017-11-13 08:40:56.205	2	20703	0	1
52793	1054	2017-11-16	4320	0	0	64	tneufeld	jake			\N	2017-11-16	2017-12-07	1560	21	\N	cmartinez	0		\N	\N	tneufeld	2017-11-16 07:49:16.221	6	3150	1590	2
52798	1043	2017-11-16	1620	0	0	67	tneufeld	richard			\N	2017-11-16	2017-12-07	1083	35	\N	cmartinez	0		\N	\N	tneufeld	2017-11-16 10:17:17.111	7	1083	0	1
52795	1044	2017-11-16	3600	6840	0	61	tneufeld	william			\N	2017-11-16	2017-12-07	2615	25	\N	cmartinez	0		\N	\N	tneufeld	2017-11-16 08:23:45.69	7	2615	0	1
52799	1048	2017-11-16	1800	2520	0	50	tneufeld	anton			\N	2017-11-16	2017-12-07	1619	20	\N	cmartinez	0		\N	\N	tneufeld	2017-11-16 10:55:22.955	1	1619	0	1
52796	1049	2017-11-16	10080	4680	0	41	tneufeld	otto			\N	2017-11-16	2017-12-07	8840	22	\N	cmartinez	0		\N	\N	tneufeld	2017-11-16 08:45:42.752	2	8840	0	1
52794	1050	2017-11-16	1800	3600	0	37	tneufeld	abe			\N	2017-11-16	2017-12-07	1632	9	\N	cmartinez	0		\N	\N	tneufeld	2017-11-16 08:09:34.111	2	1632	0	1
52804	1027	2017-11-16	8640	0	0	38	tneufeld	sea		659	\N	2017-11-16	2017-12-07	6833	202	\N	cmartinez	0		\N	\N	tneufeld	2017-11-17 08:00:46.08	4	6833	0	1
52805	1027	2017-11-16	5400	0	0	34	tneufeld	sea		669	\N	2017-11-16	2017-12-07	4364	52	\N	cmartinez	0		\N	\N	tneufeld	2017-11-17 08:01:13.986	4	4364	0	1
52806	1027	2017-11-16	8640	0	0	34	tneufeld	sea		670	\N	2017-11-16	2017-12-07	7228	31	\N	cmartinez	0		\N	\N	tneufeld	2017-11-17 08:01:41.486	4	7228	0	1
52800	1027	2017-11-16	1440	0	0	58	tneufeld	sea		608	\N	2017-11-16	2017-12-07	1048	7	\N	cmartinez	0		\N	\N	tneufeld	2017-11-17 07:59:04.955	4	1048	0	1
52801	1027	2017-11-16	2880	0	0	58	tneufeld	sea		609	\N	2017-11-16	2017-12-07	2167	12	\N	cmartinez	0		\N	\N	tneufeld	2017-11-17 07:59:31.658	4	2167	0	1
52802	1027	2017-11-16	3600	0	0	48	tneufeld	sea		631	\N	2017-11-16	2017-12-07	3008	19	\N	cmartinez	0		\N	\N	tneufeld	2017-11-17 08:00:00.205	4	3008	0	1
52803	1027	2017-11-16	3600	0	0	42	tneufeld	sea		650	\N	2017-11-16	2017-12-07	3100	11	\N	cmartinez	0		\N	\N	tneufeld	2017-11-17 08:00:20.877	4	3100	0	1
52812	1044	2017-11-20	16020	3240	0	61	tneufeld	william			\N	2017-11-20	2017-12-11	11190	68	\N	cmartinez	0		\N	\N	tneufeld	2017-11-20 09:32:48.033	7	11190	0	1
52813	1047	2017-11-20	17100	3420	0	55	tneufeld	tim			\N	2017-11-20	2017-12-11	11890	82	\N	cmartinez	0		\N	\N	tneufeld	2017-11-20 09:47:58.502	2	11890	0	1
52814	1048	2017-11-20	6480	1800	0	50	tneufeld	anton			\N	2017-11-20	2017-12-11	5351	44	\N	cmartinez	0		\N	\N	tneufeld	2017-11-20 10:07:48.393	1	5351	0	1
52810	1050	2017-11-20	9000	0	0	38	tneufeld	eric			\N	2017-11-20	2017-12-11	7850	40	\N	cmartinez	0		\N	\N	tneufeld	2017-11-20 08:53:36.752	2	7850	0	1
52811	1051	2017-11-20	180	0	0	28	tneufeld	leonard			\N	2017-11-20	2017-12-11	72	0	\N	cmartinez	0		\N	\N	tneufeld	2017-11-20 09:09:00.705	2	72	0	1
52818	1054	2017-11-23	4680	0	0	65	tneufeld	jake			\N	2017-11-23	2017-12-14	1690	45	\N	cmartinez	0		\N	\N	tneufeld	2017-11-23 08:14:54.018	6	3392	1702	2
52820	1047	2017-11-23	13140	0	0	56	tneufeld	tim			\N	2017-11-23	2017-12-14	9230	113	\N	cmartinez	0		\N	\N	tneufeld	2017-11-23 09:06:26.908	2	9230	0	1
52822	1048	2017-11-23	5760	0	0	51	tneufeld	mark			\N	2017-11-23	2017-12-14	4652	37	\N	cmartinez	0		\N	\N	tneufeld	2017-11-23 09:14:14.236	1	4652	0	1
52816	1049	2017-11-23	18900	0	0	42	tneufeld	rodney			\N	2017-11-23	2017-12-14	15552	179	\N	cmartinez	0		\N	\N	tneufeld	2017-11-23 07:57:09.627	2	15552	0	1
52824	1053	2017-11-23	180	0	0	28	tneufeld	edward			\N	2017-11-23	2017-12-14	16	0	\N	cmartinez	0		\N	\N	tneufeld	2017-11-23 09:20:48.377	2	16	0	1
52819	1052	2017-11-23	540	0	0	28	tneufeld	kenton			\N	2017-11-23	2017-12-14	322	0	\N	cmartinez	0		\N	\N	tneufeld	2017-11-23 08:55:49.611	3	322	0	1
52828	1044	2017-11-27	12240	0	0	62	tneufeld	william			\N	2017-11-27	2017-12-18	8490	96	\N	agongora	0		\N	\N	tneufeld	2017-11-27 09:01:24.314	7	8490	0	1
52829	1047	2017-11-27	12960	0	0	56	tneufeld	tim			\N	2017-11-27	2017-12-18	8830	69	\N	agongora	0		\N	\N	tneufeld	2017-11-27 09:15:59.486	2	8830	0	1
52832	1048	2017-11-27	5400	0	0	51	tneufeld	tina			\N	2017-11-27	2017-12-18	4237	63	\N	agongora	0		\N	\N	tneufeld	2017-11-27 10:06:52.267	1	4237	0	1
52826	1050	2017-11-27	7380	0	0	39	tneufeld	eric			\N	2017-11-27	2017-12-18	6333	47	\N	agongora	0		\N	\N	tneufeld	2017-11-27 08:36:26.361	2	6333	0	1
52830	1052	2017-11-27	1080	0	0	29	tneufeld	kenton			\N	2017-11-27	2017-12-18	855	0	\N	agongora	0		\N	\N	tneufeld	2017-11-27 09:39:47.861	3	855	0	1
52827	1053	2017-11-27	540	0	0	29	tneufeld	edward			\N	2017-11-27	2017-12-18	97	0	\N	agongora	0		\N	\N	tneufeld	2017-11-27 08:44:40.798	2	97	0	1
52767	1043	2017-11-06	5220	0	0	65	tneufeld	richard			\N	2017-11-06	2017-11-27	3553	100	\N	agongora	0		\N	\N	tneufeld	2017-11-06 09:15:48.518	7	3553	0	1
52766	1049	2017-11-06	24480	0	0	40	tneufeld	otto			\N	2017-11-06	2017-11-27	20744	186	\N	agongora	0		\N	\N	tneufeld	2017-11-06 09:11:20.127	2	20744	0	1
52776	1044	2017-11-09	7200	4320	0	60	tneufeld	william			\N	2017-11-09	2017-11-30	5448	15	\N	agongora	0		\N	\N	tneufeld	2017-11-09 09:45:10.424	7	5448	0	1
52773	1050	2017-11-09	3780	3600	0	36	tneufeld	abe			\N	2017-11-09	2017-11-30	3264	14	\N	agongora	0		\N	\N	tneufeld	2017-11-09 08:39:24.58	2	3264	0	1
52783	1027	2017-11-09	7200	0	0	33	tneufeld	sea		669	\N	2017-11-09	2017-11-30	5948	44	\N	agongora	0		\N	\N	tneufeld	2017-11-10 10:04:08.049	4	5948	0	1
52784	1027	2017-11-09	7200	0	0	33	tneufeld	sea		670	\N	2017-11-09	2017-11-30	5790	71	\N	agongora	0		\N	\N	tneufeld	2017-11-10 10:04:40.58	4	5790	0	1
52780	1027	2017-11-09	7200	0	0	60	tneufeld	sea		593	\N	2017-11-09	2017-11-30	5078	22	\N	agongora	0		\N	\N	tneufeld	2017-11-10 10:02:31.815	4	5078	0	1
52847	1027	2017-11-30	3600	0	0	40	tneufeld	sea		659	\N	2017-11-30	2017-12-21	2915	33	\N	cmartinez	0		\N	\N	tneufeld	2017-11-30 14:33:55.096	4	2915	0	1
52791	1044	2017-11-13	16560	0	0	60	tneufeld	william			\N	2017-11-13	2017-12-04	11846	140	\N	cmartinez	0		\N	\N	tneufeld	2017-11-13 10:34:05.549	7	11846	0	1
52787	1050	2017-11-13	9180	0	0	37	tneufeld	eric			\N	2017-11-13	2017-12-04	7881	37	\N	cmartinez	0		\N	\N	tneufeld	2017-11-13 08:25:15.299	2	7881	0	1
52797	1047	2017-11-16	3600	6840	0	55	tneufeld	abram			\N	2017-11-16	2017-12-07	2728	20	\N	cmartinez	0		\N	\N	tneufeld	2017-11-16 08:55:48.44	2	2728	0	1
52808	1027	2017-11-16	4320	0	0	27	tneufeld	sea		688	\N	2017-11-16	2017-12-07	3138	51	\N	cmartinez	0		\N	\N	tneufeld	2017-11-17 08:02:31.658	4	3138	0	1
52807	1027	2017-11-16	11880	0	0	32	tneufeld	sea		676	\N	2017-11-16	2017-12-07	9089	55	\N	cmartinez	0		\N	\N	tneufeld	2017-11-17 08:02:09.846	4	9089	0	1
52840	1047	2017-11-30	9720	0	0	57	tneufeld	Tim			\N	2017-11-30	2017-12-21	6964	51	\N	agongora	0		\N	\N	tneufeld	2017-11-30 08:51:33.815	2	6964	0	1
52838	1048	2017-11-30	3420	0	0	52	tneufeld	Tina			\N	2017-11-30	2017-12-21	2836	18	\N	agongora	0		\N	\N	tneufeld	2017-11-30 08:22:56.127	1	2836	0	1
52843	1049	2017-11-30	14220	0	0	43	tneufeld	Richard			\N	2017-11-30	2017-12-21	12282	35	\N	agongora	0		\N	\N	tneufeld	2017-11-30 09:06:08.768	2	12282	0	1
52842	1053	2017-11-30	1080	0	0	29	tneufeld	Edward			\N	2017-11-30	2017-12-21	455	0	\N	agongora	0		\N	\N	tneufeld	2017-11-30 08:59:41.143	2	455	0	1
52841	1051	2017-11-30	4140	0	0	29	tneufeld	Linda			\N	2017-11-30	2017-12-21	3114	0	\N	agongora	0		\N	\N	tneufeld	2017-11-30 08:57:56.502	2	3114	0	1
52839	1052	2017-11-30	2160	0	0	29	tneufeld	Luis			\N	2017-11-30	2017-12-21	1706	5	\N	agongora	0		\N	\N	tneufeld	2017-11-30 08:43:38.018	3	1706	0	1
52845	1027	2017-11-30	3960	0	0	56	tneufeld	sea		618	\N	2017-11-30	2017-12-21	3166	6	\N	agongora	0		\N	\N	tneufeld	2017-11-30 14:31:23.487	4	3166	0	1
52846	1027	2017-11-30	7200	0	0	44	tneufeld	sea		650	\N	2017-11-30	2017-12-21	5759	69	\N	cmartinez	0		\N	\N	tneufeld	2017-11-30 14:32:32.94	4	5759	0	1
52848	1027	2017-11-30	6480	0	0	36	tneufeld	sea		669	\N	2017-11-30	2017-12-21	5396	42	\N	cmartinez	0		\N	\N	tneufeld	2017-11-30 14:34:56.94	4	5396	0	1
52850	1027	2017-11-30	6840	0	0	34	tneufeld	sea		676	\N	2017-11-30	2017-12-21	5492	17	\N	cmartinez	0		\N	\N	tneufeld	2017-11-30 14:37:14.534	4	5492	0	1
52849	1027	2017-11-30	11520	0	0	36	tneufeld	sea		670	\N	2017-11-30	2017-12-21	9761	23	\N	cmartinez	0		\N	\N	tneufeld	2017-11-30 14:36:19.065	4	9761	0	1
52844	1027	2017-11-30	3600	0	0	56	tneufeld	sea		617	\N	2017-11-30	2017-12-21	2667	6	\N	agongora	0		\N	\N	tneufeld	2017-11-30 14:30:31.659	4	2667	0	1
52853	1047	2017-12-04	7200	0	0	57	tneufeld	Abram			\N	2017-12-04	2017-12-25	4597	43	\N	agongora	0		\N	\N	tneufeld	2017-12-04 07:44:50.63	2	4597	0	1
52854	1048	2017-12-04	2880	0	0	52	tneufeld	Anton			\N	2017-12-04	2017-12-25	2257	30	\N	agongora	0		\N	\N	tneufeld	2017-12-04 07:45:52.302	1	2257	0	1
52859	1049	2017-12-04	10800	8280	0	44	tneufeld	Richard			\N	2017-12-04	2017-12-25	8996	45	\N	agongora	0		\N	\N	tneufeld	2017-12-04 07:50:38.334	2	8996	0	1
52860	1051	2017-12-04	2520	3600	0	30	tneufeld	Leonard			\N	2017-12-04	2017-12-25	1956	4	\N	agongora	0		\N	\N	tneufeld	2017-12-04 08:19:58.287	2	1956	0	1
52856	1052	2017-12-04	1800	0	0	30	tneufeld	kenton			\N	2017-12-04	2017-12-25	1385	10	\N	agongora	0		\N	\N	tneufeld	2017-12-04 07:48:04.068	3	1385	0	1
52857	1053	2017-12-04	1080	0	0	30	tneufeld	edward			\N	2017-12-04	2017-12-25	527	7	\N	agongora	0		\N	\N	tneufeld	2017-12-04 07:48:53.943	2	527	0	1
52866	1054	2017-12-07	9000	0	0	67	jfehr	jake			\N	2017-12-07	2017-12-28	3270	50	\N	agongora	0		\N	\N	tneufeld	2017-12-07 08:53:34.927	6	6421	3151	2
52886	1052	2017-12-11	6840	0	0	31	jfehr	kenton			\N	2017-12-11	2018-01-01	4978	36	\N	agongora	0		\N	\N	tneufeld	2017-12-11 08:33:36.489	3	4978	0	1
52865	1044	2017-12-07	9000	4320	0	64	jfehr	william			\N	2017-12-07	2017-12-28	5981	45	\N	agongora	0		\N	\N	tneufeld	2017-12-07 08:50:05.021	7	5981	0	1
52870	1047	2017-12-07	8820	6300	0	58	jfehr	Tim			\N	2017-12-07	2017-12-28	5960	65	\N	agongora	0		\N	\N	tneufeld	2017-12-07 09:22:28.115	2	5960	0	1
52867	1049	2017-12-07	13680	8640	0	44	jfehr	Nelson			\N	2017-12-07	2017-12-28	11572	33	\N	cmartinez	0		\N	\N	tneufeld	2017-12-07 08:58:35.224	2	11572	0	1
52868	1050	2017-12-07	5400	2880	0	40	jfehr	Abe			\N	2017-12-07	2017-12-28	4947	12	\N	cmartinez	0		\N	\N	tneufeld	2017-12-07 09:04:44.818	2	4947	0	1
52864	1051	2017-12-07	6300	4140	0	30	jfehr	Linda			\N	2017-12-07	2017-12-28	5208	4	\N	cmartinez	0		\N	\N	tneufeld	2017-12-07 08:43:57.552	2	5208	0	1
52863	1053	2017-12-07	2160	2160	0	30	jfehr	Edward			\N	2017-12-07	2017-12-28	1331	0	\N	agongora	0		\N	\N	tneufeld	2017-12-07 08:19:47.396	2	1331	0	1
52862	1055	2017-12-07	2160	1080	0	26	jfehr	Paul			\N	2017-12-07	2017-12-28	1836	0	\N	agongora	0		\N	\N	tneufeld	2017-12-07 08:06:21.818	2	1836	0	1
52878	1027	2017-12-07	6840	0	0	35	jfehr	sea		676	\N	2017-12-07	2017-12-28	5577	13	\N	agongora	0		\N	\N	tneufeld	2017-12-08 09:31:34.99	4	5577	0	1
52876	1027	2017-12-07	7560	0	0	37	jfehr	sea		669	\N	2017-12-07	2017-12-28	5895	26	\N	agongora	0		\N	\N	tneufeld	2017-12-08 09:30:26.287	4	5895	0	1
52875	1027	2017-12-07	19800	0	0	41	jfehr	sea		659	\N	2017-12-07	2017-12-28	16430	93	\N	agongora	0		\N	\N	tneufeld	2017-12-08 09:29:36.224	4	16430	0	1
52874	1027	2017-12-07	5760	0	0	57	jfehr	sea		621	\N	2017-12-07	2017-12-28	3751	14	\N	agongora	0		\N	\N	tneufeld	2017-12-08 09:28:03.177	4	3751	0	1
52872	1027	2017-12-07	4680	0	0	57	jfehr	sea		618	\N	2017-12-07	2017-12-28	3255	8	\N	agongora	0		\N	\N	tneufeld	2017-12-08 09:26:42.787	4	3255	0	1
52873	1027	2017-12-07	4680	0	0	57	jfehr	sea		620	\N	2017-12-07	2017-12-28	2807	43	\N	agongora	0		\N	\N	tneufeld	2017-12-08 09:27:25.771	4	2807	0	1
52871	1027	2017-12-07	4680	0	0	57	jfehr	sea		617	\N	2017-12-07	2017-12-28	3592	8	\N	agongora	0		\N	\N	tneufeld	2017-12-08 09:25:38.568	4	3592	0	1
52881	1044	2017-12-11	7920	0	0	64	jfehr	Joe			\N	2017-12-11	2018-01-01	4605	30	\N	agongora	0		\N	\N	tneufeld	2017-12-11 08:29:46.177	7	4605	0	1
52883	1048	2017-12-11	4320	0	0	53	jfehr	Anton			\N	2017-12-11	2018-01-01	3429	19	\N	agongora	0		\N	\N	tneufeld	2017-12-11 08:31:04.411	1	3429	0	1
52884	1049	2017-12-11	13680	0	0	45	jfehr	Otto			\N	2017-12-11	2018-01-01	10380	61	\N	agongora	0		\N	\N	tneufeld	2017-12-11 08:31:58.271	2	10380	0	1
52880	1050	2017-12-11	5400	0	0	40	jfehr	eric			\N	2017-12-11	2018-01-01	4614	22	\N	agongora	0		\N	\N	tneufeld	2017-12-11 08:10:28.63	2	4614	0	1
52887	1053	2017-12-11	3240	0	0	31	jfehr	edward			\N	2017-12-11	2018-01-01	1819	8	\N	agongora	0		\N	\N	tneufeld	2017-12-11 08:34:17.708	2	1819	0	1
52888	1055	2017-12-11	3960	0	0	27	jfehr	Paul			\N	2017-12-11	2018-01-01	3187	5	\N	agongora	0		\N	\N	tneufeld	2017-12-11 08:35:04.911	2	3187	0	1
52809	1054	2017-11-20	4680	0	0	64	tneufeld	jake			\N	2017-11-20	2017-12-11	1612	20	\N	cmartinez	0		\N	\N	tneufeld	2017-11-20 08:25:43.611	6	3306	1694	2
52815	1049	2017-11-20	19620	0	0	42	tneufeld	nelson			\N	2017-11-20	2017-12-11	16443	134	\N	cmartinez	0		\N	\N	tneufeld	2017-11-20 10:49:43.002	2	16443	0	1
52817	1044	2017-11-23	12600	0	0	62	tneufeld	william			\N	2017-11-23	2017-12-14	8872	95	\N	cmartinez	0		\N	\N	tneufeld	2017-11-23 08:08:53.924	7	8872	0	1
52821	1050	2017-11-23	7020	0	0	38	tneufeld	abe			\N	2017-11-23	2017-12-14	5733	90	\N	cmartinez	0		\N	\N	tneufeld	2017-11-23 09:06:47.893	2	5733	0	1
52825	1054	2017-11-27	8280	0	0	65	tneufeld	jake			\N	2017-11-27	2017-12-18	2528	200	\N	agongora	0		\N	\N	tneufeld	2017-11-27 08:14:52.376	6	5206	2678	2
52831	1049	2017-11-27	19260	0	0	43	tneufeld	otto			\N	2017-11-27	2017-12-18	16180	101	\N	agongora	0		\N	\N	tneufeld	2017-11-27 10:01:31.142	2	16180	0	1
52833	1051	2017-11-27	2160	0	0	29	tneufeld	leonard			\N	2017-11-27	2017-12-18	1441	2	\N	agongora	0		\N	\N	tneufeld	2017-11-27 11:23:22.33	2	1441	0	1
52837	1044	2017-11-30	9000	0	0	63	tneufeld	William			\N	2017-11-30	2017-12-21	6127	65	\N	agongora	0		\N	\N	tneufeld	2017-11-30 08:17:49.502	7	6127	0	1
52835	1050	2017-11-30	5400	0	0	39	tneufeld	Abe			\N	2017-11-30	2017-12-21	4850	9	\N	agongora	0		\N	\N	tneufeld	2017-11-30 07:50:46.94	2	4850	0	1
52834	1055	2017-11-30	360	0	0	25	tneufeld	Paul Penner			\N	2017-11-30	2017-12-21	270	0	\N	agongora	0		\N	\N	tneufeld	2017-11-30 07:38:54.971	2	270	0	1
52851	1027	2017-11-30	5400	0	0	29	tneufeld	sea		688	\N	2017-11-30	2017-12-21	3804	50	\N	agongora	0		\N	\N	tneufeld	2017-11-30 14:38:06.971	4	3804	0	1
52852	1044	2017-12-04	6480	0	0	63	tneufeld	Joe			\N	2017-12-04	2017-12-25	3890	55	\N	agongora	0		\N	\N	tneufeld	2017-12-04 07:43:47.037	7	3890	0	1
52855	1050	2017-12-04	4320	0	0	40	tneufeld	Abe			\N	2017-12-04	2017-12-25	3824	28	\N	agongora	0		\N	\N	tneufeld	2017-12-04 07:46:59.396	2	3824	0	1
52858	1055	2017-12-04	900	0	0	26	tneufeld	Paul			\N	2017-12-04	2017-12-25	619	0	\N	agongora	0		\N	\N	tneufeld	2017-12-04 07:49:36.005	2	619	0	1
52894	1053	2017-12-14	7200	2160	0	31	jfehr	Edward			\N	2017-12-14	2018-01-04	5316	19	\N	cmanzanero	0		\N	\N	jfehr	2017-12-14 09:33:09.708	2	5316	0	1
52903	1055	2017-12-18	12780	3240	0	28	jfehr	Paul			\N	2017-12-18	2018-01-08	10415	46	\N	cmanzanero	0		\N	\N	jfehr	2017-12-18 09:37:01.505	2	10415	0	1
52913	1055	2017-12-21	10260	0	0	28	jfehr	Jose			\N	2017-12-21	2018-01-11	8374	52	\N	cmanzanero	0		\N	\N	jfehr	2017-12-21 08:47:50.13	2	8374	0	1
52861	1048	2017-12-07	4320	2880	0	53	jfehr	Anton			\N	2017-12-07	2017-12-28	3375	28	\N	agongora	0		\N	\N	tneufeld	2017-12-07 07:55:59.959	1	3375	0	1
52869	1052	2017-12-07	5220	3960	0	30	jfehr	Luis			\N	2017-12-07	2017-12-28	4198	10	\N	agongora	0		\N	\N	tneufeld	2017-12-07 09:12:41.021	3	4198	0	1
52877	1027	2017-12-07	10800	0	0	37	jfehr	sea		670	\N	2017-12-07	2017-12-28	8675	35	\N	agongora	0		\N	\N	tneufeld	2017-12-08 09:31:04.537	4	8675	0	1
52879	1027	2017-12-07	10800	0	0	30	jfehr	sea		688	\N	2017-12-07	2017-12-28	8222	30	\N	agongora	0		\N	\N	tneufeld	2017-12-08 09:32:23.552	4	8222	0	1
52889	1054	2017-12-11	6480	0	0	67	jfehr	Jake			\N	2017-12-11	2018-01-01	2100	70	\N	agongora	0		\N	\N	tneufeld	2017-12-11 08:46:26.786	6	4263	2163	2
52895	1047	2017-12-14	14940	3240	0	59	jfehr	Abram			\N	2017-12-14	2018-01-04	9530	148	\N	cmanzanero	0		\N	\N	jfehr	2017-12-14 10:11:02.021	2	9530	0	1
52897	1048	2017-12-14	6480	1440	0	54	jfehr	Anton			\N	2017-12-14	2018-01-04	5313	21	\N	cmanzanero	0		\N	\N	jfehr	2017-12-14 10:57:06.146	1	5313	0	1
52896	1049	2017-12-14	23040	4680	0	45	jfehr	Otto			\N	2017-12-14	2018-01-04	19587	52	\N	cmanzanero	0		\N	\N	jfehr	2017-12-14 10:54:28.317	2	19587	0	1
52892	1051	2017-12-14	11520	2340	0	31	jfehr	Linda	9360 fix		\N	2017-12-14	2018-01-04	9763	38	\N	cmanzanero	0		\N	\N	jfehr	2017-12-14 08:50:25.927	2	9763	0	1
52898	1052	2017-12-14	14220	3240	0	31	jfehr	Luis			\N	2017-12-14	2018-01-04	11404	27	\N	cmanzanero	0		\N	\N	jfehr	2017-12-14 11:21:17.927	3	11404	0	1
52907	1054	2017-12-18	12600	0	0	68	jfehr	Jake			\N	2017-12-18	2018-01-08	4160	30	\N	cmanzanero	0		\N	\N	jfehr	2017-12-18 10:25:47.676	6	8383	4223	2
52899	1044	2017-12-18	7020	1620	0	65	jfehr	Joe			\N	2017-12-18	2018-01-08	4287	47	\N	cmanzanero	0		\N	\N	jfehr	2017-12-18 08:25:38.692	7	4287	0	1
52901	1047	2017-12-18	12240	2880	0	59	jfehr	Tim			\N	2017-12-18	2018-01-08	7665	55	\N	cmanzanero	0		\N	\N	jfehr	2017-12-18 09:06:44.161	2	7665	0	1
52905	1049	2017-12-18	18540	4680	0	46	jfehr	nelson			\N	2017-12-18	2018-01-08	14793	65	\N	cmanzanero	0		\N	\N	jfehr	2017-12-18 09:56:25.848	2	14793	0	1
52900	1050	2017-12-18	7200	1080	0	42	jfehr	Eric			\N	2017-12-18	2018-01-08	5956	18	\N	cmanzanero	0		\N	\N	jfehr	2017-12-18 08:26:29.333	2	5956	0	1
52902	1051	2017-12-18	9540	2340	0	32	jfehr	Linda			\N	2017-12-18	2018-01-08	8225	19	\N	cmanzanero	0		\N	\N	jfehr	2017-12-18 09:18:14.208	2	8225	0	1
52908	1052	2017-12-18	14220	3780	0	32	jfehr	Kenton	\N		\N	2017-12-18	2018-01-08	10243	87	\N	cmanzanero	0		\N	\N	jfehr	2017-12-18 10:27:51.317	3	10243	0	1
52912	1044	2017-12-21	4860	720	0	66	jfehr	William			\N	2017-12-21	2018-01-11	3052	33	\N	cmanzanero	0		\N	\N	jfehr	2017-12-21 08:32:04.301	7	3052	0	1
52916	1048	2017-12-21	3960	900	0	55	jfehr	Tina			\N	2017-12-21	2018-01-11	2958	42	\N	cmanzanero	0		\N	\N	jfehr	2017-12-21 09:57:46.926	1	2958	0	1
52917	1049	2017-12-21	13680	4680	0	46	jfehr	Johann			\N	2017-12-21	2018-01-11	11337	35	\N	cmanzanero	0		\N	\N	jfehr	2017-12-21 10:11:47.286	2	11337	0	1
52911	1050	2017-12-21	5400	1260	0	42	jfehr	Abe			\N	2017-12-21	2018-01-11	4889	15	\N	cmanzanero	0		\N	\N	jfehr	2017-12-21 08:16:37.301	2	4889	0	1
52910	1051	2017-12-21	7560	2520	0	32	jfehr	Leonard			\N	2017-12-21	2018-01-11	6660	46	\N	cmanzanero	0		\N	\N	jfehr	2017-12-21 07:48:24.223	2	6660	0	1
52915	1052	2017-12-21	11700	4320	0	32	jfehr	Luis	11520 fix		\N	2017-12-21	2018-01-11	9277	88	\N	cmanzanero	0		\N	\N	jfehr	2017-12-21 09:11:12.036	3	9277	0	1
52919	1044	2017-12-25	2880	0	0	66	wcabb	Joe			\N	2017-12-25	2018-01-15	1693	10	\N	agongora	0		\N	\N	jfehr	2017-12-25 07:45:47.218	7	1693	0	1
52920	1047	2017-12-25	8460	0	0	60	wcabb	Abram			\N	2017-12-25	2018-01-15	6266	92	\N	agongora	0		\N	\N	jfehr	2017-12-25 07:46:23.733	2	6266	0	1
52937	1048	2017-12-25	4320	0	0	55	wcabb	Anton			\N	2017-12-25	2018-01-15	3237	16	\N	agongora	0		\N	\N	jfehr	2017-12-28 17:07:55.78	1	3237	0	1
52922	1050	2017-12-25	5040	0	0	43	wcabb	Abe			\N	2017-12-25	2018-01-15	4514	55	\N	agongora	0		\N	\N	jfehr	2017-12-25 07:47:34.936	2	4514	0	1
52923	1051	2017-12-25	9180	0	0	33	wcabb	Leanord			\N	2017-12-25	2018-01-15	8304	66	\N	agongora	0		\N	\N	jfehr	2017-12-25 07:48:06.093	2	8304	0	1
52924	1052	2017-12-25	15660	0	0	33	wcabb	Kenton			\N	2017-12-25	2018-01-15	12720	115	\N	cmanzanero	0		\N	\N	jfehr	2017-12-25 07:48:50.639	3	12720	0	1
52926	1055	2017-12-25	14220	0	0	29	wcabb	Paul			\N	2017-12-25	2018-01-15	12624	63	\N	cmanzanero	0		\N	\N	jfehr	2017-12-25 07:49:40.468	2	12624	0	1
52936	1054	2017-12-28	3600	0	0	70	jfehr	Jake			\N	2017-12-28	2018-01-18	1099	25	\N	agongora	0		\N	\N	jfehr	2017-12-28 16:04:11.843	6	2100	1001	2
52928	1047	2017-12-28	11160	0	0	61	wcabb	Abram			\N	2017-12-28	2018-01-18	6736	56	\N	agongora	0		\N	\N	jfehr	2017-12-28 13:41:35.264	2	6736	0	1
52929	1048	2017-12-28	5400	0	0	56	wcabb	Anton			\N	2017-12-28	2018-01-18	3993	34	\N	agongora	0		\N	\N	jfehr	2017-12-28 13:42:47.452	1	3993	0	1
52930	1049	2017-12-28	18000	0	0	47	wcabb	Otto			\N	2017-12-28	2018-01-18	14663	60	\N	cmanzanero	0		\N	\N	jfehr	2017-12-28 13:43:14.671	2	14663	0	1
52933	1052	2017-12-28	18360	0	0	33	wcabb	Kenton			\N	2017-12-28	2018-01-18	14423	132	\N	cmanzanero	0		\N	\N	jfehr	2017-12-28 13:45:30.671	3	14423	0	1
52932	1051	2017-12-28	10080	0	0	33	wcabb	Leonard			\N	2017-12-28	2018-01-18	9343	11	\N	agongora	0		\N	\N	jfehr	2017-12-28 13:44:45.514	2	9343	0	1
52934	1053	2017-12-28	8280	0	0	33	wcabb	Edward			\N	2017-12-28	2018-01-18	7347	28	\N	cmanzanero	0		\N	\N	jfehr	2017-12-28 13:45:53.343	2	7347	0	1
52836	1054	2017-11-30	6120	0	0	66	tneufeld	Jake			\N	2017-11-30	2017-12-21	2225	48	\N	agongora	0		\N	\N	tneufeld	2017-11-30 07:59:20.565	6	4237	2012	2
52882	1047	2017-12-11	9180	0	0	58	jfehr	Abram			\N	2017-12-11	2018-01-01	4994	57	\N	agongora	0		\N	\N	tneufeld	2017-12-11 08:30:32.317	2	4994	0	1
52885	1051	2017-12-11	6660	0	0	31	jfehr	Leonard			\N	2017-12-11	2018-01-01	5350	21	\N	agongora	0		\N	\N	tneufeld	2017-12-11 08:32:51.911	2	5350	0	1
52952	1051	2018-01-04	11160	0	0	34	jfehr	Linda			\N	2018-01-04	2018-01-25	10409	18	\N	agongora	0		\N	\N	jfehr	2018-01-04 09:07:27.818	2	10409	0	1
52893	1044	2017-12-14	13140	1980	0	65	jfehr	Emory			\N	2017-12-14	2018-01-04	7990	100	\N	cmanzanero	0		\N	\N	jfehr	2017-12-14 09:25:06.583	7	7990	0	1
52891	1050	2017-12-14	9000	1080	0	41	jfehr	Abe			\N	2017-12-14	2018-01-04	7887	40	\N	cmanzanero	0		\N	\N	jfehr	2017-12-14 08:23:20.067	2	7887	0	1
52890	1055	2017-12-14	11160	2880	0	27	jfehr	paul			\N	2017-12-14	2018-01-04	9367	30	\N	cmanzanero	0		\N	\N	jfehr	2017-12-14 08:16:22.771	2	9367	0	1
52904	1048	2017-12-18	5040	1440	0	54	jfehr	Anton			\N	2017-12-18	2018-01-08	3792	26	\N	cmanzanero	0		\N	\N	jfehr	2017-12-18 09:41:04.63	1	3792	0	1
52906	1053	2017-12-18	7200	2160	0	32	jfehr	Edward			\N	2017-12-18	2018-01-08	5509	33	\N	cmanzanero	0		\N	\N	jfehr	2017-12-18 09:59:52.426	2	5509	0	1
52914	1047	2017-12-21	8640	2880	0	60	jfehr	Tim			\N	2017-12-21	2018-01-11	5224	48	\N	cmanzanero	0		\N	\N	jfehr	2017-12-21 08:53:06.067	2	5224	0	1
52909	1053	2017-12-21	5400	2160	0	32	jfehr	Edward			\N	2017-12-21	2018-01-11	4599	18	\N	cmanzanero	0		\N	\N	jfehr	2017-12-21 07:33:26.926	2	4599	0	1
52918	1054	2017-12-25	7920	0	0	69	wcabb	Jake			\N	2017-12-25	2018-01-15	2423	103	\N	agongora	0		\N	\N	jfehr	2017-12-25 07:44:04.889	6	4882	2459	2
52921	1049	2017-12-25	17460	0	0	47	wcabb	Otto			\N	2017-12-25	2018-01-15	13748	154	\N	agongora	0		\N	\N	jfehr	2017-12-25 07:47:08.343	2	13748	0	1
52925	1053	2017-12-25	7560	0	0	33	wcabb	Edward			\N	2017-12-25	2018-01-15	6517	62	\N	cmanzanero	0		\N	\N	jfehr	2017-12-25 07:49:14.624	2	6517	0	1
52938	1047	2018-01-01	7200	0	0	61	wcabb	Abram 			\N	2018-01-01	2018-01-22	4280	46	\N	agongora	0		\N	\N	jfehr	2018-01-01 07:22:14.748	2	4280	0	1
52983	1053	2018-01-15	8280	0	0	36	jfehr	Edward			\N	2018-01-15	2018-02-05	6340	53	\N	agongora	0		\N	\N	jfehr	2018-01-15 09:09:21.064	2	6340	0	1
52940	1049	2018-01-01	14400	0	0	48	wcabb	Otto			\N	2018-01-01	2018-01-22	11544	120	\N	agongora	0		\N	\N	jfehr	2018-01-01 07:34:11.295	2	11544	0	1
52941	1050	2018-01-01	5400	0	0	44	wcabb	Abe			\N	2018-01-01	2018-01-22	4969	50	\N	agongora	0		\N	\N	jfehr	2018-01-01 07:34:36.733	2	4969	0	1
52942	1051	2018-01-01	7740	0	0	34	wcabb	Leonard			\N	2018-01-01	2018-01-22	7046	48	\N	agongora	0		\N	\N	jfehr	2018-01-01 07:35:19.233	2	7046	0	1
52944	1053	2018-01-01	6120	0	0	34	wcabb	Edward			\N	2018-01-01	2018-01-22	5424	53	\N	agongora	0		\N	\N	jfehr	2018-01-01 07:36:22.889	2	5424	0	1
52945	1055	2018-01-01	11880	0	0	30	wcabb	Paul			\N	2018-01-01	2018-01-22	10684	63	\N	agongora	0		\N	\N	jfehr	2018-01-01 07:38:15.436	2	10684	0	1
52977	1054	2018-01-15	15840	0	0	72	jfehr	Galen			\N	2018-01-15	2018-02-05	4614	70	\N	agongora	0		\N	\N	jfehr	2018-01-15 08:20:29.251	6	9010	4396	2
52947	1048	2018-01-04	5040	0	0	57	jfehr	Anton			\N	2018-01-04	2018-01-25	3006	180	\N	agongora	0		\N	\N	jfehr	2018-01-04 07:55:09.197	1	3006	0	1
52950	1050	2018-01-04	7200	0	0	44	jfehr	Abe			\N	2018-01-04	2018-01-25	6466	16	\N	agongora	0		\N	\N	jfehr	2018-01-04 08:20:33.209	2	6466	0	1
52951	1052	2018-01-04	21240	0	0	34	jfehr	Luis			\N	2018-01-04	2018-01-25	17095	81	\N	cmanzanero	0		\N	\N	jfehr	2018-01-04 08:57:20.239	3	17095	0	1
52966	1055	2018-01-04	16560	0	0	30	jfehr	Paul			\N	2018-01-04	2018-01-25	14321	120	\N	agongora	0		\N	\N	jfehr	2018-01-09 15:05:26.507	2	14321	0	1
52946	1056	2018-01-04	1260	0	0	27	jfehr	Leo			\N	2018-01-04	2018-01-25	816	6	\N	agongora	0		\N	\N	jfehr	2018-01-04 07:50:31.728	3	816	0	1
52957	1047	2018-01-08	10440	0	0	62	jfehr	Tim			\N	2018-01-08	2018-01-29	5702	80	\N	agongora	0		\N	\N	jfehr	2018-01-08 08:36:12.313	2	5702	0	1
52964	1048	2018-01-08	4680	0	0	57	jfehr	Anton			\N	2018-01-08	2018-01-29	3452	55	\N	agongora	0		\N	\N	jfehr	2018-01-08 10:20:33.546	1	3452	0	1
52961	1049	2018-01-08	18000	0	0	49	jfehr	Otto			\N	2018-01-08	2018-01-29	13744	102	\N	agongora	0		\N	\N	jfehr	2018-01-08 09:41:31.843	2	13744	0	1
52965	1053	2018-01-08	7920	0	0	35	jfehr	Edward			\N	2018-01-08	2018-01-29	6617	14	\N	agongora	0		\N	\N	jfehr	2018-01-09 13:39:27.131	2	6617	0	1
52958	1051	2018-01-08	10080	0	0	35	jfehr	Linda			\N	2018-01-08	2018-01-29	8850	70	\N	agongora	0		\N	\N	jfehr	2018-01-08 08:44:27.907	2	8850	0	1
52959	1055	2018-01-08	15840	0	0	31	jfehr	Paul			\N	2018-01-08	2018-01-29	13977	121	\N	agongora	0		\N	\N	jfehr	2018-01-08 08:58:17.331	2	13977	0	1
52962	1057	2018-01-08	540	0	0	26	jfehr	Otto			\N	2018-01-08	2018-01-29	361	5	\N	agongora	0		\N	\N	jfehr	2018-01-08 09:43:03.031	2	361	0	1
52960	1056	2018-01-08	5040	0	0	28	jfehr	Leo			\N	2018-01-08	2018-01-29	3506	12	\N	agongora	0		\N	\N	jfehr	2018-01-08 09:08:15.016	3	3506	0	1
52976	1048	2018-01-11	3600	0	0	58	jfehr	Anton			\N	2018-01-11	2018-02-01	1981	42	\N	agongora	0		\N	\N	jfehr	2018-01-11 13:48:52.625	1	1981	0	1
52975	1049	2018-01-11	13500	0	0	49	jfehr	Otto			\N	2018-01-11	2018-02-01	11107	77	\N	agongora	0		\N	\N	jfehr	2018-01-11 09:59:11.831	2	11107	0	1
52968	1050	2018-01-11	5040	0	0	45	jfehr	Abe			\N	2018-01-11	2018-02-01	4485	23	\N	agongora	0		\N	\N	jfehr	2018-01-11 08:20:28.834	2	4485	0	1
52971	1051	2018-01-11	7560	0	0	35	jfehr	Linda			\N	2018-01-11	2018-02-01	6883	23	\N	agongora	0		\N	\N	jfehr	2018-01-11 08:48:43.948	2	6883	0	1
52973	1052	2018-01-11	14400	0	0	35	jfehr	Kenton			\N	2018-01-11	2018-02-01	11569	78	\N	agongora	0		\N	\N	jfehr	2018-01-11 09:22:50.313	3	11569	0	1
52969	1055	2018-01-11	11880	0	0	31	jfehr	Paul			\N	2018-01-11	2018-02-01	10625	50	\N	agongora	0		\N	\N	jfehr	2018-01-11 08:30:37.258	2	10625	0	1
52974	1057	2018-01-11	1080	0	0	26	jfehr	Otto			\N	2018-01-11	2018-02-01	764	110	\N	agongora	0		\N	\N	jfehr	2018-01-11 09:57:16.779	2	764	0	1
52954	1054	2018-01-04	17640	0	0	71	jfehr	Jake			\N	2018-01-04	2018-01-25	5227	173	\N	agongora	0		\N	\N	jfehr	2018-01-04 15:04:24.819	6	10339	5112	2
52986	1047	2018-01-15	4680	0	0	63	jfehr	Tim			\N	2018-01-15	2018-02-05	2516	21	\N	agongora	0		\N	\N	jfehr	2018-01-15 09:37:27.725	2	2516	0	1
52987	1049	2018-01-15	18000	0	0	50	jfehr	Otto			\N	2018-01-15	2018-02-05	13182	140	\N	agongora	0		\N	\N	jfehr	2018-01-15 13:43:27.073	2	13182	0	1
52979	1050	2018-01-15	6660	0	0	46	jfehr	Eric			\N	2018-01-15	2018-02-05	5895	54	\N	agongora	0		\N	\N	jfehr	2018-01-15 08:36:25.882	2	5895	0	1
52982	1055	2018-01-15	15660	0	0	32	jfehr	Paul			\N	2018-01-15	2018-02-05	13560	121	\N	agongora	0		\N	\N	jfehr	2018-01-15 09:04:01.356	2	13560	0	1
52981	1051	2018-01-15	9720	0	0	36	jfehr	Leonard			\N	2018-01-15	2018-02-05	8957	22	\N	agongora	0		\N	\N	jfehr	2018-01-15 08:49:44.35	2	8957	0	1
52978	1056	2018-01-15	11340	0	0	29	jfehr	Leo			\N	2018-01-15	2018-02-05	9054	80	\N	agongora	0		\N	\N	jfehr	2018-01-15 08:25:17.248	3	9054	0	1
52992	1047	2018-01-18	2520	0	0	64	jfehr	Tim			\N	2018-01-18	2018-02-08	1429	31	\N	agongora	0		\N	\N	jfehr	2018-01-18 08:33:53.372	2	1429	0	1
52988	1048	2018-01-18	3240	0	0	59	jfehr	Anton			\N	2018-01-18	2018-02-08	2253	31	\N	agongora	0		\N	\N	jfehr	2018-01-18 07:57:06.129	1	2253	0	1
52991	1050	2018-01-18	5040	0	0	46	jfehr	Abe			\N	2018-01-18	2018-02-08	4521	15	\N	agongora	0		\N	\N	jfehr	2018-01-18 08:30:22.749	2	4521	0	1
52995	1053	2018-01-18	6120	0	0	36	jfehr	Edward			\N	2018-01-18	2018-02-08	5469	28	\N	agongora	0		\N	\N	jfehr	2018-01-18 08:59:59.929	2	5469	0	1
52990	1055	2018-01-18	11700	0	0	32	jfehr	Elma			\N	2018-01-18	2018-02-08	10319	36	\N	agongora	0		\N	\N	jfehr	2018-01-18 08:26:14.541	2	10319	0	1
52989	1056	2018-01-18	9540	0	0	29	jfehr	Leo	5940		\N	2018-01-18	2018-02-08	8171	33	\N	agongora	0		\N	\N	jfehr	2018-01-18 08:18:57.171	3	8171	0	1
52927	1044	2017-12-28	2160	0	0	67	wcabb	Joe			\N	2017-12-28	2018-01-18	1091	19	\N	agongora	0		\N	\N	jfehr	2017-12-28 13:40:58.827	7	1091	0	1
52931	1050	2017-12-28	7200	0	0	43	wcabb	Abe			\N	2017-12-28	2018-01-18	6487	39	\N	agongora	0		\N	\N	jfehr	2017-12-28 13:43:38.858	2	6487	0	1
52935	1055	2017-12-28	15480	0	0	29	wcabb	Paul			\N	2017-12-28	2018-01-18	13499	120	\N	cmanzanero	0		\N	\N	jfehr	2017-12-28 13:46:19.999	2	13499	0	1
52998	1054	2018-01-18	4320	0	0	73	jfehr	Jake	5760		\N	2018-01-18	2018-02-08	1306	94	\N	agongora	0	paid .48 for 855 layers	\N	\N	jfehr	2018-01-18 14:03:12.914	6	2645	1339	2
52939	1048	2018-01-01	3780	0	0	56	wcabb	Anton			\N	2018-01-01	2018-01-22	2831	38	\N	agongora	0		\N	\N	jfehr	2018-01-01 07:23:59.014	1	2831	0	1
52943	1052	2018-01-01	12060	0	0	34	wcabb	Kenton			\N	2018-01-01	2018-01-22	9686	65	\N	agongora	0		\N	\N	jfehr	2018-01-01 07:35:57.452	3	9686	0	1
53004	1049	2018-01-22	16200	1440	0	51	jfehr	Rodney			\N	2018-01-22	2018-02-12	11515	66	\N	jquewell	0		\N	\N	jfehr	2018-01-22 09:22:10.019	2	11515	0	1
53029	1048	2018-01-29	3240	1080	0	60	jfehr	Tina	3600		\N	2018-01-29	2018-02-19	2252	39	\N	agongora	0		\N	\N	jfehr	2018-01-29 09:23:01.12	1	2252	0	1
52948	1047	2018-01-04	12240	0	0	62	jfehr	Tim			\N	2018-01-04	2018-01-25	6982	80	\N	agongora	0		\N	\N	jfehr	2018-01-04 08:11:09.797	2	6982	0	1
52953	1049	2018-01-04	18360	0	0	48	jfehr	Otto	18720		\N	2018-01-04	2018-01-25	14740	49	\N	agongora	0		\N	\N	jfehr	2018-01-04 09:19:19.611	2	14740	0	1
52949	1053	2018-01-04	9000	0	0	34	jfehr	Edward			\N	2018-01-04	2018-01-25	7621	100	\N	cmanzanero	0		\N	\N	jfehr	2018-01-04 08:17:12.288	2	7621	0	1
53028	1054	2018-01-29	7740	0	0	74	jfehr	Galen			\N	2018-01-29	2018-02-19	1976	65	\N	agongora	0		\N	\N	jfehr	2018-01-29 08:44:30.822	6	3967	1991	2
52956	1054	2018-01-08	5400	1800	0	71	jfehr	Galen			\N	2018-01-08	2018-01-29	1540	40	\N	agongora	0		\N	\N	jfehr	2018-01-08 08:19:45.594	6	3062	1522	2
52955	1050	2018-01-08	7200	0	0	45	jfehr	Eric			\N	2018-01-08	2018-01-29	6130	47	\N	agongora	0		\N	\N	jfehr	2018-01-08 08:00:23.446	2	6130	0	1
52963	1052	2018-01-08	18540	0	0	35	jfehr	Kenton			\N	2018-01-08	2018-01-29	14425	140	\N	agongora	0		\N	\N	jfehr	2018-01-08 09:57:38.089	3	14425	0	1
52972	1047	2018-01-11	6660	0	0	63	jfehr	Tim			\N	2018-01-11	2018-02-01	3880	67	\N	agongora	0		\N	\N	jfehr	2018-01-11 09:07:45.971	2	3880	0	1
52970	1053	2018-01-11	6480	0	0	35	jfehr	Edward			\N	2018-01-11	2018-02-01	5564	79	\N	agongora	0		\N	\N	jfehr	2018-01-11 08:36:51.711	2	5564	0	1
52967	1056	2018-01-11	5940	0	0	28	jfehr	Leo			\N	2018-01-11	2018-02-01	4640	7	\N	agongora	0		\N	\N	jfehr	2018-01-11 07:56:14.437	3	4640	0	1
53013	1055	2018-01-25	11880	1800	0	33	jfehr	Elma			\N	2018-01-25	2018-02-15	10817	31	\N	agongora	0		\N	\N	jfehr	2018-01-25 09:00:46.561	2	10817	0	1
53023	1055	2018-01-29	13500	3960	0	34	jfehr	Elma			\N	2018-01-29	2018-02-19	11938	65	\N	agongora	0		\N	\N	jfehr	2018-01-29 08:04:31.687	2	11938	0	1
53031	1049	2018-01-29	12960	4320	0	52	jfehr	Otto 			\N	2018-01-29	2018-02-19	10383	70	\N	agongora	0		\N	\N	jfehr	2018-01-29 09:39:46.463	2	10383	0	1
53026	1050	2018-01-29	5040	1620	0	48	jfehr	Eric			\N	2018-01-29	2018-02-19	4436	30	\N	agongora	0		\N	\N	jfehr	2018-01-29 08:37:41.161	2	4436	0	1
52997	1049	2018-01-18	13140	0	0	50	jfehr	Rodney			\N	2018-01-18	2018-02-08	9691	100	\N	agongora	0		\N	\N	jfehr	2018-01-18 09:32:12.625	2	9691	0	1
53006	1047	2018-01-22	2340	0	0	37	jfehr	Tim			\N	2018-01-22	2018-02-12	1275	23	\N	jquewell	0		\N	\N	jfehr	2018-01-22 09:35:10.268	2	1275	0	1
53001	1050	2018-01-22	6660	0	0	47	jfehr	Eric			\N	2018-01-22	2018-02-12	5833	51	\N	jquewell	0		\N	\N	jfehr	2018-01-22 08:29:48.472	2	5833	0	1
53003	1051	2018-01-22	8640	1260	0	37	jfehr	Linda			\N	2018-01-22	2018-02-12	7878	33	\N	jquewell	0		\N	\N	jfehr	2018-01-22 09:12:04.423	2	7878	0	1
53007	1052	2018-01-22	16560	2160	0	37	jfehr	Kenton			\N	2018-01-22	2018-02-12	12560	129	\N	jquewell	0		\N	\N	jfehr	2018-01-22 09:47:17.537	3	12560	0	1
53000	1055	2018-01-22	13320	1800	0	33	jfehr	Paul 			\N	2018-01-22	2018-02-12	11499	53	\N	jquewell	0		\N	\N	jfehr	2018-01-22 08:24:41.56	2	11499	0	1
52999	1056	2018-01-22	11880	1620	0	29	jfehr	Leo			\N	2018-01-22	2018-02-12	10421	65	\N	jquewell	0		\N	\N	jfehr	2018-01-22 07:32:56.635	3	10421	0	1
53020	1058	2018-01-25	4320	1440	0	74	jfehr	Jake			\N	2018-01-25	2018-02-15	1471	3	\N	agongora	0		\N	\N	jfehr	2018-01-25 10:35:05.104	6	2831	1360	2
53016	1047	2018-01-25	900	0	0	65	jfehr	John			\N	2018-01-25	2018-02-15	518	7	\N	agongora	0		\N	\N	jfehr	2018-01-25 09:22:19.441	2	518	0	1
53017	1049	2018-01-25	14400	0	0	51	jfehr	Otto 			\N	2018-01-25	2018-02-15	10970	120	\N	agongora	0		\N	\N	jfehr	2018-01-25 09:46:33.716	2	10970	0	1
53009	1050	2018-01-25	4860	0	0	47	jfehr	Eric			\N	2018-01-25	2018-02-15	4454	24	\N	agongora	0		\N	\N	jfehr	2018-01-25 08:02:51.165	2	4454	0	1
53012	1053	2018-01-25	6480	1080	0	37	jfehr	Edward			\N	2018-01-25	2018-02-15	5832	11	\N	agongora	0		\N	\N	jfehr	2018-01-25 08:53:12.937	2	5832	0	1
53011	1052	2018-01-25	14220	2160	0	37	jfehr	Luis	3420		\N	2018-01-25	2018-02-15	11620	50	\N	agongora	0		\N	\N	jfehr	2018-01-25 08:47:13.265	3	11620	0	1
53015	1056	2018-01-25	10440	1620	0	30	jfehr	Rene			\N	2018-01-25	2018-02-15	9163	21	\N	agongora	0		\N	\N	jfehr	2018-01-25 09:19:20.273	3	9163	0	1
53027	1058	2018-01-29	9000	0	0	74	jfehr	Galen			\N	2018-01-29	2018-02-19	3202	40	\N	agongora	0		\N	\N	jfehr	2018-01-29 08:44:07.985	6	6363	3161	2
53044	1058	2018-02-01	6300	0	0	75	jfehr	Jake 			\N	2018-02-01	2018-02-22	2925	14	\N	agongora	0		\N	\N	jfehr	2018-02-01 09:59:09.432	6	5294	2369	2
53034	1058	2018-01-08	180	0	0	71	jfehr	Jake			\N	2018-01-08	2018-01-29	29	5	\N	agongora	0		\N	\N	jfehr	2018-01-30 08:57:23.603	6	64	35	2
53045	1048	2018-02-01	3240	1080	0	61	jfehr	Tina			\N	2018-02-01	2018-02-22	2434	24	\N	agongora	0		\N	\N	jfehr	2018-02-01 10:07:55.026	1	2434	0	1
53048	1049	2018-02-05	17280	4320	0	53	jfehr	Rodney			\N	2018-02-05	2018-02-26	13893	107	\N	agongora	0		\N	\N	jfehr	2018-02-05 08:53:14.388	2	13893	0	1
53018	1054	2018-01-25	14760	0	0	74	jfehr	Linda			\N	2018-01-25	2018-02-15	4576	65	\N	agongora	0		\N	\N	jfehr	2018-01-25 10:02:48.687	6	8730	4154	2
53030	1053	2018-01-29	7200	2160	0	38	jfehr	Jake			\N	2018-01-29	2018-02-19	6078	53	\N	agongora	0		\N	\N	jfehr	2018-01-29 09:30:31.145	2	6078	0	1
53024	1052	2018-01-29	16380	4500	0	38	jfehr	Luis	14580		\N	2018-01-29	2018-02-19	12743	138	\N	agongora	0		\N	\N	jfehr	2018-01-29 08:19:08.582	3	12743	0	1
53025	1056	2018-01-29	12240	3420	0	31	jfehr	Leo			\N	2018-01-29	2018-02-19	10708	113	\N	agongora	0		\N	\N	jfehr	2018-01-29 08:27:35.587	3	10708	0	1
53043	1054	2018-02-01	4140	0	0	75	jfehr	Jake			\N	2018-02-01	2018-02-22	1236	23	\N	agongora	0		\N	\N	jfehr	2018-02-01 09:58:19.641	6	2472	1236	2
53037	1050	2018-02-01	5040	1620	0	48	jfehr	Abe 			\N	2018-02-01	2018-02-22	4473	27	\N	agongora	0		\N	\N	jfehr	2018-02-01 08:47:44.977	2	4473	0	1
53039	1051	2018-02-01	7560	2520	0	38	jfehr	Linda			\N	2018-02-01	2018-02-22	6922	17	\N	agongora	0		\N	\N	jfehr	2018-02-01 09:03:59.171	2	6922	0	1
53041	1053	2018-02-01	6120	1980	0	38	jfehr	Edward			\N	2018-02-01	2018-02-22	5437	20	\N	agongora	0		\N	\N	jfehr	2018-02-01 09:30:39.596	2	5437	0	1
53038	1055	2018-02-01	11520	3600	0	34	jfehr	Elma			\N	2018-02-01	2018-02-22	10264	70	\N	agongora	0		\N	\N	jfehr	2018-02-01 08:56:57.666	2	10264	0	1
53035	1056	2018-02-01	10620	3420	0	31	jfehr	Leo			\N	2018-02-01	2018-02-22	9495	50	\N	agongora	0		\N	\N	jfehr	2018-02-01 07:52:12.178	3	9495	0	1
53040	1057	2018-02-01	11160	3960	0	29	jfehr	Richard			\N	2018-02-01	2018-02-22	9656	75	\N	agongora	0		\N	\N	jfehr	2018-02-01 09:11:25.497	2	9656	0	1
53047	1050	2018-02-05	6480	1620	0	49	jfehr	Eric			\N	2018-02-05	2018-02-26	5376	44	\N	agongora	0		\N	\N	jfehr	2018-02-05 08:12:16.539	2	5376	0	1
53049	1051	2018-02-05	9720	2520	0	39	jfehr	Linda			\N	2018-02-05	2018-02-26	8454	28	\N	agongora	0		\N	\N	jfehr	2018-02-05 08:58:04.799	2	8454	0	1
53050	1055	2018-02-05	12960	5940	0	35	jfehr	Paul			\N	2018-02-05	2018-02-26	11218	87	\N	agongora	0		\N	\N	jfehr	2018-02-05 09:15:36.623	2	11218	0	1
52984	1048	2018-01-15	4500	0	0	58	jfehr	Anton			\N	2018-01-15	2018-02-05	3220	38	\N	agongora	0		\N	\N	jfehr	2018-01-15 09:17:07.252	1	3220	0	1
52985	1052	2018-01-15	18720	0	0	36	jfehr	Luis			\N	2018-01-15	2018-02-05	14381	133	\N	agongora	0		\N	\N	jfehr	2018-01-15 09:30:28.96	3	14381	0	1
52980	1057	2018-01-15	3600	0	0	27	jfehr	Richard			\N	2018-01-15	2018-02-05	2534	11	\N	agongora	0		\N	\N	jfehr	2018-01-15 08:40:23.404	2	2534	0	1
52996	1052	2018-01-18	14220	0	0	36	jfehr	Luis			\N	2018-01-18	2018-02-08	11350	75	\N	agongora	0		\N	\N	jfehr	2018-01-18 09:17:26.944	3	11350	0	1
52994	1051	2018-01-18	7560	0	0	36	jfehr	Linda			\N	2018-01-18	2018-02-08	7053	10	\N	agongora	0		\N	\N	jfehr	2018-01-18 08:45:32.331	2	7053	0	1
52993	1057	2018-01-18	4860	0	0	27	jfehr	Richard			\N	2018-01-18	2018-02-08	3749	21	\N	agongora	0		\N	\N	jfehr	2018-01-18 08:41:15.031	2	3749	0	1
53008	1048	2018-01-22	3960	0	0	59	jfehr	Anton			\N	2018-01-22	2018-02-12	3411	27	\N	jquewell	0		\N	\N	jfehr	2018-01-22 10:11:11.617	1	3411	0	1
53005	1053	2018-01-22	7200	1080	0	37	jfehr	Edward			\N	2018-01-22	2018-02-12	6185	54	\N	jquewell	0		\N	\N	jfehr	2018-01-22 09:26:33.668	2	6185	0	1
53002	1057	2018-01-22	8820	1080	0	28	jfehr	Richard			\N	2018-01-22	2018-02-12	6731	61	\N	jquewell	0		\N	\N	jfehr	2018-01-22 08:47:15.493	2	6731	0	1
53019	1048	2018-01-25	3600	0	0	60	jfehr	Mark			\N	2018-01-25	2018-02-15	2369	24	\N	agongora	0		\N	\N	jfehr	2018-01-25 10:20:08.037	1	2369	0	1
53010	1051	2018-01-25	7560	1260	0	37	jfehr	Linda			\N	2018-01-25	2018-02-15	6834	14	\N	agongora	0		\N	\N	jfehr	2018-01-25 08:25:46.455	2	6834	0	1
53014	1057	2018-01-25	8640	1620	0	28	jfehr	Evang			\N	2018-01-25	2018-02-15	7124	24	\N	agongora	0		\N	\N	jfehr	2018-01-25 09:11:36.543	2	7124	0	1
53100	1049	2018-02-22	11880	7920	0	55	jfehr	Otto			\N	2018-02-22	2018-03-15	8935	147	\N	agongora	0		\N	\N	jfehr	2018-02-22 08:52:05.486	2	8935	0	1
53053	1056	2018-02-05	12420	5040	0	32	jfehr	Leo			\N	2018-02-05	2018-02-26	11015	29	\N	agongora	0		\N	\N	jfehr	2018-02-05 09:55:26.883	3	11015	0	1
53057	1056	2018-02-08	10800	5040	0	32	jfehr	Leo			\N	2018-02-08	2018-03-01	9442	76	\N	agongora	0		\N	\N	jfehr	2018-02-08 08:18:32.295	3	9442	0	1
53084	1049	2018-02-15	14040	4320	0	54	jfehr	Richard			\N	2018-02-15	2018-03-08	11110	293	\N	agongora	0		\N	\N	jfehr	2018-02-15 10:16:01.854	2	11110	0	1
53021	1058	2018-01-15	360	0	0	72	jfehr	Jake			\N	2018-01-15	2018-02-05	90	0	\N	agongora	0		\N	\N	jfehr	2018-01-25 13:18:01.704	6	193	103	2
53064	1049	2018-02-08	12780	4320	0	53	jfehr	Rodney			\N	2018-02-08	2018-03-01	10198	120	\N	agongora	0		\N	\N	jfehr	2018-02-08 09:47:24.429	2	10198	0	1
53074	1048	2018-02-12	5400	0	0	62	jfehr	Anton			\N	2018-02-12	2018-03-05	3302	66	\N	agongora	0		\N	\N	jfehr	2018-02-12 10:29:44.215	1	3302	0	1
53033	1047	2018-01-29	900	0	0	65	jfehr	Abram	864		\N	2018-01-29	2018-02-19	472	10	\N	agongora	0		\N	\N	jfehr	2018-01-29 10:53:06.291	2	472	0	1
53022	1051	2018-01-29	8640	2520	0	38	jfehr	Vanessa			\N	2018-01-29	2018-02-19	7894	40	\N	agongora	0		\N	\N	jfehr	2018-01-29 07:43:59.168	2	7894	0	1
53032	1057	2018-01-29	12600	2880	0	29	jfehr	Richard			\N	2018-01-29	2018-02-19	10734	96	\N	agongora	0		\N	\N	jfehr	2018-01-29 09:51:08.004	2	10734	0	1
53042	1049	2018-02-01	12960	4320	0	52	jfehr	Otto			\N	2018-02-01	2018-02-22	10245	80	\N	agongora	0		\N	\N	jfehr	2018-02-01 09:42:05.831	2	10245	0	1
53054	1057	2018-02-05	14400	6300	0	30	jfehr	Richard			\N	2018-02-05	2018-02-26	12280	88	\N	agongora	0		\N	\N	jfehr	2018-02-05 10:23:13.493	2	12280	0	1
53058	1058	2018-02-08	7020	0	0	76	jfehr	Jake			\N	2018-02-08	2018-03-01	2756	35	\N	agongora	0		\N	\N	jfehr	2018-02-08 08:26:28.201	6	5549	2793	2
53059	1050	2018-02-08	5040	1620	0	49	jfehr	Abe			\N	2018-02-08	2018-03-01	4189	38	\N	agongora	0		\N	\N	jfehr	2018-02-08 08:31:05.46	2	4189	0	1
53062	1053	2018-02-08	6120	1980	0	39	jfehr	Edward			\N	2018-02-08	2018-03-01	4518	45	\N	agongora	0		\N	\N	jfehr	2018-02-08 09:09:23.64	2	4518	0	1
53060	1051	2018-02-08	7200	2340	0	39	jfehr	Robert			\N	2018-02-08	2018-03-01	6209	20	\N	agongora	0		\N	\N	jfehr	2018-02-08 08:40:19.139	2	6209	0	1
53063	1055	2018-02-08	11520	5940	0	35	jfehr	Elma			\N	2018-02-08	2018-03-01	9729	60	\N	agongora	0		\N	\N	jfehr	2018-02-08 09:31:39.294	2	9729	0	1
53067	1058	2018-02-12	9540	0	0	76	jfehr	Jake			\N	2018-02-12	2018-03-05	3615	200	\N	agongora	0		\N	\N	jfehr	2018-02-12 08:05:43.422	6	6986	3371	2
53091	1049	2018-02-19	12960	7560	0	55	jfehr	Nelsen			\N	2018-02-19	2018-03-12	10126	71	\N	agongora	0		\N	\N	jfehr	2018-02-19 09:19:15.07	2	10126	0	1
53071	1049	2018-02-12	15480	6120	0	54	jfehr	Otto			\N	2018-02-12	2018-03-05	12525	85	\N	agongora	0		\N	\N	jfehr	2018-02-12 09:22:09.639	2	12525	0	1
53072	1057	2018-02-12	16560	8640	0	31	jfehr	Evang			\N	2018-02-12	2018-03-05	14645	117	\N	agongora	0		\N	\N	jfehr	2018-02-12 10:14:49.546	2	14645	0	1
53069	1052	2018-02-12	16200	9180	0	40	jfehr	Luis			\N	2018-02-12	2018-03-05	12833	104	\N	agongora	0		\N	\N	jfehr	2018-02-12 08:34:00.353	3	12833	0	1
53081	1048	2018-02-15	1080	2160	0	63	jfehr	Tina	stay home 3240		\N	2018-02-15	2018-03-08	682	8	\N	agongora	0		\N	\N	jfehr	2018-02-15 08:38:07.541	1	682	0	1
53066	1056	2018-02-12	12600	6840	0	33	jfehr	Leo			\N	2018-02-12	2018-03-05	11107	99	\N	agongora	0		\N	\N	jfehr	2018-02-12 07:52:13.746	3	11107	0	1
53080	1050	2018-02-15	7020	0	0	50	jfehr	Abe			\N	2018-02-15	2018-03-08	5802	27	\N	agongora	0		\N	\N	jfehr	2018-02-15 08:35:08.275	2	5802	0	1
53075	1053	2018-02-12	6840	1800	0	40	jfehr	Edward			\N	2018-02-12	2018-03-05	5788	45	\N	agongora	0		\N	\N	jfehr	2018-02-13 08:34:31.393	2	5788	0	1
53079	1052	2018-02-15	13860	8820	0	40	jfehr	Luis			\N	2018-02-15	2018-03-08	11247	43	\N	agongora	0		\N	\N	jfehr	2018-02-15 08:29:27.564	3	11247	0	1
53083	1053	2018-02-15	9000	0	0	40	jfehr	Jake			\N	2018-02-15	2018-03-08	7569	24	\N	agongora	0		\N	\N	jfehr	2018-02-15 09:34:11.245	2	7569	0	1
53078	1055	2018-02-15	11520	7920	0	36	jfehr	Elma			\N	2018-02-15	2018-03-08	10403	33	\N	agongora	0		\N	\N	jfehr	2018-02-15 08:08:20.436	2	10403	0	1
53076	1056	2018-02-15	10800	6660	0	33	jfehr	Leo			\N	2018-02-15	2018-03-08	9424	122	\N	agongora	0		\N	\N	jfehr	2018-02-15 07:51:22.96	3	9424	0	1
53094	1048	2018-02-19	4320	2160	0	63	jfehr	Jake			\N	2018-02-19	2018-03-12	2342	75	\N	agongora	0		\N	\N	jfehr	2018-02-19 10:00:09.303	1	2342	0	1
53095	1058	2018-02-22	9540	0	0	26	jfehr	Jake			\N	2018-02-22	2018-03-15	4058	83	\N	agongora	0		\N	\N	jfehr	2018-02-22 08:04:39.206	6	7934	3876	2
53092	1052	2018-02-19	18360	8640	0	41	jfehr	Cindy			\N	2018-02-19	2018-03-12	14749	103	\N	agongora	0		\N	\N	jfehr	2018-02-19 09:49:55.674	3	14749	0	1
53088	1051	2018-02-19	6840	3960	0	41	jfehr	Lynell			\N	2018-02-19	2018-03-12	5850	80	\N	agongora	0		\N	\N	jfehr	2018-02-19 08:56:32.125	2	5850	0	1
53087	1053	2018-02-19	3960	3960	0	41	jfehr	Jake			\N	2018-02-19	2018-03-12	3360	19	\N	agongora	0		\N	\N	jfehr	2018-02-19 08:43:27.685	2	3360	0	1
53085	1056	2018-02-19	14400	6480	0	34	jfehr	Leo			\N	2018-02-19	2018-03-12	12497	121	\N	agongora	0		\N	\N	jfehr	2018-02-19 07:49:51.526	3	12497	0	1
53093	1057	2018-02-19	18720	9720	0	32	jfehr	Richard			\N	2018-02-19	2018-03-12	16320	99	\N	agongora	0		\N	\N	jfehr	2018-02-19 09:55:52.293	2	16320	0	1
53086	1058	2018-02-19	14400	2340	0	25	jfehr	Jake			\N	2018-02-19	2018-03-12	5633	260	\N	agongora	0		\N	\N	jfehr	2018-02-19 08:10:06.317	6	11464	5831	2
53099	1050	2018-02-22	4860	3240	0	51	jfehr	Abe			\N	2018-02-22	2018-03-15	4135	36	\N	agongora	0		\N	\N	jfehr	2018-02-22 08:42:25.682	2	4135	0	1
53103	1053	2018-02-22	6120	3960	0	41	jfehr	Jake			\N	2018-02-22	2018-03-15	5365	45	\N	agongora	0		\N	\N	jfehr	2018-02-22 09:09:32.644	2	5365	0	1
53102	1052	2018-02-22	13680	8640	0	41	jfehr	Cindy			\N	2018-02-22	2018-03-15	10982	49	\N	agongora	0		\N	\N	jfehr	2018-02-22 09:08:16.536	3	10982	0	1
53098	1055	2018-02-22	3600	7200	0	37	jfehr	Paul			\N	2018-02-22	2018-03-15	3268	23	\N	agongora	0		\N	\N	jfehr	2018-02-22 08:38:09.278	2	3268	0	1
53096	1056	2018-02-22	17100	0	0	34	jfehr	Leo			\N	2018-02-22	2018-03-15	15099	83	\N	agongora	0		\N	\N	jfehr	2018-02-22 08:20:40.359	3	15099	0	1
53036	1052	2018-02-01	13860	4860	0	38	jfehr	Luis			\N	2018-02-01	2018-02-22	11314	51	\N	agongora	0		\N	\N	jfehr	2018-02-01 08:42:17.51	3	11314	0	1
53046	1058	2018-02-05	9000	0	0	75	jfehr	Jake 			\N	2018-02-05	2018-02-26	3453	104	\N	agongora	0		\N	\N	jfehr	2018-02-05 08:05:52.059	6	6878	3425	2
53052	1048	2018-02-05	4320	1080	0	61	jfehr	Anton			\N	2018-02-05	2018-02-26	2796	67	\N	agongora	0		\N	\N	jfehr	2018-02-05 09:28:50.291	1	2796	0	1
53051	1053	2018-02-05	7920	2160	0	39	jfehr	Edward			\N	2018-02-05	2018-02-26	6380	66	\N	agongora	0		\N	\N	jfehr	2018-02-05 09:24:30.89	2	6380	0	1
53055	1052	2018-02-05	16560	7020	0	39	jfehr	Kenton			\N	2018-02-05	2018-02-26	13105	110	\N	agongora	0		\N	\N	jfehr	2018-02-05 10:25:22.831	3	13105	0	1
53065	1048	2018-02-08	3240	1080	0	62	jfehr	Tina			\N	2018-02-08	2018-03-01	2189	35	\N	agongora	0		\N	\N	jfehr	2018-02-08 10:29:01.252	1	2189	0	1
53056	1052	2018-02-08	14220	6840	0	39	jfehr	Luis			\N	2018-02-08	2018-03-01	11404	51	\N	agongora	0		\N	\N	jfehr	2018-02-08 08:10:43.133	3	11404	0	1
53117	1048	2018-03-01	900	0	0	65	jfehr	Anton			\N	2018-03-01	2018-03-22	521	9	\N	agongora	0		\N	\N	jfehr	2018-03-01 08:08:10.723	1	521	0	1
53120	1052	2018-03-01	13500	8460	0	42	jfehr	Luis			\N	2018-03-01	2018-03-22	10675	62	\N	agongora	0		\N	\N	jfehr	2018-03-01 08:35:15.927	3	10675	0	1
53108	1052	2018-02-26	17820	8640	0	42	jfehr	Luis			\N	2018-02-26	2018-03-19	13940	80	\N	agongora	0		\N	\N	jfehr	2018-02-26 08:51:09.503	3	13940	0	1
53061	1057	2018-02-08	12600	6480	0	76	jfehr	Richard			\N	2018-02-08	2018-03-01	11120	63	\N	agongora	0		\N	\N	jfehr	2018-02-08 08:53:52.573	2	11120	0	1
53068	1050	2018-02-12	5760	2340	0	50	jfehr	Eric			\N	2018-02-12	2018-03-05	4780	46	\N	agongora	0		\N	\N	jfehr	2018-02-12 08:10:52.001	2	4780	0	1
53070	1055	2018-02-12	13500	7740	0	36	jfehr	Paul			\N	2018-02-12	2018-03-05	12004	65	\N	agongora	0		\N	\N	jfehr	2018-02-12 08:46:46.111	2	12004	0	1
53073	1051	2018-02-12	11880	0	0	40	jfehr	Leonard			\N	2018-02-12	2018-03-05	10709	25	\N	agongora	0		\N	\N	jfehr	2018-02-12 10:22:28.187	2	10709	0	1
53077	1051	2018-02-15	4680	2520	0	40	jfehr	Leonard			\N	2018-02-15	2018-03-08	4244	3	\N	agongora	0		\N	\N	jfehr	2018-02-15 07:58:48.929	2	4244	0	1
53082	1057	2018-02-15	13680	9000	0	31	jfehr	Richard			\N	2018-02-15	2018-03-08	11955	183	\N	agongora	0		\N	\N	jfehr	2018-02-15 08:47:59.969	2	11955	0	1
53089	1050	2018-02-19	3240	3240	0	51	jfehr	Eric			\N	2018-02-19	2018-03-12	2733	22	\N	agongora	0		\N	\N	jfehr	2018-02-19 09:00:28.901	2	2733	0	1
53090	1055	2018-02-19	23220	0	0	37	jfehr	Paul			\N	2018-02-19	2018-03-12	20412	146	\N	agongora	0		\N	\N	jfehr	2018-02-19 09:09:11.006	2	20412	0	1
53112	1049	2018-02-26	16560	7920	0	56	jfehr	Richard			\N	2018-02-26	2018-03-19	12213	190	\N	agongora	0		\N	\N	jfehr	2018-02-26 09:38:22.053	2	12213	0	1
53107	1050	2018-02-26	6300	2880	0	52	jfehr	Eric			\N	2018-02-26	2018-03-19	4889	117	\N	agongora	0		\N	\N	jfehr	2018-02-26 08:29:50.496	2	4889	0	1
53113	1053	2018-02-26	9720	1800	0	42	jfehr	Edward			\N	2018-02-26	2018-03-19	8162	105	\N	agongora	0		\N	\N	jfehr	2018-02-26 09:46:00.47	2	8162	0	1
53109	1055	2018-02-26	15300	7920	0	38	jfehr	Paul			\N	2018-02-26	2018-03-19	13502	145	\N	agongora	0		\N	\N	jfehr	2018-02-26 09:01:29.056	2	13502	0	1
53110	1057	2018-02-26	20160	9720	0	33	jfehr	Evang			\N	2018-02-26	2018-03-19	17973	129	\N	agongora	0		\N	\N	jfehr	2018-02-26 09:19:01.573	2	17973	0	1
53116	1058	2018-03-01	4320	1440	0	27	jfehr	Jake			\N	2018-03-01	2018-03-22	1872	38	\N	agongora	0		\N	\N	jfehr	2018-03-01 07:48:25.743	6	3700	1828	2
53115	1050	2018-03-01	7740	0	0	52	jfehr	Eric			\N	2018-03-01	2018-03-22	6428	80	\N	agongora	0		\N	\N	jfehr	2018-03-01 07:36:40.68	2	6428	0	1
53121	1051	2018-03-01	2160	4680	0	42	jfehr	Linda			\N	2018-03-01	2018-03-22	1896	12	\N	agongora	0		\N	\N	jfehr	2018-03-01 08:38:28.991	2	1896	0	1
53119	1055	2018-03-01	11700	7560	0	38	jfehr	Elma			\N	2018-03-01	2018-03-22	10301	122	\N	agongora	0		\N	\N	jfehr	2018-03-01 08:22:27.88	2	10301	0	1
53118	1056	2018-03-01	10260	6840	0	35	jfehr	Leo			\N	2018-03-01	2018-03-22	9188	30	\N	agongora	0		\N	\N	jfehr	2018-03-01 08:10:53.817	3	9188	0	1
53124	1057	2018-03-01	12240	11880	0	33	jfehr	Nelsen			\N	2018-03-01	2018-03-22	10903	101	\N	agongora	0		\N	\N	jfehr	2018-03-01 09:17:48.181	2	10903	0	1
53131	1049	2018-03-05	19800	3960	0	57	jfehr	Otto			\N	2018-03-05	2018-03-26	14258	116	\N	agongora	0		\N	\N	jfehr	2018-03-05 09:21:14.635	2	14258	0	1
53128	1050	2018-03-05	4860	1620	0	53	jfehr	Eric			\N	2018-03-05	2018-03-26	3729	59	\N	agongora	0		\N	\N	jfehr	2018-03-05 08:38:54.562	2	3729	0	1
53132	1052	2018-03-05	21780	4500	0	43	jfehr	Luis			\N	2018-03-05	2018-03-26	16654	135	\N	agongora	0		\N	\N	jfehr	2018-03-05 09:58:04.108	3	16654	0	1
53129	1056	2018-03-05	17100	4500	0	36	jfehr	Juan Carlos			\N	2018-03-05	2018-03-26	14822	75	\N	agongora	0		\N	\N	jfehr	2018-03-05 08:44:35	3	14822	0	1
53133	1055	2018-03-05	22500	0	0	39	jfehr	Elma			\N	2018-03-05	2018-03-26	19587	101	\N	agongora	0		\N	\N	jfehr	2018-03-05 10:20:57.469	2	19587	0	1
53136	1058	2018-03-08	5040	2160	0	28	jfehr	Jake			\N	2018-03-08	2018-03-29	2191	46	\N	agongora	0		\N	\N	jfehr	2018-03-08 08:07:38.293	6	4218	2027	2
53126	1053	2018-03-05	3960	3780	0	43	jfehr	Edward			\N	2018-03-05	2018-03-26	3149	20	\N	agongora	0		\N	\N	jfehr	2018-03-05 08:12:36.763	2	3149	0	1
53140	1049	2018-03-08	11880	3960	0	57	jfehr	Nelson			\N	2018-03-08	2018-03-29	9076	72	\N	agongora	0		\N	\N	jfehr	2018-03-08 09:06:41.014	2	9076	0	1
53139	1050	2018-03-08	4860	1620	0	53	jfehr	Abe			\N	2018-03-08	2018-03-29	3780	106	\N	agongora	0		\N	\N	jfehr	2018-03-08 08:56:41.592	2	3780	0	1
53138	1053	2018-03-08	7560	1800	0	43	jfehr	Edward			\N	2018-03-08	2018-03-29	6461	37	\N	agongora	0		\N	\N	jfehr	2018-03-08 08:51:12.404	2	6461	0	1
53141	1052	2018-03-08	13320	4320	0	43	jfehr	Luis			\N	2018-03-08	2018-03-29	10589	40	\N	agongora	0		\N	\N	jfehr	2018-03-08 09:13:08.717	3	10589	0	1
53135	1055	2018-03-08	7380	3780	0	39	jfehr	Paul			\N	2018-03-08	2018-03-29	6374	30	\N	agongora	0		\N	\N	jfehr	2018-03-08 07:59:44.777	2	6374	0	1
53137	1057	2018-03-08	14760	7200	0	34	jfehr	Richard			\N	2018-03-08	2018-03-29	13236	22	\N	agongora	0		\N	\N	jfehr	2018-03-08 08:44:58.044	2	13236	0	1
53150	1049	2018-03-12	16200	3960	0	58	jfehr	Otto			\N	2018-03-12	2018-04-02	11738	82	\N	agongora	0		\N	\N	jfehr	2018-03-12 09:48:13.023	2	11738	0	1
53146	1050	2018-03-12	4860	3060	0	54	jfehr	Eric			\N	2018-03-12	2018-04-02	3956	32	\N	agongora	0		\N	\N	jfehr	2018-03-12 08:34:49.208	2	3956	0	1
53151	1052	2018-03-12	13320	8460	0	44	jfehr	Kenton			\N	2018-03-12	2018-04-02	9888	88	\N	agongora	0		\N	\N	jfehr	2018-03-12 10:29:16.665	3	9888	0	1
53148	1051	2018-03-12	11160	0	0	44	jfehr	Linda			\N	2018-03-12	2018-04-02	9623	50	\N	agongora	0		\N	\N	jfehr	2018-03-12 08:52:39.396	2	9623	0	1
53147	1055	2018-03-12	11340	7380	0	40	jfehr	Paul			\N	2018-03-12	2018-04-02	9227	162	\N	agongora	0		\N	\N	jfehr	2018-03-12 08:45:21.084	2	9227	0	1
53149	1057	2018-03-12	17280	9360	0	35	jfehr	Richard			\N	2018-03-12	2018-04-02	14878	63	\N	agongora	0		\N	\N	jfehr	2018-03-12 09:21:22.616	2	14878	0	1
53155	1050	2018-03-15	7740	0	0	54	jfehr	Betty			\N	2018-03-15	2018-04-05	6236	42	\N	agongora	0		\N	\N	jfehr	2018-03-15 08:27:06.239	2	6236	0	1
53144	1058	2018-03-12	8280	3600	0	28	jfehr	Jake			\N	2018-03-12	2018-04-02	3561	77	\N	agongora	0		\N	\N	jfehr	2018-03-12 08:26:00.019	6	7088	3527	2
53159	1051	2018-03-15	2160	4680	0	44	jfehr	Linda			\N	2018-03-15	2018-04-05	1846	7	\N	agongora	0		\N	\N	jfehr	2018-03-15 09:23:19.154	2	1846	0	1
53157	1052	2018-03-15	17460	4320	0	44	jfehr	Luis			\N	2018-03-15	2018-04-05	13559	53	\N	agongora	0		\N	\N	jfehr	2018-03-15 09:03:44.302	3	13559	0	1
53152	1056	2018-03-15	10080	3240	0	37	jfehr	Leo 			\N	2018-03-15	2018-04-05	8854	52	\N	agongora	0		\N	\N	jfehr	2018-03-15 07:36:14.232	3	8854	0	1
53154	1057	2018-03-15	14580	9540	0	35	jfehr	Richard			\N	2018-03-15	2018-04-05	13255	45	\N	agongora	0		\N	\N	jfehr	2018-03-15 08:12:51.94	2	13255	0	1
53156	1055	2018-03-15	11160	7380	0	40	jfehr	Elma			\N	2018-03-15	2018-04-05	9650	43	\N	agongora	0		\N	\N	jfehr	2018-03-15 08:42:53.52	2	9650	0	1
53104	1048	2018-02-22	5220	0	0	64	jfehr	Mark			\N	2018-02-22	2018-03-15	3013	55	\N	agongora	0		\N	\N	jfehr	2018-02-22 11:01:23.556	1	3013	0	1
53101	1051	2018-02-22	7200	5040	0	41	jfehr	Leonard			\N	2018-02-22	2018-03-15	6430	25	\N	agongora	0		\N	\N	jfehr	2018-02-22 08:56:30.084	2	6430	0	1
53097	1057	2018-02-22	14400	7200	0	32	jfehr	Richard			\N	2018-02-22	2018-03-15	12756	82	\N	agongora	0		\N	\N	jfehr	2018-02-22 08:32:48.515	2	12756	0	1
53106	1058	2018-02-26	11160	0	0	26	jfehr	Jake			\N	2018-02-26	2018-03-19	4853	70	\N	agongora	0		\N	\N	jfehr	2018-02-26 08:01:05.17	6	9397	4544	2
53114	1048	2018-02-26	4680	0	0	64	jfehr	Anton			\N	2018-02-26	2018-03-19	2715	108	\N	agongora	0		\N	\N	jfehr	2018-02-26 11:17:24.824	1	2715	0	1
53111	1051	2018-02-26	14400	0	0	64	jfehr	Anton			\N	2018-02-26	2018-03-19	12587	40	\N	agongora	0		\N	\N	jfehr	2018-02-26 09:37:34.656	1	12587	0	1
53105	1056	2018-02-26	7200	6840	0	35	jfehr	Leo			\N	2018-02-26	2018-03-19	6397	64	\N	agongora	0		\N	\N	jfehr	2018-02-26 07:42:34.922	3	6397	0	1
53172	1058	2018-03-22	8280	2160	0	30	jfehr	Jake			\N	2018-03-22	2018-04-12	3622	60	\N	agongora	0		\N	\N	jfehr	2018-03-22 07:54:20.321	6	7217	3595	2
53122	1049	2018-03-01	12960	7560	0	56	jfehr	Rodney			\N	2018-03-01	2018-03-22	9928	127	\N	agongora	0		\N	\N	jfehr	2018-03-01 08:56:35.382	2	9928	0	1
53123	1053	2018-03-01	7920	0	0	42	jfehr	Edward			\N	2018-03-01	2018-03-22	6863	54	\N	agongora	0		\N	\N	jfehr	2018-03-01 09:02:24.46	2	6863	0	1
53180	1057	2018-03-26	12600	21960	0	37	jfehr	Richard			\N	2018-03-26	2018-04-16	11428	79	\N	agongora	0		\N	\N	jfehr	2018-03-26 08:01:40.202	2	11428	0	1
53127	1058	2018-03-05	9360	0	0	27	jfehr	Linda			\N	2018-03-05	2018-03-26	3873	166	\N	agongora	0		\N	\N	jfehr	2018-03-05 08:34:42.093	6	7462	3589	2
53130	1051	2018-03-05	11880	2340	0	43	jfehr	Linda			\N	2018-03-05	2018-03-26	10006	43	\N	agongora	0		\N	\N	jfehr	2018-03-05 09:06:10.978	2	10006	0	1
53125	1057	2018-03-05	24120	6480	0	34	jfehr	Richard			\N	2018-03-05	2018-03-26	21461	82	\N	agongora	0		\N	\N	jfehr	2018-03-05 08:09:09.403	2	21461	0	1
53189	1056	2018-03-26	0	12960	0	39	jfehr	Leo			\N	2018-03-26	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-03-27 10:10:02.39	3	\N	\N	1
53190	1051	2018-03-29	0	6840	0	46	jfehr	Leonard			\N	2018-03-29	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-03-29 07:15:24.593	2	\N	\N	1
53196	1050	2018-03-29	0	4680	0	56	jfehr	Abe			\N	2018-03-29	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-03-29 08:59:42.374	2	\N	\N	1
53198	1053	2018-03-29	0	5760	0	46	jfehr	Edward			\N	2018-03-29	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-03-29 09:37:12.858	2	\N	\N	1
53142	1051	2018-03-08	7200	2160	0	43	jfehr	Linda			\N	2018-03-08	2018-03-29	6395	35	\N	agongora	0		\N	\N	jfehr	2018-03-08 09:27:01.779	2	6395	0	1
53134	1056	2018-03-08	13500	0	0	36	jfehr	Leo			\N	2018-03-08	2018-03-29	12149	50	\N	agongora	0		\N	\N	jfehr	2018-03-08 07:52:09.027	3	12149	0	1
53208	1061	2018-04-02	0	14760	0	28	jfehr	Joe			\N	2018-04-02	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-02 08:31:37.748	2	\N	\N	1
53145	1053	2018-03-12	5760	3960	0	44	jfehr	Edward			\N	2018-03-12	2018-04-02	4601	24	\N	agongora	0		\N	\N	jfehr	2018-03-12 08:30:29.223	2	4601	0	1
53143	1056	2018-03-12	10260	3240	0	37	jfehr	Leo			\N	2018-03-12	2018-04-02	8938	69	\N	agongora	0		\N	\N	jfehr	2018-03-12 07:53:31.204	3	8938	0	1
53209	1056	2018-04-05	9900	16560	0	40	jfehr	Leo			\N	2018-04-05	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-05 07:32:03.373	3	\N	\N	1
53210	1057	2018-04-05	14580	24120	0	38	jfehr	Richard			\N	2018-04-05	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-05 07:45:08.686	2	\N	\N	1
53211	1058	2018-04-05	6840	0	0	32	tneufeld	jake			\N	2018-04-05	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-05 07:58:20.451	6	\N	\N	2
53213	1055	2018-04-05	10800	17820	0	43	tneufeld	paul			\N	2018-04-05	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-05 08:20:01.826	2	\N	\N	1
53214	1053	2018-04-05	5760	9000	0	47	tneufeld	edward			\N	2018-04-05	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-05 08:21:35.686	2	\N	\N	1
53161	1061	2018-03-15	2520	0	0	26	jfehr	Joe			\N	2018-03-15	2018-04-05	1951	5	\N	agongora	0		\N	\N	jfehr	2018-03-15 10:20:47.664	2	1951	0	1
53163	1050	2018-03-19	3240	3060	0	55	jfehr	Eric			\N	2018-03-19	2018-04-09	2500	13	\N	agongora	0		\N	\N	jfehr	2018-03-19 08:25:36.47	2	2500	0	1
53164	1053	2018-03-19	3960	3960	0	45	jfehr	Jake			\N	2018-03-19	2018-04-09	2907	46	\N	agongora	0		\N	\N	jfehr	2018-03-19 08:28:37.674	2	2907	0	1
53166	1052	2018-03-19	16920	4320	0	45	jfehr	Luis			\N	2018-03-19	2018-04-09	13112	100	\N	agongora	0		\N	\N	jfehr	2018-03-19 09:12:21.726	3	13112	0	1
53170	1055	2018-03-19	22320	0	0	41	jfehr	Elma			\N	2018-03-19	2018-04-09	19052	90	\N	agongora	0		\N	\N	jfehr	2018-03-19 10:55:26.772	2	19052	0	1
53162	1056	2018-03-19	13320	3240	0	38	jfehr	Leo			\N	2018-03-19	2018-04-09	11692	84	\N	agongora	0		\N	\N	jfehr	2018-03-19 08:03:10.37	3	11692	0	1
53165	1057	2018-03-19	19440	9900	0	36	jfehr	Richard			\N	2018-03-19	2018-04-09	17500	80	\N	agongora	0		\N	\N	jfehr	2018-03-19 08:54:45.958	2	17500	0	1
53178	1049	2018-03-22	4140	12240	0	59	jfehr	Otto			\N	2018-03-22	2018-04-12	3056	16	\N	agongora	0		\N	\N	jfehr	2018-03-22 09:11:41.275	2	3056	0	1
53174	1050	2018-03-22	3240	4500	0	55	jfehr	Abe			\N	2018-03-22	2018-04-12	2407	15	\N	agongora	0		\N	\N	jfehr	2018-03-22 08:23:00.476	2	2407	0	1
53175	1052	2018-03-22	4680	12420	0	45	jfehr	Luis			\N	2018-03-22	2018-04-12	3426	19	\N	agongora	0		\N	\N	jfehr	2018-03-22 08:43:42.149	3	3426	0	1
53176	1053	2018-03-22	3960	5400	0	45	jfehr	Jake			\N	2018-03-22	2018-04-12	3268	31	\N	agongora	0		\N	\N	jfehr	2018-03-22 08:47:18.54	2	3268	0	1
53173	1057	2018-03-22	9900	14940	0	36	jfehr	Richard			\N	2018-03-22	2018-04-12	8283	49	\N	agongora	0		\N	\N	jfehr	2018-03-22 08:07:43.396	2	8283	0	1
53179	1061	2018-03-22	1800	3960	0	27	jfehr	Joe			\N	2018-03-22	2018-04-12	1481	4	\N	agongora	0		\N	\N	jfehr	2018-03-22 16:39:09.939	2	1481	0	1
53183	1049	2018-03-26	9360	16920	0	60	jfehr	Otto 			\N	2018-03-26	2018-04-16	6109	36	\N	agongora	0		\N	\N	jfehr	2018-03-26 08:53:09.405	2	6109	0	1
53184	1051	2018-03-26	15120	0	0	46	jfehr	Linda			\N	2018-03-26	2018-04-16	12658	125	\N	agongora	0		\N	\N	jfehr	2018-03-26 08:57:41.593	2	12658	0	1
53187	1053	2018-03-26	12600	0	0	46	jfehr	Edward			\N	2018-03-26	2018-04-16	9589	126	\N	agongora	0		\N	\N	jfehr	2018-03-26 10:02:30.124	2	9589	0	1
53186	1052	2018-03-26	10800	18360	0	46	jfehr	Luis			\N	2018-03-26	2018-04-16	8006	124	\N	agongora	0		\N	\N	jfehr	2018-03-26 09:23:07.28	3	8006	0	1
53181	1061	2018-03-26	4320	10080	0	27	jfehr	William			\N	2018-03-26	2018-04-16	3628	54	\N	agongora	0		\N	\N	jfehr	2018-03-26 08:08:55.296	2	3628	0	1
53205	1058	2018-04-02	8640	2880	0	31	jfehr	Jake			\N	2018-04-02	2018-04-23	3705	44	\N	agongora	0		\N	\N	jfehr	2018-04-02 07:23:00.154	6	7127	3422	2
53194	1049	2018-03-29	12600	16740	0	60	jfehr	Otto			\N	2018-03-29	2018-04-19	8664	53	\N	agongora	0		\N	\N	jfehr	2018-03-29 08:45:33.608	2	8664	0	1
53195	1055	2018-03-29	9180	18180	0	42	jfehr	Paul			\N	2018-03-29	2018-04-19	8099	57	\N	agongora	0		\N	\N	jfehr	2018-03-29 08:52:52.14	2	8099	0	1
53193	1056	2018-03-29	10080	13500	0	39	jfehr	Juan Carlos			\N	2018-03-29	2018-04-19	8969	45	\N	agongora	0		\N	\N	jfehr	2018-03-29 08:39:53.39	3	8969	0	1
53192	1057	2018-03-29	14940	21420	0	37	jfehr	Richard			\N	2018-03-29	2018-04-19	13521	44	\N	agongora	0		\N	\N	jfehr	2018-03-29 08:03:17.733	2	13521	0	1
53188	1058	2018-03-26	13680	0	0	30	jfehr	Jake			\N	2018-03-26	2018-04-16	5645	166	\N	agongora	0		\N	\N	jfehr	2018-03-26 13:57:33.499	6	11267	5622	2
53203	1049	2018-04-02	14760	16920	0	61	jfehr	Otto			\N	2018-04-02	2018-04-23	9525	64	\N	agongora	0		\N	\N	jfehr	2018-04-02 07:03:01.186	2	9525	0	1
53201	1053	2018-04-02	3960	9360	0	47	jfehr	Jake			\N	2018-04-02	2018-04-23	3250	33	\N	agongora	0		\N	\N	jfehr	2018-04-02 06:36:18.467	2	3250	0	1
53207	1051	2018-04-02	4320	11160	0	47	jfehr	Leonard			\N	2018-04-02	2018-04-23	3441	8	\N	agongora	0		\N	\N	jfehr	2018-04-02 08:26:40.264	2	3441	0	1
53199	1052	2018-04-02	15120	18360	0	47	jfehr	Luis			\N	2018-04-02	2018-04-23	11563	73	\N	agongora	0		\N	\N	jfehr	2018-04-02 06:29:41.186	3	11563	0	1
53202	1056	2018-04-02	9720	16200	0	40	jfehr	Juan Carlos			\N	2018-04-02	2018-04-23	8627	62	\N	agongora	0		\N	\N	jfehr	2018-04-02 06:51:16.248	3	8627	0	1
53206	1057	2018-04-02	16740	24120	0	38	jfehr	Richard			\N	2018-04-02	2018-04-23	15137	75	\N	agongora	0		\N	\N	jfehr	2018-04-02 07:50:30.076	2	15137	0	1
53215	1052	2018-04-05	11880	18720	0	47	tneufeld	louis			\N	2018-04-05	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-05 08:44:18.733	3	\N	\N	1
53216	1050	2018-04-05	4320	7380	0	57	tneufeld	abe			\N	2018-04-05	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-05 08:46:24.811	2	\N	\N	1
53217	1049	2018-04-05	11880	16920	0	61	tneufeld	rodney			\N	2018-04-05	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-05 09:00:16.795	2	\N	\N	1
53218	1051	2018-04-05	6840	11160	0	47	tneufeld	linda			\N	2018-04-05	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-05 09:06:57.342	2	\N	\N	1
53219	1061	2018-04-05	6480	19800	0	29	tneufeld	william			\N	2018-04-05	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-05 10:15:59.873	2	\N	\N	1
53158	1049	2018-03-15	11880	3960	0	58	jfehr	Otto			\N	2018-03-15	2018-04-05	8955	34	\N	agongora	0		\N	\N	jfehr	2018-03-15 09:18:42.212	2	8955	0	1
53153	1053	2018-03-15	9360	0	0	44	jfehr	Edward			\N	2018-03-15	2018-04-05	8014	40	\N	agongora	0		\N	\N	jfehr	2018-03-15 07:43:53.357	2	8014	0	1
53160	1058	2018-03-15	10440	0	0	29	jfehr	Jake			\N	2018-03-15	2018-04-05	4485	85	\N	agongora	0		\N	\N	jfehr	2018-03-15 10:17:10.383	6	8958	4473	2
53220	1061	2018-04-09	12960	25560	0	29	jfehr	William			\N	2018-04-09	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-09 07:42:19.154	2	\N	\N	1
53221	1051	2018-04-09	6840	13320	0	48	jfehr	Vanessa			\N	2018-04-09	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-09 08:02:27.716	2	\N	\N	1
53222	1050	2018-04-09	4320	8820	0	58	jfehr	Eric			\N	2018-04-09	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-09 08:24:55.638	2	\N	\N	1
53223	1052	2018-04-09	12420	22680	0	48	jfehr	Luis			\N	2018-04-09	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-09 08:51:56.545	3	\N	\N	1
53225	1055	2018-04-09	8640	23580	0	44	jfehr	Veronica			\N	2018-04-09	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-09 09:06:17.826	2	\N	\N	1
53226	1049	2018-04-09	11880	19080	0	62	jfehr	Richard			\N	2018-04-09	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-09 09:22:30.576	2	\N	\N	1
53227	1057	2018-04-09	12600	30600	0	39	jfehr	Richard			\N	2018-04-09	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-09 09:22:48.466	2	\N	\N	1
53228	1056	2018-04-09	8100	19800	0	41	jfehr	Leo			\N	2018-04-09	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-09 13:19:45.763	3	\N	\N	1
53263	1057	2018-04-23	14040	37440	0	41	jfehr	Richard			\N	2018-04-23	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-23 11:04:09.468	2	\N	\N	1
53224	1053	2018-04-09	5400	10800	0	32	jfehr	Edward	''Flock ID 1058		\N	2018-04-09	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-09 08:55:48.466	6	\N	\N	1
53168	1049	2018-03-19	16020	3960	0	59	jfehr	Otto			\N	2018-03-19	2018-04-09	11311	92	\N	agongora	0		\N	\N	jfehr	2018-03-19 09:37:22.152	2	11311	0	1
53167	1051	2018-03-19	9000	4680	0	45	jfehr	Linda			\N	2018-03-19	2018-04-09	7691	41	\N	agongora	0		\N	\N	jfehr	2018-03-19 09:20:59.197	2	7691	0	1
53169	1061	2018-03-19	5760	180	0	26	jfehr	Joe			\N	2018-03-19	2018-04-09	4528	48	\N	agongora	0		\N	\N	jfehr	2018-03-19 09:47:35.159	2	4528	0	1
53229	1055	2018-04-12	11340	22860	0	44	jfehr	Elma			\N	2018-04-12	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-12 07:39:34.404	2	\N	\N	1
53230	1058	2018-04-12	9720	5040	0	33	jfehr	Jake			\N	2018-04-12	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-12 07:48:41.357	6	\N	\N	2
53231	1056	2018-04-12	10980	18360	0	41	jfehr	Heinrich			\N	2018-04-12	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-12 07:58:35.966	3	\N	\N	1
53232	1057	2018-04-12	13680	31320	0	39	jfehr	Richard			\N	2018-04-12	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-12 08:10:59.295	2	\N	\N	1
53234	1053	2018-04-12	5400	10800	0	48	jfehr	Edward			\N	2018-04-12	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-12 08:45:21.138	2	\N	\N	1
53235	1052	2018-04-12	12240	22680	0	48	jfehr	Luis			\N	2018-04-12	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-12 08:46:08.498	3	\N	\N	1
53236	1061	2018-04-12	12960	25560	0	30	jfehr	William			\N	2018-04-12	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-12 08:53:55.935	2	\N	\N	1
53237	1051	2018-04-12	5400	14400	0	48	jfehr	Linda			\N	2018-04-12	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-12 09:08:01.451	2	\N	\N	1
53238	1049	2018-04-12	9720	13320	0	62	jfehr	Cornelius			\N	2018-04-12	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-12 10:26:27.951	2	\N	\N	1
53233	1050	2018-04-12	3600	9720	0	58	jfehr	Eric	''2880		\N	2018-04-12	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-12 08:19:46.545	2	\N	\N	1
53177	1051	2018-03-22	4680	7020	0	45	jfehr	Linda			\N	2018-03-22	2018-04-12	3541	32	\N	agongora	0		\N	\N	jfehr	2018-03-22 08:55:29.102	2	3541	0	1
53171	1056	2018-03-22	13140	0	0	38	jfehr	Leo			\N	2018-03-22	2018-04-12	11148	67	\N	agongora	0		\N	\N	jfehr	2018-03-22 07:37:46.133	3	11148	0	1
53239	1056	2018-04-16	10800	19800	0	42	jfehr	Leo			\N	2018-04-16	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-16 07:32:46.295	3	\N	\N	1
53240	1058	2018-04-16	5760	2880	0	33	jfehr	Jake			\N	2018-04-16	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-16 07:39:31.107	6	\N	\N	2
53242	1050	2018-04-16	5040	10080	0	59	jfehr	Eric			\N	2018-04-16	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-16 08:21:57.435	2	\N	\N	1
53243	1051	2018-04-16	7560	15480	0	49	jfehr	Linda			\N	2018-04-16	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-16 08:29:35.857	2	\N	\N	1
53244	1053	2018-04-16	5400	12600	0	49	jfehr	Edward			\N	2018-04-16	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-16 08:37:01.482	2	\N	\N	1
53245	1057	2018-04-16	14760	35640	0	40	jfehr	Richard			\N	2018-04-16	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-16 09:01:16.701	2	\N	\N	1
53246	1052	2018-04-16	12420	25920	0	49	jfehr	Luis			\N	2018-04-16	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-16 09:16:41.201	3	\N	\N	1
53247	1055	2018-04-16	10620	26820	0	45	jfehr	Paul			\N	2018-04-16	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-16 09:21:01.279	2	\N	\N	1
53248	1049	2018-04-16	1800	12600	0	63	jfehr	Otto			\N	2018-04-16	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-16 10:44:22.623	2	\N	\N	1
53185	1050	2018-03-26	10440	0	0	56	jfehr	Betty			\N	2018-03-26	2018-04-16	8233	67	\N	agongora	0		\N	\N	jfehr	2018-03-26 09:05:51.655	2	8233	0	1
53182	1055	2018-03-26	9720	16380	0	42	jfehr	Elma	''9180 at home		\N	2018-03-26	2018-04-16	8021	69	\N	agongora	0		\N	\N	jfehr	2018-03-26 08:25:38.108	2	8021	0	1
53249	1057	2018-04-19	16740	33120	0	40	jfehr	Richard			\N	2018-04-19	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-19 07:31:16.357	2	\N	\N	1
53250	1058	2018-04-19	3960	4320	0	34	jfehr	Jake			\N	2018-04-19	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-19 07:44:27.607	6	\N	\N	2
53251	1061	2018-04-19	12960	28800	0	31	jfehr	William			\N	2018-04-19	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-19 07:48:06.763	2	\N	\N	1
53252	1052	2018-04-19	12240	28620	0	49	jfehr	Kenton			\N	2018-04-19	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-19 08:59:51.732	3	\N	\N	1
53253	1056	2018-04-19	12240	17100	0	42	jfehr	Leo			\N	2018-04-19	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-19 09:00:21.716	3	\N	\N	1
53254	1050	2018-04-19	5040	9720	0	59	jfehr	Abe			\N	2018-04-19	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-19 10:16:38.42	2	\N	\N	1
53255	1051	2018-04-19	6480	15120	0	49	jfehr	Leonard			\N	2018-04-19	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-19 10:17:08.216	2	\N	\N	1
53256	1053	2018-04-19	5400	12240	0	49	jfehr	Edward			\N	2018-04-19	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-19 10:17:38.154	2	\N	\N	1
53257	1055	2018-04-19	10620	22320	0	45	jfehr	Paul			\N	2018-04-19	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-19 10:18:05.826	2	\N	\N	1
53258	1049	2018-04-19	1800	9720	0	63	jfehr	Otto			\N	2018-04-19	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-19 14:58:54.576	2	\N	\N	1
53241	1061	2018-04-16	14760	29160	0	30	jfehr	William			\N	2018-04-16	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-16 07:47:04.091	2	\N	\N	1
53197	1052	2018-03-29	14040	16920	0	46	jfehr	Luis			\N	2018-03-29	2018-04-19	10716	49	\N	agongora	0		\N	\N	jfehr	2018-03-29 09:06:59.78	3	10716	0	1
53191	1061	2018-03-29	20520	0	0	28	jfehr	William			\N	2018-03-29	2018-04-19	18210	47	\N	agongora	0		\N	\N	jfehr	2018-03-29 07:48:29.78	2	18210	0	1
53259	1058	2018-04-23	11880	0	0	34	jfehr	Galen			\N	2018-04-23	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-23 08:04:06.437	6	\N	\N	2
53260	1050	2018-04-23	4320	10980	0	60	jfehr	Eric			\N	2018-04-23	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-23 11:02:01.031	2	\N	\N	1
53261	1051	2018-04-23	7560	15840	0	50	jfehr	Linda			\N	2018-04-23	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-23 11:02:57.546	2	\N	\N	1
53262	1053	2018-04-23	6480	12960	0	50	jfehr	Edward			\N	2018-04-23	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-23 11:03:33.328	2	\N	\N	1
53264	1055	2018-04-23	12240	27000	0	46	jfehr	Paul			\N	2018-04-23	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-23 11:10:35.875	2	\N	\N	1
53265	1049	2018-04-23	1800	6120	0	64	jfehr	Otto			\N	2018-04-23	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-23 11:11:46.937	2	\N	\N	1
53266	1056	2018-04-23	10440	18720	0	43	jfehr	Leo			\N	2018-04-23	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-23 13:09:21.312	3	\N	\N	1
53267	1061	2018-04-23	13680	34560	0	31	jfehr	William			\N	2018-04-23	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-23 13:10:05.187	2	\N	\N	1
53268	1052	2018-04-23	12960	27000	0	50	jfehr	Luis			\N	2018-04-23	\N	\N	\N	\N	\N	\N	\N	\N	\N	jfehr	2018-04-23 16:02:34.171	3	\N	\N	1
53200	1050	2018-04-02	3060	7380	0	57	jfehr	Eric			\N	2018-04-02	2018-04-23	2439	15	\N	agongora	0		\N	\N	jfehr	2018-04-02 06:32:48.217	2	2439	0	1
53204	1055	2018-04-02	14760	17820	0	43	jfehr	Paul			\N	2018-04-02	2018-04-23	12365	74	\N	agongora	0		\N	\N	jfehr	2018-04-02 07:13:04.92	2	12365	0	1
\.


--
-- TOC entry 2157 (class 0 OID 0)
-- Dependencies: 186
-- Name: lot_lot_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('lot_lot_id_seq', 53268, true);


--
-- TOC entry 2121 (class 0 OID 36329)
-- Dependencies: 187
-- Data for Name: poultry_type; Type: TABLE DATA; Schema: public; Owner: fh
--

COPY poultry_type (poultry_type_id, poultry_type_name, poultry_type_incubation_time, user_added, ddate_added) FROM stdin;
1	Broilers	21	admin       	2015-12-02 09:59:47.146
2	Layers	21	admin       	2015-12-02 09:59:57.52
3	Turkeys	28	admin       	2015-12-02 10:00:05.937
\.


--
-- TOC entry 2158 (class 0 OID 0)
-- Dependencies: 188
-- Name: poultry_type_poultry_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fh
--

SELECT pg_catalog.setval('poultry_type_poultry_type_id_seq', 3, true);


--
-- TOC entry 2123 (class 0 OID 36335)
-- Dependencies: 189
-- Data for Name: price; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY price (price_id, price_pay, user_added, date_added, breed_id) FROM stdin;
\.


--
-- TOC entry 2159 (class 0 OID 0)
-- Dependencies: 190
-- Name: price_price_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('price_price_id_seq', 1, true);


--
-- TOC entry 2125 (class 0 OID 36341)
-- Dependencies: 191
-- Data for Name: seasonal_percent; Type: TABLE DATA; Schema: public; Owner: fh
--

COPY seasonal_percent (seasonal_percent_id, seasonal_percent_week, seasonal_percent, seasonal_percent_date) FROM stdin;
1	0	-0.010000	2000-01-01
2	1	0.005000	2000-01-01
3	2	0.020000	2000-01-01
4	3	0.042000	2000-01-01
5	4	0.065000	2000-01-01
6	5	0.082000	2000-01-01
7	6	0.090000	2000-01-01
8	7	0.104000	2000-01-01
9	8	0.125000	2000-01-01
10	9	0.136000	2000-01-01
11	10	0.143000	2000-01-01
12	11	0.141000	2000-01-01
13	12	0.137000	2000-01-01
14	13	0.133000	2000-01-01
15	14	0.130000	2000-01-01
16	15	0.110000	2000-01-01
17	16	0.089000	2000-01-01
18	17	0.067000	2000-01-01
19	18	0.056000	2000-01-01
20	19	0.047000	2000-01-01
21	20	0.033000	2000-01-01
22	21	0.019000	2000-01-01
23	22	0.008000	2000-01-01
24	23	-0.009000	2000-01-01
25	24	-0.010000	2000-01-01
26	25	-0.012000	2000-01-01
27	26	-0.013000	2000-01-01
28	27	-0.012000	2000-01-01
29	28	-0.010000	2000-01-01
30	29	-0.007000	2000-01-01
31	30	-0.005000	2000-01-01
32	31	-0.002000	2000-01-01
33	32	0.001000	2000-01-01
34	33	0.006000	2000-01-01
35	34	0.012000	2000-01-01
36	35	0.016000	2000-01-01
37	36	0.023000	2000-01-01
38	37	0.010000	2000-01-01
39	38	-0.008000	2000-01-01
40	39	-0.022000	2000-01-01
41	40	-0.041000	2000-01-01
42	41	-0.045000	2000-01-01
43	42	-0.050000	2000-01-01
44	43	-0.055000	2000-01-01
45	44	-0.060000	2000-01-01
46	45	-0.064000	2000-01-01
47	46	-0.065000	2000-01-01
48	47	-0.066000	2000-01-01
49	48	-0.068000	2000-01-01
50	49	-0.070000	2000-01-01
51	50	-0.060000	2000-01-01
52	51	-0.050000	2000-01-01
53	52	-0.038000	2000-01-01
54	53	-0.010000	2000-01-01
\.


--
-- TOC entry 2160 (class 0 OID 0)
-- Dependencies: 192
-- Name: seasonal_percent_seasonal_percent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fh
--

SELECT pg_catalog.setval('seasonal_percent_seasonal_percent_id_seq', 54, true);


--
-- TOC entry 2127 (class 0 OID 36346)
-- Dependencies: 193
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: fh
--

COPY users (user_login, user_name, user_password, user_status, user_added, date_added) FROM stdin;
rthiessen	Ruben Thiessen	202cb962ac59075b964b07152d234b70	A	edueck	2014-12-05 17:06:27.472
edueck	Ed Dueck	202cb962ac59075b964b07152d234b70	A	edueck	2014-12-05 17:06:27.472
wcabb	Wincess Cabb	202cb962ac59075b964b07152d234b70	A	edueck	2015-03-18 09:22:25.019
zalegria	Zoila Alegria	\N	A	admin	2015-05-06 09:20:20.413
agongora	Anthony Gongora	\N	A	admin	2015-05-06 09:21:32.772
jguenther	Johan Guenther	\N	A	admin	2015-05-06 09:22:28.991
kochao	Kelly Ochao	\N	A	admin	2015-05-06 09:24:49.866
jquewell	Jonathon Quewell	\N	A	admin	2015-05-06 09:25:20.116
aquinonez	Armando Quinonez	\N	A	admin	2015-05-06 09:26:11.6
dyoung	Darway Young	\N	A	admin	2015-05-06 09:27:27.663
nreimer	Nettie Reimer	\N	A	admin	2015-05-06 09:29:09.507
cmanzanero	Carlos Manzanero	\N	A	admin	2015-05-06 09:52:43.721
bmiranda	Byron Miranda	\N	A	admin	2015-05-06 09:53:09.611
icarrias	Ivan Carrias	\N	I	admin	2015-05-06 09:21:14.663
mcarrias	Mario Carrias	\N	I	admin	2015-05-06 09:28:16.522
admin	Administrator	202cb962ac59075b964b07152d234b70	A	admin	2015-03-18 09:55:04.8
nrecinos	Noemi Recinos	\N	I	admin	2016-01-26 10:57:07.687
gcano	Gregorio Cano	\N	I	admin	2015-05-06 09:20:59.194
dmenendez	Dario Menendez	\N	A	dthiessen	2016-06-24 10:30:41.031
cmartinez	Carlos Martinez	\N	A	dthiessen	2016-06-24 10:31:32.25
alopez	Alicia Lopez	\N	I	admin	2015-05-06 09:24:21.616
ealergria	Emily Alegria	\N	I	admin	2016-05-16 15:59:48.437
grodriguez	Glenda Rodriguez	\N	I	admin	2015-05-06 09:26:54.835
jrodriguez	Juan Rodriguez	\N	I	dthiessen	2016-06-24 10:30:03.843
sthiessen	Sherwin Thiessen	202cb962ac59075b964b07152d234b70	I	edueck	2014-12-05 17:06:27.472
tneufeld	Theresa Neufeld	202cb962ac59075b964b07152d234b70	A	admin	2017-04-03 17:04:52.386
tthiessen	Tina Thiessen	202cb962ac59075b964b07152d234b70	A	admin	2017-04-03 17:06:25.214
jfehr	Jolene Fehr	202cb962ac59075b964b07152d234b70	A	admin	2017-12-04 11:19:17.318
cthiessen	Cornie Thiessen	202cb962ac59075b964b07152d234b70	I	edueck	2014-12-05 17:06:27.472
dthiessen	Dorcas Thiessen	202cb962ac59075b964b07152d234b70	I	edueck	2015-03-18 09:20:18.144
ereimer	Ez Reimer	202cb962ac59075b964b07152d234b70	I	admin	2015-11-28 10:38:00.895
\.


SET search_path = breeder_farmer, pg_catalog;

--
-- TOC entry 1995 (class 2606 OID 36393)
-- Name: farmer_eggs_pkey; Type: CONSTRAINT; Schema: breeder_farmer; Owner: fh; Tablespace: 
--

ALTER TABLE ONLY farmer_eggs
    ADD CONSTRAINT farmer_eggs_pkey PRIMARY KEY (farmer_eggs_id);


--
-- TOC entry 1997 (class 2606 OID 36403)
-- Name: userf_pkey; Type: CONSTRAINT; Schema: breeder_farmer; Owner: fh; Tablespace: 
--

ALTER TABLE ONLY farmer_users
    ADD CONSTRAINT userf_pkey PRIMARY KEY (user_login);


SET search_path = public, pg_catalog;

--
-- TOC entry 1973 (class 2606 OID 36361)
-- Name: breed_pkey; Type: CONSTRAINT; Schema: public; Owner: fh; Tablespace: 
--

ALTER TABLE ONLY breed
    ADD CONSTRAINT breed_pkey PRIMARY KEY (breed_id);


--
-- TOC entry 1975 (class 2606 OID 36363)
-- Name: eggs_age_pkey; Type: CONSTRAINT; Schema: public; Owner: fh; Tablespace: 
--

ALTER TABLE ONLY eggs_age
    ADD CONSTRAINT eggs_age_pkey PRIMARY KEY (eggs_age_id);


--
-- TOC entry 1977 (class 2606 OID 36365)
-- Name: farm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY farm
    ADD CONSTRAINT farm_pkey PRIMARY KEY (farm_id);


--
-- TOC entry 1981 (class 2606 OID 36367)
-- Name: flock_eggs_pkey; Type: CONSTRAINT; Schema: public; Owner: fh; Tablespace: 
--

ALTER TABLE ONLY flock_eggs
    ADD CONSTRAINT flock_eggs_pkey PRIMARY KEY (flock_eggs_id);


--
-- TOC entry 1979 (class 2606 OID 36369)
-- Name: flock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY flock
    ADD CONSTRAINT flock_pkey PRIMARY KEY (flock_id);


--
-- TOC entry 1983 (class 2606 OID 36371)
-- Name: login_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY login_log
    ADD CONSTRAINT login_log_pkey PRIMARY KEY (log_id);


--
-- TOC entry 1985 (class 2606 OID 36373)
-- Name: lot_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lot
    ADD CONSTRAINT lot_pkey PRIMARY KEY (lot_id);


--
-- TOC entry 1987 (class 2606 OID 36375)
-- Name: poultry_type_pkey; Type: CONSTRAINT; Schema: public; Owner: fh; Tablespace: 
--

ALTER TABLE ONLY poultry_type
    ADD CONSTRAINT poultry_type_pkey PRIMARY KEY (poultry_type_id);


--
-- TOC entry 1989 (class 2606 OID 36377)
-- Name: price_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY price
    ADD CONSTRAINT price_pkey PRIMARY KEY (price_id);


--
-- TOC entry 1991 (class 2606 OID 36379)
-- Name: seasonal_percent_pkey; Type: CONSTRAINT; Schema: public; Owner: fh; Tablespace: 
--

ALTER TABLE ONLY seasonal_percent
    ADD CONSTRAINT seasonal_percent_pkey PRIMARY KEY (seasonal_percent_id);


--
-- TOC entry 1993 (class 2606 OID 36381)
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: fh; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_login);


--
-- TOC entry 2137 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-11-10 15:04:54

--
-- PostgreSQL database dump complete
--

