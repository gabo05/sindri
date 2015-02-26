--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.3
-- Dumped by pg_dump version 9.3.3
-- Started on 2015-02-26 02:06:08

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 247 (class 3079 OID 11750)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2587 (class 0 OID 0)
-- Dependencies: 247
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 208 (class 1259 OID 59902)
-- Name: accounts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE accounts (
    id integer NOT NULL,
    email_id integer NOT NULL,
    passsword character varying NOT NULL,
    picture character varying,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    state bit(1) DEFAULT (1)::bit(1) NOT NULL,
    confirmed bit(1) DEFAULT (0)::bit(1) NOT NULL
);


ALTER TABLE public.accounts OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 59900)
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_id_seq OWNER TO postgres;

--
-- TOC entry 2588 (class 0 OID 0)
-- Dependencies: 207
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE accounts_id_seq OWNED BY accounts.id;


--
-- TOC entry 213 (class 1259 OID 59986)
-- Name: accounts_roles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE accounts_roles (
    account_id integer NOT NULL,
    role_id integer NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    state bit(1) DEFAULT (1)::bit(1) NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone,
    business_id integer
);


ALTER TABLE public.accounts_roles OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 106521)
-- Name: accounts_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE accounts_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_roles_id_seq OWNER TO postgres;

--
-- TOC entry 2589 (class 0 OID 0)
-- Dependencies: 224
-- Name: accounts_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE accounts_roles_id_seq OWNED BY accounts_roles.id;


--
-- TOC entry 191 (class 1259 OID 59669)
-- Name: activities; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE activities (
    id integer NOT NULL,
    schedule_id integer NOT NULL,
    name character varying,
    description text,
    start_at timestamp without time zone,
    end_at timestamp without time zone,
    predecessor integer,
    completed bit(1),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    state bit(1)
);


ALTER TABLE public.activities OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 59667)
-- Name: activities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activities_id_seq OWNER TO postgres;

--
-- TOC entry 2590 (class 0 OID 0)
-- Dependencies: 190
-- Name: activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE activities_id_seq OWNED BY activities.id;


--
-- TOC entry 193 (class 1259 OID 59687)
-- Name: agents; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE agents (
    id integer NOT NULL,
    appointment_id integer NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    state bit(1) DEFAULT (1)::bit(1) NOT NULL
);


ALTER TABLE public.agents OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 147494)
-- Name: agents_areas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE agents_areas (
    id integer NOT NULL,
    area_id integer NOT NULL,
    agent_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    state bit(1) DEFAULT (1)::bit(1) NOT NULL
);


ALTER TABLE public.agents_areas OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 147492)
-- Name: agents_areas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE agents_areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agents_areas_id_seq OWNER TO postgres;

--
-- TOC entry 2591 (class 0 OID 0)
-- Dependencies: 241
-- Name: agents_areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE agents_areas_id_seq OWNED BY agents_areas.id;


--
-- TOC entry 192 (class 1259 OID 59685)
-- Name: agents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE agents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agents_id_seq OWNER TO postgres;

--
-- TOC entry 2592 (class 0 OID 0)
-- Dependencies: 192
-- Name: agents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE agents_id_seq OWNED BY agents.id;


--
-- TOC entry 189 (class 1259 OID 59658)
-- Name: appointments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE appointments (
    id integer NOT NULL,
    name character varying,
    description text,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone,
    state bit(1) DEFAULT (1)::bit(1) NOT NULL
);


ALTER TABLE public.appointments OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 59656)
-- Name: appointments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE appointments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appointments_id_seq OWNER TO postgres;

--
-- TOC entry 2593 (class 0 OID 0)
-- Dependencies: 188
-- Name: appointments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE appointments_id_seq OWNED BY appointments.id;


--
-- TOC entry 236 (class 1259 OID 139266)
-- Name: areas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE areas (
    id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone,
    state bit(1) DEFAULT (1)::bit(1) NOT NULL,
    is_suggested bit(1) DEFAULT (0)::bit(1) NOT NULL,
    is_default bit(1) DEFAULT (0)::bit(1) NOT NULL
);


ALTER TABLE public.areas OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 122880)
-- Name: areas_categories; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE areas_categories (
    id integer NOT NULL,
    businesses_area_id integer NOT NULL,
    category_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    state bit(1) DEFAULT (1)::bit(1) NOT NULL
);


ALTER TABLE public.areas_categories OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 139264)
-- Name: areas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.areas_id_seq OWNER TO postgres;

--
-- TOC entry 2594 (class 0 OID 0)
-- Dependencies: 235
-- Name: areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE areas_id_seq OWNED BY areas.id;


--
-- TOC entry 187 (class 1259 OID 59647)
-- Name: attachments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE attachments (
    id integer NOT NULL,
    name character varying,
    path character varying,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone,
    state bit(1) DEFAULT (1)::bit(1)
);


ALTER TABLE public.attachments OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 59645)
-- Name: attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attachments_id_seq OWNER TO postgres;

--
-- TOC entry 2595 (class 0 OID 0)
-- Dependencies: 186
-- Name: attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE attachments_id_seq OWNED BY attachments.id;


--
-- TOC entry 199 (class 1259 OID 59777)
-- Name: businesses_agents; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE businesses_agents (
    agent_id integer NOT NULL,
    business_id integer NOT NULL,
    updated_at timestamp without time zone,
    state bit(1) DEFAULT (1)::bit(1) NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.businesses_agents OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 106496)
-- Name: business_agents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE business_agents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.business_agents_id_seq OWNER TO postgres;

--
-- TOC entry 2596 (class 0 OID 0)
-- Dependencies: 223
-- Name: business_agents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE business_agents_id_seq OWNED BY businesses_agents.id;


--
-- TOC entry 240 (class 1259 OID 147473)
-- Name: businesses_areas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE businesses_areas (
    id integer NOT NULL,
    business_id integer NOT NULL,
    area_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at time without time zone DEFAULT now() NOT NULL,
    state bit(1) DEFAULT (1)::bit(1) NOT NULL
);


ALTER TABLE public.businesses_areas OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 147471)
-- Name: business_areas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE business_areas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.business_areas_id_seq OWNER TO postgres;

--
-- TOC entry 2597 (class 0 OID 0)
-- Dependencies: 239
-- Name: business_areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE business_areas_id_seq OWNED BY businesses_areas.id;


--
-- TOC entry 222 (class 1259 OID 90114)
-- Name: businesses; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE businesses (
    id integer NOT NULL,
    name character varying(255),
    logo character varying(255),
    color1 character varying(255),
    color2 character varying(255),
    color3 character varying(255),
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone,
    state bit(1) DEFAULT (1)::bit(1) NOT NULL
);


ALTER TABLE public.businesses OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 90112)
-- Name: businesses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE businesses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.businesses_id_seq OWNER TO postgres;

--
-- TOC entry 2598 (class 0 OID 0)
-- Dependencies: 221
-- Name: businesses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE businesses_id_seq OWNED BY businesses.id;


--
-- TOC entry 246 (class 1259 OID 148419)
-- Name: businesses_states; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE businesses_states (
    id integer NOT NULL,
    business_id integer NOT NULL,
    state_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    state bit(1) DEFAULT (1)::bit(1) NOT NULL
);


ALTER TABLE public.businesses_states OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 148417)
-- Name: businesses_states_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE businesses_states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.businesses_states_id_seq OWNER TO postgres;

--
-- TOC entry 2599 (class 0 OID 0)
-- Dependencies: 245
-- Name: businesses_states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE businesses_states_id_seq OWNED BY businesses_states.id;


--
-- TOC entry 232 (class 1259 OID 122883)
-- Name: businesses_ticket_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE businesses_ticket_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.businesses_ticket_categories_id_seq OWNER TO postgres;

--
-- TOC entry 2600 (class 0 OID 0)
-- Dependencies: 232
-- Name: businesses_ticket_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE businesses_ticket_categories_id_seq OWNED BY areas_categories.id;


--
-- TOC entry 175 (class 1259 OID 59573)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying,
    description text,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone,
    state bit(1) DEFAULT (1)::bit(1) NOT NULL,
    is_suggested bit(1) DEFAULT (0)::bit(1) NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 59571)
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- TOC entry 2601 (class 0 OID 0)
-- Dependencies: 174
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- TOC entry 196 (class 1259 OID 59727)
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE clients (
    id integer NOT NULL,
    business_id integer NOT NULL,
    appointment_id integer NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    state bit(1) DEFAULT (1)::bit(1) NOT NULL,
    phone_number character varying
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 59725)
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_id_seq OWNER TO postgres;

--
-- TOC entry 2602 (class 0 OID 0)
-- Dependencies: 195
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE clients_id_seq OWNED BY clients.id;


--
-- TOC entry 177 (class 1259 OID 59584)
-- Name: conversations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE conversations (
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone,
    state bit(1) DEFAULT (1)::bit(1) NOT NULL
);


ALTER TABLE public.conversations OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 59582)
-- Name: conversations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE conversations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conversations_id_seq OWNER TO postgres;

--
-- TOC entry 2603 (class 0 OID 0)
-- Dependencies: 176
-- Name: conversations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE conversations_id_seq OWNED BY conversations.id;


--
-- TOC entry 198 (class 1259 OID 59752)
-- Name: emails; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE emails (
    id integer NOT NULL,
    client_id integer,
    agent_id integer,
    email character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    state bit(1) DEFAULT (1)::bit(1) NOT NULL
);


ALTER TABLE public.emails OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 59750)
-- Name: emails_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE emails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.emails_id_seq OWNER TO postgres;

--
-- TOC entry 2604 (class 0 OID 0)
-- Dependencies: 197
-- Name: emails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE emails_id_seq OWNED BY emails.id;


--
-- TOC entry 171 (class 1259 OID 59551)
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE groups (
    id integer NOT NULL,
    name character varying,
    description text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone,
    state bit(1) DEFAULT (1)::bit(1) NOT NULL
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 59797)
-- Name: groups_agents; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE groups_agents (
    id integer NOT NULL,
    groups_id integer NOT NULL,
    agents_id integer NOT NULL,
    is_manager bit(1),
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone,
    state bit(1) DEFAULT (1)::bit(1)
);


ALTER TABLE public.groups_agents OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 59795)
-- Name: groups_agents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE groups_agents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_agents_id_seq OWNER TO postgres;

--
-- TOC entry 2605 (class 0 OID 0)
-- Dependencies: 200
-- Name: groups_agents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE groups_agents_id_seq OWNED BY groups_agents.id;


--
-- TOC entry 170 (class 1259 OID 59549)
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_id_seq OWNER TO postgres;

--
-- TOC entry 2606 (class 0 OID 0)
-- Dependencies: 170
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE groups_id_seq OWNED BY groups.id;


--
-- TOC entry 204 (class 1259 OID 59841)
-- Name: messages; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE messages (
    id integer NOT NULL,
    clients_id integer NOT NULL,
    agents_id integer NOT NULL,
    conversations_id integer NOT NULL,
    text text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    state bit(1)
);


ALTER TABLE public.messages OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 59839)
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO postgres;

