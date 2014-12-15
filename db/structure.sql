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
    meta_slot_id integer,
    id integer NOT NULL
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
-- Name: friendships; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE friendships (
    id integer NOT NULL,
    user_id integer,
    friend_id integer,
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
-- Name: group_slots; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE group_slots (
    group_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    meta_slot_id integer,
    footest character varying(255),
    deleted_at timestamp without time zone
)
INHERITS (base_slots);


--
-- Name: groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE groups (
    id integer NOT NULL,
    owner_id integer,
    name character varying(255),
    members_can_post boolean DEFAULT true,
    members_can_invite boolean DEFAULT false,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
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
-- Name: media_items; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE media_items (
    id integer NOT NULL,
    media_type character varying(255),
    public_id character varying(255),
    ordering integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    mediable_id integer,
    mediable_type character varying(255),
    deleted_at timestamp without time zone,
    duration integer,
    thumbnail character varying(255)
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
    id integer NOT NULL,
    user_id integer,
    group_id integer,
    notifications boolean DEFAULT true,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    state bit(3) DEFAULT B'011'::"bit"
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
    id integer NOT NULL,
    title character varying(48),
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    creator_id integer,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    location_id integer
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
    id integer NOT NULL,
    base_slot_id integer,
    title character varying(255) NOT NULL,
    content text DEFAULT ''::text,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
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
-- Name: re_slots; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE re_slots (
    predecessor_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    footest character varying(255),
    deleted_at timestamp without time zone,
    meta_slot_id integer NOT NULL,
    slotter_id integer NOT NULL
)
INHERITS (base_slots);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: slot_settings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE slot_settings (
    user_id integer,
    meta_slot_id integer,
    alerts bit(10) DEFAULT B'0000000000'::"bit",
    deleted_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    id integer NOT NULL
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
    visibility bit(2) DEFAULT B'11'::"bit",
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    footest character varying(255),
    meta_slot_id integer,
    owner_id integer
)
INHERITS (base_slots);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying(20),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
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

ALTER TABLE ONLY friendships ALTER COLUMN id SET DEFAULT nextval('friendships_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY group_slots ALTER COLUMN id SET DEFAULT nextval('base_slots_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY groups ALTER COLUMN id SET DEFAULT nextval('groups_id_seq'::regclass);


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

ALTER TABLE ONLY re_slots ALTER COLUMN id SET DEFAULT nextval('base_slots_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY slot_settings ALTER COLUMN id SET DEFAULT nextval('slot_settings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY std_slots ALTER COLUMN id SET DEFAULT nextval('base_slots_id_seq'::regclass);


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
-- Name: index_friendships_on_friend_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_friendships_on_friend_id ON friendships USING btree (friend_id);


--
-- Name: index_friendships_on_user_id_and_friend_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_friendships_on_user_id_and_friend_id ON friendships USING btree (user_id, friend_id);


--
-- Name: index_group_slots_on_group_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_group_slots_on_group_id ON group_slots USING btree (group_id);


--
-- Name: index_group_slots_on_meta_slot_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_group_slots_on_meta_slot_id ON group_slots USING btree (meta_slot_id);


--
-- Name: index_groups_on_owner_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_groups_on_owner_id ON groups USING btree (owner_id);


--
-- Name: index_media_items_on_mediable_id_and_mediable_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_media_items_on_mediable_id_and_mediable_type ON media_items USING btree (mediable_id, mediable_type);


--
-- Name: index_memberships_on_group_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_memberships_on_group_id ON memberships USING btree (group_id);


--
-- Name: index_memberships_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_memberships_on_user_id ON memberships USING btree (user_id);


--
-- Name: index_meta_slots_on_creator_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_meta_slots_on_creator_id ON meta_slots USING btree (creator_id);


--
-- Name: index_notes_on_base_slot_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_notes_on_base_slot_id ON notes USING btree (base_slot_id);


--
-- Name: index_re_slots_on_meta_slot_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_re_slots_on_meta_slot_id ON re_slots USING btree (meta_slot_id);


--
-- Name: index_re_slots_on_predecessor_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_re_slots_on_predecessor_id ON re_slots USING btree (predecessor_id);


--
-- Name: index_re_slots_on_slotter_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_re_slots_on_slotter_id ON re_slots USING btree (slotter_id);


--
-- Name: index_slot_settings_on_meta_slot_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_slot_settings_on_meta_slot_id ON slot_settings USING btree (meta_slot_id);


--
-- Name: index_slot_settings_on_user_id_and_meta_slot_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_slot_settings_on_user_id_and_meta_slot_id ON slot_settings USING btree (user_id, meta_slot_id);


--
-- Name: index_std_slots_on_meta_slot_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_std_slots_on_meta_slot_id ON std_slots USING btree (meta_slot_id);


--
-- Name: index_std_slots_on_owner_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_std_slots_on_owner_id ON std_slots USING btree (owner_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


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

