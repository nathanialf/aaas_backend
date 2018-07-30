--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: aaas_project_dbs; Type: TABLE; Schema: public; Owner: n; Tablespace: 
--

CREATE TABLE aaas_project_dbs (
    db_id integer NOT NULL,
    proj_id integer,
    db_endpoint character varying(150),
    db_uname character varying(50),
    db_password character varying(50),
    db_active integer
);


ALTER TABLE public.aaas_project_dbs OWNER TO n;

--
-- Name: aaas_project_dbs_db_id_seq; Type: SEQUENCE; Schema: public; Owner: n
--

CREATE SEQUENCE aaas_project_dbs_db_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aaas_project_dbs_db_id_seq OWNER TO n;

--
-- Name: aaas_project_dbs_db_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: n
--

ALTER SEQUENCE aaas_project_dbs_db_id_seq OWNED BY aaas_project_dbs.db_id;


--
-- Name: aaas_project_routes; Type: TABLE; Schema: public; Owner: n; Tablespace: 
--

CREATE TABLE aaas_project_routes (
    route_id integer NOT NULL,
    db_id integer,
    route_content_type character varying(20),
    route_db_query character varying(100),
    route_active integer
);


ALTER TABLE public.aaas_project_routes OWNER TO n;

--
-- Name: aaas_project_routes_route_id_seq; Type: SEQUENCE; Schema: public; Owner: n
--

CREATE SEQUENCE aaas_project_routes_route_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aaas_project_routes_route_id_seq OWNER TO n;

--
-- Name: aaas_project_routes_route_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: n
--

ALTER SEQUENCE aaas_project_routes_route_id_seq OWNED BY aaas_project_routes.route_id;


--
-- Name: aaas_projects; Type: TABLE; Schema: public; Owner: n; Tablespace: 
--

CREATE TABLE aaas_projects (
    proj_id integer NOT NULL,
    proj_name character varying(20),
    proj_code character varying(6),
    proj_active integer
);


ALTER TABLE public.aaas_projects OWNER TO n;

--
-- Name: aaas_projects_proj_id_seq; Type: SEQUENCE; Schema: public; Owner: n
--

CREATE SEQUENCE aaas_projects_proj_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aaas_projects_proj_id_seq OWNER TO n;

--
-- Name: aaas_projects_proj_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: n
--

ALTER SEQUENCE aaas_projects_proj_id_seq OWNED BY aaas_projects.proj_id;


--
-- Name: aaas_roles; Type: TABLE; Schema: public; Owner: n; Tablespace: 
--

CREATE TABLE aaas_roles (
    role_id integer NOT NULL,
    role_title character varying(10)
);


ALTER TABLE public.aaas_roles OWNER TO n;

--
-- Name: aaas_roles_role_id_seq; Type: SEQUENCE; Schema: public; Owner: n
--

CREATE SEQUENCE aaas_roles_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aaas_roles_role_id_seq OWNER TO n;

--
-- Name: aaas_roles_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: n
--

ALTER SEQUENCE aaas_roles_role_id_seq OWNED BY aaas_roles.role_id;


--
-- Name: aaas_route_vars; Type: TABLE; Schema: public; Owner: n; Tablespace: 
--

CREATE TABLE aaas_route_vars (
    var_id integer NOT NULL,
    route_id integer,
    var_datatype character varying(50),
    var_name character varying(20),
    var_active integer
);


ALTER TABLE public.aaas_route_vars OWNER TO n;

--
-- Name: aaas_route_vars_var_id_seq; Type: SEQUENCE; Schema: public; Owner: n
--

CREATE SEQUENCE aaas_route_vars_var_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aaas_route_vars_var_id_seq OWNER TO n;

--
-- Name: aaas_route_vars_var_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: n
--

ALTER SEQUENCE aaas_route_vars_var_id_seq OWNED BY aaas_route_vars.var_id;


--
-- Name: aaas_user_project_roles; Type: TABLE; Schema: public; Owner: n; Tablespace: 
--

CREATE TABLE aaas_user_project_roles (
    user_id integer,
    proj_id integer,
    role_id integer
);


ALTER TABLE public.aaas_user_project_roles OWNER TO n;

--
-- Name: aaas_users; Type: TABLE; Schema: public; Owner: n; Tablespace: 
--

CREATE TABLE aaas_users (
    user_id integer NOT NULL,
    user_email character varying(40),
    user_fname character varying(20),
    user_lname character varying(20),
    user_password character varying(20),
    user_active integer
);


ALTER TABLE public.aaas_users OWNER TO n;

--
-- Name: aaas_users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: n
--

CREATE SEQUENCE aaas_users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aaas_users_user_id_seq OWNER TO n;

--
-- Name: aaas_users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: n
--

ALTER SEQUENCE aaas_users_user_id_seq OWNED BY aaas_users.user_id;


--
-- Name: db_id; Type: DEFAULT; Schema: public; Owner: n
--

ALTER TABLE ONLY aaas_project_dbs ALTER COLUMN db_id SET DEFAULT nextval('aaas_project_dbs_db_id_seq'::regclass);