--
-- TOC entry 2607 (class 0 OID 0)
-- Dependencies: 203
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE messages_id_seq OWNED BY messages.id;


--
-- TOC entry 215 (class 1259 OID 60008)
-- Name: notifications; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE notifications (
    id integer NOT NULL,
    tickets_id integer NOT NULL,
    agents_id integer NOT NULL,
    subject character varying,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    state bit(1)
);


ALTER TABLE public.notifications OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 60006)
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notifications_id_seq OWNER TO postgres;

--
-- TOC entry 2608 (class 0 OID 0)
-- Dependencies: 214
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE notifications_id_seq OWNED BY notifications.id;


--
-- TOC entry 206 (class 1259 OID 59873)
-- Name: participants; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE participants (
    id integer NOT NULL,
    clients_id integer NOT NULL,
    agents_id integer NOT NULL,
    conversations_id integer NOT NULL,
    is_online bit(1),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    state bit(1)
);


ALTER TABLE public.participants OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 59871)
-- Name: participants_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE participants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.participants_id_seq OWNER TO postgres;

--
-- TOC entry 2609 (class 0 OID 0)
-- Dependencies: 205
-- Name: participants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE participants_id_seq OWNED BY participants.id;


--
-- TOC entry 238 (class 1259 OID 139279)
-- Name: permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE permissions (
    id integer NOT NULL,
    name character varying NOT NULL,
    controller character varying NOT NULL,
    action character varying NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    state bit(1) DEFAULT (1)::bit(1) NOT NULL
);


ALTER TABLE public.permissions OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 139277)
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_id_seq OWNER TO postgres;

--
-- TOC entry 2610 (class 0 OID 0)
-- Dependencies: 237
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE permissions_id_seq OWNED BY permissions.id;


--
-- TOC entry 244 (class 1259 OID 147571)
-- Name: permissions_roles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE permissions_roles (
    id integer NOT NULL,
    permission_id integer NOT NULL,
    role_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    state bit(1) DEFAULT (1)::bit(1) NOT NULL
);


ALTER TABLE public.permissions_roles OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 147569)
-- Name: permissions_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE permissions_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_roles_id_seq OWNER TO postgres;

--
-- TOC entry 2611 (class 0 OID 0)
-- Dependencies: 243
-- Name: permissions_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE permissions_roles_id_seq OWNED BY permissions_roles.id;


--
-- TOC entry 183 (class 1259 OID 59614)
-- Name: priorities; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE priorities (
    id integer NOT NULL,
    name character varying,
    description text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone,
    state bit(1) DEFAULT (1)::bit(1) NOT NULL
);


ALTER TABLE public.priorities OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 59612)
-- Name: priorities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE priorities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.priorities_id_seq OWNER TO postgres;

--
-- TOC entry 2612 (class 0 OID 0)
-- Dependencies: 182
-- Name: priorities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE priorities_id_seq OWNED BY priorities.id;


--
-- TOC entry 185 (class 1259 OID 59625)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying NOT NULL,
    description text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    state bit(1) DEFAULT (1)::bit(1) NOT NULL,
    default_to integer,
    key_name character varying NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 2613 (class 0 OID 0)
-- Dependencies: 185
-- Name: COLUMN roles.default_to; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN roles.default_to IS '1: Default role super administrator
2: Default role user administrator
3: Default role agent administrator
4: Default role agent
5: Default role client
';


--
-- TOC entry 184 (class 1259 OID 59623)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- TOC entry 2614 (class 0 OID 0)
-- Dependencies: 184
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- TOC entry 179 (class 1259 OID 59592)
-- Name: schedules; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE schedules (
    id integer NOT NULL,
    description text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone,
    state bit(1) DEFAULT (1)::bit(1) NOT NULL
);


ALTER TABLE public.schedules OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 59819)
-- Name: schedules_agents; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE schedules_agents (
    schedule_id integer NOT NULL,
    agent_id integer NOT NULL,
    is_manager bit(1),
    updated_at timestamp without time zone,
    state bit(1) DEFAULT (1)::bit(1) NOT NULL,
    business_id integer NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.schedules_agents OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 131072)
-- Name: schedules_agents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE schedules_agents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.schedules_agents_id_seq OWNER TO postgres;

--
-- TOC entry 2615 (class 0 OID 0)
-- Dependencies: 234
-- Name: schedules_agents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE schedules_agents_id_seq OWNED BY schedules_agents.id;


--
-- TOC entry 178 (class 1259 OID 59590)
-- Name: schedules_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE schedules_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.schedules_id_seq OWNER TO postgres;

--
-- TOC entry 2616 (class 0 OID 0)
-- Dependencies: 178
-- Name: schedules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE schedules_id_seq OWNED BY schedules.id;


--
-- TOC entry 220 (class 1259 OID 73728)
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 59603)
-- Name: solutions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE solutions (
    id integer NOT NULL,
    title character varying,
    description text,
    version character varying,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone,
    state bit(1) DEFAULT (1)::bit(1) NOT NULL
);


ALTER TABLE public.solutions OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 59705)
-- Name: solutions_attachments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE solutions_attachments (
    attachment_id integer NOT NULL,
    solution_id integer NOT NULL,
    updated_at timestamp without time zone,
    state bit(1),
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.solutions_attachments OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 114734)
-- Name: solutions_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE solutions_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solutions_attachments_id_seq OWNER TO postgres;

--
-- TOC entry 2617 (class 0 OID 0)
-- Dependencies: 228
-- Name: solutions_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE solutions_attachments_id_seq OWNED BY solutions_attachments.id;


--
-- TOC entry 180 (class 1259 OID 59601)
-- Name: solutions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE solutions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solutions_id_seq OWNER TO postgres;

--
-- TOC entry 2618 (class 0 OID 0)
-- Dependencies: 180
-- Name: solutions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE solutions_id_seq OWNED BY solutions.id;


--
-- TOC entry 173 (class 1259 OID 59562)
-- Name: states; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE states (
    id integer NOT NULL,
    name character varying,
    description text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone,
    state bit(1) DEFAULT (1)::bit(1) NOT NULL,
    "order" integer NOT NULL,
    css_class character varying
);


ALTER TABLE public.states OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 59560)
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.states_id_seq OWNER TO postgres;

--
-- TOC entry 2619 (class 0 OID 0)
-- Dependencies: 172
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE states_id_seq OWNED BY states.id;


--
-- TOC entry 210 (class 1259 OID 59920)
-- Name: tickets; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tickets (
    id integer NOT NULL,
    priority_id integer NOT NULL,
    client_id integer NOT NULL,
    title character varying NOT NULL,
    description text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    state bit(1) DEFAULT (1)::bit(1) NOT NULL,
    expire_at timestamp without time zone,
    business_id integer
);


ALTER TABLE public.tickets OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 59943)
-- Name: tickets_agents; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tickets_agents (
    ticket_id integer NOT NULL,
    agent_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone,
    state bit(1) DEFAULT (1)::bit(1) NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.tickets_agents OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 114713)
-- Name: tickets_agents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tickets_agents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tickets_agents_id_seq OWNER TO postgres;

--
-- TOC entry 2620 (class 0 OID 0)
-- Dependencies: 227
-- Name: tickets_agents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tickets_agents_id_seq OWNED BY tickets_agents.id;


--
-- TOC entry 212 (class 1259 OID 59964)
-- Name: tickets_attachments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tickets_attachments (
    attachment_id integer NOT NULL,
    ticket_id integer NOT NULL,
    updated_at timestamp without time zone,
    state bit(1) DEFAULT (1)::bit(1) NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.tickets_attachments OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 114746)
-- Name: tickets_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tickets_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tickets_attachments_id_seq OWNER TO postgres;

--
-- TOC entry 2621 (class 0 OID 0)
-- Dependencies: 229
-- Name: tickets_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tickets_attachments_id_seq OWNED BY tickets_attachments.id;


--
-- TOC entry 217 (class 1259 OID 60055)
-- Name: tickets_categories; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tickets_categories (
    category_id integer NOT NULL,
    ticket_id integer NOT NULL,
    updated_at timestamp without time zone,
    state bit(1) DEFAULT (1)::bit(1) NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.tickets_categories OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 122905)
-- Name: tickets_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tickets_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tickets_categories_id_seq OWNER TO postgres;

--
-- TOC entry 2622 (class 0 OID 0)
-- Dependencies: 233
-- Name: tickets_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tickets_categories_id_seq OWNED BY tickets_categories.id;


--
-- TOC entry 218 (class 1259 OID 60075)
-- Name: tickets_groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tickets_groups (
    id integer NOT NULL,
    groups_id integer NOT NULL,
    tickets_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone,
    state bit(1) DEFAULT (1)::bit(1) NOT NULL
);


ALTER TABLE public.tickets_groups OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 59918)
-- Name: tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tickets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tickets_id_seq OWNER TO postgres;

--
-- TOC entry 2623 (class 0 OID 0)
-- Dependencies: 209
-- Name: tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tickets_id_seq OWNED BY tickets.id;


--
-- TOC entry 226 (class 1259 OID 114693)
-- Name: tickets_responses; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tickets_responses (
    id integer NOT NULL,
    ticket_id integer NOT NULL,
    account_id integer NOT NULL,
    text text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    state bit(1) DEFAULT (1)::bit(1) NOT NULL
);


ALTER TABLE public.tickets_responses OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 114691)
-- Name: tickets_responses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tickets_responses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tickets_responses_id_seq OWNER TO postgres;

--
-- TOC entry 2624 (class 0 OID 0)
-- Dependencies: 225
-- Name: tickets_responses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tickets_responses_id_seq OWNED BY tickets_responses.id;


--
-- TOC entry 219 (class 1259 OID 60096)
-- Name: tickets_solutions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tickets_solutions (
    ticket_id integer NOT NULL,
    solution_id integer NOT NULL,
    updated_at timestamp without time zone,
    state bit(1) DEFAULT (1)::bit(1) NOT NULL,
    acepted bit(1) DEFAULT (0)::bit(1) NOT NULL,
    agent_id integer NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.tickets_solutions OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 114757)
-- Name: tickets_solutions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tickets_solutions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tickets_solutions_id_seq OWNER TO postgres;

--
-- TOC entry 2625 (class 0 OID 0)
-- Dependencies: 230
-- Name: tickets_solutions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tickets_solutions_id_seq OWNED BY tickets_solutions.id;


