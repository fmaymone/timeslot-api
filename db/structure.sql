--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


--
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: base_slots; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE base_slots (
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    meta_slot_id bigint NOT NULL,
    id bigint NOT NULL,
    slot_type integer NOT NULL,
    likes_count integer DEFAULT 0,
    comments_count integer DEFAULT 0,
    type text NOT NULL,
    slot_uuid uuid DEFAULT uuid_generate_v4(),
    description character varying DEFAULT ''::character varying NOT NULL,
    high_fives_count integer DEFAULT 0
);


--
-- Name: base_slots_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE base_slots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: base_slots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE base_slots_id_seq OWNED BY base_slots.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comments (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    slot_id bigint NOT NULL,
    content text,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: connects; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE connects (
    id integer NOT NULL,
    user_id bigint NOT NULL,
    provider_id integer NOT NULL,
    social_id bigint NOT NULL,
    data hstore DEFAULT ''::hstore,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: connects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE connects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: connects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE connects_id_seq OWNED BY connects.id;


--
-- Name: containerships; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE containerships (
    id bigint NOT NULL,
    slot_id bigint NOT NULL,
    group_id bigint NOT NULL,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: containerships_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE containerships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: containerships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE containerships_id_seq OWNED BY containerships.id;


--
-- Name: devices; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE devices (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    device_id character varying(128) NOT NULL,
    system character varying(8) NOT NULL,
    version character varying(8) NOT NULL,
    token character varying(128),
    endpoint character varying(128),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone
);


--
-- Name: devices_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE devices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: devices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE devices_id_seq OWNED BY devices.id;


--
-- Name: friendships; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE friendships (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    friend_id bigint NOT NULL,
    state bit(2) DEFAULT B'00'::"bit",
    deleted_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: friendships_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE friendships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: friendships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE friendships_id_seq OWNED BY friendships.id;


--
-- Name: global_slots; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE global_slots (
    id bigint DEFAULT nextval('base_slots_id_seq'::regclass),
    meta_slot_id bigint,
    slot_type integer,
    likes_count integer DEFAULT 0,
    comments_count integer DEFAULT 0,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    url character varying DEFAULT ''::character varying,
    muid uuid
)
INHERITS (base_slots);


--
-- Name: groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE groups (
    id bigint NOT NULL,
    owner_id bigint NOT NULL,
    name character varying NOT NULL,
    members_can_post boolean DEFAULT false NOT NULL,
    members_can_invite boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone,
    image character varying(255) DEFAULT ''::character varying NOT NULL,
    uuid uuid NOT NULL,
    public boolean DEFAULT false NOT NULL,
    string_id text DEFAULT ''::text NOT NULL,
    description character varying(255),
    default_color character varying DEFAULT '000000'::character varying NOT NULL
);


--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE groups_id_seq OWNED BY groups.id;


--
-- Name: high_fives; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE high_fives (
    id integer NOT NULL,
    user_id integer,
    base_slot_id integer,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    count integer DEFAULT 0
);


--
-- Name: high_fives_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE high_fives_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: high_fives_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE high_fives_id_seq OWNED BY high_fives.id;


--
-- Name: invitecodes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE invitecodes (
    id integer NOT NULL,
    user_id bigint NOT NULL,
    context character varying,
    code character varying,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: invitecodes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE invitecodes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: invitecodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE invitecodes_id_seq OWNED BY invitecodes.id;


--
-- Name: ios_locations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ios_locations (
    id bigint NOT NULL,
    name character varying(255) DEFAULT ''::character varying,
    thoroughfare character varying(255),
    sub_thoroughfare character varying(255),
    locality character varying(255),
    sub_locality character varying(255),
    administrative_area character varying(255),
    sub_administrative_area character varying(255),
    postal_code character varying(32),
    country character varying(255),
    iso_country_code character varying(8),
    in_land_water character varying(255),
    ocean character varying(255),
    areas_of_interest character varying(255),
    latitude double precision,
    longitude double precision,
    creator_id bigint NOT NULL,
    private_location boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    uuid uuid DEFAULT uuid_generate_v4() NOT NULL,
    place_id character varying
);


--
-- Name: ios_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ios_locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ios_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ios_locations_id_seq OWNED BY ios_locations.id;


--
-- Name: likes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE likes (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    base_slot_id bigint NOT NULL,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE likes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE likes_id_seq OWNED BY likes.id;


--
-- Name: media_items; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE media_items (
    id bigint NOT NULL,
    media_type character varying(255),
    public_id character varying(255),
    "position" integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    mediable_id bigint,
    mediable_type character varying(255),
    deleted_at timestamp without time zone,
    duration real,
    thumbnail character varying(255),
    local_id character varying(512),
    creator_id bigint NOT NULL,
    title character varying(64)
);


--
-- Name: media_items_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE media_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: media_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE media_items_id_seq OWNED BY media_items.id;


--
-- Name: memberships; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE memberships (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id bigint NOT NULL,
    notifications boolean DEFAULT true,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    state bit(3) DEFAULT B'011'::"bit",
    default_alerts bit(10),
    show_slots_in_schedule boolean DEFAULT false NOT NULL,
    color character varying DEFAULT '000000'::character varying NOT NULL
);


--
-- Name: memberships_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE memberships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: memberships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE memberships_id_seq OWNED BY memberships.id;


--
-- Name: meta_slots; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE meta_slots (
    id bigint NOT NULL,
    title character varying(60) NOT NULL,
    start_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone NOT NULL,
    creator_id bigint NOT NULL,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    ios_location_id bigint,
    open_end boolean DEFAULT false NOT NULL,
    location_uid uuid,
    rrule character varying DEFAULT ''::character varying NOT NULL,
    allday boolean DEFAULT false NOT NULL
);


--
-- Name: meta_slots_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE meta_slots_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: meta_slots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE meta_slots_id_seq OWNED BY meta_slots.id;


--
-- Name: notes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE notes (
    id bigint NOT NULL,
    base_slot_id bigint NOT NULL,
    title character varying NOT NULL,
    content text DEFAULT ''::text,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    creator_id bigint NOT NULL,
    local_id character varying(512)
);


--
-- Name: notes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE notes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE notes_id_seq OWNED BY notes.id;


--
-- Name: passengerships; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE passengerships (
    id bigint NOT NULL,
    slot_id bigint NOT NULL,
    user_id bigint NOT NULL,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    add_media_permission boolean DEFAULT false NOT NULL,
    show_in_my_schedule boolean DEFAULT true NOT NULL
);


--
-- Name: passengerships_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE passengerships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: passengerships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE passengerships_id_seq OWNED BY passengerships.id;


--
-- Name: providers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE providers (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: providers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE providers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: providers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE providers_id_seq OWNED BY providers.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: slot_settings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE slot_settings (
    user_id bigint NOT NULL,
    meta_slot_id bigint NOT NULL,
    alerts bit(10) DEFAULT B'0000000000'::"bit",
    deleted_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    id bigint NOT NULL
);


--
-- Name: slot_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE slot_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: slot_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE slot_settings_id_seq OWNED BY slot_settings.id;


--
-- Name: std_slots; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE std_slots (
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    meta_slot_id bigint,
    owner_id bigint NOT NULL,
    share_with_friends boolean DEFAULT false NOT NULL
)
INHERITS (base_slots);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id bigint NOT NULL,
    username character varying(50) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    email citext,
    password_digest character varying(60),
    auth_token character varying(27),
    role smallint NOT NULL,
    default_group_alerts bit(10) DEFAULT B'0000000000'::"bit",
    default_private_alerts bit(10) DEFAULT B'0000000000'::"bit",
    default_own_friendslot_alerts bit(10) DEFAULT B'0000000000'::"bit",
    default_friends_friendslot_alerts bit(10) DEFAULT B'0000000000'::"bit",
    default_own_public_alerts bit(10) DEFAULT B'0000000000'::"bit",
    default_friends_public_alerts bit(10) DEFAULT B'0000000000'::"bit",
    default_reslot_alerts bit(10) DEFAULT B'0000000000'::"bit",
    phone character varying(35),
    location_id bigint,
    public_url character varying(255),
    push boolean DEFAULT true NOT NULL,
    slot_default_location_id bigint,
    slot_default_duration integer,
    slot_default_type_id integer,
    phone_verified boolean DEFAULT false NOT NULL,
    email_verified boolean DEFAULT false NOT NULL,
    lang character varying(8),
    picture character varying(255) DEFAULT ''::character varying NOT NULL,
    slot_sets hstore DEFAULT hstore(ARRAY[ARRAY['my_cal_uuid'::text, (uuid_generate_v4())::text], ARRAY['friends_cal_uuid'::text, (uuid_generate_v4())::text], ARRAY['my_lib_uuid'::text, (uuid_generate_v4())::text], ARRAY['my_created_slots_uuid'::text, (uuid_generate_v4())::text], ARRAY['my_friend_slots_uuid'::text, (uuid_generate_v4())::text], ARRAY['my_private_slots_uuid'::text, (uuid_generate_v4())::text], ARRAY['my_public_slots_uuid'::text, (uuid_generate_v4())::text]]) NOT NULL,
    user_uuid uuid DEFAULT uuid_generate_v4() NOT NULL,
    first_name text,
    middle_name text,
    last_name text,
    gender text
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY base_slots ALTER COLUMN id SET DEFAULT nextval('base_slots_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY connects ALTER COLUMN id SET DEFAULT nextval('connects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY containerships ALTER COLUMN id SET DEFAULT nextval('containerships_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY devices ALTER COLUMN id SET DEFAULT nextval('devices_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY friendships ALTER COLUMN id SET DEFAULT nextval('friendships_id_seq'::regclass);


--
-- Name: slot_uuid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY global_slots ALTER COLUMN slot_uuid SET DEFAULT uuid_generate_v4();


--
-- Name: description; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY global_slots ALTER COLUMN description SET DEFAULT ''::character varying;


--
-- Name: high_fives_count; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY global_slots ALTER COLUMN high_fives_count SET DEFAULT 0;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY groups ALTER COLUMN id SET DEFAULT nextval('groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY high_fives ALTER COLUMN id SET DEFAULT nextval('high_fives_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY invitecodes ALTER COLUMN id SET DEFAULT nextval('invitecodes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY ios_locations ALTER COLUMN id SET DEFAULT nextval('ios_locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY likes ALTER COLUMN id SET DEFAULT nextval('likes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY media_items ALTER COLUMN id SET DEFAULT nextval('media_items_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY memberships ALTER COLUMN id SET DEFAULT nextval('memberships_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY meta_slots ALTER COLUMN id SET DEFAULT nextval('meta_slots_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY notes ALTER COLUMN id SET DEFAULT nextval('notes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY passengerships ALTER COLUMN id SET DEFAULT nextval('passengerships_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY providers ALTER COLUMN id SET DEFAULT nextval('providers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY slot_settings ALTER COLUMN id SET DEFAULT nextval('slot_settings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY std_slots ALTER COLUMN id SET DEFAULT nextval('base_slots_id_seq'::regclass);


--
-- Name: likes_count; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY std_slots ALTER COLUMN likes_count SET DEFAULT 0;


--
-- Name: comments_count; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY std_slots ALTER COLUMN comments_count SET DEFAULT 0;


--
-- Name: slot_uuid; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY std_slots ALTER COLUMN slot_uuid SET DEFAULT uuid_generate_v4();


--
-- Name: description; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY std_slots ALTER COLUMN description SET DEFAULT ''::character varying;


--
-- Name: high_fives_count; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY std_slots ALTER COLUMN high_fives_count SET DEFAULT 0;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: base_slots_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY base_slots
    ADD CONSTRAINT base_slots_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: connects_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY connects
    ADD CONSTRAINT connects_pkey PRIMARY KEY (id);


--
-- Name: containerships_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY containerships
    ADD CONSTRAINT containerships_pkey PRIMARY KEY (id);


--
-- Name: devices_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY devices
    ADD CONSTRAINT devices_pkey PRIMARY KEY (id);


--
-- Name: friendships_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY friendships
    ADD CONSTRAINT friendships_pkey PRIMARY KEY (id);


--
-- Name: groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: high_fives_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY high_fives
    ADD CONSTRAINT high_fives_pkey PRIMARY KEY (id);


--
-- Name: invitecodes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY invitecodes
    ADD CONSTRAINT invitecodes_pkey PRIMARY KEY (id);


--
-- Name: ios_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ios_locations
    ADD CONSTRAINT ios_locations_pkey PRIMARY KEY (id);


--
-- Name: likes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- Name: media_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY media_items
    ADD CONSTRAINT media_items_pkey PRIMARY KEY (id);


--
-- Name: memberships_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY memberships
    ADD CONSTRAINT memberships_pkey PRIMARY KEY (id);


--
-- Name: meta_slots_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY meta_slots
    ADD CONSTRAINT meta_slots_pkey PRIMARY KEY (id);


--
-- Name: notes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (id);


--
-- Name: passengerships_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY passengerships
    ADD CONSTRAINT passengerships_pkey PRIMARY KEY (id);


--
-- Name: providers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY providers
    ADD CONSTRAINT providers_pkey PRIMARY KEY (id);


--
-- Name: slot_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY slot_settings
    ADD CONSTRAINT slot_settings_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_comments_on_user_id_and_slot_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_comments_on_user_id_and_slot_id ON public.comments USING btree (user_id, slot_id);


--
-- Name: index_connects_on_social_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_connects_on_social_id ON public.connects USING btree (social_id);


--
-- Name: index_connects_on_social_id_and_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_connects_on_social_id_and_user_id ON public.connects USING btree (social_id, user_id);


--
-- Name: index_connects_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_connects_on_user_id ON public.connects USING btree (user_id);


--
-- Name: index_containerships_on_group_id_and_slot_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_containerships_on_group_id_and_slot_id ON public.containerships USING btree (group_id, slot_id);


--
-- Name: index_containerships_on_slot_id_and_group_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_containerships_on_slot_id_and_group_id ON public.containerships USING btree (slot_id, group_id);


--
-- Name: index_devices_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_devices_on_user_id ON public.devices USING btree (user_id);


--
-- Name: index_friendships_on_friend_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_friendships_on_friend_id ON public.friendships USING btree (friend_id);


--
-- Name: index_friendships_on_user_id_and_friend_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_friendships_on_user_id_and_friend_id ON public.friendships USING btree (user_id, friend_id);


--
-- Name: index_groups_on_owner_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_groups_on_owner_id ON public.groups USING btree (owner_id);


--
-- Name: index_groups_on_uuid; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_groups_on_uuid ON public.groups USING btree (uuid);


--
-- Name: index_high_fives_on_user_id_and_base_slot_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_high_fives_on_user_id_and_base_slot_id ON public.high_fives USING btree (user_id, base_slot_id);


--
-- Name: index_invitecodes_on_code; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_invitecodes_on_code ON public.invitecodes USING btree (code);


--
-- Name: index_invitecodes_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_invitecodes_on_user_id ON public.invitecodes USING btree (user_id);


--
-- Name: index_ios_locations_on_name_and_latitude_and_longitude; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_ios_locations_on_name_and_latitude_and_longitude ON public.ios_locations USING btree (name, latitude, longitude);


--
-- Name: index_ios_locations_on_place_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_ios_locations_on_place_id ON public.ios_locations USING btree (place_id);


--
-- Name: index_likes_on_user_id_and_base_slot_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_likes_on_user_id_and_base_slot_id ON public.likes USING btree (user_id, base_slot_id);


--
-- Name: index_media_items_on_mediable_type_and_mediable_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_media_items_on_mediable_type_and_mediable_id ON public.media_items USING btree (mediable_type, mediable_id);


--
-- Name: index_memberships_on_group_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_memberships_on_group_id ON public.memberships USING btree (group_id);


--
-- Name: index_memberships_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_memberships_on_user_id ON public.memberships USING btree (user_id);


--
-- Name: index_memberships_on_user_id_and_group_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_memberships_on_user_id_and_group_id ON public.memberships USING btree (user_id, group_id);


--
-- Name: index_meta_slots_on_creator_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_meta_slots_on_creator_id ON public.meta_slots USING btree (creator_id);


--
-- Name: index_notes_on_base_slot_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_notes_on_base_slot_id ON public.notes USING btree (base_slot_id);


--
-- Name: index_passengerships_on_slot_id_and_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_passengerships_on_slot_id_and_user_id ON public.passengerships USING btree (slot_id, user_id);


--
-- Name: index_passengerships_on_user_id_and_slot_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_passengerships_on_user_id_and_slot_id ON public.passengerships USING btree (user_id, slot_id);


--
-- Name: index_slot_settings_on_meta_slot_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_slot_settings_on_meta_slot_id ON public.slot_settings USING btree (meta_slot_id);


--
-- Name: index_slot_settings_on_user_id_and_meta_slot_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_slot_settings_on_user_id_and_meta_slot_id ON public.slot_settings USING btree (user_id, meta_slot_id);


--
-- Name: index_std_slots_on_meta_slot_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_std_slots_on_meta_slot_id ON public.std_slots USING btree (meta_slot_id);


--
-- Name: index_std_slots_on_owner_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_std_slots_on_owner_id ON public.std_slots USING btree (owner_id);


--
-- Name: index_users_on_auth_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_auth_token ON public.users USING btree (auth_token);


--
-- Name: unique_index_through_basic_user_email_accounts; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_index_through_basic_user_email_accounts ON public.users USING btree (email) WHERE ((role = 0) AND (email IS NOT NULL));


--
-- Name: unique_index_through_public_user_email_accounts; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_index_through_public_user_email_accounts ON public.users USING btree (email, username) WHERE ((role > 0) AND (email IS NOT NULL));


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON public.schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20141007095331');

INSERT INTO schema_migrations (version) VALUES ('20141015122755');

INSERT INTO schema_migrations (version) VALUES ('20141018114828');

INSERT INTO schema_migrations (version) VALUES ('20141020105135');

INSERT INTO schema_migrations (version) VALUES ('20141020110144');

INSERT INTO schema_migrations (version) VALUES ('20141027105619');

INSERT INTO schema_migrations (version) VALUES ('20141101013446');

INSERT INTO schema_migrations (version) VALUES ('20141101220238');

INSERT INTO schema_migrations (version) VALUES ('20141102004823');

INSERT INTO schema_migrations (version) VALUES ('20141102232807');

INSERT INTO schema_migrations (version) VALUES ('20141103203106');

INSERT INTO schema_migrations (version) VALUES ('20141103204451');

INSERT INTO schema_migrations (version) VALUES ('20141103205815');

INSERT INTO schema_migrations (version) VALUES ('20141106102922');

INSERT INTO schema_migrations (version) VALUES ('20141106103238');

INSERT INTO schema_migrations (version) VALUES ('20141106103514');

INSERT INTO schema_migrations (version) VALUES ('20141106135926');

INSERT INTO schema_migrations (version) VALUES ('20141118141033');

INSERT INTO schema_migrations (version) VALUES ('20141119092600');

INSERT INTO schema_migrations (version) VALUES ('20141119125908');

INSERT INTO schema_migrations (version) VALUES ('20141119144049');

INSERT INTO schema_migrations (version) VALUES ('20141119205309');

INSERT INTO schema_migrations (version) VALUES ('20141120091047');

INSERT INTO schema_migrations (version) VALUES ('20141120091415');

INSERT INTO schema_migrations (version) VALUES ('20141120092303');

INSERT INTO schema_migrations (version) VALUES ('20141120092546');

INSERT INTO schema_migrations (version) VALUES ('20141120102152');

INSERT INTO schema_migrations (version) VALUES ('20141120104643');

INSERT INTO schema_migrations (version) VALUES ('20141123173734');

INSERT INTO schema_migrations (version) VALUES ('20141125085243');

INSERT INTO schema_migrations (version) VALUES ('20141125095021');

INSERT INTO schema_migrations (version) VALUES ('20141125110600');

INSERT INTO schema_migrations (version) VALUES ('20141126125743');

INSERT INTO schema_migrations (version) VALUES ('20141126134021');

INSERT INTO schema_migrations (version) VALUES ('20141127130943');

INSERT INTO schema_migrations (version) VALUES ('20141127140805');

INSERT INTO schema_migrations (version) VALUES ('20141128130147');

INSERT INTO schema_migrations (version) VALUES ('20141201103503');

INSERT INTO schema_migrations (version) VALUES ('20141202183715');

INSERT INTO schema_migrations (version) VALUES ('20141202233110');

INSERT INTO schema_migrations (version) VALUES ('20141203115550');

INSERT INTO schema_migrations (version) VALUES ('20141203213610');

INSERT INTO schema_migrations (version) VALUES ('20141205094237');

INSERT INTO schema_migrations (version) VALUES ('20141210122837');

INSERT INTO schema_migrations (version) VALUES ('20141210135147');

INSERT INTO schema_migrations (version) VALUES ('20141213235605');

INSERT INTO schema_migrations (version) VALUES ('20141214164428');

INSERT INTO schema_migrations (version) VALUES ('20141215092936');

INSERT INTO schema_migrations (version) VALUES ('20141215223116');

INSERT INTO schema_migrations (version) VALUES ('20141227213950');

INSERT INTO schema_migrations (version) VALUES ('20150112223724');

INSERT INTO schema_migrations (version) VALUES ('20150116103054');

INSERT INTO schema_migrations (version) VALUES ('20150124224424');

INSERT INTO schema_migrations (version) VALUES ('20150128120441');

INSERT INTO schema_migrations (version) VALUES ('20150203092305');

INSERT INTO schema_migrations (version) VALUES ('20150203153826');

INSERT INTO schema_migrations (version) VALUES ('20150206105753');

INSERT INTO schema_migrations (version) VALUES ('20150208002831');

INSERT INTO schema_migrations (version) VALUES ('20150210101825');

INSERT INTO schema_migrations (version) VALUES ('20150214163709');

INSERT INTO schema_migrations (version) VALUES ('20150221012103');

INSERT INTO schema_migrations (version) VALUES ('20150408130844');

INSERT INTO schema_migrations (version) VALUES ('20150417143753');

INSERT INTO schema_migrations (version) VALUES ('20150426210456');

INSERT INTO schema_migrations (version) VALUES ('20150428150031');

INSERT INTO schema_migrations (version) VALUES ('20150429103206');

INSERT INTO schema_migrations (version) VALUES ('20150429104404');

INSERT INTO schema_migrations (version) VALUES ('20150429205903');

INSERT INTO schema_migrations (version) VALUES ('20150504094941');

INSERT INTO schema_migrations (version) VALUES ('20150505110742');

INSERT INTO schema_migrations (version) VALUES ('20150519084309');

INSERT INTO schema_migrations (version) VALUES ('20150521115806');

INSERT INTO schema_migrations (version) VALUES ('20150526100738');

INSERT INTO schema_migrations (version) VALUES ('20150527102505');

INSERT INTO schema_migrations (version) VALUES ('20150528130614');

INSERT INTO schema_migrations (version) VALUES ('20150601135924');

INSERT INTO schema_migrations (version) VALUES ('20150603142220');

INSERT INTO schema_migrations (version) VALUES ('20150610092616');

INSERT INTO schema_migrations (version) VALUES ('20150612093738');

INSERT INTO schema_migrations (version) VALUES ('20150618062654');

INSERT INTO schema_migrations (version) VALUES ('20150619113120');

INSERT INTO schema_migrations (version) VALUES ('20150724110859');

INSERT INTO schema_migrations (version) VALUES ('20150808172817');

INSERT INTO schema_migrations (version) VALUES ('20150810155024');

INSERT INTO schema_migrations (version) VALUES ('20150819181058');

INSERT INTO schema_migrations (version) VALUES ('20150825113006');

INSERT INTO schema_migrations (version) VALUES ('20151028213045');

INSERT INTO schema_migrations (version) VALUES ('20151101102829');

INSERT INTO schema_migrations (version) VALUES ('20151102154547');

INSERT INTO schema_migrations (version) VALUES ('20151122175133');

INSERT INTO schema_migrations (version) VALUES ('20151126144402');

INSERT INTO schema_migrations (version) VALUES ('20151213004813');

INSERT INTO schema_migrations (version) VALUES ('20151216084727');

INSERT INTO schema_migrations (version) VALUES ('20151217144020');

INSERT INTO schema_migrations (version) VALUES ('20160102223742');

INSERT INTO schema_migrations (version) VALUES ('20160104012453');

INSERT INTO schema_migrations (version) VALUES ('20160107230953');

INSERT INTO schema_migrations (version) VALUES ('20160119125106');

INSERT INTO schema_migrations (version) VALUES ('20160120123637');

INSERT INTO schema_migrations (version) VALUES ('20160121113721');

INSERT INTO schema_migrations (version) VALUES ('20160121133720');

INSERT INTO schema_migrations (version) VALUES ('20160130125422');

INSERT INTO schema_migrations (version) VALUES ('20160131005126');

INSERT INTO schema_migrations (version) VALUES ('20160209102620');

INSERT INTO schema_migrations (version) VALUES ('20160215135746');

INSERT INTO schema_migrations (version) VALUES ('20160215231713');

INSERT INTO schema_migrations (version) VALUES ('20160221192251');

INSERT INTO schema_migrations (version) VALUES ('20160303174854');

INSERT INTO schema_migrations (version) VALUES ('20160309215254');

INSERT INTO schema_migrations (version) VALUES ('20160311110857');

INSERT INTO schema_migrations (version) VALUES ('20160330140930');

INSERT INTO schema_migrations (version) VALUES ('20160405112204');

INSERT INTO schema_migrations (version) VALUES ('20160411104513');

INSERT INTO schema_migrations (version) VALUES ('20160416150256');

INSERT INTO schema_migrations (version) VALUES ('20160417140125');

INSERT INTO schema_migrations (version) VALUES ('20160510125032');

INSERT INTO schema_migrations (version) VALUES ('20160603103055');

INSERT INTO schema_migrations (version) VALUES ('20160711102234');

INSERT INTO schema_migrations (version) VALUES ('20160826225331');

INSERT INTO schema_migrations (version) VALUES ('20160829092803');

INSERT INTO schema_migrations (version) VALUES ('20160912100726');

INSERT INTO schema_migrations (version) VALUES ('20161212131529');

INSERT INTO schema_migrations (version) VALUES ('20180319141657');

INSERT INTO schema_migrations (version) VALUES ('20180319145038');

INSERT INTO schema_migrations (version) VALUES ('20180319153304');

INSERT INTO schema_migrations (version) VALUES ('20180319213054');

