--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


--ALTER TABLE public.auth_group OWNER TO ubuntu;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--ALTER TABLE public.auth_group_id_seq OWNER TO ubuntu;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--ALTER TABLE public.auth_group_permissions OWNER TO ubuntu;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--ALTER TABLE public.auth_group_permissions_id_seq OWNER TO ubuntu;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--ALTER TABLE public.auth_permission OWNER TO ubuntu;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--ALTER TABLE public.auth_permission_id_seq OWNER TO ubuntu;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--ALTER TABLE public.django_content_type OWNER TO ubuntu;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--ALTER TABLE public.django_content_type_id_seq OWNER TO ubuntu;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--ALTER TABLE public.django_migrations OWNER TO ubuntu;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--ALTER TABLE public.django_migrations_id_seq OWNER TO ubuntu;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: klee_web_category; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.klee_web_category (
    id integer NOT NULL,
    name text NOT NULL,
    created timestamp without time zone NOT NULL,
    size integer NOT NULL
);


--ALTER TABLE public.klee_web_category OWNER TO ubuntu;

--
-- Name: klee_web_category_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.klee_web_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--ALTER TABLE public.klee_web_category_id_seq OWNER TO ubuntu;

--
-- Name: klee_web_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.klee_web_category_id_seq OWNED BY public.klee_web_category.id;


--
-- Name: klee_web_challenge; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.klee_web_challenge (
    id integer NOT NULL,
    name text NOT NULL,
    created timestamp without time zone NOT NULL,
    tags jsonb NOT NULL,
    description text NOT NULL,
    sample_solution text NOT NULL,
    category_id integer NOT NULL
);


--ALTER TABLE public.klee_web_challenge OWNER TO ubuntu;

--
-- Name: klee_web_challenge_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.klee_web_challenge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--ALTER TABLE public.klee_web_challenge_id_seq OWNER TO ubuntu;

--
-- Name: klee_web_challenge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.klee_web_challenge_id_seq OWNED BY public.klee_web_challenge.id;


--
-- Name: klee_web_file; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.klee_web_file (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    num_files integer NOT NULL,
    size_files integer NOT NULL,
    size_sym_in integer NOT NULL,
    min_sym_args integer NOT NULL,
    max_sym_args integer NOT NULL,
    size_sym_args integer NOT NULL,
    options text,
    arguments text,
    last_modified timestamp with time zone NOT NULL
);


--ALTER TABLE public.klee_web_file OWNER TO ubuntu;

--
-- Name: klee_web_file_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.klee_web_file_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--ALTER TABLE public.klee_web_file_id_seq OWNER TO ubuntu;

--
-- Name: klee_web_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.klee_web_file_id_seq OWNED BY public.klee_web_file.id;


--
-- Name: klee_web_submission; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.klee_web_submission (
    id integer NOT NULL,
    correct boolean NOT NULL,
    challenge_id integer NOT NULL,
    user_id integer NOT NULL
);


--ALTER TABLE public.klee_web_submission OWNER TO ubuntu;

--
-- Name: klee_web_submission_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.klee_web_submission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--ALTER TABLE public.klee_web_submission_id_seq OWNER TO ubuntu;

--
-- Name: klee_web_submission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.klee_web_submission_id_seq OWNED BY public.klee_web_submission.id;


--
-- Name: klee_web_task; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.klee_web_task (
    created_at timestamp with time zone NOT NULL,
    id integer NOT NULL,
    task_id character varying(255) NOT NULL,
    ip_address inet NOT NULL,
    email_address character varying(254),
    completed_at timestamp with time zone,
    current_output text,
    worker_name character varying(255) NOT NULL,
    location character varying(255) NOT NULL,
    "user" character varying(255) NOT NULL
);


--ALTER TABLE public.klee_web_task OWNER TO ubuntu;

--
-- Name: klee_web_task_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.klee_web_task_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--ALTER TABLE public.klee_web_task_id_seq OWNER TO ubuntu;

--
-- Name: klee_web_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.klee_web_task_id_seq OWNED BY public.klee_web_task.id;


--
-- Name: klee_web_user; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.klee_web_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    scores jsonb NOT NULL
);


--ALTER TABLE public.klee_web_user OWNER TO ubuntu;

--
-- Name: klee_web_user_groups; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.klee_web_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--ALTER TABLE public.klee_web_user_groups OWNER TO ubuntu;