--
-- TOC entry 216 (class 1259 OID 60033)
-- Name: tickets_states; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tickets_states (
    id integer DEFAULT nextval('tickets_id_seq'::regclass) NOT NULL,
    state_id integer NOT NULL,
    ticket_id integer NOT NULL,
    is_current bit(1),
    updated_at timestamp without time zone,
    state bit(1) DEFAULT (1)::bit(1) NOT NULL,
    change_by integer,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.tickets_states OWNER TO postgres;

--
-- TOC entry 2127 (class 2604 OID 59905)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY accounts ALTER COLUMN id SET DEFAULT nextval('accounts_id_seq'::regclass);


--
-- TOC entry 2138 (class 2604 OID 106523)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY accounts_roles ALTER COLUMN id SET DEFAULT nextval('accounts_roles_id_seq'::regclass);


--
-- TOC entry 2103 (class 2604 OID 59672)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY activities ALTER COLUMN id SET DEFAULT nextval('activities_id_seq'::regclass);


--
-- TOC entry 2105 (class 2604 OID 59690)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY agents ALTER COLUMN id SET DEFAULT nextval('agents_id_seq'::regclass);


--
-- TOC entry 2177 (class 2604 OID 147497)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY agents_areas ALTER COLUMN id SET DEFAULT nextval('agents_areas_id_seq'::regclass);


--
-- TOC entry 2100 (class 2604 OID 59661)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY appointments ALTER COLUMN id SET DEFAULT nextval('appointments_id_seq'::regclass);


--
-- TOC entry 2162 (class 2604 OID 139269)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY areas ALTER COLUMN id SET DEFAULT nextval('areas_id_seq'::regclass);


--
-- TOC entry 2159 (class 2604 OID 122885)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY areas_categories ALTER COLUMN id SET DEFAULT nextval('businesses_ticket_categories_id_seq'::regclass);


--
-- TOC entry 2098 (class 2604 OID 59650)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY attachments ALTER COLUMN id SET DEFAULT nextval('attachments_id_seq'::regclass);


--
-- TOC entry 2153 (class 2604 OID 90117)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY businesses ALTER COLUMN id SET DEFAULT nextval('businesses_id_seq'::regclass);


--
-- TOC entry 2114 (class 2604 OID 106498)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY businesses_agents ALTER COLUMN id SET DEFAULT nextval('business_agents_id_seq'::regclass);


--
-- TOC entry 2171 (class 2604 OID 147476)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY businesses_areas ALTER COLUMN id SET DEFAULT nextval('business_areas_id_seq'::regclass);


--
-- TOC entry 2183 (class 2604 OID 148422)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY businesses_states ALTER COLUMN id SET DEFAULT nextval('businesses_states_id_seq'::regclass);


--
-- TOC entry 2080 (class 2604 OID 59576)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- TOC entry 2110 (class 2604 OID 59730)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clients ALTER COLUMN id SET DEFAULT nextval('clients_id_seq'::regclass);


--
-- TOC entry 2084 (class 2604 OID 59587)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY conversations ALTER COLUMN id SET DEFAULT nextval('conversations_id_seq'::regclass);


--
-- TOC entry 2113 (class 2604 OID 59755)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY emails ALTER COLUMN id SET DEFAULT nextval('emails_id_seq'::regclass);


--
-- TOC entry 2074 (class 2604 OID 59554)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups ALTER COLUMN id SET DEFAULT nextval('groups_id_seq'::regclass);


--
-- TOC entry 2119 (class 2604 OID 59800)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups_agents ALTER COLUMN id SET DEFAULT nextval('groups_agents_id_seq'::regclass);


--
-- TOC entry 2123 (class 2604 OID 59844)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY messages ALTER COLUMN id SET DEFAULT nextval('messages_id_seq'::regclass);


--
-- TOC entry 2140 (class 2604 OID 60011)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY notifications ALTER COLUMN id SET DEFAULT nextval('notifications_id_seq'::regclass);


--
-- TOC entry 2124 (class 2604 OID 59876)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY participants ALTER COLUMN id SET DEFAULT nextval('participants_id_seq'::regclass);


--
-- TOC entry 2167 (class 2604 OID 139282)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permissions ALTER COLUMN id SET DEFAULT nextval('permissions_id_seq'::regclass);


--
-- TOC entry 2179 (class 2604 OID 147574)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permissions_roles ALTER COLUMN id SET DEFAULT nextval('permissions_roles_id_seq'::regclass);


--
-- TOC entry 2091 (class 2604 OID 59617)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY priorities ALTER COLUMN id SET DEFAULT nextval('priorities_id_seq'::regclass);


--
-- TOC entry 2094 (class 2604 OID 59628)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- TOC entry 2085 (class 2604 OID 59595)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY schedules ALTER COLUMN id SET DEFAULT nextval('schedules_id_seq'::regclass);


--
-- TOC entry 2120 (class 2604 OID 131074)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY schedules_agents ALTER COLUMN id SET DEFAULT nextval('schedules_agents_id_seq'::regclass);


--
-- TOC entry 2088 (class 2604 OID 59606)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY solutions ALTER COLUMN id SET DEFAULT nextval('solutions_id_seq'::regclass);


--
-- TOC entry 2106 (class 2604 OID 114736)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY solutions_attachments ALTER COLUMN id SET DEFAULT nextval('solutions_attachments_id_seq'::regclass);


--
-- TOC entry 2075 (class 2604 OID 59565)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY states ALTER COLUMN id SET DEFAULT nextval('states_id_seq'::regclass);


--
-- TOC entry 2129 (class 2604 OID 59923)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tickets ALTER COLUMN id SET DEFAULT nextval('tickets_id_seq'::regclass);


--
-- TOC entry 2132 (class 2604 OID 114715)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tickets_agents ALTER COLUMN id SET DEFAULT nextval('tickets_agents_id_seq'::regclass);


--
-- TOC entry 2135 (class 2604 OID 114748)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tickets_attachments ALTER COLUMN id SET DEFAULT nextval('tickets_attachments_id_seq'::regclass);


--
-- TOC entry 2144 (class 2604 OID 122907)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tickets_categories ALTER COLUMN id SET DEFAULT nextval('tickets_categories_id_seq'::regclass);


--
-- TOC entry 2156 (class 2604 OID 114696)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tickets_responses ALTER COLUMN id SET DEFAULT nextval('tickets_responses_id_seq'::regclass);


--
-- TOC entry 2150 (class 2604 OID 114759)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tickets_solutions ALTER COLUMN id SET DEFAULT nextval('tickets_solutions_id_seq'::regclass);


--
-- TOC entry 2541 (class 0 OID 59902)
-- Dependencies: 208
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY accounts (id, email_id, passsword, picture, created_at, updated_at, state, confirmed) FROM stdin;
48	61	qjuFP32/kp4iE7R7bIlfpQ==\n	avatar_default.png	2015-02-11 09:03:40.146162	2015-02-11 09:03:56.144753	1	1
50	63	qjuFP32/kp4iE7R7bIlfpQ==\n	ana_salazar.jpeg	2015-02-12 05:44:24.032412	2015-02-12 07:18:36.55837	1	1
43	56	qjuFP32/kp4iE7R7bIlfpQ==\n	buho.jpg	2015-02-11 08:45:26.784466	2015-02-12 07:35:17.611153	1	1
\.


--
-- TOC entry 2626 (class 0 OID 0)
-- Dependencies: 207
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('accounts_id_seq', 50, true);


--
-- TOC entry 2546 (class 0 OID 59986)
-- Dependencies: 213
-- Data for Name: accounts_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY accounts_roles (account_id, role_id, updated_at, state, id, created_at, business_id) FROM stdin;
43	5	2015-02-11 08:45:26.823495	1	7	2015-02-11 00:00:00	\N
48	7	2015-02-11 09:03:40.18218	1	9	2015-02-11 00:00:00	\N
50	8	2015-02-14 00:00:00	1	10	2015-02-11 00:00:00	\N
\.


--
-- TOC entry 2627 (class 0 OID 0)
-- Dependencies: 224
-- Name: accounts_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('accounts_roles_id_seq', 10, true);


--
-- TOC entry 2524 (class 0 OID 59669)
-- Dependencies: 191
-- Data for Name: activities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY activities (id, schedule_id, name, description, start_at, end_at, predecessor, completed, created_at, updated_at, state) FROM stdin;
7	6	Crear funciones para reportes	Crear funciones de base de datos para los reportes del sistema	2015-02-24 00:00:00	2015-02-27 00:00:00	\N	1	2015-02-21 10:53:41.328942	2015-02-21 10:53:41.328942	1
8	6	Corregir diagrama de gantt	Investigar porque el diagrama no se renderiza correctamente	2015-02-28 00:00:00	2015-03-03 00:00:00	\N	1	2015-02-21 16:25:51.850371	2015-02-21 16:25:51.850371	1
9	6	Finalizar Catalogos	Terminar CRUD de catalogos	2015-02-17 00:00:00	2015-02-26 00:00:00	\N	1	2015-02-21 16:40:09.65584	2015-02-21 16:40:09.65584	1
10	6	Afinar detalles	Revisar todo y afinar detalles	2015-03-25 00:00:00	2015-03-26 00:00:00	\N	1	2015-02-21 16:43:00.496617	2015-02-21 16:43:00.496617	1
11	6	Mejorar interfaz	Mejorar interfaz gráfica	2015-02-18 00:00:00	2015-02-24 00:00:00	\N	1	2015-02-21 16:45:09.655195	2015-02-21 16:45:09.655195	1
\.


--
-- TOC entry 2628 (class 0 OID 0)
-- Dependencies: 190
-- Name: activities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('activities_id_seq', 11, true);


--
-- TOC entry 2526 (class 0 OID 59687)
-- Dependencies: 193
-- Data for Name: agents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY agents (id, appointment_id, first_name, last_name, created_at, updated_at, state) FROM stdin;
66	1	Israel	Cruz	2015-02-11 09:03:40.071099	2015-02-11 09:03:40.071099	1
61	1	Gabriel	Flores	2015-02-11 08:45:26.706409	2015-02-12 07:36:53.522463	1
\.


--
-- TOC entry 2575 (class 0 OID 147494)
-- Dependencies: 242
-- Data for Name: agents_areas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY agents_areas (id, area_id, agent_id, created_at, updated_at, state) FROM stdin;
\.


--
-- TOC entry 2629 (class 0 OID 0)
-- Dependencies: 241
-- Name: agents_areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('agents_areas_id_seq', 1, false);


--
-- TOC entry 2630 (class 0 OID 0)
-- Dependencies: 192
-- Name: agents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('agents_id_seq', 66, true);


--
-- TOC entry 2522 (class 0 OID 59658)
-- Dependencies: 189
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY appointments (id, name, description, created_at, updated_at, state) FROM stdin;
1	Operador	Cargo por defecto	2014-11-16 00:00:00	2014-11-16 00:00:00	1
\.


--
-- TOC entry 2631 (class 0 OID 0)
-- Dependencies: 188
-- Name: appointments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('appointments_id_seq', 1, true);


--
-- TOC entry 2569 (class 0 OID 139266)
-- Dependencies: 236
-- Data for Name: areas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY areas (id, name, description, created_at, updated_at, state, is_suggested, is_default) FROM stdin;
2	Soporte Técnico	Area de mantenimiento y soporte de PC	2015-02-23 00:00:00	\N	1	1	0
1	Desarrollo de Software	Area de desarrollo de software	2015-02-22 20:04:10.548	\N	1	1	0
3	Redes e Infraestructura	Area de Redes e Infraestructura	2015-02-23 00:00:00	\N	1	1	0
4	Default	Area por defecto	2015-02-23 00:00:00	\N	1	0	1
\.


--
-- TOC entry 2564 (class 0 OID 122880)
-- Dependencies: 231
-- Data for Name: areas_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY areas_categories (id, businesses_area_id, category_id, created_at, updated_at, state) FROM stdin;
\.


--
-- TOC entry 2632 (class 0 OID 0)
-- Dependencies: 235
-- Name: areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('areas_id_seq', 4, true);


--
-- TOC entry 2520 (class 0 OID 59647)
-- Dependencies: 187
-- Data for Name: attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY attachments (id, name, path, created_at, updated_at, state) FROM stdin;
1	HelpdeskAnotaciones.docx	C:/Users/Gabriel/Documents/RailsProjects/sindri/public/attachments/HelpdeskAnotaciones.docx	2015-02-14 09:06:41.212897	2015-02-14 09:06:41.212897	1
2	HelpdeskAnotaciones.docx	C:/Users/Gabriel/Documents/RailsProjects/sindri/public/attachments/HelpdeskAnotaciones.docx	2015-02-14 09:08:16.064619	2015-02-14 09:08:16.064619	1
3	Requerimientos.docx	C:/Users/Gabriel/Documents/RailsProjects/sindri/public/attachments/Requerimientos.docx	2015-02-14 09:08:16.110651	2015-02-14 09:08:16.110651	1
4	ResponsabilidadSocial.jpg	C:/Users/Gabriel/Documents/RailsProjects/sindri/public/attachments/ResponsabilidadSocial.jpg	2015-02-14 09:09:15.641784	2015-02-14 09:09:15.641784	1
5	HelpdeskAnotaciones.docx	C:/Users/Gabriel/Documents/RailsProjects/sindri/public/attachments/HelpdeskAnotaciones.docx	2015-02-14 13:37:22.975366	2015-02-14 13:37:22.975366	1
6	HelpdeskAnotaciones.docx	C:/Users/Gabriel/Documents/RailsProjects/sindri/public/attachments/HelpdeskAnotaciones.docx	2015-02-14 13:40:27.58712	2015-02-14 13:40:27.58712	1
7	HelpdeskAnotaciones.docx	C:/Users/Gabriel/Documents/RailsProjects/sindri/public/attachments/HelpdeskAnotaciones.docx	2015-02-14 13:41:14.022763	2015-02-14 13:41:14.022763	1
8	HelpdeskAnotaciones.docx	C:/Users/Gabriel/Documents/RailsProjects/sindri/public/attachments/HelpdeskAnotaciones.docx	2015-02-14 13:43:05.903824	2015-02-14 13:43:05.903824	1
9	pgadmin.log	C:/Users/Gabriel/Documents/RailsProjects/sindri/public/attachments/pgadmin.log	2015-02-14 13:43:06.012909	2015-02-14 13:43:06.012909	1
10	HelpdeskAnotaciones.docx	C:/Users/Gabriel/Documents/RailsProjects/sindri/public/attachments/HelpdeskAnotaciones.docx	2015-02-14 13:46:28.531632	2015-02-14 13:46:28.531632	1
11	pgadmin.log	C:/Users/Gabriel/Documents/RailsProjects/sindri/public/attachments/pgadmin.log	2015-02-14 13:46:28.574672	2015-02-14 13:46:28.574672	1
\.


--
-- TOC entry 2633 (class 0 OID 0)
-- Dependencies: 186
-- Name: attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('attachments_id_seq', 11, true);


--
-- TOC entry 2634 (class 0 OID 0)
-- Dependencies: 223
-- Name: business_agents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('business_agents_id_seq', 23, true);


--
-- TOC entry 2635 (class 0 OID 0)
-- Dependencies: 239
-- Name: business_areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('business_areas_id_seq', 1, false);


--
-- TOC entry 2555 (class 0 OID 90114)
-- Dependencies: 222
-- Data for Name: businesses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY businesses (id, name, logo, color1, color2, color3, created_at, updated_at, state) FROM stdin;
22	EngraneSolutions	configuracion.png	\N	\N	\N	2015-02-14 14:52:53.536844	2015-02-14 14:52:53.536844	1
19	Brokkenitri	logo-brokkneitri.png	\N	\N	\N	2015-02-11 08:45:26.724422	2015-02-16 04:52:34.986035	1
24	Default	default.png	\N	\N	\N	2015-02-21 16:52:54.268845	2015-02-21 16:52:54.268845	1
\.


--
-- TOC entry 2532 (class 0 OID 59777)
-- Dependencies: 199
-- Data for Name: businesses_agents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY businesses_agents (agent_id, business_id, updated_at, state, id, created_at) FROM stdin;
61	19	2015-02-11 08:45:26.763451	1	18	2015-02-11 00:00:00
66	19	2015-02-11 09:03:40.173173	1	19	2015-02-11 00:00:00
61	22	2015-02-14 14:52:53.567866	1	20	2015-02-11 00:00:00
66	22	2015-02-14 19:07:27.676157	0	21	2015-02-11 00:00:00
61	24	2015-02-21 16:52:54.311848	0	23	2015-02-21 16:52:54.311848
\.


--
-- TOC entry 2573 (class 0 OID 147473)
-- Dependencies: 240
-- Data for Name: businesses_areas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY businesses_areas (id, business_id, area_id, created_at, updated_at, state) FROM stdin;
\.


--
-- TOC entry 2636 (class 0 OID 0)
-- Dependencies: 221
-- Name: businesses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('businesses_id_seq', 24, true);


--
-- TOC entry 2579 (class 0 OID 148419)
-- Dependencies: 246
-- Data for Name: businesses_states; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY businesses_states (id, business_id, state_id, created_at, updated_at, state) FROM stdin;
\.


--
-- TOC entry 2637 (class 0 OID 0)
-- Dependencies: 245
-- Name: businesses_states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('businesses_states_id_seq', 1, false);


--
-- TOC entry 2638 (class 0 OID 0)
-- Dependencies: 232
-- Name: businesses_ticket_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('businesses_ticket_categories_id_seq', 4, true);


--
-- TOC entry 2508 (class 0 OID 59573)
-- Dependencies: 175
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY categories (id, name, description, created_at, updated_at, state, is_suggested) FROM stdin;
1	Software	Incidencias relacionadas a software	2015-02-15 00:00:00	2015-02-15 00:00:00	1	1
2	Hardware	Incidencias relacionadas a Hardware	2015-02-15 00:00:00	2015-02-15 00:00:00	1	1
3	Infraestructura	Incidencias referentes a infraestructura	2015-02-23 00:00:00	2015-02-23 00:00:00	1	1
\.


--
-- TOC entry 2639 (class 0 OID 0)
-- Dependencies: 174
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categories_id_seq', 3, true);


--
-- TOC entry 2529 (class 0 OID 59727)
-- Dependencies: 196
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY clients (id, business_id, appointment_id, first_name, last_name, created_at, updated_at, state, phone_number) FROM stdin;
6	19	1	Ana	Salazar	2015-02-12 05:44:23.985535	2015-02-12 06:23:22.782127	1	89287322
\.


--
-- TOC entry 2640 (class 0 OID 0)
-- Dependencies: 195
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('clients_id_seq', 6, true);


--
-- TOC entry 2510 (class 0 OID 59584)
-- Dependencies: 177
-- Data for Name: conversations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY conversations (id, created_at, updated_at, state) FROM stdin;
\.


--
-- TOC entry 2641 (class 0 OID 0)
-- Dependencies: 176
-- Name: conversations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('conversations_id_seq', 1, false);


--
-- TOC entry 2531 (class 0 OID 59752)
-- Dependencies: 198
-- Data for Name: emails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY emails (id, client_id, agent_id, email, created_at, updated_at, state) FROM stdin;
56	\N	61	san.gaby05@gmail.com	2015-02-11 08:45:26.754444	2015-02-11 08:45:26.754444	1
61	\N	66	san.gaby@hotmail.es	2015-02-11 09:03:40.098118	2015-02-11 09:03:40.098118	1
63	6	\N	ana.salazar_05@yahoo.com	2015-02-12 05:44:24.016789	2015-02-12 05:44:24.016789	1
\.


--
-- TOC entry 2642 (class 0 OID 0)
-- Dependencies: 197
-- Name: emails_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('emails_id_seq', 63, true);


--
-- TOC entry 2504 (class 0 OID 59551)
-- Dependencies: 171
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY groups (id, name, description, created_at, updated_at, state) FROM stdin;
\.


--
-- TOC entry 2534 (class 0 OID 59797)
-- Dependencies: 201
-- Data for Name: groups_agents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY groups_agents (id, groups_id, agents_id, is_manager, created_at, updated_at, state) FROM stdin;
\.


--
-- TOC entry 2643 (class 0 OID 0)
-- Dependencies: 200
-- Name: groups_agents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('groups_agents_id_seq', 1, false);


--
-- TOC entry 2644 (class 0 OID 0)
-- Dependencies: 170
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('groups_id_seq', 1, false);


--
-- TOC entry 2537 (class 0 OID 59841)
-- Dependencies: 204
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY messages (id, clients_id, agents_id, conversations_id, text, created_at, updated_at, state) FROM stdin;
\.


--
-- TOC entry 2645 (class 0 OID 0)
-- Dependencies: 203
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('messages_id_seq', 1, false);


--
-- TOC entry 2548 (class 0 OID 60008)
-- Dependencies: 215
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY notifications (id, tickets_id, agents_id, subject, description, created_at, updated_at, state) FROM stdin;
\.


--
-- TOC entry 2646 (class 0 OID 0)
-- Dependencies: 214
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('notifications_id_seq', 1, false);


--
-- TOC entry 2539 (class 0 OID 59873)
-- Dependencies: 206
-- Data for Name: participants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY participants (id, clients_id, agents_id, conversations_id, is_online, created_at, updated_at, state) FROM stdin;
\.


--
-- TOC entry 2647 (class 0 OID 0)
-- Dependencies: 205
-- Name: participants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('participants_id_seq', 1, false);


--
-- TOC entry 2571 (class 0 OID 139279)
-- Dependencies: 238
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY permissions (id, name, controller, action, created_at, updated_at, state) FROM stdin;
\.


--
-- TOC entry 2648 (class 0 OID 0)
-- Dependencies: 237
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('permissions_id_seq', 1, false);


--
-- TOC entry 2577 (class 0 OID 147571)
-- Dependencies: 244
-- Data for Name: permissions_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY permissions_roles (id, permission_id, role_id, created_at, updated_at, state) FROM stdin;
\.


--
-- TOC entry 2649 (class 0 OID 0)
-- Dependencies: 243
-- Name: permissions_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('permissions_roles_id_seq', 1, false);


--
-- TOC entry 2516 (class 0 OID 59614)
-- Dependencies: 183
-- Data for Name: priorities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY priorities (id, name, description, created_at, updated_at, state) FROM stdin;
1	Alta	La resolución de la ticket es urgente	2015-02-14 00:00:00	2015-02-14 00:00:00	1
2	Media	La resución de la ticket urge, pero no es crítica	2015-02-14 00:00:00	2015-02-14 00:00:00	1
3	Baja	La resolución de la ticket no es urgente ni critica	2014-02-14 00:00:00	2015-02-14 00:00:00	1
\.


--
-- TOC entry 2650 (class 0 OID 0)
-- Dependencies: 182
-- Name: priorities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('priorities_id_seq', 3, true);


--
-- TOC entry 2518 (class 0 OID 59625)
-- Dependencies: 185
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY roles (id, name, description, created_at, updated_at, state, default_to, key_name) FROM stdin;
4	Super Administrador	Se encarga de la administración total del sistema	2015-02-10 00:00:00	2015-02-10 00:00:00	1	1	super_admin
5	Usuario Administrador	Se encarga de aprobar tickets e invitar clientes y agentes, tambien puede crear organizaciones	2015-02-10 00:00:00	2015-02-10 00:00:00	1	2	admin
6	Ticket Administrador	Aprueba y atiende tickets	2015-02-10 00:00:00	2015-02-10 00:00:00	1	3	ticket_admin
7	Agente	Atiende Tickets	2015-02-10 00:00:00	2015-02-10 00:00:00	1	4	agent
8	Cliente	Genera Tickets	2015-02-10 00:00:00	2015-02-10 00:00:00	1	5	client
\.


--
-- TOC entry 2651 (class 0 OID 0)
-- Dependencies: 184
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('roles_id_seq', 8, true);


--
-- TOC entry 2512 (class 0 OID 59592)
-- Dependencies: 179
-- Data for Name: schedules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schedules (id, description, created_at, updated_at, state) FROM stdin;
6	\N	2015-02-20 06:39:46.768493	2015-02-20 06:39:46.768493	1
\.


--
-- TOC entry 2535 (class 0 OID 59819)
-- Dependencies: 202
-- Data for Name: schedules_agents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schedules_agents (schedule_id, agent_id, is_manager, updated_at, state, business_id, id, created_at) FROM stdin;
6	66	\N	2015-02-20 06:39:46.782503	1	19	3	2015-02-20 00:00:00
\.


--
-- TOC entry 2652 (class 0 OID 0)
-- Dependencies: 234
-- Name: schedules_agents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('schedules_agents_id_seq', 3, true);


--
-- TOC entry 2653 (class 0 OID 0)
-- Dependencies: 178
-- Name: schedules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('schedules_id_seq', 6, true);


--
-- TOC entry 2553 (class 0 OID 73728)
-- Dependencies: 220
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY schema_migrations (version) FROM stdin;
20150122044303
20150122044316
20150122044329
20150122044341
20150122044354
20150122044407
20150122044420
20150122044432
20150122044445
20150122044458
20150122044510
20150122044523
20150122044536
20150122044549
20150122044601
20150122044614
20150122044626
20150122044639
20150122044652
20150122044922
\.


--
-- TOC entry 2514 (class 0 OID 59603)
-- Dependencies: 181
-- Data for Name: solutions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY solutions (id, title, description, version, created_at, updated_at, state) FROM stdin;
4	Crear un formulario de aprobación	El administrador podrá aprobar las tickets mediante un formulario	\N	2015-02-14 13:43:05.863821	2015-02-14 13:43:05.863821	1
5	Crear un formulario de aprobación	El administrador podrá aprobar las tickets mediante un formulario	\N	2015-02-14 13:46:28.508615	2015-02-14 13:46:28.508615	1
6	El administrador aprobara todas las tickets	Sin comentarios	\N	2015-02-14 13:49:01.700604	2015-02-14 13:49:01.700604	1
\.


--
-- TOC entry 2527 (class 0 OID 59705)
-- Dependencies: 194
-- Data for Name: solutions_attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY solutions_attachments (attachment_id, solution_id, updated_at, state, id, created_at) FROM stdin;
10	5	2015-02-14 13:46:28.564675	1	3	2015-02-21 00:00:00
11	5	2015-02-14 13:46:28.586671	1	4	2015-02-21 00:00:00
\.


--
-- TOC entry 2654 (class 0 OID 0)
-- Dependencies: 228
-- Name: solutions_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('solutions_attachments_id_seq', 4, true);


--
-- TOC entry 2655 (class 0 OID 0)
-- Dependencies: 180
-- Name: solutions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('solutions_id_seq', 6, true);


--
-- TOC entry 2506 (class 0 OID 59562)
-- Dependencies: 173
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY states (id, name, description, created_at, updated_at, state, "order", css_class) FROM stdin;
1	Abierta	La ticket ha sido creada por el usuario pero aun no se ha aprobado por el administrador	2015-02-12 00:00:00	2015-02-12 00:00:00	1	1	warning
6	Vencida	La ticket superó el tiempo de respuesta	2015-02-12 00:00:00	2015-02-12 00:00:00	1	6	danger
4	Resuelta	El agente resolvió la ticket pero no ha sido aprobada por el cliente	2015-02-12 00:00:00	2015-02-12 00:00:00	1	4	primary
5	Cerrada	El cliente aprobó la solución del agente	2015-02-12 00:00:00	2015-02-12 00:00:00	1	5	success
3	Atendiendose	La ticket esta siendo atendida por un agente	2015-02-12 00:00:00	2015-02-12 00:00:00	1	3	info
2	En proceso	La ticket esta siendo evaluada por el administrador para aprobacion	2015-02-12 00:00:00	2015-02-12 00:00:00	1	2	default
\.


--
-- TOC entry 2656 (class 0 OID 0)
-- Dependencies: 172
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('states_id_seq', 6, true);


--
-- TOC entry 2543 (class 0 OID 59920)
-- Dependencies: 210
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tickets (id, priority_id, client_id, title, description, created_at, updated_at, state, expire_at, business_id) FROM stdin;
6	1	6	Formulario de aprobación de tickets	Crear formulario para que los agentes administradores aprueben las tickets para ser atendidas	2015-02-14 07:14:14.786653	2015-02-14 07:14:14.786653	1	\N	19
8	1	6	Crear formulario de configuración de empresa	Crear un formulario para personalizar las opciones de la empresa en el momento de acceder al sistema	2015-02-14 08:01:57.32045	2015-02-14 08:01:57.32045	1	\N	19
22	1	6	Mejorar verificación de roles	Mejorar la seguridad del sistema	2015-02-14 09:08:16.002573	2015-02-14 09:08:16.002573	1	\N	19
24	1	6	Crear crud para organizaciones	Acciones de creacion, actualizacion y eliminación de organizaciones	2015-02-14 09:09:15.576737	2015-02-14 09:09:15.576737	1	\N	19
26	2	6	Habilidad de categorizar tickets	Permitir agregar una categoría a las tickets generadas	2015-02-14 09:09:58.597905	2015-02-14 09:09:58.597905	1	\N	19
28	2	6	Generar reporteria del sistema	Generar los distintos reportes que pueden verse en el sistema	2015-02-14 09:10:52.391881	2015-02-14 09:10:52.391881	1	\N	19
30	3	6	Generar diagramas de gantt	Generar diagrama de gantt de la atención de las tickets	2015-02-14 09:13:55.5746	2015-02-14 09:13:55.5746	1	\N	19
47	3	6	Añadir enlaces a la ticket en la pantalla de inicio	Al hacer clic en el titulo de la ticket debe llevar a la pantalla de soluciones para la ticket	2015-02-16 04:24:00.940588	2015-02-16 04:24:00.940588	1	\N	19
50	2	6	Validar fechas con datepicker	Cambiar date select de rails por datepicker de bootstrap	2015-02-21 18:56:12.363523	2015-02-21 18:56:12.363523	1	2015-02-23 00:00:00	19
\.


--
-- TOC entry 2544 (class 0 OID 59943)
-- Dependencies: 211
-- Data for Name: tickets_agents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tickets_agents (ticket_id, agent_id, created_at, updated_at, state, id) FROM stdin;
6	66	2015-02-14 12:13:03.3926	2015-02-14 12:13:03.3926	1	3
26	66	2015-02-14 12:13:58.714682	2015-02-14 12:13:58.714682	1	4
\.


--
-- TOC entry 2657 (class 0 OID 0)
-- Dependencies: 227
-- Name: tickets_agents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tickets_agents_id_seq', 4, true);


--
-- TOC entry 2545 (class 0 OID 59964)
-- Dependencies: 212
-- Data for Name: tickets_attachments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tickets_attachments (attachment_id, ticket_id, updated_at, state, id, created_at) FROM stdin;
2	22	2015-02-14 09:08:16.090637	1	1	2015-02-21 00:00:00
3	22	2015-02-14 09:08:16.117658	1	2	2015-02-21 00:00:00
4	24	2015-02-14 09:09:15.652791	1	3	2015-02-14 00:00:00
\.


--
-- TOC entry 2658 (class 0 OID 0)
-- Dependencies: 229
-- Name: tickets_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tickets_attachments_id_seq', 3, true);


--
-- TOC entry 2550 (class 0 OID 60055)
-- Dependencies: 217
-- Data for Name: tickets_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tickets_categories (category_id, ticket_id, updated_at, state, id, created_at) FROM stdin;
1	50	2015-02-21 18:56:12.440638	1	2	2015-02-21 18:56:12.440638
1	47	2015-02-16 04:24:01.034344	1	1	2015-02-21 00:00:00
\.


--
-- TOC entry 2659 (class 0 OID 0)
-- Dependencies: 233
-- Name: tickets_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tickets_categories_id_seq', 2, true);


--
-- TOC entry 2551 (class 0 OID 60075)
-- Dependencies: 218
-- Data for Name: tickets_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tickets_groups (id, groups_id, tickets_id, created_at, updated_at, state) FROM stdin;
\.


--
-- TOC entry 2660 (class 0 OID 0)
-- Dependencies: 209
-- Name: tickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tickets_id_seq', 51, true);


--
-- TOC entry 2559 (class 0 OID 114693)
-- Dependencies: 226
-- Data for Name: tickets_responses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tickets_responses (id, ticket_id, account_id, text, created_at, updated_at, state) FROM stdin;
4	6	43	Estamos revisando su petición para ser atendida, pronto le responderemos	2015-02-14 11:09:01.680213	2015-02-14 11:09:01.680213	1
5	22	43	Estamos verificando la validez de esta ticket	2015-02-14 12:13:39.924068	2015-02-14 12:13:39.924068	1
\.


--
-- TOC entry 2661 (class 0 OID 0)
-- Dependencies: 225
-- Name: tickets_responses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tickets_responses_id_seq', 5, true);


--
-- TOC entry 2552 (class 0 OID 60096)
-- Dependencies: 219
-- Data for Name: tickets_solutions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tickets_solutions (ticket_id, solution_id, updated_at, state, acepted, agent_id, id, created_at) FROM stdin;
6	5	2015-02-14 13:49:36.36672	1	1	66	1	2015-02-14 00:00:00
6	6	2015-02-14 13:49:01.73663	1	0	66	2	2015-02-14 00:00:00
6	4	2015-02-17 00:00:00	1	0	66	4	2015-02-14 00:00:00
\.


--
-- TOC entry 2662 (class 0 OID 0)
-- Dependencies: 230
-- Name: tickets_solutions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tickets_solutions_id_seq', 4, true);


--
-- TOC entry 2549 (class 0 OID 60033)
-- Dependencies: 216
-- Data for Name: tickets_states; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tickets_states (id, state_id, ticket_id, is_current, updated_at, state, change_by, created_at) FROM stdin;
51	1	50	1	2015-02-21 18:56:12.418561	1	50	2015-02-21 18:56:12.418561
7	1	6	0	2015-02-14 07:14:14.864782	1	50	2015-02-14 00:00:00
9	1	8	1	2015-02-14 08:01:57.367329	1	50	2015-02-14 00:00:00
23	1	22	0	2015-02-14 09:08:16.043604	1	50	2015-02-14 00:00:00
25	1	24	1	2015-02-14 09:09:15.614763	1	50	2015-02-14 00:00:00
27	1	26	0	2015-02-14 09:09:58.647969	1	50	2015-02-14 00:00:00
29	1	28	1	2015-02-14 09:10:52.429908	1	50	2015-02-14 00:00:00
31	1	30	1	2015-02-14 09:13:55.626637	1	50	2015-02-14 00:00:00
35	2	6	0	2015-02-14 12:12:55.382797	1	43	2015-02-14 00:00:00
36	3	6	0	2015-02-14 12:13:03.402607	1	43	2015-02-14 00:00:00
37	2	22	1	2015-02-14 12:13:13.671048	1	43	2015-02-14 00:00:00
38	2	26	0	2015-02-14 12:13:51.001093	1	43	2015-02-14 00:00:00
39	3	26	1	2015-02-14 12:13:58.737698	1	43	2015-02-14 00:00:00
40	4	6	0	2015-02-14 13:46:28.621696	1	66	2015-02-14 00:00:00
41	4	6	0	2015-02-14 13:49:01.764651	1	66	2015-02-14 00:00:00
42	5	6	1	2015-02-14 13:49:36.37873	1	6	2015-02-14 00:00:00
48	1	47	1	2015-02-16 04:24:00.987465	1	50	2015-02-14 00:00:00
\.


--
-- TOC entry 2269 (class 2606 OID 59910)
-- Name: accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- TOC entry 2292 (class 2606 OID 106532)
-- Name: accounts_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY accounts_roles
    ADD CONSTRAINT accounts_roles_pkey PRIMARY KEY (id, account_id, role_id);


--
-- TOC entry 2209 (class 2606 OID 59677)
-- Name: activities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- TOC entry 2339 (class 2606 OID 147502)
-- Name: agents_areas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY agents_areas
    ADD CONSTRAINT agents_areas_pkey PRIMARY KEY (id);


--
-- TOC entry 2213 (class 2606 OID 59695)
-- Name: agents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY agents
    ADD CONSTRAINT agents_pkey PRIMARY KEY (id);


--
-- TOC entry 2206 (class 2606 OID 59666)
-- Name: appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (id);


--
-- TOC entry 2333 (class 2606 OID 139276)
-- Name: areas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id);


