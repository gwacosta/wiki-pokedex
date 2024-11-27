--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

DROP TABLE IF EXISTS pokedex;
CREATE TABLE pokedex;

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
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- Name: admins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admins (
    id integer NOT NULL,
    nome character varying(60) NOT NULL,
    email character varying(60) NOT NULL,
    senha character varying(60) NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.admins OWNER TO postgres;

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admins_id_seq OWNER TO postgres;

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;


--
-- Name: capturas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.capturas (
    "treinadorId" character varying(36) NOT NULL,
    "pokemonId" integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.capturas OWNER TO postgres;

--
-- Name: grupos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grupos (
    id integer NOT NULL,
    nome character varying(30) NOT NULL
);


ALTER TABLE public.grupos OWNER TO postgres;

--
-- Name: grupos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grupos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.grupos_id_seq OWNER TO postgres;

--
-- Name: grupos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grupos_id_seq OWNED BY public.grupos.id;


--
-- Name: pokemons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pokemons (
    id integer NOT NULL,
    nome character varying(60) NOT NULL,
    numero integer NOT NULL,
    peso numeric(6,1) NOT NULL,
    altura numeric(5,1) NOT NULL,
    "habPassiva" character varying(60) NOT NULL,
    descricao text NOT NULL,
    tipos json NOT NULL,
    fraquezas json NOT NULL,
    foto text NOT NULL,
    "grupoId" integer NOT NULL,
    "evolucaoId" integer,
    "evoluiDeId" integer,
    "adminId" integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.pokemons OWNER TO postgres;

--
-- Name: pokemons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pokemons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pokemons_id_seq OWNER TO postgres;

--
-- Name: pokemons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pokemons_id_seq OWNED BY public.pokemons.id;


--
-- Name: treinadores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.treinadores (
    id character varying(36) NOT NULL,
    nome character varying(60) NOT NULL,
    email character varying(40) NOT NULL,
    senha character varying(60) NOT NULL,
    codigo integer,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public.treinadores OWNER TO postgres;

--
-- Name: admins id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);


--
-- Name: grupos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupos ALTER COLUMN id SET DEFAULT nextval('public.grupos_id_seq'::regclass);


--
-- Name: pokemons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemons ALTER COLUMN id SET DEFAULT nextval('public.pokemons_id_seq'::regclass);


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
b12b0765-c7c4-4cc2-8263-fde8602aa1df	b50d056602dc3538de6818a66151d275882c6698e8c835976abca2ac6d6c6342	2024-10-25 02:23:43.446235-03	20241025052011_envio1	\N	\N	2024-10-25 02:23:43.396978-03	1
e9e5cc17-79d4-4c3c-8bad-d9df0d3aa1e0	b3ee582a762fc55c646dde765dea434f823e63aa4c92c15fe7496b6009f26478	2024-11-22 01:47:36.154976-03	20241122044736_adicao_admins	\N	\N	2024-11-22 01:47:36.140949-03	1
ba1164d5-3142-47ff-a287-ee0e1e2f996c	feee92c8c0960029c46a6a37d267264eac59df5bb6abe44c087bf400027f443b	2024-11-22 01:59:53.503004-03	20241122045953_ajuste_pokemon_admin	\N	\N	2024-11-22 01:59:53.498411-03	1
\.


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admins (id, nome, email, senha, "createdAt", "updatedAt") FROM stdin;
1	Guilherme Acosta	gui@gmail.com	$2b$12$glTVyBn9U1vEE/FYZKMmEOxUuZdzooJlw6wnke.yBtPh5rFe.NDzq	2024-11-22 04:57:19.189	2024-11-22 04:57:19.189
\.


--
-- Data for Name: capturas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.capturas ("treinadorId", "pokemonId", "createdAt") FROM stdin;
dbc3f5f1-0353-48ad-bc91-db985bb563d8	1	2024-10-25 05:29:13.253
dbc3f5f1-0353-48ad-bc91-db985bb563d8	2	2024-10-25 05:29:15.459
dbc3f5f1-0353-48ad-bc91-db985bb563d8	13	2024-10-25 05:29:21.88
dbc3f5f1-0353-48ad-bc91-db985bb563d8	14	2024-10-25 05:29:23.631
dbc3f5f1-0353-48ad-bc91-db985bb563d8	15	2024-10-25 05:29:24.901
dbc3f5f1-0353-48ad-bc91-db985bb563d8	151	2024-10-25 05:29:29.432
dbc3f5f1-0353-48ad-bc91-db985bb563d8	145	2024-10-25 05:29:36.021
dbc3f5f1-0353-48ad-bc91-db985bb563d8	62	2024-11-22 03:42:57.672
b5c0223d-1f2b-428e-82fd-20cbc8eab204	4	2024-11-22 05:26:54.385
b5c0223d-1f2b-428e-82fd-20cbc8eab204	5	2024-11-22 05:26:56.038
b5c0223d-1f2b-428e-82fd-20cbc8eab204	6	2024-11-22 05:26:57.529
b5c0223d-1f2b-428e-82fd-20cbc8eab204	151	2024-11-22 05:27:06.146
b5c0223d-1f2b-428e-82fd-20cbc8eab204	144	2024-11-22 05:27:11.504
b5c0223d-1f2b-428e-82fd-20cbc8eab204	150	2024-11-22 05:27:15.189
b5c0223d-1f2b-428e-82fd-20cbc8eab204	94	2024-11-22 05:52:05.73
b5c0223d-1f2b-428e-82fd-20cbc8eab204	65	2024-11-22 05:52:11.354
b5c0223d-1f2b-428e-82fd-20cbc8eab204	152	2024-11-27 06:54:13.024
dbc3f5f1-0353-48ad-bc91-db985bb563d8	156	2024-11-27 07:59:03.421
dbc3f5f1-0353-48ad-bc91-db985bb563d8	3	2024-11-27 08:50:38.312
\.


--
-- Data for Name: grupos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grupos (id, nome) FROM stdin;
1	Padrão
2	Iniciais
3	Míticos
4	Lendários
\.


--
-- Data for Name: pokemons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pokemons (id, nome, numero, peso, altura, "habPassiva", descricao, tipos, fraquezas, foto, "grupoId", "evolucaoId", "evoluiDeId", "adminId") FROM stdin;
1	Bulbasaur	1	6.9	0.7	Overgrow	A strange seed was planted on its back at birth. The plant sprouts and grows with this POKéMON.	["Grama","Venenoso"]	["Inseto","Psiquico","Voador","Venenoso","Gelo","Terra","Fogo"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/001.png	2	2	\N	1
4	Charmander	4	8.5	0.6	Blaze	Obviously prefers hot places. When it rains, steam is said to spout from the tip of its tail.	["Fogo"]	["Terra","Agua","Pedra"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/004.png	2	5	\N	1
6	Charizard	6	90.5	1.7	Blaze	Spits fire that is hot enough to melt boulders. Known to cause forest fires unintentionally.	["Fogo","Voador"]	["Pedra","Eletrico","Agua","Gelo","Terra"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/006.png	1	\N	5	1
5	Charmeleon	5	19.0	1.1	Blaze	When it swings its burning tail, it elevates the temperature to unbearably high levels.	["Fogo"]	["Terra","Agua","Pedra"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/005.png	1	6	4	1
7	Squirtle	7	9.0	0.5	Torrent	After birth, its back swells and hardens into a shell. Powerfully sprays foam from its mouth.	["Agua"]	["Grama","Eletrico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/007.png	2	8	\N	1
9	Blastoise	9	85.5	1.6	Torrent	A brutal POKéMON with pressurized water jets on its shell. They are used for high speed tackles.	["Agua"]	["Grama","Eletrico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/009.png	1	\N	8	1
8	Wartortle	8	22.5	1.0	Torrent	Often hides in water to stalk unwary prey. For swimming fast, it moves its ears to maintain balance.	["Agua"]	["Grama","Eletrico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/008.png	1	9	7	1
10	Caterpie	10	2.9	0.3	Shield-dust	Its short feet are tipped with suction pads that enable it to tirelessly climb slopes and walls.	["Inseto"]	["Voador","Fogo","Pedra"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/010.png	1	11	\N	1
12	Butterfree	12	32.0	1.1	Compound-eyes	In battle, it flaps its wings at high speed to release highly toxic dust into the air.	["Inseto","Voador"]	["Voador","Pedra","Eletrico","Gelo","Fogo"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/012.png	1	\N	11	1
11	Metapod	11	9.9	0.7	Shed-skin	This POKéMON is vulnerable to attack while its shell is soft, exposing its weak and tender body.	["Inseto"]	["Voador","Fogo","Pedra"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/011.png	1	12	10	1
13	Weedle	13	3.2	0.3	Shield-dust	Often found in forests, eating leaves. It has a sharp venomous stinger on its head.	["Inseto","Venenoso"]	["Psiquico","Voador","Pedra","Terra","Fogo"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/013.png	1	14	\N	1
15	Beedrill	15	29.5	1.0	Swarm	It has three poisonous stingers on its forelegs and its tail. They are used to jab its enemy repeatedly.	["Inseto","Venenoso"]	["Psiquico","Voador","Pedra","Terra","Fogo"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/015.png	1	\N	14	1
14	Kakuna	14	10.0	0.6	Shed-skin	Almost incapable of moving, this POKéMON can only harden its shell to protect itself from predators.	["Inseto","Venenoso"]	["Psiquico","Voador","Pedra","Terra","Fogo"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/014.png	1	15	13	1
16	Pidgey	16	1.8	0.3	Keen-eye	A common sight in forests and woods. It flaps its wings at ground level to kick up blinding sand.	["Normal","Voador"]	["Pedra","Gelo","Lutador","Eletrico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/016.png	1	17	\N	1
18	Pidgeot	18	39.5	1.5	Keen-eye	When hunting, it skims the surface of water at high speed to pick off unwary prey such as MAGIKARP.	["Normal","Voador"]	["Pedra","Gelo","Lutador","Eletrico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/018.png	1	\N	17	1
17	Pidgeotto	17	30.0	1.1	Keen-eye	Very protective of its sprawling territorial area, this POKéMON will fiercely peck at any intruder.	["Normal","Voador"]	["Pedra","Gelo","Lutador","Eletrico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/017.png	1	18	16	1
20	Raticate	20	18.5	0.7	Run-away	It uses its whis­ kers to maintain its balance. It apparently slows down if they are cut off.	["Normal"]	["Lutador"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/020.png	1	\N	19	1
19	Rattata	19	3.5	0.3	Run-away	Bites anything when it attacks. Small and very quick, it is a common sight in many places.	["Normal"]	["Lutador"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/019.png	1	20	\N	1
21	Spearow	21	2.0	0.3	Keen-eye	It flaps its small wings busily to fly. Using its beak, it searches in grass for prey.	["Normal","Voador"]	["Pedra","Gelo","Lutador","Eletrico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/021.png	1	22	\N	1
22	Fearow	22	38.0	1.2	Keen-eye	With its huge and magnificent wings, it can keep aloft without ever having to land for rest.	["Normal","Voador"]	["Pedra","Gelo","Lutador","Eletrico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/022.png	1	\N	21	1
24	Arbok	24	65.0	3.5	Intimidate	It is rumored that the ferocious warning markings on its belly differ from area to area.	["Venenoso"]	["Terra","Psiquico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/024.png	1	\N	23	1
23	Ekans	23	6.9	2.0	Intimidate	Moves silently and stealthily. Eats the eggs of birds, such as PIDGEY and SPEAROW, whole.	["Venenoso"]	["Terra","Psiquico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/023.png	1	24	\N	1
26	Raichu	26	30.0	0.8	Static	Its long tail serves as a ground to protect itself from its own high-voltage power.	["Eletrico"]	["Terra"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/026.png	1	\N	25	1
25	Pikachu	25	6.0	0.4	Static	When several of these POKéMON gather, their electricity could build and cause lightning storms.	["Eletrico"]	["Terra"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/025.png	1	26	\N	1
2	Ivysaur	2	13.0	1.0	Overgrow	When the bulb on its back grows large, it appears to lose the ability to stand on its hind legs.	["Grama","Venenoso"]	["Inseto","Psiquico","Voador","Venenoso","Gelo","Terra","Fogo"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/002.png	1	3	1	1
28	Sandslash	28	29.5	1.0	Sand-veil	Curls up into a spiny ball when threatened. It can roll while curled up to attack or escape.	["Terra"]	["Agua","Grama","Gelo"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/028.png	1	\N	27	1
27	Sandshrew	27	12.0	0.6	Sand-veil	Burrows deep underground in arid locations far from water. It only emerges to hunt for food.	["Terra"]	["Agua","Grama","Gelo"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/027.png	1	28	\N	1
29	Nidoran-f	29	7.0	0.4	Poison-point	Although small, its venomous barbs render this POKéMON dangerous. The female has smaller horns.	["Venenoso"]	["Terra","Psiquico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/029.png	1	30	\N	1
31	Nidoqueen	31	60.0	1.3	Poison-point	Its hard scales provide strong protection. It uses its hefty bulk to execute powerful moves.	["Venenoso","Terra"]	["Psiquico","Grama","Agua","Gelo","Terra"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/031.png	1	\N	30	1
30	Nidorina	30	20.0	0.8	Poison-point	The female's horn develops slowly. Prefers physical attacks such as clawing and biting.	["Venenoso"]	["Terra","Psiquico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/030.png	1	31	29	1
32	Nidoran-m	32	9.0	0.5	Poison-point	Stiffens its ears to sense danger. The larger its horns, the more powerful its secreted venom.	["Venenoso"]	["Terra","Psiquico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/032.png	1	33	\N	1
34	Nidoking	34	62.0	1.4	Poison-point	It uses its powerful tail in battle to smash, constrict, then break the prey's bones.	["Venenoso","Terra"]	["Psiquico","Grama","Agua","Gelo","Terra"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/034.png	1	\N	33	1
33	Nidorino	33	19.5	0.9	Poison-point	An aggressive POKéMON that is quick to attack. The horn on its head secretes a powerful venom.	["Venenoso"]	["Terra","Psiquico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/033.png	1	34	32	1
36	Clefable	36	40.0	1.3	Cute-charm	A timid fairy POKéMON that is rarely seen. It will run and hide the moment it senses people.	["Fada"]	["Venenoso","Aco"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/036.png	1	\N	35	1
35	Clefairy	35	7.5	0.6	Cute-charm	Its magical and cute appeal has many admirers. It is rare and found only in certain areas.	["Fada"]	["Venenoso","Aco"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/035.png	1	36	\N	1
38	Ninetales	38	19.9	1.1	Flash-fire	Very smart and very vengeful. Grabbing one of its many tails could result in a 1000-year curse.	["Fogo"]	["Terra","Agua","Pedra"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/038.png	1	\N	37	1
37	Vulpix	37	9.9	0.6	Flash-fire	At the time of birth, it has just one tail. The tail splits from its tip as it grows older.	["Fogo"]	["Terra","Agua","Pedra"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/037.png	1	38	\N	1
40	Wigglytuff	40	12.0	1.0	Cute-charm	The body is soft and rubbery. When angered, it will suck in air and inflate itself to an enormous size.	["Normal","Fada"]	["Lutador","Venenoso","Aco"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/040.png	1	\N	39	1
39	Jigglypuff	39	5.5	0.5	Cute-charm	When its huge eyes light up, it sings a mysteriously soothing melody that lulls its enemies to sleep.	["Normal","Fada"]	["Lutador","Venenoso","Aco"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/039.png	1	40	\N	1
42	Golbat	42	55.0	1.6	Inner-focus	Once it strikes, it will not stop draining energy from the victim even if it gets too heavy to fly.	["Venenoso","Voador"]	["Psiquico","Pedra","Eletrico","Gelo","Terra"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/042.png	1	\N	41	1
41	Zubat	41	7.5	0.8	Inner-focus	Forms colonies in perpetually dark places. Uses ultrasonic waves to identify and approach targets.	["Venenoso","Voador"]	["Psiquico","Pedra","Eletrico","Gelo","Terra"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/041.png	1	42	\N	1
43	Oddish	43	5.4	0.5	Chlorophyll	During the day, it keeps its face buried in the ground. At night, it wanders around sowing its seeds.	["Grama","Venenoso"]	["Inseto","Psiquico","Voador","Venenoso","Gelo","Terra","Fogo"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/043.png	1	44	\N	1
45	Vileplume	45	18.6	1.2	Chlorophyll	It has the world’s largest petals. With every step, the petals shake out heavy clouds of toxic pollen.	["Grama","Venenoso"]	["Inseto","Psiquico","Voador","Venenoso","Gelo","Terra","Fogo"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/045.png	1	\N	44	1
44	Gloom	44	8.6	0.8	Chlorophyll	The fluid that oozes from its mouth isn't drool. It is a nectar that is used to attract prey.	["Grama","Venenoso"]	["Inseto","Psiquico","Voador","Venenoso","Gelo","Terra","Fogo"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/044.png	1	45	43	1
47	Parasect	47	29.5	1.0	Effect-spore	A host-parasite pair in which the parasite mushroom has taken over the host bug. Prefers damp places.	["Inseto","Grama"]	["Inseto","Voador","Pedra","Venenoso","Gelo","Fogo"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/047.png	1	\N	46	1
46	Paras	46	5.4	0.3	Effect-spore	Burrows to suck tree roots. The mushrooms on its back grow by draw­ ing nutrients from the bug host.	["Inseto","Grama"]	["Inseto","Voador","Pedra","Venenoso","Gelo","Fogo"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/046.png	1	47	\N	1
49	Venomoth	49	12.5	1.5	Shield-dust	The dustlike scales covering its wings are color-coded to indicate the kinds of poison it has.	["Inseto","Venenoso"]	["Psiquico","Voador","Pedra","Terra","Fogo"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/049.png	1	\N	48	1
48	Venonat	48	30.0	1.0	Compound-eyes	Lives in the shadows of tall trees where it eats insects. It is attracted by light at night.	["Inseto","Venenoso"]	["Psiquico","Voador","Pedra","Terra","Fogo"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/048.png	1	49	\N	1
51	Dugtrio	51	33.3	0.7	Sand-veil	A team of DIGLETT triplets. It triggers huge earthquakes by burrowing 60 miles underground.	["Terra"]	["Agua","Grama","Gelo"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/051.png	1	\N	50	1
50	Diglett	50	0.8	0.2	Sand-veil	Lives about one yard underground where it feeds on plant roots. It sometimes appears above ground.	["Terra"]	["Agua","Grama","Gelo"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/050.png	1	51	\N	1
53	Persian	53	32.0	1.0	Limber	Although its fur has many admirers, it is tough to raise as a pet because of its fickle meanness.	["Normal"]	["Lutador"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/053.png	1	\N	52	1
52	Meowth	52	4.2	0.4	Pickup	It washes its face regularly to keep the coin on its forehead spotless. It doesn’t get along with Galarian Meowth.	["Normal"]	["Lutador"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/052.png	1	53	\N	1
55	Golduck	55	76.6	1.7	Damp	Often seen swim­ ming elegantly by lake shores. It is often mistaken for the Japanese monster, Kappa.	["Agua"]	["Grama","Eletrico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/055.png	1	\N	54	1
54	Psyduck	54	19.6	0.8	Damp	While lulling its enemies with its vacant look, this wily POKéMON will use psychokinetic powers.	["Agua"]	["Grama","Eletrico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/054.png	1	55	\N	1
57	Primeape	57	32.0	1.0	Vital-spirit	Always furious and tenacious to boot. It will not abandon chasing its quarry until it is caught.	["Lutador"]	["Voador","Psiquico","Fada"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/057.png	1	\N	56	1
56	Mankey	56	28.0	0.5	Vital-spirit	Extremely quick to anger. It could be docile one moment then thrashing away the next instant.	["Lutador"]	["Voador","Psiquico","Fada"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/056.png	1	57	\N	1
59	Arcanine	59	155.0	1.9	Intimidate	A POKéMON that has been admired since the past for its beauty. It runs agilely as if on wings.	["Fogo"]	["Terra","Agua","Pedra"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/059.png	1	\N	58	1
58	Growlithe	58	19.0	0.7	Intimidate	Very protective of its territory. It will bark and bite to repel intruders from its space.	["Fogo"]	["Terra","Agua","Pedra"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/058.png	1	59	\N	1
60	Poliwag	60	12.4	0.6	Water-absorb	Its newly grown legs prevent it from running. It appears to prefer swimming than trying to stand.	["Agua"]	["Grama","Eletrico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/060.png	1	61	\N	1
62	Poliwrath	62	54.0	1.3	Water-absorb	An adept swimmer at both the front crawl and breast stroke. Easily overtakes the best human swimmers.	["Agua","Lutador"]	["Voador","Grama","Eletrico","Psiquico","Fada"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/062.png	1	\N	61	1
61	Poliwhirl	61	20.0	1.0	Water-absorb	Capable of living in or out of water. When out of water, it sweats to keep its body slimy.	["Agua"]	["Grama","Eletrico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/061.png	1	62	60	1
63	Abra	63	19.5	0.9	Synchronize	Using its ability to read minds, it will identify impending danger and TELEPORT to safety.	["Psiquico"]	["Fantasma","Inseto","Sombrio"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/063.png	1	64	\N	1
65	Alakazam	65	48.0	1.5	Synchronize	Its brain can out­ perform a super­ computer. Its intelligence quotient is said to be 5,000.	["Psiquico"]	["Fantasma","Inseto","Sombrio"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/065.png	1	\N	64	1
64	Kadabra	64	56.5	1.3	Synchronize	It emits special alpha waves from its body that induce headaches just by being close by.	["Psiquico"]	["Fantasma","Inseto","Sombrio"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/064.png	1	65	63	1
66	Machop	66	19.5	0.8	Guts	Loves to build its muscles. It trains in all styles of martial arts to become even stronger.	["Lutador"]	["Voador","Psiquico","Fada"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/066.png	1	67	\N	1
68	Machamp	68	130.0	1.6	Guts	Using its heavy muscles, it throws powerful punches that can send the victim clear over the horizon.	["Lutador"]	["Voador","Psiquico","Fada"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/068.png	1	\N	67	1
67	Machoke	67	70.5	1.5	Guts	Its muscular body is so powerful, it must wear a power save belt to be able to regulate its motions.	["Lutador"]	["Voador","Psiquico","Fada"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/067.png	1	68	66	1
69	Bellsprout	69	4.0	0.7	Chlorophyll	A carnivorous POKéMON that traps and eats bugs. It uses its root feet to soak up needed moisture.	["Grama","Venenoso"]	["Inseto","Psiquico","Voador","Venenoso","Gelo","Terra","Fogo"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/069.png	1	70	\N	1
71	Victreebel	71	15.5	1.7	Chlorophyll	Said to live in huge colonies deep in jungles, although no one has ever returned from there.	["Grama","Venenoso"]	["Inseto","Psiquico","Voador","Venenoso","Gelo","Terra","Fogo"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/071.png	1	\N	70	1
70	Weepinbell	70	6.4	1.0	Chlorophyll	It spits out POISONPOWDER to immobilize the enemy and then finishes it with a spray of ACID.	["Grama","Venenoso"]	["Inseto","Psiquico","Voador","Venenoso","Gelo","Terra","Fogo"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/070.png	1	71	69	1
73	Tentacruel	73	55.0	1.6	Clear-body	The tentacles are normally kept short. On hunts, they are extended to ensnare and immobilize prey.	["Agua","Venenoso"]	["Terra","Grama","Eletrico","Psiquico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/073.png	1	\N	72	1
72	Tentacool	72	45.5	0.9	Clear-body	Drifts in shallow seas. Anglers who hook them by accident are often punished by its stinging acid.	["Agua","Venenoso"]	["Terra","Grama","Eletrico","Psiquico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/072.png	1	73	\N	1
74	Geodude	74	20.0	0.4	Rock-head	Found in fields and mountains. Mistaking them for boulders, people often step or trip on them.	["Pedra","Terra"]	["Aco","Grama","Agua","Lutador","Gelo","Terra"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/074.png	1	75	\N	1
76	Golem	76	300.0	1.4	Rock-head	Its boulder-like body is extremely hard. It can easily withstand dynamite blasts without damage.	["Pedra","Terra"]	["Aco","Grama","Agua","Lutador","Gelo","Terra"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/076.png	1	\N	75	1
75	Graveler	75	105.0	1.0	Rock-head	Rolls down slopes to move. It rolls over any obstacle without slowing or changing its direction.	["Pedra","Terra"]	["Aco","Grama","Agua","Lutador","Gelo","Terra"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/075.png	1	76	74	1
78	Rapidash	78	95.0	1.7	Run-away	Very competitive, this POKéMON will chase anything that moves fast in the hopes of racing it.	["Fogo"]	["Terra","Agua","Pedra"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/078.png	1	\N	77	1
77	Ponyta	77	30.0	1.0	Run-away	Its hooves are 10 times harder than diamonds. It can trample anything completely flat in little time.	["Fogo"]	["Terra","Agua","Pedra"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/077.png	1	78	\N	1
80	Slowbro	80	78.5	1.6	Oblivious	The SHELLDER that is latched onto SLOWPOKE's tail is said to feed on the host's left over scraps.	["Agua","Psiquico"]	["Inseto","Sombrio","Grama","Eletrico","Fantasma"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/080.png	1	\N	79	1
79	Slowpoke	79	36.0	1.2	Oblivious	Incredibly slow and dopey. It takes 5 seconds for it to feel pain when under attack.	["Agua","Psiquico"]	["Inseto","Sombrio","Grama","Eletrico","Fantasma"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/079.png	1	80	\N	1
82	Magneton	82	60.0	1.0	Magnet-pull	Formed by several MAGNEMITEs linked together. They frequently appear when sunspots flare up.	["Eletrico","Aco"]	["Terra","Fogo","Lutador"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/082.png	1	\N	81	1
81	Magnemite	81	6.0	0.3	Magnet-pull	Uses anti-gravity to stay suspended. Appears without warning and uses THUNDER WAVE and similar moves.	["Eletrico","Aco"]	["Terra","Fogo","Lutador"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/081.png	1	82	\N	1
83	Farfetchd	83	15.0	0.8	Keen-eye	The sprig of green onions it holds is its weapon. It is used much like a metal sword.	["Normal","Voador"]	["Pedra","Gelo","Lutador","Eletrico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/083.png	1	\N	\N	1
85	Dodrio	85	85.2	1.8	Run-away	Uses its three brains to execute complex plans. While two heads sleep, one head stays awake.	["Normal","Voador"]	["Pedra","Gelo","Lutador","Eletrico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/085.png	1	\N	84	1
84	Doduo	84	39.2	1.4	Run-away	A bird that makes up for its poor flying with its fast foot speed. Leaves giant footprints.	["Normal","Voador"]	["Pedra","Gelo","Lutador","Eletrico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/084.png	1	85	\N	1
87	Dewgong	87	120.0	1.7	Thick-fat	Stores thermal energy in its body. Swims at a steady 8 knots even in intensely cold waters.	["Agua","Gelo"]	["Aco","Pedra","Grama","Eletrico","Lutador","Fogo"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/087.png	1	\N	86	1
86	Seel	86	90.0	1.1	Thick-fat	The protruding horn on its head is very hard. It is used for bashing through thick ice.	["Agua"]	["Grama","Eletrico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/086.png	1	87	\N	1
89	Muk	89	30.0	1.2	Stench	Thickly covered with a filthy, vile sludge. It is so toxic, even its footprints contain poison.	["Venenoso"]	["Terra","Psiquico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/089.png	1	\N	88	1
88	Grimer	88	30.0	0.9	Stench	Appears in filthy areas. Thrives by sucking up polluted sludge that is pumped out of factories.	["Venenoso"]	["Terra","Psiquico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/088.png	1	89	\N	1
91	Cloyster	91	132.5	1.5	Shell-armor	When attacked, it launches its horns in quick volleys. Its innards have never been seen.	["Agua","Gelo"]	["Aco","Pedra","Grama","Eletrico","Lutador","Fogo"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/091.png	1	\N	90	1
90	Shellder	90	4.0	0.3	Shell-armor	Its hard shell repels any kind of attack. It is vulnerable only when its shell is open.	["Agua"]	["Grama","Eletrico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/090.png	1	91	\N	1
92	Gastly	92	0.1	1.3	Levitate	Almost invisible, this gaseous POKéMON cloaks the target and puts it to sleep without notice.	["Fantasma","Venenoso"]	["Terra","Fantasma","Sombrio","Psiquico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/092.png	1	93	\N	1
93	Haunter	93	0.1	1.6	Levitate	Because of its ability to slip through block walls, it is said to be from an­ other dimension.	["Fantasma","Venenoso"]	["Terra","Fantasma","Sombrio","Psiquico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/093.png	1	94	92	1
94	Gengar	94	40.5	1.5	Cursed-body	Under a full moon, this POKéMON likes to mimic the shadows of people and laugh at their fright.	["Fantasma","Venenoso"]	["Terra","Fantasma","Sombrio","Psiquico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/094.png	1	\N	93	1
95	Onix	95	210.0	8.8	Rock-head	As it grows, the stone portions of its body harden to become similar to a diamond, but colored black.	["Pedra","Terra"]	["Aco","Grama","Agua","Lutador","Gelo","Terra"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/095.png	1	\N	\N	1
97	Hypno	97	75.6	1.6	Insomnia	When it locks eyes with an enemy, it will use a mix of PSI moves such as HYPNOSIS and CONFUSION.	["Psiquico"]	["Fantasma","Inseto","Sombrio"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/097.png	1	\N	96	1
96	Drowzee	96	32.4	1.0	Insomnia	Puts enemies to sleep then eats their dreams. Occasionally gets sick from eating bad dreams.	["Psiquico"]	["Fantasma","Inseto","Sombrio"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/096.png	1	97	\N	1
99	Kingler	99	60.0	1.3	Hyper-cutter	The large pincer has 10000 hp of crushing power. However, its huge size makes it unwieldy to use.	["Agua"]	["Grama","Eletrico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/099.png	1	\N	98	1
98	Krabby	98	6.5	0.4	Hyper-cutter	Its pincers are not only powerful weapons, they are used for balance when walking sideways.	["Agua"]	["Grama","Eletrico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/098.png	1	99	\N	1
101	Electrode	101	66.6	1.2	Soundproof	It stores electric energy under very high pressure. It often explodes with little or no provocation.	["Eletrico"]	["Terra"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/101.png	1	\N	100	1
100	Voltorb	100	10.4	0.5	Soundproof	Usually found in power plants. Easily mistaken for a POKé BALL, they have zapped many people.	["Eletrico"]	["Terra"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/100.png	1	101	\N	1
103	Exeggutor	103	120.0	2.0	Chlorophyll	Legend has it that on rare occasions, one of its heads will drop off and continue on as an EXEGGCUTE.	["Grama","Psiquico"]	["Inseto","Voador","Sombrio","Venenoso","Gelo","Fantasma","Fogo"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/103.png	1	\N	102	1
102	Exeggcute	102	2.5	0.4	Chlorophyll	Often mistaken for eggs. When disturbed, they quickly gather and attack in swarms.	["Grama","Psiquico"]	["Inseto","Voador","Sombrio","Venenoso","Gelo","Fantasma","Fogo"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/102.png	1	103	\N	1
105	Marowak	105	45.0	1.0	Rock-head	The bone it holds is its key weapon. It throws the bone skillfully like a boomerang to KO targets.	["Terra"]	["Agua","Grama","Gelo"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/105.png	1	\N	104	1
104	Cubone	104	6.5	0.4	Rock-head	Because it never removes its skull helmet, no one has ever seen this POKéMON's real face.	["Terra"]	["Agua","Grama","Gelo"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/104.png	1	105	\N	1
106	Hitmonlee	106	49.8	1.5	Limber	When in a hurry, its legs lengthen progressively. It runs smoothly with extra long, loping strides.	["Lutador"]	["Voador","Psiquico","Fada"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/106.png	1	\N	\N	1
107	Hitmonchan	107	50.2	1.4	Keen-eye	While apparently doing nothing, it fires punches in lightning fast volleys that are impossible to see.	["Lutador"]	["Voador","Psiquico","Fada"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/107.png	1	\N	\N	1
108	Lickitung	108	65.5	1.2	Own-tempo	Its tongue can be extended like a chameleon's. It leaves a tingling sensation when it licks enemies.	["Normal"]	["Lutador"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/108.png	1	\N	\N	1
110	Weezing	110	9.5	1.2	Levitate	Where two kinds of poison gases meet, 2 KOFFINGs can fuse into a WEEZING over many years.	["Venenoso"]	["Terra","Psiquico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/110.png	1	\N	109	1
109	Koffing	109	1.0	0.6	Levitate	Because it stores several kinds of toxic gases in its body, it is prone to exploding without warning.	["Venenoso"]	["Terra","Psiquico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/109.png	1	110	\N	1
112	Rhydon	112	120.0	1.9	Lightning-rod	Protected by an armor-like hide, it is capable of living in molten lava of 3,600 degrees.	["Terra","Pedra"]	["Aco","Grama","Agua","Lutador","Gelo","Terra"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/112.png	1	\N	111	1
111	Rhyhorn	111	115.0	1.0	Lightning-rod	A POKéMON with a one-track mind. Once it charges,  it won't stop running until it falls asleep.	["Terra","Pedra"]	["Aco","Grama","Agua","Lutador","Gelo","Terra"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/111.png	1	112	\N	1
113	Chansey	113	34.6	1.1	Natural-cure	A rare and elusive POKéMON that is said to bring happiness to those who manage to get it.	["Normal"]	["Lutador"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/113.png	1	\N	\N	1
114	Tangela	114	35.0	1.0	Chlorophyll	The whole body is swathed with wide vines that are similar to sea­ weed. Its vines shake as it walks.	["Grama"]	["Inseto","Voador","Venenoso","Gelo","Fogo"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/114.png	1	\N	\N	1
115	Kangaskhan	115	80.0	2.2	Early-bird	The infant rarely ventures out of its mother's protective pouch until it is 3 years old.	["Normal"]	["Lutador"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/115.png	1	\N	\N	1
117	Seadra	117	25.0	1.2	Poison-point	Capable of swim­ ming backwards by rapidly flapping its wing-like pectoral fins and stout tail.	["Agua"]	["Grama","Eletrico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/117.png	1	\N	116	1
116	Horsea	116	8.0	0.4	Swift-swim	Known to shoot down flying bugs with precision blasts of ink from the surface of the water.	["Agua"]	["Grama","Eletrico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/116.png	1	117	\N	1
118	Goldeen	118	15.0	0.6	Swift-swim	Its tail fin billows like an elegant ballroom dress, giving it the nickname of the Water Queen.	["Agua"]	["Grama","Eletrico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/118.png	1	119	\N	1
119	Seaking	119	39.0	1.3	Swift-swim	In the autumn spawning season, they can be seen swimming powerfully up rivers and creeks.	["Agua"]	["Grama","Eletrico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/119.png	1	\N	118	1
121	Starmie	121	80.0	1.1	Illuminate	Its central core glows with the seven colors of the rainbow. Some people value the core as a gem.	["Agua","Psiquico"]	["Inseto","Sombrio","Grama","Eletrico","Fantasma"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/121.png	1	\N	120	1
120	Staryu	120	34.5	0.8	Illuminate	If its body is torn, it can grow back if the red core remains. The core flashes at midnight.	["Agua"]	["Grama","Eletrico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/120.png	1	121	\N	1
122	Mr-mime	122	54.5	1.3	Soundproof	If interrupted while it is miming, it will slap around the offender with its broad hands.	["Psiquico","Fada"]	["Inseto","Aco","Sombrio","Venenoso","Fantasma"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/122.png	1	\N	\N	1
123	Scyther	123	56.0	1.5	Swarm	With ninja-like agility and speed, it can create the illusion that there is more than one.	["Inseto","Voador"]	["Voador","Pedra","Eletrico","Gelo","Fogo"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/123.png	1	\N	\N	1
124	Jynx	124	40.6	1.4	Oblivious	It seductively wiggles its hips as it walks. It can cause people to dance in unison with it.	["Gelo","Psiquico"]	["Inseto","Aco","Pedra","Sombrio","Lutador","Fantasma","Fogo"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/124.png	1	\N	\N	1
125	Electabuzz	125	30.0	1.1	Static	Normally found near power plants, they can wander away and cause major blackouts in cities.	["Eletrico"]	["Terra"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/125.png	1	\N	\N	1
126	Magmar	126	44.5	1.3	Flame-body	Its body always burns with an orange glow that enables it to hide perfectly among flames.	["Fogo"]	["Terra","Agua","Pedra"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/126.png	1	\N	\N	1
127	Pinsir	127	55.0	1.5	Hyper-cutter	If it fails to crush the victim in its pincers, it will swing it around and toss it hard.	["Inseto"]	["Voador","Fogo","Pedra"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/127.png	1	\N	\N	1
128	Tauros	128	88.4	1.4	Intimidate	When it targets an enemy, it charges furiously while whipping its body with its long tails.	["Normal"]	["Lutador"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/128.png	1	\N	\N	1
130	Gyarados	130	235.0	6.5	Intimidate	Once it begins to rampage, a GYARADOS will burn everything down, even in a harsh storm.	["Agua","Voador"]	["Gelo","Pedra","Grama","Eletrico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/130.png	1	\N	129	1
129	Magikarp	129	10.0	0.9	Swift-swim	In the distant past, it was somewhat stronger than the horribly weak descendants that exist today.	["Agua"]	["Grama","Eletrico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/129.png	1	130	\N	1
131	Lapras	131	220.0	2.5	Water-absorb	A POKéMON that has been over­ hunted almost to extinction. It can ferry people across the water.	["Agua","Gelo"]	["Aco","Pedra","Grama","Eletrico","Lutador","Fogo"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/131.png	1	\N	\N	1
132	Ditto	132	4.0	0.3	Limber	Capable of copying an enemy's genetic code to instantly transform itself into a duplicate of the enemy.	["Normal"]	["Lutador"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/132.png	1	\N	\N	1
134	Vaporeon	134	29.0	1.0	Water-absorb	Lives close to water. Its long tail is ridged with a fin which is often mistaken for a mermaid's.	["Agua"]	["Grama","Eletrico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/134.png	1	\N	133	1
133	Eevee	133	6.5	0.3	Run-away	Its genetic code is irregular. It may mutate if it is exposed to radiation from element STONEs.	["Normal"]	["Lutador"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/133.png	1	134	\N	1
135	Jolteon	135	24.5	0.8	Volt-absorb	It accumulates negative ions in the atmosphere to blast out 10000- volt lightning bolts.	["Eletrico"]	["Terra"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/135.png	1	\N	\N	1
136	Flareon	136	25.0	0.9	Flash-fire	When storing thermal energy in its body, its temperature could soar to over 1600 degrees.	["Fogo"]	["Terra","Agua","Pedra"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/136.png	1	\N	\N	1
137	Porygon	137	36.5	0.8	Trace	A POKéMON that consists entirely of programming code. Capable of moving freely in cyberspace.	["Normal"]	["Lutador"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/137.png	1	\N	\N	1
139	Omastar	139	35.0	1.0	Swift-swim	A prehistoric POKéMON that died out when its heavy shell made it impossible to catch prey.	["Pedra","Agua"]	["Aco","Grama","Eletrico","Agua","Lutador","Terra"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/139.png	1	\N	138	1
138	Omanyte	138	7.5	0.4	Swift-swim	Although long extinct, in rare cases, it can be genetically resurrected from fossils.	["Pedra","Agua"]	["Aco","Grama","Eletrico","Agua","Lutador","Terra"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/138.png	1	139	\N	1
140	Kabuto	140	11.5	0.5	Swift-swim	A POKéMON that was resurrected from a fossil found in what was once the ocean floor eons ago.	["Pedra","Agua"]	["Aco","Grama","Eletrico","Agua","Lutador","Terra"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/140.png	1	141	\N	1
141	Kabutops	141	40.5	1.3	Swift-swim	Its sleek shape is perfect for swim­ ming. It slashes prey with its claws and drains the body fluids.	["Pedra","Agua"]	["Aco","Grama","Eletrico","Agua","Lutador","Terra"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/141.png	1	\N	140	1
142	Aerodactyl	142	59.0	1.8	Rock-head	A Pokémon that roamed the skies in the dinosaur era. Its teeth are like saw blades.	["Pedra","Voador"]	["Aco","Pedra","Grama","Eletrico","Agua","Lutador","Gelo","Terra"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/142.png	1	\N	\N	1
143	Snorlax	143	460.0	2.1	Immunity	Very lazy. Just eats and sleeps. As its rotund bulk builds, it becomes steadily more slothful.	["Normal"]	["Lutador"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/143.png	1	\N	\N	1
144	Articuno	144	55.4	1.7	Pressure	A legendary bird POKéMON that is said to appear to doomed people who are lost in icy mountains.	["Gelo","Voador"]	["Aco","Pedra","Eletrico","Lutador","Gelo","Fogo"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/144.png	4	\N	\N	1
145	Zapdos	145	52.6	1.6	Pressure	A legendary bird POKéMON that is said to appear from clouds while dropping enormous lightning bolts.	["Eletrico","Voador"]	["Terra","Gelo","Pedra","Eletrico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/145.png	4	\N	\N	1
146	Moltres	146	60.0	2.0	Pressure	Known as the legendary bird of fire. Every flap of its wings creates a dazzling flash of flames.	["Fogo","Voador"]	["Pedra","Eletrico","Agua","Gelo","Terra"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/146.png	4	\N	\N	1
147	Dratini	147	3.3	1.8	Shed-skin	Long considered a mythical POKéMON until recently when a small colony was found living underwater.	["Dragao"]	["Fada","Gelo","Dragao"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/147.png	1	148	\N	1
149	Dragonite	149	210.0	2.2	Inner-focus	An extremely rarely seen marine POKéMON. Its intelligence is said to match that of humans.	["Dragao","Voador"]	["Pedra","Eletrico","Dragao","Gelo","Fada"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/149.png	1	\N	148	1
148	Dragonair	148	16.5	4.0	Shed-skin	A mystical POKéMON that exudes a gentle aura. Has the ability to change climate conditions.	["Dragao"]	["Fada","Gelo","Dragao"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/148.png	1	149	147	1
150	Mewtwo	150	122.0	2.0	Pressure	It was created by a scientist after years of horrific gene splicing and DNA engineering experiments.	["Psiquico"]	["Fantasma","Inseto","Sombrio"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/150.png	4	\N	\N	1
151	Mew	151	4.0	0.4	Synchronize	So rare that it is still said to be a mirage by many experts. Only a few people have seen it worldwide.	["Psiquico"]	["Fantasma","Inseto","Sombrio"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/151.png	3	\N	\N	1
152	Darkrai	491	50.5	1.5	Bad Dreams	It chases people and Pokémon from its territory by causing them to experience deep, nightmarish slumbers.	["Escuridao"]	["Lutador","Inseto","Fada"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/491.png	3	\N	\N	1
154	Deoxys	386	50.5	1.5	Bad Dreams	It chases people and Pokémon from its territory by causing them to experience deep, nightmarish slumbers.	["Escuridao"]	["Lutador","Inseto","Fada"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/386.png	3	\N	\N	1
3	Venusaur	3	100.0	2.0	Overgrow	While it basks in the sun, it can convert the light into energy. As a result, it is more powerful in the summertime.	["Grama","Venenoso"]	["Fogo","Gelo","Voador","Psiquico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/003.png	1	\N	2	1
155	Celebi	251	5.0	0.6	Natural Cure	This Pokémon came from the future by crossing over time. It is thought that so long as Celebi appears, a bright and shining future awaits us.	["Psiquico","Grama"]	["Fogo","Gelo","Venenoso","Voador","Inseto","Fantasma","Escuridao"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/251.png	3	\N	\N	1
156	Arceus	493	320.0	3.2	Multitype	According to the legends of Sinnoh, this Pokémon emerged from an egg and shaped all there is in this world. 	["Normal"]	["Psiquico"]	https://www.pokemon.com/static-assets/content-assets/cms2/img/pokedex/full/493.png	3	\N	\N	1
\.


--
-- Data for Name: treinadores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.treinadores (id, nome, email, senha, codigo, "createdAt", "updatedAt") FROM stdin;
b5c0223d-1f2b-428e-82fd-20cbc8eab204	Pedro Santos	ped@gmail.com	$2b$12$2YaPwwNfCdCnmQmPiRPYVOuRAUYw1csHp4Z1KJF7PZi1FaC3Z0KtK	\N	2024-10-25 05:27:37.444	2024-10-25 05:27:37.444
dbc3f5f1-0353-48ad-bc91-db985bb563d8	Ana Costa	ana@gmail.com	$2b$12$OLmVT62Q8BR8jnUqht.jr.VkyCLtrpyBxll30WcMz5SkKnOrgqtKC	285008	2024-10-25 05:27:51.781	2024-10-25 05:28:52.386
\.


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admins_id_seq', 1, true);


--
-- Name: grupos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grupos_id_seq', 4, true);


--
-- Name: pokemons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pokemons_id_seq', 156, true);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: capturas capturas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.capturas
    ADD CONSTRAINT capturas_pkey PRIMARY KEY ("treinadorId", "pokemonId");


--
-- Name: grupos grupos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupos
    ADD CONSTRAINT grupos_pkey PRIMARY KEY (id);


--
-- Name: pokemons pokemons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemons
    ADD CONSTRAINT pokemons_pkey PRIMARY KEY (id);


--
-- Name: treinadores treinadores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treinadores
    ADD CONSTRAINT treinadores_pkey PRIMARY KEY (id);


--
-- Name: admins_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX admins_email_key ON public.admins USING btree (email);


--
-- Name: treinadores_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX treinadores_email_key ON public.treinadores USING btree (email);


--
-- Name: capturas capturas_pokemonId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.capturas
    ADD CONSTRAINT "capturas_pokemonId_fkey" FOREIGN KEY ("pokemonId") REFERENCES public.pokemons(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: capturas capturas_treinadorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.capturas
    ADD CONSTRAINT "capturas_treinadorId_fkey" FOREIGN KEY ("treinadorId") REFERENCES public.treinadores(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: pokemons pokemons_adminId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemons
    ADD CONSTRAINT "pokemons_adminId_fkey" FOREIGN KEY ("adminId") REFERENCES public.admins(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: pokemons pokemons_evolucaoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemons
    ADD CONSTRAINT "pokemons_evolucaoId_fkey" FOREIGN KEY ("evolucaoId") REFERENCES public.pokemons(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: pokemons pokemons_evoluiDeId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemons
    ADD CONSTRAINT "pokemons_evoluiDeId_fkey" FOREIGN KEY ("evoluiDeId") REFERENCES public.pokemons(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: pokemons pokemons_grupoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pokemons
    ADD CONSTRAINT "pokemons_grupoId_fkey" FOREIGN KEY ("grupoId") REFERENCES public.grupos(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