--
-- Name: klee_web_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.klee_web_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--ALTER TABLE public.klee_web_user_groups_id_seq OWNER TO ubuntu;

--
-- Name: klee_web_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.klee_web_user_groups_id_seq OWNED BY public.klee_web_user_groups.id;


--
-- Name: klee_web_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.klee_web_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--ALTER TABLE public.klee_web_user_id_seq OWNER TO ubuntu;

--
-- Name: klee_web_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.klee_web_user_id_seq OWNED BY public.klee_web_user.id;


--
-- Name: klee_web_user_user_permissions; Type: TABLE; Schema: public; Owner: ubuntu
--

CREATE TABLE public.klee_web_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


--ALTER TABLE public.klee_web_user_user_permissions OWNER TO ubuntu;

--
-- Name: klee_web_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ubuntu
--

CREATE SEQUENCE public.klee_web_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--ALTER TABLE public.klee_web_user_user_permissions_id_seq OWNER TO ubuntu;

--
-- Name: klee_web_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ubuntu
--

ALTER SEQUENCE public.klee_web_user_user_permissions_id_seq OWNED BY public.klee_web_user_user_permissions.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: klee_web_category id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.klee_web_category ALTER COLUMN id SET DEFAULT nextval('public.klee_web_category_id_seq'::regclass);


--
-- Name: klee_web_challenge id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.klee_web_challenge ALTER COLUMN id SET DEFAULT nextval('public.klee_web_challenge_id_seq'::regclass);


--
-- Name: klee_web_file id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.klee_web_file ALTER COLUMN id SET DEFAULT nextval('public.klee_web_file_id_seq'::regclass);


--
-- Name: klee_web_submission id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.klee_web_submission ALTER COLUMN id SET DEFAULT nextval('public.klee_web_submission_id_seq'::regclass);


--
-- Name: klee_web_task id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.klee_web_task ALTER COLUMN id SET DEFAULT nextval('public.klee_web_task_id_seq'::regclass);


--
-- Name: klee_web_user id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.klee_web_user ALTER COLUMN id SET DEFAULT nextval('public.klee_web_user_id_seq'::regclass);


--
-- Name: klee_web_user_groups id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.klee_web_user_groups ALTER COLUMN id SET DEFAULT nextval('public.klee_web_user_groups_id_seq'::regclass);


--
-- Name: klee_web_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.klee_web_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.klee_web_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add user	1	add_user
2	Can change user	1	change_user
3	Can delete user	1	delete_user
4	Can view user	1	view_user
5	Can add category	2	add_category
6	Can change category	2	change_category
7	Can delete category	2	delete_category
8	Can view category	2	view_category
9	Can add challenge	3	add_challenge
10	Can change challenge	3	change_challenge
11	Can delete challenge	3	delete_challenge
12	Can view challenge	3	view_challenge
13	Can add file	4	add_file
14	Can change file	4	change_file
15	Can delete file	4	delete_file
16	Can view file	4	view_file
17	Can add task	5	add_task
18	Can change task	5	change_task
19	Can delete task	5	delete_task
20	Can view task	5	view_task
21	Can add submission	6	add_submission
22	Can change submission	6	change_submission
23	Can delete submission	6	delete_submission
24	Can view submission	6	view_submission
25	Can add permission	7	add_permission
26	Can change permission	7	change_permission
27	Can delete permission	7	delete_permission
28	Can view permission	7	view_permission
29	Can add group	8	add_group
30	Can change group	8	change_group
31	Can delete group	8	delete_group
32	Can view group	8	view_group
33	Can add content type	9	add_contenttype
34	Can change content type	9	change_contenttype
35	Can delete content type	9	delete_contenttype
36	Can view content type	9	view_contenttype
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	klee_web	user
2	klee_web	category
3	klee_web	challenge
4	klee_web	file
5	klee_web	task
6	klee_web	submission
7	auth	permission
8	auth	group
9	contenttypes	contenttype
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-11-27 11:37:16.33955+00
3	contenttypes	0002_remove_content_type_name	2022-11-27 11:40:41.371868+00
4	auth	0001_initial	2022-11-27 11:40:41.400564+00
5	auth	0002_alter_permission_name_max_length	2022-11-27 11:40:41.418578+00
6	auth	0003_alter_user_email_max_length	2022-11-27 11:40:41.424224+00
7	auth	0004_alter_user_username_opts	2022-11-27 11:40:41.4673+00
8	auth	0005_alter_user_last_login_null	2022-11-27 11:40:41.475226+00
9	auth	0006_require_contenttypes_0002	2022-11-27 11:40:41.47752+00
10	auth	0007_alter_validators_add_error_messages	2022-11-27 11:40:41.482035+00
11	auth	0008_alter_user_username_max_length	2022-11-27 11:40:41.486778+00
12	auth	0009_alter_user_last_name_max_length	2022-11-27 11:40:41.491993+00
13	auth	0010_alter_group_name_max_length	2022-11-27 11:40:41.498366+00
14	auth	0011_update_proxy_permissions	2022-11-27 11:40:41.504632+00
15	klee_web	0001_initial	2022-11-27 11:40:41.562035+00
\.