--
-- TOC entry 2204 (class 2606 OID 59655)
-- Name: attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);


--
-- TOC entry 2337 (class 2606 OID 147481)
-- Name: business_area_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY businesses_areas
    ADD CONSTRAINT business_area_pkey PRIMARY KEY (id);


--
-- TOC entry 2236 (class 2606 OID 106534)
-- Name: businesses_agents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY businesses_agents
    ADD CONSTRAINT businesses_agents_pkey PRIMARY KEY (id, agent_id, business_id);


--
-- TOC entry 2331 (class 2606 OID 122904)
-- Name: businesses_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY areas_categories
    ADD CONSTRAINT businesses_categories_pkey PRIMARY KEY (id, businesses_area_id, category_id);


--
-- TOC entry 2327 (class 2606 OID 90122)
-- Name: businesses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY businesses
    ADD CONSTRAINT businesses_pkey PRIMARY KEY (id);


--
-- TOC entry 2343 (class 2606 OID 148427)
-- Name: businesses_states_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY businesses_states
    ADD CONSTRAINT businesses_states_pkey PRIMARY KEY (id);


--
-- TOC entry 2192 (class 2606 OID 59581)
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 2224 (class 2606 OID 59735)
-- Name: clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- TOC entry 2194 (class 2606 OID 59589)
-- Name: conversations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY conversations
    ADD CONSTRAINT conversations_pkey PRIMARY KEY (id);