--
-- Name: route_id; Type: DEFAULT; Schema: public; Owner: n
--

ALTER TABLE ONLY aaas_project_routes ALTER COLUMN route_id SET DEFAULT nextval('aaas_project_routes_route_id_seq'::regclass);


--
-- Name: proj_id; Type: DEFAULT; Schema: public; Owner: n
--

ALTER TABLE ONLY aaas_projects ALTER COLUMN proj_id SET DEFAULT nextval('aaas_projects_proj_id_seq'::regclass);


--
-- Name: role_id; Type: DEFAULT; Schema: public; Owner: n
--

ALTER TABLE ONLY aaas_roles ALTER COLUMN role_id SET DEFAULT nextval('aaas_roles_role_id_seq'::regclass);


--
-- Name: var_id; Type: DEFAULT; Schema: public; Owner: n
--

ALTER TABLE ONLY aaas_route_vars ALTER COLUMN var_id SET DEFAULT nextval('aaas_route_vars_var_id_seq'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: n
--

ALTER TABLE ONLY aaas_users ALTER COLUMN user_id SET DEFAULT nextval('aaas_users_user_id_seq'::regclass);


--
-- Name: aaas_project_dbs_pkey; Type: CONSTRAINT; Schema: public; Owner: n; Tablespace: 
--

ALTER TABLE ONLY aaas_project_dbs
    ADD CONSTRAINT aaas_project_dbs_pkey PRIMARY KEY (db_id);


--
-- Name: aaas_project_routes_pkey; Type: CONSTRAINT; Schema: public; Owner: n; Tablespace: 
--

ALTER TABLE ONLY aaas_project_routes
    ADD CONSTRAINT aaas_project_routes_pkey PRIMARY KEY (route_id);


--
-- Name: aaas_projects_pkey; Type: CONSTRAINT; Schema: public; Owner: n; Tablespace: 
--

ALTER TABLE ONLY aaas_projects
    ADD CONSTRAINT aaas_projects_pkey PRIMARY KEY (proj_id);


--
-- Name: aaas_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: n; Tablespace: 
--

ALTER TABLE ONLY aaas_roles
    ADD CONSTRAINT aaas_roles_pkey PRIMARY KEY (role_id);


--
-- Name: aaas_route_vars_pkey; Type: CONSTRAINT; Schema: public; Owner: n; Tablespace: 
--

ALTER TABLE ONLY aaas_route_vars
    ADD CONSTRAINT aaas_route_vars_pkey PRIMARY KEY (var_id);


--
-- Name: aaas_users_pkey; Type: CONSTRAINT; Schema: public; Owner: n; Tablespace: 
--

ALTER TABLE ONLY aaas_users
    ADD CONSTRAINT aaas_users_pkey PRIMARY KEY (user_id);


--
-- Name: code; Type: CONSTRAINT; Schema: public; Owner: n; Tablespace: 
--

ALTER TABLE ONLY aaas_projects
    ADD CONSTRAINT code UNIQUE (proj_code);


--
-- Name: email; Type: CONSTRAINT; Schema: public; Owner: n; Tablespace: 
--

ALTER TABLE ONLY aaas_users
    ADD CONSTRAINT email UNIQUE (user_email);


--
-- Name: title; Type: CONSTRAINT; Schema: public; Owner: n; Tablespace: 
--

ALTER TABLE ONLY aaas_roles
    ADD CONSTRAINT title UNIQUE (role_title);


--
-- Name: aaas_project_dbs_proj_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: n
--

ALTER TABLE ONLY aaas_project_dbs
    ADD CONSTRAINT aaas_project_dbs_proj_id_fkey FOREIGN KEY (proj_id) REFERENCES aaas_projects(proj_id);


--
-- Name: aaas_project_routes_db_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: n
--

ALTER TABLE ONLY aaas_project_routes
    ADD CONSTRAINT aaas_project_routes_db_id_fkey FOREIGN KEY (db_id) REFERENCES aaas_project_dbs(db_id);


--
-- Name: aaas_route_vars_route_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: n
--

ALTER TABLE ONLY aaas_route_vars
    ADD CONSTRAINT aaas_route_vars_route_id_fkey FOREIGN KEY (route_id) REFERENCES aaas_project_routes(route_id);


--
-- Name: aaas_user_project_roles_proj_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: n
--

ALTER TABLE ONLY aaas_user_project_roles
    ADD CONSTRAINT aaas_user_project_roles_proj_id_fkey FOREIGN KEY (proj_id) REFERENCES aaas_projects(proj_id);


--
-- Name: aaas_user_project_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: n
--

ALTER TABLE ONLY aaas_user_project_roles
    ADD CONSTRAINT aaas_user_project_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES aaas_roles(role_id);


--
-- Name: aaas_user_project_roles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: n
--

ALTER TABLE ONLY aaas_user_project_roles
    ADD CONSTRAINT aaas_user_project_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES aaas_users(user_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