--
-- Data for Name: klee_web_category; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.klee_web_category (id, name, created, size) FROM stdin;
1	basic_problems	1990-01-01 05:00:00	20
\.


--
-- Data for Name: klee_web_challenge; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.klee_web_challenge (id, name, created, tags, description, sample_solution, category_id) FROM stdin;
4	sum	1990-01-01 05:00:00	{}	sum of two numbers	foobar	1
\.


--
-- Data for Name: klee_web_file; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.klee_web_file (id, created, updated, name, code, num_files, size_files, size_sym_in, min_sym_args, max_sym_args, size_sym_args, options, arguments, last_modified) FROM stdin;
\.


--
-- Data for Name: klee_web_submission; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.klee_web_submission (id, correct, challenge_id, user_id) FROM stdin;
\.


--
-- Data for Name: klee_web_task; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.klee_web_task (created_at, id, task_id, ip_address, email_address, completed_at, current_output, worker_name, location, "user") FROM stdin;
\.


--
-- Data for Name: klee_web_user; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.klee_web_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, scores) FROM stdin;
\.


--
-- Data for Name: klee_web_user_groups; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.klee_web_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: klee_web_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: ubuntu
--

COPY public.klee_web_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 15, true);


--
-- Name: klee_web_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.klee_web_category_id_seq', 1, true);


--
-- Name: klee_web_challenge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.klee_web_challenge_id_seq', 4, true);


--
-- Name: klee_web_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.klee_web_file_id_seq', 1, false);


--
-- Name: klee_web_submission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.klee_web_submission_id_seq', 1, false);


--
-- Name: klee_web_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.klee_web_task_id_seq', 1, false);


--
-- Name: klee_web_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.klee_web_user_groups_id_seq', 1, false);


--
-- Name: klee_web_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.klee_web_user_id_seq', 1, false);


--
-- Name: klee_web_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ubuntu
--

