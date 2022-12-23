--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: istvan
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO istvan;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: istvan
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO istvan;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: istvan
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: istvan
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO istvan;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: istvan
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO istvan;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: istvan
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: istvan
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO istvan;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: istvan
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO istvan;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: istvan
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: istvan
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO istvan;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: istvan
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO istvan;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: istvan
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: istvan
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO istvan;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: istvan
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO istvan;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: istvan
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: istvan
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO istvan;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: istvan
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO istvan;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: istvan
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: istvan
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO istvan;

--
-- Name: klee_web_category; Type: TABLE; Schema: public; Owner: istvan
--

CREATE TABLE public.klee_web_category (
    id integer NOT NULL,
    name text NOT NULL,
    created timestamp without time zone NOT NULL,
    nr_problems integer NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.klee_web_category OWNER TO istvan;

--
-- Name: klee_web_category_id_seq; Type: SEQUENCE; Schema: public; Owner: istvan
--

CREATE SEQUENCE public.klee_web_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.klee_web_category_id_seq OWNER TO istvan;

--
-- Name: klee_web_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: istvan
--

ALTER SEQUENCE public.klee_web_category_id_seq OWNED BY public.klee_web_category.id;


--
-- Name: klee_web_challenge; Type: TABLE; Schema: public; Owner: istvan
--

CREATE TABLE public.klee_web_challenge (
    id integer NOT NULL,
    name text NOT NULL,
    created timestamp without time zone NOT NULL,
    tags jsonb NOT NULL,
    sample_solution text NOT NULL,
    category_id integer NOT NULL,
    difficulty text NOT NULL,
    input text NOT NULL,
    output text NOT NULL,
    restrictions text NOT NULL,
    statement text NOT NULL
);


ALTER TABLE public.klee_web_challenge OWNER TO istvan;

--
-- Name: klee_web_challenge_id_seq; Type: SEQUENCE; Schema: public; Owner: istvan
--

CREATE SEQUENCE public.klee_web_challenge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.klee_web_challenge_id_seq OWNER TO istvan;

--
-- Name: klee_web_challenge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: istvan
--

ALTER SEQUENCE public.klee_web_challenge_id_seq OWNED BY public.klee_web_challenge.id;


--
-- Name: klee_web_classroom; Type: TABLE; Schema: public; Owner: istvan
--

CREATE TABLE public.klee_web_classroom (
    id integer NOT NULL,
    name text NOT NULL,
    created timestamp with time zone,
    teacher_img character varying(200),
    nr_of_members integer,
    assignments jsonb,
    announcements jsonb,
    teacher_id integer,
    members jsonb NOT NULL
);


ALTER TABLE public.klee_web_classroom OWNER TO istvan;

--
-- Name: klee_web_classroom_id_seq; Type: SEQUENCE; Schema: public; Owner: istvan
--

CREATE SEQUENCE public.klee_web_classroom_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.klee_web_classroom_id_seq OWNER TO istvan;

--
-- Name: klee_web_classroom_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: istvan
--

ALTER SEQUENCE public.klee_web_classroom_id_seq OWNED BY public.klee_web_classroom.id;


--
-- Name: klee_web_file; Type: TABLE; Schema: public; Owner: istvan
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


ALTER TABLE public.klee_web_file OWNER TO istvan;

--
-- Name: klee_web_file_id_seq; Type: SEQUENCE; Schema: public; Owner: istvan
--

CREATE SEQUENCE public.klee_web_file_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.klee_web_file_id_seq OWNER TO istvan;

--
-- Name: klee_web_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: istvan
--

ALTER SEQUENCE public.klee_web_file_id_seq OWNED BY public.klee_web_file.id;


--
-- Name: klee_web_submission; Type: TABLE; Schema: public; Owner: istvan
--

CREATE TABLE public.klee_web_submission (
    id integer NOT NULL,
    correct boolean NOT NULL,
    challenge_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.klee_web_submission OWNER TO istvan;

--
-- Name: klee_web_submission_id_seq; Type: SEQUENCE; Schema: public; Owner: istvan
--

CREATE SEQUENCE public.klee_web_submission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.klee_web_submission_id_seq OWNER TO istvan;

--
-- Name: klee_web_submission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: istvan
--

ALTER SEQUENCE public.klee_web_submission_id_seq OWNED BY public.klee_web_submission.id;


--
-- Name: klee_web_task; Type: TABLE; Schema: public; Owner: istvan
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


ALTER TABLE public.klee_web_task OWNER TO istvan;

--
-- Name: klee_web_task_id_seq; Type: SEQUENCE; Schema: public; Owner: istvan
--

CREATE SEQUENCE public.klee_web_task_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.klee_web_task_id_seq OWNER TO istvan;

--
-- Name: klee_web_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: istvan
--

ALTER SEQUENCE public.klee_web_task_id_seq OWNED BY public.klee_web_task.id;


--
-- Name: klee_web_user; Type: TABLE; Schema: public; Owner: istvan
--

CREATE TABLE public.klee_web_user (
    id integer NOT NULL,
    password character varying(128),
    last_login time without time zone,
    is_superuser boolean,
    username character varying(150),
    first_name character varying(30),
    last_name character varying(150),
    email character varying(254),
    is_staff boolean,
    is_active boolean,
    date_joined timestamp without time zone,
    scores jsonb NOT NULL,
    assignment_scores jsonb
);


ALTER TABLE public.klee_web_user OWNER TO istvan;

--
-- Name: klee_web_user_groups; Type: TABLE; Schema: public; Owner: istvan
--

CREATE TABLE public.klee_web_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.klee_web_user_groups OWNER TO istvan;

--
-- Name: klee_web_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: istvan
--

CREATE SEQUENCE public.klee_web_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.klee_web_user_groups_id_seq OWNER TO istvan;

--
-- Name: klee_web_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: istvan
--

ALTER SEQUENCE public.klee_web_user_groups_id_seq OWNED BY public.klee_web_user_groups.id;


--
-- Name: klee_web_user_id_seq; Type: SEQUENCE; Schema: public; Owner: istvan
--

CREATE SEQUENCE public.klee_web_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.klee_web_user_id_seq OWNER TO istvan;

--
-- Name: klee_web_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: istvan
--

ALTER SEQUENCE public.klee_web_user_id_seq OWNED BY public.klee_web_user.id;


--
-- Name: klee_web_user_user_permissions; Type: TABLE; Schema: public; Owner: istvan
--

CREATE TABLE public.klee_web_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.klee_web_user_user_permissions OWNER TO istvan;

--
-- Name: klee_web_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: istvan
--

CREATE SEQUENCE public.klee_web_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.klee_web_user_user_permissions_id_seq OWNER TO istvan;

--
-- Name: klee_web_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: istvan
--

ALTER SEQUENCE public.klee_web_user_user_permissions_id_seq OWNED BY public.klee_web_user_user_permissions.id;


--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE; Schema: public; Owner: istvan
--

CREATE SEQUENCE public.oauth2_provider_accesstoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_accesstoken_id_seq OWNER TO istvan;

--
-- Name: oauth2_provider_accesstoken; Type: TABLE; Schema: public; Owner: istvan
--

CREATE TABLE public.oauth2_provider_accesstoken (
    id bigint DEFAULT nextval('public.oauth2_provider_accesstoken_id_seq'::regclass) NOT NULL,
    token character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    scope text NOT NULL,
    application_id bigint,
    user_id integer,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    source_refresh_token_id bigint
);


ALTER TABLE public.oauth2_provider_accesstoken OWNER TO istvan;

--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE; Schema: public; Owner: istvan
--

CREATE SEQUENCE public.oauth2_provider_application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_application_id_seq OWNER TO istvan;

--
-- Name: oauth2_provider_application; Type: TABLE; Schema: public; Owner: istvan
--

CREATE TABLE public.oauth2_provider_application (
    id bigint DEFAULT nextval('public.oauth2_provider_application_id_seq'::regclass) NOT NULL,
    client_id character varying(100) NOT NULL,
    redirect_uris text NOT NULL,
    client_type character varying(32) NOT NULL,
    authorization_grant_type character varying(32) NOT NULL,
    client_secret character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    user_id integer,
    skip_authorization boolean NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE public.oauth2_provider_application OWNER TO istvan;

--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE; Schema: public; Owner: istvan
--

CREATE SEQUENCE public.oauth2_provider_grant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_grant_id_seq OWNER TO istvan;

--
-- Name: oauth2_provider_grant; Type: TABLE; Schema: public; Owner: istvan
--

CREATE TABLE public.oauth2_provider_grant (
    id bigint DEFAULT nextval('public.oauth2_provider_grant_id_seq'::regclass) NOT NULL,
    code character varying(255) NOT NULL,
    expires timestamp with time zone NOT NULL,
    redirect_uri character varying(255) NOT NULL,
    scope text NOT NULL,
    application_id bigint NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL
);


ALTER TABLE public.oauth2_provider_grant OWNER TO istvan;

--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: istvan
--

CREATE SEQUENCE public.oauth2_provider_refreshtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth2_provider_refreshtoken_id_seq OWNER TO istvan;

--
-- Name: oauth2_provider_refreshtoken; Type: TABLE; Schema: public; Owner: istvan
--

CREATE TABLE public.oauth2_provider_refreshtoken (
    id bigint DEFAULT nextval('public.oauth2_provider_refreshtoken_id_seq'::regclass) NOT NULL,
    token character varying(255) NOT NULL,
    access_token_id bigint,
    application_id bigint NOT NULL,
    user_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    revoked timestamp with time zone
);


ALTER TABLE public.oauth2_provider_refreshtoken OWNER TO istvan;

--
-- Name: social_auth_association; Type: TABLE; Schema: public; Owner: istvan
--

CREATE TABLE public.social_auth_association (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    handle character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    issued integer NOT NULL,
    lifetime integer NOT NULL,
    assoc_type character varying(64) NOT NULL
);


ALTER TABLE public.social_auth_association OWNER TO istvan;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE; Schema: public; Owner: istvan
--

CREATE SEQUENCE public.social_auth_association_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_association_id_seq OWNER TO istvan;

--
-- Name: social_auth_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: istvan
--

ALTER SEQUENCE public.social_auth_association_id_seq OWNED BY public.social_auth_association.id;


--
-- Name: social_auth_code; Type: TABLE; Schema: public; Owner: istvan
--

CREATE TABLE public.social_auth_code (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    code character varying(32) NOT NULL,
    verified boolean NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.social_auth_code OWNER TO istvan;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE; Schema: public; Owner: istvan
--

CREATE SEQUENCE public.social_auth_code_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_code_id_seq OWNER TO istvan;

--
-- Name: social_auth_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: istvan
--

ALTER SEQUENCE public.social_auth_code_id_seq OWNED BY public.social_auth_code.id;


--
-- Name: social_auth_nonce; Type: TABLE; Schema: public; Owner: istvan
--

CREATE TABLE public.social_auth_nonce (
    id integer NOT NULL,
    server_url character varying(255) NOT NULL,
    "timestamp" integer NOT NULL,
    salt character varying(65) NOT NULL
);


ALTER TABLE public.social_auth_nonce OWNER TO istvan;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE; Schema: public; Owner: istvan
--

CREATE SEQUENCE public.social_auth_nonce_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_nonce_id_seq OWNER TO istvan;

--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: istvan
--

ALTER SEQUENCE public.social_auth_nonce_id_seq OWNED BY public.social_auth_nonce.id;


--
-- Name: social_auth_partial; Type: TABLE; Schema: public; Owner: istvan
--

CREATE TABLE public.social_auth_partial (
    id integer NOT NULL,
    token character varying(32) NOT NULL,
    next_step smallint NOT NULL,
    backend character varying(32) NOT NULL,
    data text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    CONSTRAINT social_auth_partial_next_step_check CHECK ((next_step >= 0))
);


ALTER TABLE public.social_auth_partial OWNER TO istvan;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE; Schema: public; Owner: istvan
--

CREATE SEQUENCE public.social_auth_partial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_partial_id_seq OWNER TO istvan;

--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: istvan
--

ALTER SEQUENCE public.social_auth_partial_id_seq OWNED BY public.social_auth_partial.id;


--
-- Name: social_auth_usersocialauth; Type: TABLE; Schema: public; Owner: istvan
--

CREATE TABLE public.social_auth_usersocialauth (
    id integer NOT NULL,
    provider character varying(32) NOT NULL,
    uid character varying(255) NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.social_auth_usersocialauth OWNER TO istvan;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE; Schema: public; Owner: istvan
--

CREATE SEQUENCE public.social_auth_usersocialauth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.social_auth_usersocialauth_id_seq OWNER TO istvan;

--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: istvan
--

ALTER SEQUENCE public.social_auth_usersocialauth_id_seq OWNED BY public.social_auth_usersocialauth.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: klee_web_category id; Type: DEFAULT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.klee_web_category ALTER COLUMN id SET DEFAULT nextval('public.klee_web_category_id_seq'::regclass);


--
-- Name: klee_web_challenge id; Type: DEFAULT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.klee_web_challenge ALTER COLUMN id SET DEFAULT nextval('public.klee_web_challenge_id_seq'::regclass);


--
-- Name: klee_web_classroom id; Type: DEFAULT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.klee_web_classroom ALTER COLUMN id SET DEFAULT nextval('public.klee_web_classroom_id_seq'::regclass);


--
-- Name: klee_web_file id; Type: DEFAULT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.klee_web_file ALTER COLUMN id SET DEFAULT nextval('public.klee_web_file_id_seq'::regclass);


--
-- Name: klee_web_submission id; Type: DEFAULT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.klee_web_submission ALTER COLUMN id SET DEFAULT nextval('public.klee_web_submission_id_seq'::regclass);


--
-- Name: klee_web_task id; Type: DEFAULT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.klee_web_task ALTER COLUMN id SET DEFAULT nextval('public.klee_web_task_id_seq'::regclass);


--
-- Name: klee_web_user id; Type: DEFAULT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.klee_web_user ALTER COLUMN id SET DEFAULT nextval('public.klee_web_user_id_seq'::regclass);


--
-- Name: klee_web_user_groups id; Type: DEFAULT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.klee_web_user_groups ALTER COLUMN id SET DEFAULT nextval('public.klee_web_user_groups_id_seq'::regclass);


--
-- Name: klee_web_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.klee_web_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.klee_web_user_user_permissions_id_seq'::regclass);


--
-- Name: social_auth_association id; Type: DEFAULT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.social_auth_association ALTER COLUMN id SET DEFAULT nextval('public.social_auth_association_id_seq'::regclass);


--
-- Name: social_auth_code id; Type: DEFAULT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.social_auth_code ALTER COLUMN id SET DEFAULT nextval('public.social_auth_code_id_seq'::regclass);


--
-- Name: social_auth_nonce id; Type: DEFAULT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.social_auth_nonce ALTER COLUMN id SET DEFAULT nextval('public.social_auth_nonce_id_seq'::regclass);


--
-- Name: social_auth_partial id; Type: DEFAULT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.social_auth_partial ALTER COLUMN id SET DEFAULT nextval('public.social_auth_partial_id_seq'::regclass);


--
-- Name: social_auth_usersocialauth id; Type: DEFAULT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.social_auth_usersocialauth ALTER COLUMN id SET DEFAULT nextval('public.social_auth_usersocialauth_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: istvan
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: istvan
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: istvan
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
25	Can add log entry	7	add_logentry
26	Can change log entry	7	change_logentry
27	Can delete log entry	7	delete_logentry
28	Can view log entry	7	view_logentry
29	Can add permission	8	add_permission
30	Can change permission	8	change_permission
31	Can delete permission	8	delete_permission
32	Can view permission	8	view_permission
33	Can add group	9	add_group
34	Can change group	9	change_group
35	Can delete group	9	delete_group
36	Can view group	9	view_group
37	Can add content type	10	add_contenttype
38	Can change content type	10	change_contenttype
39	Can delete content type	10	delete_contenttype
40	Can view content type	10	view_contenttype
41	Can add session	11	add_session
42	Can change session	11	change_session
43	Can delete session	11	delete_session
44	Can view session	11	view_session
45	Can add application	12	add_application
46	Can change application	12	change_application
47	Can delete application	12	delete_application
48	Can view application	12	view_application
49	Can add access token	13	add_accesstoken
50	Can change access token	13	change_accesstoken
51	Can delete access token	13	delete_accesstoken
52	Can view access token	13	view_accesstoken
53	Can add grant	14	add_grant
54	Can change grant	14	change_grant
55	Can delete grant	14	delete_grant
56	Can view grant	14	view_grant
57	Can add refresh token	15	add_refreshtoken
58	Can change refresh token	15	change_refreshtoken
59	Can delete refresh token	15	delete_refreshtoken
60	Can view refresh token	15	view_refreshtoken
61	Can add association	16	add_association
62	Can change association	16	change_association
63	Can delete association	16	delete_association
64	Can view association	16	view_association
65	Can add code	17	add_code
66	Can change code	17	change_code
67	Can delete code	17	delete_code
68	Can view code	17	view_code
69	Can add nonce	18	add_nonce
70	Can change nonce	18	change_nonce
71	Can delete nonce	18	delete_nonce
72	Can view nonce	18	view_nonce
73	Can add user social auth	19	add_usersocialauth
74	Can change user social auth	19	change_usersocialauth
75	Can delete user social auth	19	delete_usersocialauth
76	Can view user social auth	19	view_usersocialauth
77	Can add partial	20	add_partial
78	Can change partial	20	change_partial
79	Can delete partial	20	delete_partial
80	Can view partial	20	view_partial
81	Can add classroom	21	add_classroom
82	Can change classroom	21	change_classroom
83	Can delete classroom	21	delete_classroom
84	Can view classroom	21	view_classroom
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: istvan
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: istvan
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	klee_web	user
2	klee_web	category
3	klee_web	challenge
4	klee_web	file
5	klee_web	task
6	klee_web	submission
7	admin	logentry
8	auth	permission
9	auth	group
10	contenttypes	contenttype
11	sessions	session
12	oauth2_provider	application
13	oauth2_provider	accesstoken
14	oauth2_provider	grant
15	oauth2_provider	refreshtoken
16	social_django	association
17	social_django	code
18	social_django	nonce
19	social_django	usersocialauth
20	social_django	partial
21	klee_web	classroom
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: istvan
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-11-26 16:48:54.535831+00
5	contenttypes	0002_remove_content_type_name	2022-11-26 16:59:49.102132+00
6	auth	0001_initial	2022-11-26 16:59:49.140908+00
7	auth	0002_alter_permission_name_max_length	2022-11-26 16:59:49.175345+00
8	auth	0003_alter_user_email_max_length	2022-11-26 16:59:49.182966+00
9	auth	0004_alter_user_username_opts	2022-11-26 16:59:49.18985+00
10	auth	0005_alter_user_last_login_null	2022-11-26 16:59:49.196698+00
11	auth	0006_require_contenttypes_0002	2022-11-26 16:59:49.199941+00
12	auth	0007_alter_validators_add_error_messages	2022-11-26 16:59:49.209927+00
13	auth	0008_alter_user_username_max_length	2022-11-26 16:59:49.220656+00
14	auth	0009_alter_user_last_name_max_length	2022-11-26 16:59:49.229489+00
15	auth	0010_alter_group_name_max_length	2022-11-26 16:59:49.2399+00
16	auth	0011_update_proxy_permissions	2022-11-26 16:59:49.250883+00
17	klee_web	0001_initial	2022-11-26 16:59:49.349099+00
18	admin	0001_initial	2022-11-26 16:59:49.422131+00
19	admin	0002_logentry_remove_auto_add	2022-11-26 16:59:49.445599+00
20	admin	0003_logentry_add_action_flag_choices	2022-11-26 16:59:49.455732+00
21	oauth2_provider	0001_initial	2022-11-26 16:59:49.550999+00
22	oauth2_provider	0002_08_updates	2022-11-26 16:59:49.714946+00
23	oauth2_provider	0003_auto_20160316_1503	2022-11-26 16:59:49.738837+00
24	oauth2_provider	0004_auto_20160525_1623	2022-11-26 16:59:49.821184+00
25	oauth2_provider	0005_auto_20170514_1141	2022-11-26 16:59:50.253352+00
26	oauth2_provider	0006_auto_20171214_2232	2022-11-26 16:59:50.356145+00
27	sessions	0001_initial	2022-11-26 16:59:50.372143+00
28	default	0001_initial	2022-11-26 16:59:50.457812+00
29	social_auth	0001_initial	2022-11-26 16:59:50.459635+00
30	default	0002_add_related_name	2022-11-26 16:59:50.503008+00
31	social_auth	0002_add_related_name	2022-11-26 16:59:50.504611+00
32	default	0003_alter_email_max_length	2022-11-26 16:59:50.512148+00
33	social_auth	0003_alter_email_max_length	2022-11-26 16:59:50.513753+00
34	default	0004_auto_20160423_0400	2022-11-26 16:59:50.535716+00
35	social_auth	0004_auto_20160423_0400	2022-11-26 16:59:50.53782+00
36	social_auth	0005_auto_20160727_2333	2022-11-26 16:59:50.549063+00
37	social_django	0006_partial	2022-11-26 16:59:50.564283+00
38	social_django	0007_code_timestamp	2022-11-26 16:59:50.57893+00
39	social_django	0008_partial_timestamp	2022-11-26 16:59:50.589716+00
40	social_django	0002_add_related_name	2022-11-26 16:59:50.598291+00
41	social_django	0004_auto_20160423_0400	2022-11-26 16:59:50.601239+00
42	social_django	0005_auto_20160727_2333	2022-11-26 16:59:50.60376+00
43	social_django	0003_alter_email_max_length	2022-11-26 16:59:50.606185+00
44	social_django	0001_initial	2022-11-26 16:59:50.608733+00
45	klee_web	0002_auto_20221130_1959	2022-11-30 19:59:18.266757+00
46	klee_web	0003_user_assignment_scores	2022-12-01 11:33:57.386101+00
47	klee_web	0004_auto_20221202_0838	2022-12-02 08:38:56.543564+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: istvan
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: klee_web_category; Type: TABLE DATA; Schema: public; Owner: istvan
--

COPY public.klee_web_category (id, name, created, nr_problems, description) FROM stdin;
1	algorithms	2022-01-01 01:01:01	20	foobar
2	basic	2022-01-01 01:01:01	10	barfoo
\.


--
-- Data for Name: klee_web_challenge; Type: TABLE DATA; Schema: public; Owner: istvan
--

COPY public.klee_web_challenge (id, name, created, tags, sample_solution, category_id, difficulty, input, output, restrictions, statement) FROM stdin;
1	prob1	2022-01-01 01:01:01	{}	baz	1	easy	123	456	none	no
2	prob2	2022-01-01 01:01:01	{}	bar	1	medium	789	123	none	yea
\.


--
-- Data for Name: klee_web_classroom; Type: TABLE DATA; Schema: public; Owner: istvan
--

COPY public.klee_web_classroom (id, name, created, teacher_img, nr_of_members, assignments, announcements, teacher_id, members) FROM stdin;
1	class1	\N	\N	\N	\N	\N	\N	{}
\.


--
-- Data for Name: klee_web_file; Type: TABLE DATA; Schema: public; Owner: istvan
--

COPY public.klee_web_file (id, created, updated, name, code, num_files, size_files, size_sym_in, min_sym_args, max_sym_args, size_sym_args, options, arguments, last_modified) FROM stdin;
\.


--
-- Data for Name: klee_web_submission; Type: TABLE DATA; Schema: public; Owner: istvan
--

COPY public.klee_web_submission (id, correct, challenge_id, user_id) FROM stdin;
\.


--
-- Data for Name: klee_web_task; Type: TABLE DATA; Schema: public; Owner: istvan
--

COPY public.klee_web_task (created_at, id, task_id, ip_address, email_address, completed_at, current_output, worker_name, location, "user") FROM stdin;
\.


--
-- Data for Name: klee_web_user; Type: TABLE DATA; Schema: public; Owner: istvan
--

COPY public.klee_web_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, scores, assignment_scores) FROM stdin;
1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	{"basic": {"prob3": 1, "prob4": 1}, "algorithms": {"prob1": 1, "prob2": 1}}	\N
\.


--
-- Data for Name: klee_web_user_groups; Type: TABLE DATA; Schema: public; Owner: istvan
--

COPY public.klee_web_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: klee_web_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: istvan
--

COPY public.klee_web_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_accesstoken; Type: TABLE DATA; Schema: public; Owner: istvan
--

COPY public.oauth2_provider_accesstoken (id, token, expires, scope, application_id, user_id, created, updated, source_refresh_token_id) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_application; Type: TABLE DATA; Schema: public; Owner: istvan
--

COPY public.oauth2_provider_application (id, client_id, redirect_uris, client_type, authorization_grant_type, client_secret, name, user_id, skip_authorization, created, updated) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_grant; Type: TABLE DATA; Schema: public; Owner: istvan
--

COPY public.oauth2_provider_grant (id, code, expires, redirect_uri, scope, application_id, user_id, created, updated) FROM stdin;
\.


--
-- Data for Name: oauth2_provider_refreshtoken; Type: TABLE DATA; Schema: public; Owner: istvan
--

COPY public.oauth2_provider_refreshtoken (id, token, access_token_id, application_id, user_id, created, updated, revoked) FROM stdin;
\.


--
-- Data for Name: social_auth_association; Type: TABLE DATA; Schema: public; Owner: istvan
--

COPY public.social_auth_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
\.


--
-- Data for Name: social_auth_code; Type: TABLE DATA; Schema: public; Owner: istvan
--

COPY public.social_auth_code (id, email, code, verified, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_nonce; Type: TABLE DATA; Schema: public; Owner: istvan
--

COPY public.social_auth_nonce (id, server_url, "timestamp", salt) FROM stdin;
\.


--
-- Data for Name: social_auth_partial; Type: TABLE DATA; Schema: public; Owner: istvan
--

COPY public.social_auth_partial (id, token, next_step, backend, data, "timestamp") FROM stdin;
\.


--
-- Data for Name: social_auth_usersocialauth; Type: TABLE DATA; Schema: public; Owner: istvan
--

COPY public.social_auth_usersocialauth (id, provider, uid, extra_data, user_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: istvan
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: istvan
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: istvan
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 84, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: istvan
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: istvan
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 21, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: istvan
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 47, true);


--
-- Name: klee_web_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: istvan
--

SELECT pg_catalog.setval('public.klee_web_category_id_seq', 2, true);


--
-- Name: klee_web_challenge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: istvan
--

SELECT pg_catalog.setval('public.klee_web_challenge_id_seq', 3, true);


--
-- Name: klee_web_classroom_id_seq; Type: SEQUENCE SET; Schema: public; Owner: istvan
--

SELECT pg_catalog.setval('public.klee_web_classroom_id_seq', 1, true);


--
-- Name: klee_web_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: istvan
--

SELECT pg_catalog.setval('public.klee_web_file_id_seq', 1, false);


--
-- Name: klee_web_submission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: istvan
--

SELECT pg_catalog.setval('public.klee_web_submission_id_seq', 1, false);


--
-- Name: klee_web_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: istvan
--

SELECT pg_catalog.setval('public.klee_web_task_id_seq', 1, false);


--
-- Name: klee_web_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: istvan
--

SELECT pg_catalog.setval('public.klee_web_user_groups_id_seq', 1, false);


--
-- Name: klee_web_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: istvan
--

SELECT pg_catalog.setval('public.klee_web_user_id_seq', 2, true);


--
-- Name: klee_web_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: istvan
--

SELECT pg_catalog.setval('public.klee_web_user_user_permissions_id_seq', 1, false);


--
-- Name: oauth2_provider_accesstoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: istvan
--

SELECT pg_catalog.setval('public.oauth2_provider_accesstoken_id_seq', 1, false);


--
-- Name: oauth2_provider_application_id_seq; Type: SEQUENCE SET; Schema: public; Owner: istvan
--

SELECT pg_catalog.setval('public.oauth2_provider_application_id_seq', 1, false);


--
-- Name: oauth2_provider_grant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: istvan
--

SELECT pg_catalog.setval('public.oauth2_provider_grant_id_seq', 1, false);


--
-- Name: oauth2_provider_refreshtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: istvan
--

SELECT pg_catalog.setval('public.oauth2_provider_refreshtoken_id_seq', 1, false);


--
-- Name: social_auth_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: istvan
--

SELECT pg_catalog.setval('public.social_auth_association_id_seq', 1, false);


--
-- Name: social_auth_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: istvan
--

SELECT pg_catalog.setval('public.social_auth_code_id_seq', 1, false);


--
-- Name: social_auth_nonce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: istvan
--

SELECT pg_catalog.setval('public.social_auth_nonce_id_seq', 1, false);


--
-- Name: social_auth_partial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: istvan
--

SELECT pg_catalog.setval('public.social_auth_partial_id_seq', 1, false);


--
-- Name: social_auth_usersocialauth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: istvan
--

SELECT pg_catalog.setval('public.social_auth_usersocialauth_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: klee_web_category klee_web_category_pkey; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.klee_web_category
    ADD CONSTRAINT klee_web_category_pkey PRIMARY KEY (id);


--
-- Name: klee_web_challenge klee_web_challenge_pkey; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.klee_web_challenge
    ADD CONSTRAINT klee_web_challenge_pkey PRIMARY KEY (id);


--
-- Name: klee_web_classroom klee_web_classroom_pkey; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.klee_web_classroom
    ADD CONSTRAINT klee_web_classroom_pkey PRIMARY KEY (id);


--
-- Name: klee_web_file klee_web_file_pkey; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.klee_web_file
    ADD CONSTRAINT klee_web_file_pkey PRIMARY KEY (id);


--
-- Name: klee_web_submission klee_web_submission_pkey; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.klee_web_submission
    ADD CONSTRAINT klee_web_submission_pkey PRIMARY KEY (id);


--
-- Name: klee_web_task klee_web_task_pkey; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.klee_web_task
    ADD CONSTRAINT klee_web_task_pkey PRIMARY KEY (id);


--
-- Name: klee_web_task klee_web_task_task_id_key; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.klee_web_task
    ADD CONSTRAINT klee_web_task_task_id_key UNIQUE (task_id);


--
-- Name: klee_web_user_groups klee_web_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.klee_web_user_groups
    ADD CONSTRAINT klee_web_user_groups_pkey PRIMARY KEY (id);


--
-- Name: klee_web_user_groups klee_web_user_groups_user_id_group_id_478375b8_uniq; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.klee_web_user_groups
    ADD CONSTRAINT klee_web_user_groups_user_id_group_id_478375b8_uniq UNIQUE (user_id, group_id);


--
-- Name: klee_web_user klee_web_user_pkey; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.klee_web_user
    ADD CONSTRAINT klee_web_user_pkey PRIMARY KEY (id);


--
-- Name: klee_web_user_user_permissions klee_web_user_user_permi_user_id_permission_id_a807c063_uniq; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.klee_web_user_user_permissions
    ADD CONSTRAINT klee_web_user_user_permi_user_id_permission_id_a807c063_uniq UNIQUE (user_id, permission_id);


--
-- Name: klee_web_user_user_permissions klee_web_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.klee_web_user_user_permissions
    ADD CONSTRAINT klee_web_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: klee_web_user klee_web_user_username_key; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.klee_web_user
    ADD CONSTRAINT klee_web_user_username_key UNIQUE (username);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_pkey; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_source_refresh_token_id_key; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_source_refresh_token_id_key UNIQUE (source_refresh_token_id);


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_token_8af090f8_uniq; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_token_8af090f8_uniq UNIQUE (token);


--
-- Name: oauth2_provider_application oauth2_provider_application_client_id_key; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_client_id_key UNIQUE (client_id);


--
-- Name: oauth2_provider_application oauth2_provider_application_pkey; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_application_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_grant oauth2_provider_grant_code_49ab4ddf_uniq; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_code_49ab4ddf_uniq UNIQUE (code);


--
-- Name: oauth2_provider_grant oauth2_provider_grant_pkey; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_access_token_id_key; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_access_token_id_key UNIQUE (access_token_id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_pkey PRIMARY KEY (id);


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq UNIQUE (token, revoked);


--
-- Name: social_auth_association social_auth_association_pkey; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_pkey PRIMARY KEY (id);


--
-- Name: social_auth_association social_auth_association_server_url_handle_078befa2_uniq; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.social_auth_association
    ADD CONSTRAINT social_auth_association_server_url_handle_078befa2_uniq UNIQUE (server_url, handle);


--
-- Name: social_auth_code social_auth_code_email_code_801b2d02_uniq; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_email_code_801b2d02_uniq UNIQUE (email, code);


--
-- Name: social_auth_code social_auth_code_pkey; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.social_auth_code
    ADD CONSTRAINT social_auth_code_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_pkey; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_pkey PRIMARY KEY (id);


--
-- Name: social_auth_nonce social_auth_nonce_server_url_timestamp_salt_f6284463_uniq; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.social_auth_nonce
    ADD CONSTRAINT social_auth_nonce_server_url_timestamp_salt_f6284463_uniq UNIQUE (server_url, "timestamp", salt);


--
-- Name: social_auth_partial social_auth_partial_pkey; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.social_auth_partial
    ADD CONSTRAINT social_auth_partial_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_pkey; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_pkey PRIMARY KEY (id);


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_provider_uid_e6b5e668_uniq; Type: CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_provider_uid_e6b5e668_uniq UNIQUE (provider, uid);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: klee_web_challenge_category_id_f9072620; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX klee_web_challenge_category_id_f9072620 ON public.klee_web_challenge USING btree (category_id);


--
-- Name: klee_web_classroom_teacher_id_id_9c20ce87; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX klee_web_classroom_teacher_id_id_9c20ce87 ON public.klee_web_classroom USING btree (teacher_id);


--
-- Name: klee_web_submission_challenge_id_725a6ea8; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX klee_web_submission_challenge_id_725a6ea8 ON public.klee_web_submission USING btree (challenge_id);


--
-- Name: klee_web_submission_user_id_71dd7231; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX klee_web_submission_user_id_71dd7231 ON public.klee_web_submission USING btree (user_id);


--
-- Name: klee_web_task_task_id_2c7f5e6f_like; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX klee_web_task_task_id_2c7f5e6f_like ON public.klee_web_task USING btree (task_id varchar_pattern_ops);


--
-- Name: klee_web_user_groups_group_id_d48299b7; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX klee_web_user_groups_group_id_d48299b7 ON public.klee_web_user_groups USING btree (group_id);


--
-- Name: klee_web_user_groups_user_id_95de0b71; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX klee_web_user_groups_user_id_95de0b71 ON public.klee_web_user_groups USING btree (user_id);


--
-- Name: klee_web_user_user_permissions_permission_id_5d5fdb74; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX klee_web_user_user_permissions_permission_id_5d5fdb74 ON public.klee_web_user_user_permissions USING btree (permission_id);


--
-- Name: klee_web_user_user_permissions_user_id_e3481454; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX klee_web_user_user_permissions_user_id_e3481454 ON public.klee_web_user_user_permissions USING btree (user_id);


--
-- Name: klee_web_user_username_f95cdb65_like; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX klee_web_user_username_f95cdb65_like ON public.klee_web_user USING btree (username varchar_pattern_ops);


--
-- Name: oauth2_provider_accesstoken_application_id_b22886e1; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX oauth2_provider_accesstoken_application_id_b22886e1 ON public.oauth2_provider_accesstoken USING btree (application_id);


--
-- Name: oauth2_provider_accesstoken_token_8af090f8_like; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX oauth2_provider_accesstoken_token_8af090f8_like ON public.oauth2_provider_accesstoken USING btree (token varchar_pattern_ops);


--
-- Name: oauth2_provider_accesstoken_user_id_6e4c9a65; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX oauth2_provider_accesstoken_user_id_6e4c9a65 ON public.oauth2_provider_accesstoken USING btree (user_id);


--
-- Name: oauth2_provider_application_client_id_03f0cc84_like; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX oauth2_provider_application_client_id_03f0cc84_like ON public.oauth2_provider_application USING btree (client_id varchar_pattern_ops);


--
-- Name: oauth2_provider_application_client_secret_53133678; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX oauth2_provider_application_client_secret_53133678 ON public.oauth2_provider_application USING btree (client_secret);


--
-- Name: oauth2_provider_application_client_secret_53133678_like; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX oauth2_provider_application_client_secret_53133678_like ON public.oauth2_provider_application USING btree (client_secret varchar_pattern_ops);


--
-- Name: oauth2_provider_application_user_id_79829054; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX oauth2_provider_application_user_id_79829054 ON public.oauth2_provider_application USING btree (user_id);


--
-- Name: oauth2_provider_grant_application_id_81923564; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX oauth2_provider_grant_application_id_81923564 ON public.oauth2_provider_grant USING btree (application_id);


--
-- Name: oauth2_provider_grant_code_49ab4ddf_like; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX oauth2_provider_grant_code_49ab4ddf_like ON public.oauth2_provider_grant USING btree (code varchar_pattern_ops);


--
-- Name: oauth2_provider_grant_user_id_e8f62af8; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX oauth2_provider_grant_user_id_e8f62af8 ON public.oauth2_provider_grant USING btree (user_id);


--
-- Name: oauth2_provider_refreshtoken_application_id_2d1c311b; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX oauth2_provider_refreshtoken_application_id_2d1c311b ON public.oauth2_provider_refreshtoken USING btree (application_id);


--
-- Name: oauth2_provider_refreshtoken_user_id_da837fce; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX oauth2_provider_refreshtoken_user_id_da837fce ON public.oauth2_provider_refreshtoken USING btree (user_id);


--
-- Name: social_auth_code_code_a2393167; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX social_auth_code_code_a2393167 ON public.social_auth_code USING btree (code);


--
-- Name: social_auth_code_code_a2393167_like; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX social_auth_code_code_a2393167_like ON public.social_auth_code USING btree (code varchar_pattern_ops);


--
-- Name: social_auth_code_timestamp_176b341f; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX social_auth_code_timestamp_176b341f ON public.social_auth_code USING btree ("timestamp");


--
-- Name: social_auth_partial_timestamp_50f2119f; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX social_auth_partial_timestamp_50f2119f ON public.social_auth_partial USING btree ("timestamp");


--
-- Name: social_auth_partial_token_3017fea3; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX social_auth_partial_token_3017fea3 ON public.social_auth_partial USING btree (token);


--
-- Name: social_auth_partial_token_3017fea3_like; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX social_auth_partial_token_3017fea3_like ON public.social_auth_partial USING btree (token varchar_pattern_ops);


--
-- Name: social_auth_usersocialauth_user_id_17d28448; Type: INDEX; Schema: public; Owner: istvan
--

CREATE INDEX social_auth_usersocialauth_user_id_17d28448 ON public.social_auth_usersocialauth USING btree (user_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_klee_web_user_id; Type: FK CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_klee_web_user_id FOREIGN KEY (user_id) REFERENCES public.klee_web_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: klee_web_challenge klee_web_challenge_category_id_f9072620_fk_klee_web_category_id; Type: FK CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.klee_web_challenge
    ADD CONSTRAINT klee_web_challenge_category_id_f9072620_fk_klee_web_category_id FOREIGN KEY (category_id) REFERENCES public.klee_web_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: klee_web_classroom klee_web_classroom_teacher_id_5c4e96ea_fk_klee_web_user_id; Type: FK CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.klee_web_classroom
    ADD CONSTRAINT klee_web_classroom_teacher_id_5c4e96ea_fk_klee_web_user_id FOREIGN KEY (teacher_id) REFERENCES public.klee_web_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: klee_web_submission klee_web_submission_challenge_id_725a6ea8_fk_klee_web_; Type: FK CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.klee_web_submission
    ADD CONSTRAINT klee_web_submission_challenge_id_725a6ea8_fk_klee_web_ FOREIGN KEY (challenge_id) REFERENCES public.klee_web_challenge(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: klee_web_submission klee_web_submission_user_id_71dd7231_fk_klee_web_user_id; Type: FK CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.klee_web_submission
    ADD CONSTRAINT klee_web_submission_user_id_71dd7231_fk_klee_web_user_id FOREIGN KEY (user_id) REFERENCES public.klee_web_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: klee_web_user_groups klee_web_user_groups_group_id_d48299b7_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.klee_web_user_groups
    ADD CONSTRAINT klee_web_user_groups_group_id_d48299b7_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: klee_web_user_groups klee_web_user_groups_user_id_95de0b71_fk_klee_web_user_id; Type: FK CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.klee_web_user_groups
    ADD CONSTRAINT klee_web_user_groups_user_id_95de0b71_fk_klee_web_user_id FOREIGN KEY (user_id) REFERENCES public.klee_web_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: klee_web_user_user_permissions klee_web_user_user_p_permission_id_5d5fdb74_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.klee_web_user_user_permissions
    ADD CONSTRAINT klee_web_user_user_p_permission_id_5d5fdb74_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: klee_web_user_user_permissions klee_web_user_user_p_user_id_e3481454_fk_klee_web_; Type: FK CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.klee_web_user_user_permissions
    ADD CONSTRAINT klee_web_user_user_p_user_id_e3481454_fk_klee_web_ FOREIGN KEY (user_id) REFERENCES public.klee_web_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr FOREIGN KEY (source_refresh_token_id) REFERENCES public.oauth2_provider_refreshtoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_acce_user_id_6e4c9a65_fk_klee_web_; Type: FK CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_acce_user_id_6e4c9a65_fk_klee_web_ FOREIGN KEY (user_id) REFERENCES public.klee_web_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_accesstoken oauth2_provider_accesstoken_application_id_b22886e1_fk; Type: FK CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.oauth2_provider_accesstoken
    ADD CONSTRAINT oauth2_provider_accesstoken_application_id_b22886e1_fk FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_application oauth2_provider_appl_user_id_79829054_fk_klee_web_; Type: FK CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.oauth2_provider_application
    ADD CONSTRAINT oauth2_provider_appl_user_id_79829054_fk_klee_web_ FOREIGN KEY (user_id) REFERENCES public.klee_web_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant oauth2_provider_grant_application_id_81923564_fk; Type: FK CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_application_id_81923564_fk FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_grant oauth2_provider_grant_user_id_e8f62af8_fk_klee_web_user_id; Type: FK CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.oauth2_provider_grant
    ADD CONSTRAINT oauth2_provider_grant_user_id_e8f62af8_fk_klee_web_user_id FOREIGN KEY (user_id) REFERENCES public.klee_web_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr; Type: FK CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr FOREIGN KEY (access_token_id) REFERENCES public.oauth2_provider_accesstoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refr_user_id_da837fce_fk_klee_web_; Type: FK CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refr_user_id_da837fce_fk_klee_web_ FOREIGN KEY (user_id) REFERENCES public.klee_web_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: oauth2_provider_refreshtoken oauth2_provider_refreshtoken_application_id_2d1c311b_fk; Type: FK CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.oauth2_provider_refreshtoken
    ADD CONSTRAINT oauth2_provider_refreshtoken_application_id_2d1c311b_fk FOREIGN KEY (application_id) REFERENCES public.oauth2_provider_application(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: social_auth_usersocialauth social_auth_usersocialauth_user_id_17d28448_fk_klee_web_user_id; Type: FK CONSTRAINT; Schema: public; Owner: istvan
--

ALTER TABLE ONLY public.social_auth_usersocialauth
    ADD CONSTRAINT social_auth_usersocialauth_user_id_17d28448_fk_klee_web_user_id FOREIGN KEY (user_id) REFERENCES public.klee_web_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