--
-- TOC entry 2230 (class 2606 OID 59760)
-- Name: emails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY emails
    ADD CONSTRAINT emails_pkey PRIMARY KEY (id);


--
-- TOC entry 2242 (class 2606 OID 59802)
-- Name: groups_agents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY groups_agents
    ADD CONSTRAINT groups_agents_pkey PRIMARY KEY (id, groups_id, agents_id);


--
-- TOC entry 2188 (class 2606 OID 59559)
-- Name: groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2258 (class 2606 OID 59849)
-- Name: messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- TOC entry 2300 (class 2606 OID 60016)
-- Name: notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- TOC entry 2266 (class 2606 OID 59878)
-- Name: participants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY participants
    ADD CONSTRAINT participants_pkey PRIMARY KEY (id);


--
-- TOC entry 2335 (class 2606 OID 147568)
-- Name: permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2341 (class 2606 OID 147579)
-- Name: permissions_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY permissions_roles
    ADD CONSTRAINT permissions_roles_pkey PRIMARY KEY (id);


--
-- TOC entry 2200 (class 2606 OID 59622)
-- Name: priorities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY priorities
    ADD CONSTRAINT priorities_pkey PRIMARY KEY (id);


--
-- TOC entry 2202 (class 2606 OID 59633)
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 2248 (class 2606 OID 131083)
-- Name: schedules_agents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY schedules_agents
    ADD CONSTRAINT schedules_agents_pkey PRIMARY KEY (id);