SELECT pg_catalog.setval('public.klee_web_user_user_permissions_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: klee_web_category klee_web_category_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.klee_web_category
    ADD CONSTRAINT klee_web_category_pkey PRIMARY KEY (id);


--
-- Name: klee_web_challenge klee_web_challenge_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.klee_web_challenge
    ADD CONSTRAINT klee_web_challenge_pkey PRIMARY KEY (id);


--
-- Name: klee_web_file klee_web_file_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.klee_web_file
    ADD CONSTRAINT klee_web_file_pkey PRIMARY KEY (id);


--
-- Name: klee_web_submission klee_web_submission_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.klee_web_submission
    ADD CONSTRAINT klee_web_submission_pkey PRIMARY KEY (id);


--
-- Name: klee_web_task klee_web_task_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.klee_web_task
    ADD CONSTRAINT klee_web_task_pkey PRIMARY KEY (id);


--
-- Name: klee_web_task klee_web_task_task_id_key; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.klee_web_task
    ADD CONSTRAINT klee_web_task_task_id_key UNIQUE (task_id);


--
-- Name: klee_web_user_groups klee_web_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.klee_web_user_groups
    ADD CONSTRAINT klee_web_user_groups_pkey PRIMARY KEY (id);


--
-- Name: klee_web_user_groups klee_web_user_groups_user_id_group_id_478375b8_uniq; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.klee_web_user_groups
    ADD CONSTRAINT klee_web_user_groups_user_id_group_id_478375b8_uniq UNIQUE (user_id, group_id);


--
-- Name: klee_web_user klee_web_user_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.klee_web_user
    ADD CONSTRAINT klee_web_user_pkey PRIMARY KEY (id);


--
-- Name: klee_web_user_user_permissions klee_web_user_user_permi_user_id_permission_id_a807c063_uniq; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.klee_web_user_user_permissions
    ADD CONSTRAINT klee_web_user_user_permi_user_id_permission_id_a807c063_uniq UNIQUE (user_id, permission_id);


--
-- Name: klee_web_user_user_permissions klee_web_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.klee_web_user_user_permissions
    ADD CONSTRAINT klee_web_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: klee_web_user klee_web_user_username_key; Type: CONSTRAINT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.klee_web_user
    ADD CONSTRAINT klee_web_user_username_key UNIQUE (username);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: klee_web_challenge_category_id_f9072620; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX klee_web_challenge_category_id_f9072620 ON public.klee_web_challenge USING btree (category_id);


--
-- Name: klee_web_submission_challenge_id_725a6ea8; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX klee_web_submission_challenge_id_725a6ea8 ON public.klee_web_submission USING btree (challenge_id);


--
-- Name: klee_web_submission_user_id_71dd7231; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX klee_web_submission_user_id_71dd7231 ON public.klee_web_submission USING btree (user_id);


--
-- Name: klee_web_task_task_id_2c7f5e6f_like; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX klee_web_task_task_id_2c7f5e6f_like ON public.klee_web_task USING btree (task_id varchar_pattern_ops);


--
-- Name: klee_web_user_groups_group_id_d48299b7; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX klee_web_user_groups_group_id_d48299b7 ON public.klee_web_user_groups USING btree (group_id);


--
-- Name: klee_web_user_groups_user_id_95de0b71; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX klee_web_user_groups_user_id_95de0b71 ON public.klee_web_user_groups USING btree (user_id);


--
-- Name: klee_web_user_user_permissions_permission_id_5d5fdb74; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX klee_web_user_user_permissions_permission_id_5d5fdb74 ON public.klee_web_user_user_permissions USING btree (permission_id);


--
-- Name: klee_web_user_user_permissions_user_id_e3481454; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX klee_web_user_user_permissions_user_id_e3481454 ON public.klee_web_user_user_permissions USING btree (user_id);


--
-- Name: klee_web_user_username_f95cdb65_like; Type: INDEX; Schema: public; Owner: ubuntu
--

CREATE INDEX klee_web_user_username_f95cdb65_like ON public.klee_web_user USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: klee_web_challenge klee_web_challenge_category_id_f9072620_fk_klee_web_category_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.klee_web_challenge
    ADD CONSTRAINT klee_web_challenge_category_id_f9072620_fk_klee_web_category_id FOREIGN KEY (category_id) REFERENCES public.klee_web_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: klee_web_submission klee_web_submission_challenge_id_725a6ea8_fk_klee_web_; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.klee_web_submission
    ADD CONSTRAINT klee_web_submission_challenge_id_725a6ea8_fk_klee_web_ FOREIGN KEY (challenge_id) REFERENCES public.klee_web_challenge(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: klee_web_submission klee_web_submission_user_id_71dd7231_fk_klee_web_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.klee_web_submission
    ADD CONSTRAINT klee_web_submission_user_id_71dd7231_fk_klee_web_user_id FOREIGN KEY (user_id) REFERENCES public.klee_web_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: klee_web_user_groups klee_web_user_groups_group_id_d48299b7_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.klee_web_user_groups
    ADD CONSTRAINT klee_web_user_groups_group_id_d48299b7_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: klee_web_user_groups klee_web_user_groups_user_id_95de0b71_fk_klee_web_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.klee_web_user_groups
    ADD CONSTRAINT klee_web_user_groups_user_id_95de0b71_fk_klee_web_user_id FOREIGN KEY (user_id) REFERENCES public.klee_web_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: klee_web_user_user_permissions klee_web_user_user_p_permission_id_5d5fdb74_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.klee_web_user_user_permissions
    ADD CONSTRAINT klee_web_user_user_p_permission_id_5d5fdb74_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: klee_web_user_user_permissions klee_web_user_user_p_user_id_e3481454_fk_klee_web_; Type: FK CONSTRAINT; Schema: public; Owner: ubuntu
--

--ALTER TABLE ONLY public.klee_web_user_user_permissions
    ADD CONSTRAINT klee_web_user_user_p_user_id_e3481454_fk_klee_web_ FOREIGN KEY (user_id) REFERENCES public.klee_web_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

