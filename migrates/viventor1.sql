--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: accounts; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA accounts;


ALTER SCHEMA accounts OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = accounts, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: accounts; Type: TABLE; Schema: accounts; Owner: postgres
--

CREATE TABLE accounts (
    id bigint NOT NULL,
    userid bigint NOT NULL,
    identifier character varying(100) NOT NULL,
    balance numeric(15,6) DEFAULT NULL::numeric,
    creationdate timestamp without time zone NOT NULL,
    expirationdate timestamp without time zone NOT NULL,
    activated boolean DEFAULT false,
    activationkey character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE accounts OWNER TO postgres;

--
-- Name: accounts_sequence; Type: SEQUENCE; Schema: accounts; Owner: postgres
--

CREATE SEQUENCE accounts_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE accounts_sequence OWNER TO postgres;

--
-- Name: declarations; Type: TABLE; Schema: accounts; Owner: postgres
--

CREATE TABLE declarations (
    id bigint NOT NULL,
    transactionid bigint NOT NULL,
    description character varying(500) DEFAULT NULL::character varying,
    declarationtypeid integer NOT NULL
);


ALTER TABLE declarations OWNER TO postgres;

--
-- Name: declarations_sequence; Type: SEQUENCE; Schema: accounts; Owner: postgres
--

CREATE SEQUENCE declarations_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE declarations_sequence OWNER TO postgres;

--
-- Name: declarationtype; Type: TABLE; Schema: accounts; Owner: postgres
--

CREATE TABLE declarationtype (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(500) DEFAULT NULL::character varying
);


ALTER TABLE declarationtype OWNER TO postgres;

--
-- Name: declarationtype_sequence; Type: SEQUENCE; Schema: accounts; Owner: postgres
--

CREATE SEQUENCE declarationtype_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE declarationtype_sequence OWNER TO postgres;

--
-- Name: operationtype; Type: TABLE; Schema: accounts; Owner: postgres
--

CREATE TABLE operationtype (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description character varying(500) DEFAULT NULL::character varying
);


ALTER TABLE operationtype OWNER TO postgres;

--
-- Name: transactions; Type: TABLE; Schema: accounts; Owner: postgres
--

CREATE TABLE transactions (
    id bigint NOT NULL,
    accountid bigint NOT NULL,
    trantypeid integer NOT NULL,
    operationtypeid integer NOT NULL,
    detail character varying(500) DEFAULT NULL::character varying,
    origin character varying(500),
    destiny character varying(500),
    amount numeric(15,6) DEFAULT NULL::numeric,
    balance numeric(15,6) DEFAULT NULL::numeric,
    date timestamp without time zone NOT NULL
);


ALTER TABLE transactions OWNER TO postgres;

--
-- Name: transactions_sequence; Type: SEQUENCE; Schema: accounts; Owner: postgres
--

CREATE SEQUENCE transactions_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE transactions_sequence OWNER TO postgres;

--
-- Name: trantype; Type: TABLE; Schema: accounts; Owner: postgres
--

CREATE TABLE trantype (
    id integer NOT NULL,
    name character varying(10) NOT NULL,
    description character varying(500) DEFAULT NULL::character varying
);


ALTER TABLE trantype OWNER TO postgres;

--
-- Name: trantype_sequence; Type: SEQUENCE; Schema: accounts; Owner: postgres
--

CREATE SEQUENCE trantype_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trantype_sequence OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: accounts; Owner: postgres
--

CREATE TABLE users (
    id bigint NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(500) NOT NULL,
    activated boolean DEFAULT false,
    resetpasswordkey character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE users OWNER TO postgres;

--
-- Name: users_sequence; Type: SEQUENCE; Schema: accounts; Owner: postgres
--

CREATE SEQUENCE users_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_sequence OWNER TO postgres;

SET search_path = public, pg_catalog;

--
-- Name: accounts_sequence; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE accounts_sequence (
    id bigint
);


ALTER TABLE accounts_sequence OWNER TO postgres;

--
-- Name: declarations_sequence; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE declarations_sequence (
    id bigint
);


ALTER TABLE declarations_sequence OWNER TO postgres;

--
-- Name: declarationtype_sequence; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE declarationtype_sequence (
    id bigint
);


ALTER TABLE declarationtype_sequence OWNER TO postgres;

--
-- Name: operationtype_sequence; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE operationtype_sequence (
    id bigint
);


ALTER TABLE operationtype_sequence OWNER TO postgres;

--
-- Name: transactions_sequence; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE transactions_sequence (
    id bigint
);


ALTER TABLE transactions_sequence OWNER TO postgres;

--
-- Name: trantype_sequence; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE trantype_sequence (
    id bigint
);


ALTER TABLE trantype_sequence OWNER TO postgres;

--
-- Name: users_sequence; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE users_sequence (
    id bigint
);


ALTER TABLE users_sequence OWNER TO postgres;

SET search_path = accounts, pg_catalog;

--
-- Data for Name: accounts; Type: TABLE DATA; Schema: accounts; Owner: postgres
--

COPY accounts (id, userid, identifier, balance, creationdate, expirationdate, activated, activationkey) FROM stdin;
5	6	ESB5678995677675679DR	\N	2017-01-29 00:00:00	2017-01-29 00:00:00	t	\N
8	6	ESB5673435677675679DR	\N	2017-01-29 00:00:00	2017-01-29 00:00:00	t	\N
10	6	ESB5673445677675679DR	\N	2017-01-29 00:00:00	2017-01-29 00:00:00	t	\N
20	6	ESB567823423677675679DR	8000.000000	2017-01-29 00:00:00	2017-01-29 00:00:00	t	\N
22	6	ESB5678232342423677675679DR	8000.000000	2017-01-29 00:00:00	2017-01-29 00:00:00	t	\N
25	6	4c1c5729-9f42-407b-b9b5-432da9be173b	8000.000000	2017-01-29 00:00:00	2017-01-29 00:00:00	t	\N
26	6	3bf4d32c-cd80-4dc4-9f76-3d76dd05d8ae	120000.000000	2017-01-29 00:00:00	2017-01-29 00:00:00	t	\N
27	6	63e638aa-82b9-42a1-9495-f2e8d62b5ad8	120000.000000	2017-01-29 01:00:00	2017-01-29 01:00:00	t	\N
28	6	9e3305bb-c44e-47b2-bb78-ef8f73d64865	120000.000000	2017-01-29 01:00:00	2017-01-29 01:00:00	t	\N
30	6	823805a6-99ab-4069-a182-ceae28127b7d	120000.000000	2017-01-29 18:11:22.1	2018-01-29 18:11:22.1	t	\N
31	6	ad03ffa6-757c-4586-be0c-60b709843d5b	120000.000000	2017-01-29 18:13:07.857	2018-01-29 18:13:07.857	t	\N
32	6	1b080773-fda9-4136-a7a3-4bfa61448f5a	120000.000000	2017-01-29 18:15:36.067	2018-01-29 18:15:36.067	t	\N
29	6	e2851100-1fc1-43ad-9563-06b93845bef4	3000.000000	2017-01-29 17:20:02.743	2018-01-29 17:20:02.743	t	\N
\.


--
-- Name: accounts_sequence; Type: SEQUENCE SET; Schema: accounts; Owner: postgres
--

SELECT pg_catalog.setval('accounts_sequence', 11, true);


--
-- Data for Name: declarations; Type: TABLE DATA; Schema: accounts; Owner: postgres
--

COPY declarations (id, transactionid, description, declarationtypeid) FROM stdin;
\.


--
-- Name: declarations_sequence; Type: SEQUENCE SET; Schema: accounts; Owner: postgres
--

SELECT pg_catalog.setval('declarations_sequence', 1, false);


--
-- Data for Name: declarationtype; Type: TABLE DATA; Schema: accounts; Owner: postgres
--

COPY declarationtype (id, name, description) FROM stdin;
\.


--
-- Name: declarationtype_sequence; Type: SEQUENCE SET; Schema: accounts; Owner: postgres
--

SELECT pg_catalog.setval('declarationtype_sequence', 1, false);


--
-- Data for Name: operationtype; Type: TABLE DATA; Schema: accounts; Owner: postgres
--

COPY operationtype (id, name, description) FROM stdin;
1	DEPOSIT	\N
2	WITHDRAW	\N
\.


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: accounts; Owner: postgres
--

COPY transactions (id, accountid, trantypeid, operationtypeid, detail, origin, destiny, amount, balance, date) FROM stdin;
3	5	1	1	some thing			123.000000	\N	2017-01-29 00:00:00
4	5	1	1	some thing			320.000000	\N	2017-01-29 00:00:00
5	5	1	1	some thing			328.780000	\N	2017-01-29 00:00:00
1	5	1	1	some thing			0.000000	\N	2017-01-29 00:00:00
2	5	1	1	some thing			0.000000	\N	2017-01-29 00:00:00
64	20	2	1	some thing			0.000000	\N	2017-01-29 00:00:00
65	20	2	1	some thing			0.000000	\N	2017-01-29 00:00:00
61	20	2	1	some thing			1222.000000	\N	2017-01-29 00:00:00
62	20	2	1	some thing			2333.000000	\N	2017-01-29 00:00:00
63	20	2	1	some thing			4343.000000	\N	2017-01-29 00:00:00
71	22	2	1	some thing			123.000000	\N	2017-01-29 00:00:00
72	22	2	1	some thing			320.000000	\N	2017-01-29 00:00:00
73	22	2	1	some thing			328.780000	\N	2017-01-29 00:00:00
74	22	2	1	some thing			0.000000	\N	2017-01-29 00:00:00
75	22	2	1	some thing			0.000000	\N	2017-01-29 00:00:00
86	25	2	1	some thing			123.000000	\N	2017-01-29 00:00:00
87	25	2	1	some thing			320.000000	\N	2017-01-29 00:00:00
88	25	2	1	some thing			328.780000	\N	2017-01-29 00:00:00
89	25	2	1	some thing			0.000000	\N	2017-01-29 00:00:00
90	25	2	1	some thing			0.000000	\N	2017-01-29 00:00:00
92	29	1	1	some detail	some origin	some destiny	100.000000	\N	2017-01-29 17:40:04.999
93	29	1	1	some detail	some origin	some destiny	200.000000	\N	2017-01-29 17:40:17.011
94	29	1	1	some detail	some origin	some destiny	200.000000	\N	2017-01-29 17:41:15.604
95	29	1	1	some detail	some origin	some destiny	20.000000	\N	2017-01-29 17:41:32.692
96	29	1	1	some detail	some origin	some destiny	20.000000	\N	2017-01-29 17:41:33.398
97	29	1	1	some detail	some origin	some destiny	20.500000	\N	2017-01-29 17:42:13.353
98	29	1	1	some detail	some origin	some destiny	20.500000	\N	2017-01-29 17:42:14.077
99	29	2	1	some detail	some origin	some destiny	59.000000	1822.000000	2017-01-29 17:50:44.372
100	29	2	1	some detail	some origin	some destiny	8.000000	1814.000000	2017-01-29 17:51:32.494
101	29	1	1	some detail	some origin	some destiny	6.000000	1808.000000	2017-01-29 17:53:46.939
102	29	1	1	some detail	some origin	some destiny	2.000000	1806.000000	2017-01-29 17:54:49.939
103	29	1	1	some detail	some origin	some destiny	4.000000	1810.000000	2017-01-29 17:58:15.954
104	29	2	1	some detail	some origin	some destiny	110.000000	1700.000000	2017-01-29 18:00:46.904
105	29	2	1	some detail	some origin	some destiny	1000.000000	700.000000	2017-01-29 18:00:58.199
106	29	1	1	some detail	some origin	some destiny	1200.000000	1900.000000	2017-01-29 18:01:06.371
107	29	1	1	some detail	some origin	some destiny	4.000000	1904.000000	2017-01-29 18:06:29.987
108	29	2	1	some detail	some origin	some destiny	110.000000	1794.000000	2017-01-29 18:06:30.117
109	29	1	1	some detail	some origin	some destiny	4.000000	1798.000000	2017-01-29 18:13:07.524
110	29	2	1	some detail	some origin	some destiny	110.000000	1688.000000	2017-01-29 18:13:07.578
111	29	1	1	some detail	some origin	some destiny	1200.000000	2888.000000	2017-01-29 18:28:15.178
112	29	1	1	some detail	some origin	some destiny	200.000000	3088.000000	2017-01-29 18:28:38.71
113	29	1	1	some detail	some origin	some destiny	202.000000	3290.000000	2017-01-29 18:28:47.177
114	29	1	1	some detail	some origin	some destiny	10.000000	3300.000000	2017-01-29 18:28:58.986
115	29	2	1	some detail	some origin	some destiny	300.000000	3000.000000	2017-01-29 18:29:21.497
\.


--
-- Name: transactions_sequence; Type: SEQUENCE SET; Schema: accounts; Owner: postgres
--

SELECT pg_catalog.setval('transactions_sequence', 5, true);


--
-- Data for Name: trantype; Type: TABLE DATA; Schema: accounts; Owner: postgres
--

COPY trantype (id, name, description) FROM stdin;
1	POSITIVE	\N
2	NEGATIVE	\N
\.


--
-- Name: trantype_sequence; Type: SEQUENCE SET; Schema: accounts; Owner: postgres
--

SELECT pg_catalog.setval('trantype_sequence', 2, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: accounts; Owner: postgres
--

COPY users (id, username, email, password, activated, resetpasswordkey) FROM stdin;
6	mmerida	mmerida@netsuite.com	nosedeque	\N	\N
8	m1merida	mmerida@netsuite.com	nosedeque	\N	\N
1	m3merida	m3merida@netsuite.com	password1	t	\N
3	m4merida	m4merida@netsuite.com	password1	t	\N
4	m5merida	m5merida@netsuite.com	password1	t	\N
\.


--
-- Name: users_sequence; Type: SEQUENCE SET; Schema: accounts; Owner: postgres
--

SELECT pg_catalog.setval('users_sequence', 1, false);


SET search_path = public, pg_catalog;

--
-- Data for Name: accounts_sequence; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY accounts_sequence (id) FROM stdin;
33
\.


--
-- Data for Name: declarations_sequence; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY declarations_sequence (id) FROM stdin;
1
\.


--
-- Data for Name: declarationtype_sequence; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY declarationtype_sequence (id) FROM stdin;
1
\.


--
-- Data for Name: operationtype_sequence; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY operationtype_sequence (id) FROM stdin;
1
\.


--
-- Data for Name: transactions_sequence; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY transactions_sequence (id) FROM stdin;
116
\.


--
-- Data for Name: trantype_sequence; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY trantype_sequence (id) FROM stdin;
1
\.


--
-- Data for Name: users_sequence; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users_sequence (id) FROM stdin;
14
\.


SET search_path = accounts, pg_catalog;

--
-- Name: accounts accounts_identifier_key; Type: CONSTRAINT; Schema: accounts; Owner: postgres
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_identifier_key UNIQUE (identifier);


--
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: accounts; Owner: postgres
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: declarations declarations_pkey; Type: CONSTRAINT; Schema: accounts; Owner: postgres
--

ALTER TABLE ONLY declarations
    ADD CONSTRAINT declarations_pkey PRIMARY KEY (id);


--
-- Name: declarationtype declarationtype_name_key; Type: CONSTRAINT; Schema: accounts; Owner: postgres
--

ALTER TABLE ONLY declarationtype
    ADD CONSTRAINT declarationtype_name_key UNIQUE (name);


--
-- Name: declarationtype declarationtype_pkey; Type: CONSTRAINT; Schema: accounts; Owner: postgres
--

ALTER TABLE ONLY declarationtype
    ADD CONSTRAINT declarationtype_pkey PRIMARY KEY (id);


--
-- Name: operationtype operationtype_name_key; Type: CONSTRAINT; Schema: accounts; Owner: postgres
--

ALTER TABLE ONLY operationtype
    ADD CONSTRAINT operationtype_name_key UNIQUE (name);


--
-- Name: operationtype operationtype_pkey; Type: CONSTRAINT; Schema: accounts; Owner: postgres
--

ALTER TABLE ONLY operationtype
    ADD CONSTRAINT operationtype_pkey PRIMARY KEY (id);


--
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: accounts; Owner: postgres
--

ALTER TABLE ONLY transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- Name: trantype trantype_name_key; Type: CONSTRAINT; Schema: accounts; Owner: postgres
--

ALTER TABLE ONLY trantype
    ADD CONSTRAINT trantype_name_key UNIQUE (name);


--
-- Name: trantype trantype_pkey; Type: CONSTRAINT; Schema: accounts; Owner: postgres
--

ALTER TABLE ONLY trantype
    ADD CONSTRAINT trantype_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: accounts; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: accounts; Owner: postgres
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: accounts accounts_users_fk; Type: FK CONSTRAINT; Schema: accounts; Owner: postgres
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_users_fk FOREIGN KEY (userid) REFERENCES users(id);


--
-- Name: declarations declarations_declarationtype_fk; Type: FK CONSTRAINT; Schema: accounts; Owner: postgres
--

ALTER TABLE ONLY declarations
    ADD CONSTRAINT declarations_declarationtype_fk FOREIGN KEY (declarationtypeid) REFERENCES declarationtype(id);


--
-- Name: declarations declarations_transactions_fk; Type: FK CONSTRAINT; Schema: accounts; Owner: postgres
--

ALTER TABLE ONLY declarations
    ADD CONSTRAINT declarations_transactions_fk FOREIGN KEY (transactionid) REFERENCES transactions(id);


--
-- Name: transactions fk3x8pbv356qrwnj4lev8jxljfi; Type: FK CONSTRAINT; Schema: accounts; Owner: postgres
--

ALTER TABLE ONLY transactions
    ADD CONSTRAINT fk3x8pbv356qrwnj4lev8jxljfi FOREIGN KEY (accountid) REFERENCES accounts(id);


--
-- Name: transactions fk64nk14j4i7x2us0uxwet92bqa; Type: FK CONSTRAINT; Schema: accounts; Owner: postgres
--

ALTER TABLE ONLY transactions
    ADD CONSTRAINT fk64nk14j4i7x2us0uxwet92bqa FOREIGN KEY (trantypeid) REFERENCES trantype(id);


--
-- Name: accounts fk8k62em5udi9bqvr1elq36n05n; Type: FK CONSTRAINT; Schema: accounts; Owner: postgres
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT fk8k62em5udi9bqvr1elq36n05n FOREIGN KEY (userid) REFERENCES users(id);


--
-- Name: transactions fkh0ooo8tme3kt8pcmhs5ik8qhl; Type: FK CONSTRAINT; Schema: accounts; Owner: postgres
--

ALTER TABLE ONLY transactions
    ADD CONSTRAINT fkh0ooo8tme3kt8pcmhs5ik8qhl FOREIGN KEY (operationtypeid) REFERENCES operationtype(id);


--
-- Name: declarations fki5gutdvu6ja8tjt2xy93oalxt; Type: FK CONSTRAINT; Schema: accounts; Owner: postgres
--

ALTER TABLE ONLY declarations
    ADD CONSTRAINT fki5gutdvu6ja8tjt2xy93oalxt FOREIGN KEY (transactionid) REFERENCES transactions(id);


--
-- Name: declarations fkl2qq94h4bha1pnwqs7onbe15h; Type: FK CONSTRAINT; Schema: accounts; Owner: postgres
--

ALTER TABLE ONLY declarations
    ADD CONSTRAINT fkl2qq94h4bha1pnwqs7onbe15h FOREIGN KEY (declarationtypeid) REFERENCES declarationtype(id);


--
-- Name: transactions transactions_accounts_fk; Type: FK CONSTRAINT; Schema: accounts; Owner: postgres
--

ALTER TABLE ONLY transactions
    ADD CONSTRAINT transactions_accounts_fk FOREIGN KEY (accountid) REFERENCES accounts(id);


--
-- Name: transactions transactions_operationtype_fk; Type: FK CONSTRAINT; Schema: accounts; Owner: postgres
--

ALTER TABLE ONLY transactions
    ADD CONSTRAINT transactions_operationtype_fk FOREIGN KEY (operationtypeid) REFERENCES operationtype(id);


--
-- Name: transactions transactions_trantype_fk; Type: FK CONSTRAINT; Schema: accounts; Owner: postgres
--

ALTER TABLE ONLY transactions
    ADD CONSTRAINT transactions_trantype_fk FOREIGN KEY (trantypeid) REFERENCES trantype(id);


--
-- PostgreSQL database dump complete
--