--
-- TOC entry 2196 (class 2606 OID 59600)
-- Name: schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY schedules
    ADD CONSTRAINT schedules_pkey PRIMARY KEY (id);


--
-- TOC entry 2220 (class 2606 OID 114745)
-- Name: solutions_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY solutions_attachments
    ADD CONSTRAINT solutions_attachments_pkey PRIMARY KEY (id, solution_id, attachment_id);


--
-- TOC entry 2198 (class 2606 OID 59611)
-- Name: solutions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY solutions
    ADD CONSTRAINT solutions_pkey PRIMARY KEY (id);


--
-- TOC entry 2190 (class 2606 OID 59570)
-- Name: states_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- TOC entry 2282 (class 2606 OID 114724)
-- Name: tickets_agents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tickets_agents
    ADD CONSTRAINT tickets_agents_pkey PRIMARY KEY (id, ticket_id, agent_id);


--
-- TOC entry 2288 (class 2606 OID 59969)
-- Name: tickets_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tickets_attachments
    ADD CONSTRAINT tickets_attachments_pkey PRIMARY KEY (attachment_id, ticket_id);


--
-- TOC entry 2312 (class 2606 OID 122916)
-- Name: tickets_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tickets_categories
    ADD CONSTRAINT tickets_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 2318 (class 2606 OID 60079)
-- Name: tickets_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tickets_groups
    ADD CONSTRAINT tickets_groups_pkey PRIMARY KEY (id, groups_id, tickets_id);


--
-- TOC entry 2276 (class 2606 OID 59928)
-- Name: tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 2606 OID 114702)
-- Name: tickets_responses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tickets_responses
    ADD CONSTRAINT tickets_responses_pkey PRIMARY KEY (id, ticket_id, account_id);


--
-- TOC entry 2324 (class 2606 OID 114768)
-- Name: tickets_solutions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tickets_solutions
    ADD CONSTRAINT tickets_solutions_pkey PRIMARY KEY (id, solution_id, ticket_id);


--
-- TOC entry 2306 (class 2606 OID 60038)
-- Name: tickets_states_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tickets_states
    ADD CONSTRAINT tickets_states_pkey PRIMARY KEY (id, state_id, ticket_id);


--
-- TOC entry 2267 (class 1259 OID 59916)
-- Name: accounts_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX accounts_fkindex1 ON accounts USING btree (email_id);


--
-- TOC entry 2289 (class 1259 OID 60002)
-- Name: accounts_roles_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX accounts_roles_fkindex1 ON accounts_roles USING btree (account_id);


--
-- TOC entry 2290 (class 1259 OID 60003)
-- Name: accounts_roles_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX accounts_roles_fkindex2 ON accounts_roles USING btree (role_id);


--
-- TOC entry 2207 (class 1259 OID 59683)
-- Name: activities_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX activities_fkindex1 ON activities USING btree (schedule_id);


--
-- TOC entry 2211 (class 1259 OID 59701)
-- Name: agents_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX agents_fkindex1 ON agents USING btree (appointment_id);


--
-- TOC entry 2233 (class 1259 OID 59791)
-- Name: business_agents_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX business_agents_fkindex1 ON businesses_agents USING btree (business_id);


--
-- TOC entry 2234 (class 1259 OID 59792)
-- Name: business_agents_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX business_agents_fkindex2 ON businesses_agents USING btree (agent_id);


--
-- TOC entry 2221 (class 1259 OID 59746)
-- Name: clients_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX clients_fkindex1 ON clients USING btree (appointment_id);


--
-- TOC entry 2222 (class 1259 OID 59747)
-- Name: clients_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX clients_fkindex2 ON clients USING btree (business_id);


--
-- TOC entry 2227 (class 1259 OID 59771)
-- Name: emails_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX emails_fkindex1 ON emails USING btree (agent_id);


--
-- TOC entry 2228 (class 1259 OID 59772)
-- Name: emails_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX emails_fkindex2 ON emails USING btree (client_id);


--
-- TOC entry 2239 (class 1259 OID 59813)
-- Name: groups_agents_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX groups_agents_fkindex1 ON groups_agents USING btree (groups_id);


--
-- TOC entry 2240 (class 1259 OID 59814)
-- Name: groups_agents_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX groups_agents_fkindex2 ON groups_agents USING btree (agents_id);


--
-- TOC entry 2271 (class 1259 OID 59941)
-- Name: ifk_create; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_create ON tickets USING btree (client_id);


--
-- TOC entry 2293 (class 1259 OID 60004)
-- Name: ifk_has_many; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_has_many ON accounts_roles USING btree (account_id);


--
-- TOC entry 2231 (class 1259 OID 59773)
-- Name: ifk_has_many_a; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_has_many_a ON emails USING btree (agent_id);


--
-- TOC entry 2232 (class 1259 OID 59774)
-- Name: ifk_has_many_c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_has_many_c ON emails USING btree (client_id);


--
-- TOC entry 2294 (class 1259 OID 60005)
-- Name: ifk_is_assigned; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_is_assigned ON accounts_roles USING btree (role_id);


--
-- TOC entry 2277 (class 1259 OID 59961)
-- Name: ifk_is_assigned_a; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_is_assigned_a ON tickets_agents USING btree (agent_id);


--
-- TOC entry 2313 (class 1259 OID 60092)
-- Name: ifk_is_assigned_g; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_is_assigned_g ON tickets_groups USING btree (groups_id);


--
-- TOC entry 2278 (class 1259 OID 59960)
-- Name: ifk_is_assigned_t; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_is_assigned_t ON tickets_agents USING btree (ticket_id);


--
-- TOC entry 2314 (class 1259 OID 60093)
-- Name: ifk_is_assigned_t2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_is_assigned_t2 ON tickets_groups USING btree (tickets_id);


--
-- TOC entry 2270 (class 1259 OID 59917)
-- Name: ifk_is_identified; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_is_identified ON accounts USING btree (email_id);


--
-- TOC entry 2301 (class 1259 OID 60051)
-- Name: ifk_rel_11; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_11 ON tickets_states USING btree (state_id);


--
-- TOC entry 2302 (class 1259 OID 60052)
-- Name: ifk_rel_13; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_13 ON tickets_states USING btree (ticket_id);


--
-- TOC entry 2307 (class 1259 OID 60073)
-- Name: ifk_rel_14; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_14 ON tickets_categories USING btree (category_id);


--
-- TOC entry 2308 (class 1259 OID 60074)
-- Name: ifk_rel_15; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_15 ON tickets_categories USING btree (ticket_id);


--
-- TOC entry 2272 (class 1259 OID 59942)
-- Name: ifk_rel_16; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_16 ON tickets USING btree (priority_id);


--
-- TOC entry 2214 (class 1259 OID 59702)
-- Name: ifk_rel_17; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_17 ON agents USING btree (appointment_id);


--
-- TOC entry 2225 (class 1259 OID 59748)
-- Name: ifk_rel_18; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_18 ON clients USING btree (appointment_id);


--
-- TOC entry 2295 (class 1259 OID 60029)
-- Name: ifk_rel_19; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_19 ON notifications USING btree (agents_id);


--
-- TOC entry 2237 (class 1259 OID 59793)
-- Name: ifk_rel_20; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_20 ON businesses_agents USING btree (business_id);


--
-- TOC entry 2296 (class 1259 OID 60030)
-- Name: ifk_rel_201; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_201 ON notifications USING btree (tickets_id);


--
-- TOC entry 2238 (class 1259 OID 59794)
-- Name: ifk_rel_21; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_21 ON businesses_agents USING btree (agent_id);


--
-- TOC entry 2226 (class 1259 OID 59749)
-- Name: ifk_rel_22; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_22 ON clients USING btree (business_id);


--
-- TOC entry 2319 (class 1259 OID 60114)
-- Name: ifk_rel_25; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_25 ON tickets_solutions USING btree (ticket_id);


--
-- TOC entry 2320 (class 1259 OID 60115)
-- Name: ifk_rel_26; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_26 ON tickets_solutions USING btree (solution_id);


--
-- TOC entry 2245 (class 1259 OID 59837)
-- Name: ifk_rel_27; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_27 ON schedules_agents USING btree (schedule_id);


--
-- TOC entry 2246 (class 1259 OID 59838)
-- Name: ifk_rel_28; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_28 ON schedules_agents USING btree (agent_id);


--
-- TOC entry 2210 (class 1259 OID 59684)
-- Name: ifk_rel_29; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_29 ON activities USING btree (schedule_id);


--
-- TOC entry 2283 (class 1259 OID 59982)
-- Name: ifk_rel_30; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_30 ON tickets_attachments USING btree (attachment_id);


--
-- TOC entry 2284 (class 1259 OID 59983)
-- Name: ifk_rel_31; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_31 ON tickets_attachments USING btree (ticket_id);


--
-- TOC entry 2215 (class 1259 OID 59723)
-- Name: ifk_rel_32; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_32 ON solutions_attachments USING btree (attachment_id);


--
-- TOC entry 2216 (class 1259 OID 59724)
-- Name: ifk_rel_33; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_33 ON solutions_attachments USING btree (solution_id);


--
-- TOC entry 2243 (class 1259 OID 59815)
-- Name: ifk_rel_35; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_35 ON groups_agents USING btree (groups_id);


--
-- TOC entry 2244 (class 1259 OID 59816)
-- Name: ifk_rel_36; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_36 ON groups_agents USING btree (agents_id);


--
-- TOC entry 2259 (class 1259 OID 59897)
-- Name: ifk_rel_37; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_37 ON participants USING btree (conversations_id);


--
-- TOC entry 2260 (class 1259 OID 59898)
-- Name: ifk_rel_38; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_38 ON participants USING btree (agents_id);


--
-- TOC entry 2261 (class 1259 OID 59899)
-- Name: ifk_rel_39; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_39 ON participants USING btree (clients_id);


--
-- TOC entry 2251 (class 1259 OID 59868)
-- Name: ifk_rel_40; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_40 ON messages USING btree (conversations_id);


--
-- TOC entry 2252 (class 1259 OID 59869)
-- Name: ifk_rel_41; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_41 ON messages USING btree (agents_id);


--
-- TOC entry 2253 (class 1259 OID 59870)
-- Name: ifk_rel_42; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_42 ON messages USING btree (clients_id);


--
-- TOC entry 2254 (class 1259 OID 59865)
-- Name: messages_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX messages_fkindex1 ON messages USING btree (conversations_id);


--
-- TOC entry 2255 (class 1259 OID 59866)
-- Name: messages_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX messages_fkindex2 ON messages USING btree (agents_id);


--
-- TOC entry 2256 (class 1259 OID 59867)
-- Name: messages_fkindex3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX messages_fkindex3 ON messages USING btree (clients_id);


--
-- TOC entry 2297 (class 1259 OID 60027)
-- Name: notifications_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX notifications_fkindex1 ON notifications USING btree (agents_id);


--
-- TOC entry 2298 (class 1259 OID 60028)
-- Name: notifications_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX notifications_fkindex2 ON notifications USING btree (tickets_id);


--
-- TOC entry 2262 (class 1259 OID 59894)
-- Name: participants_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX participants_fkindex1 ON participants USING btree (conversations_id);


--
-- TOC entry 2263 (class 1259 OID 59895)
-- Name: participants_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX participants_fkindex2 ON participants USING btree (agents_id);


--
-- TOC entry 2264 (class 1259 OID 59896)
-- Name: participants_fkindex3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX participants_fkindex3 ON participants USING btree (clients_id);


--
-- TOC entry 2249 (class 1259 OID 59835)
-- Name: scheldules_agents_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX scheldules_agents_fkindex1 ON schedules_agents USING btree (schedule_id);


--
-- TOC entry 2250 (class 1259 OID 59836)
-- Name: scheldules_agents_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX scheldules_agents_fkindex2 ON schedules_agents USING btree (agent_id);


--
-- TOC entry 2217 (class 1259 OID 59721)
-- Name: solutions_attachments_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX solutions_attachments_fkindex1 ON solutions_attachments USING btree (attachment_id);


--
-- TOC entry 2218 (class 1259 OID 59722)
-- Name: solutions_attachments_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX solutions_attachments_fkindex2 ON solutions_attachments USING btree (solution_id);


--
-- TOC entry 2279 (class 1259 OID 59958)
-- Name: tickets_agents_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tickets_agents_fkindex1 ON tickets_agents USING btree (ticket_id);


--
-- TOC entry 2280 (class 1259 OID 59959)
-- Name: tickets_agents_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tickets_agents_fkindex2 ON tickets_agents USING btree (agent_id);


--
-- TOC entry 2285 (class 1259 OID 59980)
-- Name: tickets_attachments_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tickets_attachments_fkindex1 ON tickets_attachments USING btree (attachment_id);


--
-- TOC entry 2286 (class 1259 OID 59981)
-- Name: tickets_attachments_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tickets_attachments_fkindex2 ON tickets_attachments USING btree (ticket_id);


--
-- TOC entry 2309 (class 1259 OID 60071)
-- Name: tickets_categories_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tickets_categories_fkindex1 ON tickets_categories USING btree (category_id);


--
-- TOC entry 2310 (class 1259 OID 60072)
-- Name: tickets_categories_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tickets_categories_fkindex2 ON tickets_categories USING btree (ticket_id);


--
-- TOC entry 2273 (class 1259 OID 59939)
-- Name: tickets_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tickets_fkindex1 ON tickets USING btree (client_id);


--
-- TOC entry 2274 (class 1259 OID 59940)
-- Name: tickets_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tickets_fkindex2 ON tickets USING btree (priority_id);


--
-- TOC entry 2315 (class 1259 OID 60090)
-- Name: tickets_groups_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tickets_groups_fkindex1 ON tickets_groups USING btree (groups_id);


--
-- TOC entry 2316 (class 1259 OID 60091)
-- Name: tickets_groups_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tickets_groups_fkindex2 ON tickets_groups USING btree (tickets_id);


--
-- TOC entry 2321 (class 1259 OID 60112)
-- Name: tickets_solutions_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tickets_solutions_fkindex1 ON tickets_solutions USING btree (ticket_id);


--
-- TOC entry 2322 (class 1259 OID 60113)
-- Name: tickets_solutions_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tickets_solutions_fkindex2 ON tickets_solutions USING btree (solution_id);


--
-- TOC entry 2303 (class 1259 OID 60049)
-- Name: tickets_states_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tickets_states_fkindex1 ON tickets_states USING btree (state_id);


--
-- TOC entry 2304 (class 1259 OID 60050)
-- Name: tickets_states_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tickets_states_fkindex2 ON tickets_states USING btree (ticket_id);


--
-- TOC entry 2325 (class 1259 OID 73731)
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- TOC entry 2364 (class 2606 OID 59911)
-- Name: accounts_emails_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_emails_id_fkey FOREIGN KEY (email_id) REFERENCES emails(id);


--
-- TOC entry 2372 (class 2606 OID 59992)
-- Name: accounts_roles_accounts_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY accounts_roles
    ADD CONSTRAINT accounts_roles_accounts_id_fkey FOREIGN KEY (account_id) REFERENCES accounts(id);


--
-- TOC entry 2371 (class 2606 OID 148412)
-- Name: accounts_roles_business_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY accounts_roles
    ADD CONSTRAINT accounts_roles_business_id_fkey FOREIGN KEY (business_id) REFERENCES businesses(id);


--
-- TOC entry 2373 (class 2606 OID 59997)
-- Name: accounts_roles_roles_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY accounts_roles
    ADD CONSTRAINT accounts_roles_roles_id_fkey FOREIGN KEY (role_id) REFERENCES roles(id);


--
-- TOC entry 2344 (class 2606 OID 59678)
-- Name: activities_schedules_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY activities
    ADD CONSTRAINT activities_schedules_id_fkey FOREIGN KEY (schedule_id) REFERENCES schedules(id);


--
-- TOC entry 2345 (class 2606 OID 59696)
-- Name: agents_appointments_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY agents
    ADD CONSTRAINT agents_appointments_id_fkey FOREIGN KEY (appointment_id) REFERENCES appointments(id);


--
-- TOC entry 2390 (class 2606 OID 147503)
-- Name: agents_areas_agents_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY agents_areas
    ADD CONSTRAINT agents_areas_agents_id_fkey FOREIGN KEY (agent_id) REFERENCES agents(id);


--
-- TOC entry 2391 (class 2606 OID 147508)
-- Name: agents_areas_areas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY agents_areas
    ADD CONSTRAINT agents_areas_areas_id_fkey FOREIGN KEY (area_id) REFERENCES areas(id);


--
-- TOC entry 2353 (class 2606 OID 106516)
-- Name: businesses_agents_agents_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY businesses_agents
    ADD CONSTRAINT businesses_agents_agents_id_fkey FOREIGN KEY (agent_id) REFERENCES agents(id);


--
-- TOC entry 2352 (class 2606 OID 106511)
-- Name: businesses_agents_businesses_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY businesses_agents
    ADD CONSTRAINT businesses_agents_businesses_id_fkey FOREIGN KEY (business_id) REFERENCES businesses(id);


--
-- TOC entry 2389 (class 2606 OID 147487)
-- Name: businesses_areas_areas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY businesses_areas
    ADD CONSTRAINT businesses_areas_areas_id_fkey FOREIGN KEY (area_id) REFERENCES areas(id);


--
-- TOC entry 2388 (class 2606 OID 147482)
-- Name: businesses_areas_businesses_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY businesses_areas
    ADD CONSTRAINT businesses_areas_businesses_fkey FOREIGN KEY (business_id) REFERENCES businesses(id);


--
-- TOC entry 2387 (class 2606 OID 147518)
-- Name: businesses_areas_categories_businesses_areas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY areas_categories
    ADD CONSTRAINT businesses_areas_categories_businesses_areas_id_fkey FOREIGN KEY (businesses_area_id) REFERENCES businesses_areas(id);


--
-- TOC entry 2386 (class 2606 OID 122898)
-- Name: businesses_categories_categories_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY areas_categories
    ADD CONSTRAINT businesses_categories_categories_id_fkey FOREIGN KEY (category_id) REFERENCES categories(id);


--
-- TOC entry 2394 (class 2606 OID 148428)
-- Name: businesses_states_businesses_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY businesses_states
    ADD CONSTRAINT businesses_states_businesses_id_fkey FOREIGN KEY (business_id) REFERENCES businesses(id);


--
-- TOC entry 2395 (class 2606 OID 148433)
-- Name: businesses_states_states_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY businesses_states
    ADD CONSTRAINT businesses_states_states_id_fkey FOREIGN KEY (state_id) REFERENCES states(id);


--
-- TOC entry 2349 (class 2606 OID 59736)
-- Name: clients_appointments_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_appointments_id_fkey FOREIGN KEY (appointment_id) REFERENCES appointments(id);


--
-- TOC entry 2348 (class 2606 OID 106506)
-- Name: clients_business_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clients
    ADD CONSTRAINT clients_business_id_fkey FOREIGN KEY (business_id) REFERENCES businesses(id);


--
-- TOC entry 2350 (class 2606 OID 59761)
-- Name: emails_agents_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY emails
    ADD CONSTRAINT emails_agents_id_fkey FOREIGN KEY (agent_id) REFERENCES agents(id);


--
-- TOC entry 2351 (class 2606 OID 59766)
-- Name: emails_clients_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY emails
    ADD CONSTRAINT emails_clients_id_fkey FOREIGN KEY (client_id) REFERENCES clients(id);


--
-- TOC entry 2355 (class 2606 OID 59808)
-- Name: groups_agents_agents_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups_agents
    ADD CONSTRAINT groups_agents_agents_id_fkey FOREIGN KEY (agents_id) REFERENCES agents(id);


--
-- TOC entry 2354 (class 2606 OID 59803)
-- Name: groups_agents_groups_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups_agents
    ADD CONSTRAINT groups_agents_groups_id_fkey FOREIGN KEY (groups_id) REFERENCES groups(id);


--
-- TOC entry 2359 (class 2606 OID 59855)
-- Name: messages_agents_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT messages_agents_id_fkey FOREIGN KEY (agents_id) REFERENCES agents(id);


--
-- TOC entry 2360 (class 2606 OID 59860)
-- Name: messages_clients_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT messages_clients_id_fkey FOREIGN KEY (clients_id) REFERENCES clients(id);


--
-- TOC entry 2358 (class 2606 OID 59850)
-- Name: messages_conversations_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY messages
    ADD CONSTRAINT messages_conversations_id_fkey FOREIGN KEY (conversations_id) REFERENCES conversations(id);


--
-- TOC entry 2374 (class 2606 OID 60017)
-- Name: notifications_agents_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT notifications_agents_id_fkey FOREIGN KEY (agents_id) REFERENCES agents(id);


--
-- TOC entry 2375 (class 2606 OID 60022)
-- Name: notifications_tickets_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY notifications
    ADD CONSTRAINT notifications_tickets_id_fkey FOREIGN KEY (tickets_id) REFERENCES tickets(id);


--
-- TOC entry 2362 (class 2606 OID 59884)
-- Name: participants_agents_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY participants
    ADD CONSTRAINT participants_agents_id_fkey FOREIGN KEY (agents_id) REFERENCES agents(id);


--
-- TOC entry 2363 (class 2606 OID 59889)
-- Name: participants_clients_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY participants
    ADD CONSTRAINT participants_clients_id_fkey FOREIGN KEY (clients_id) REFERENCES clients(id);


--
-- TOC entry 2361 (class 2606 OID 59879)
-- Name: participants_conversations_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY participants
    ADD CONSTRAINT participants_conversations_id_fkey FOREIGN KEY (conversations_id) REFERENCES conversations(id);


--
-- TOC entry 2392 (class 2606 OID 147580)
-- Name: permissions_roles_permissions_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permissions_roles
    ADD CONSTRAINT permissions_roles_permissions_id_fkey FOREIGN KEY (permission_id) REFERENCES permissions(id);


--
-- TOC entry 2393 (class 2606 OID 147585)
-- Name: permissions_roles_roles_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY permissions_roles
    ADD CONSTRAINT permissions_roles_roles_id_fkey FOREIGN KEY (role_id) REFERENCES roles(id);


--
-- TOC entry 2357 (class 2606 OID 59830)
-- Name: scheldules_agents_agents_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY schedules_agents
    ADD CONSTRAINT scheldules_agents_agents_id_fkey FOREIGN KEY (agent_id) REFERENCES agents(id);


--
-- TOC entry 2356 (class 2606 OID 59825)
-- Name: scheldules_agents_schedules_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY schedules_agents
    ADD CONSTRAINT scheldules_agents_schedules_id_fkey FOREIGN KEY (schedule_id) REFERENCES schedules(id);


--
-- TOC entry 2346 (class 2606 OID 59711)
-- Name: solutions_attachments_attachments_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY solutions_attachments
    ADD CONSTRAINT solutions_attachments_attachments_id_fkey FOREIGN KEY (attachment_id) REFERENCES attachments(id);


--
-- TOC entry 2347 (class 2606 OID 59716)
-- Name: solutions_attachments_solutions_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY solutions_attachments
    ADD CONSTRAINT solutions_attachments_solutions_id_fkey FOREIGN KEY (solution_id) REFERENCES solutions(id);


--
-- TOC entry 2368 (class 2606 OID 59953)
-- Name: tickets_agents_agents_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tickets_agents
    ADD CONSTRAINT tickets_agents_agents_id_fkey FOREIGN KEY (agent_id) REFERENCES agents(id);


--
-- TOC entry 2367 (class 2606 OID 59948)
-- Name: tickets_agents_tickets_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tickets_agents
    ADD CONSTRAINT tickets_agents_tickets_id_fkey FOREIGN KEY (ticket_id) REFERENCES tickets(id);


--
-- TOC entry 2369 (class 2606 OID 59970)
-- Name: tickets_attachments_attachments_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tickets_attachments
    ADD CONSTRAINT tickets_attachments_attachments_id_fkey FOREIGN KEY (attachment_id) REFERENCES attachments(id);


--
-- TOC entry 2370 (class 2606 OID 59975)
-- Name: tickets_attachments_tickets_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tickets_attachments
    ADD CONSTRAINT tickets_attachments_tickets_id_fkey FOREIGN KEY (ticket_id) REFERENCES tickets(id);


--
-- TOC entry 2378 (class 2606 OID 60061)
-- Name: tickets_categories_categories_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tickets_categories
    ADD CONSTRAINT tickets_categories_categories_id_fkey FOREIGN KEY (category_id) REFERENCES categories(id);


--
-- TOC entry 2379 (class 2606 OID 60066)
-- Name: tickets_categories_tickets_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tickets_categories
    ADD CONSTRAINT tickets_categories_tickets_id_fkey FOREIGN KEY (ticket_id) REFERENCES tickets(id);


--
-- TOC entry 2365 (class 2606 OID 59929)
-- Name: tickets_clients_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tickets
    ADD CONSTRAINT tickets_clients_id_fkey FOREIGN KEY (client_id) REFERENCES clients(id);


--
-- TOC entry 2380 (class 2606 OID 60080)
-- Name: tickets_groups_groups_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tickets_groups
    ADD CONSTRAINT tickets_groups_groups_id_fkey FOREIGN KEY (groups_id) REFERENCES groups(id);


--
-- TOC entry 2381 (class 2606 OID 60085)
-- Name: tickets_groups_tickets_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tickets_groups
    ADD CONSTRAINT tickets_groups_tickets_id_fkey FOREIGN KEY (tickets_id) REFERENCES tickets(id);


--
-- TOC entry 2366 (class 2606 OID 59934)
-- Name: tickets_priorities_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tickets
    ADD CONSTRAINT tickets_priorities_id_fkey FOREIGN KEY (priority_id) REFERENCES priorities(id);


--
-- TOC entry 2385 (class 2606 OID 114708)
-- Name: tickets_responses_accounts_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tickets_responses
    ADD CONSTRAINT tickets_responses_accounts_id_fkey FOREIGN KEY (account_id) REFERENCES accounts(id);


--
-- TOC entry 2384 (class 2606 OID 114703)
-- Name: tickets_responses_tickets_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tickets_responses
    ADD CONSTRAINT tickets_responses_tickets_id_fkey FOREIGN KEY (ticket_id) REFERENCES tickets(id);


--
-- TOC entry 2383 (class 2606 OID 60107)
-- Name: tickets_solutions_solutions_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tickets_solutions
    ADD CONSTRAINT tickets_solutions_solutions_id_fkey FOREIGN KEY (solution_id) REFERENCES solutions(id);


--
-- TOC entry 2382 (class 2606 OID 60102)
-- Name: tickets_solutions_tickets_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tickets_solutions
    ADD CONSTRAINT tickets_solutions_tickets_id_fkey FOREIGN KEY (ticket_id) REFERENCES tickets(id);


--
-- TOC entry 2376 (class 2606 OID 60039)
-- Name: tickets_states_states_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tickets_states
    ADD CONSTRAINT tickets_states_states_id_fkey FOREIGN KEY (state_id) REFERENCES states(id);


--
-- TOC entry 2377 (class 2606 OID 60044)
-- Name: tickets_states_tickets_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tickets_states
    ADD CONSTRAINT tickets_states_tickets_id_fkey FOREIGN KEY (ticket_id) REFERENCES tickets(id);


--
-- TOC entry 2586 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-02-26 02:06:11

--
-- PostgreSQL database dump complete
--

