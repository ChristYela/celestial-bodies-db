--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO postgres;

\connect universe

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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    mass bigint NOT NULL,
    is_supermassive boolean DEFAULT false,
    description text
);


ALTER TABLE public.black_hole OWNER TO postgres;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO postgres;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth numeric(10,2),
    description text,
    has_life boolean,
    age_in_millions_of_years integer NOT NULL,
    is_spherical boolean DEFAULT false
);


ALTER TABLE public.galaxy OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    distance_from_planet numeric(10,2),
    is_spherical boolean DEFAULT false,
    has_life boolean DEFAULT false,
    age_in_millions_of_years integer
);


ALTER TABLE public.moon OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    distance_from_star numeric(10,2),
    planet_type character varying(20),
    has_life boolean DEFAULT false,
    is_spherical boolean DEFAULT true,
    age_in_millions_of_years integer
);


ALTER TABLE public.planet OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    mass integer,
    temperature integer,
    is_spherical boolean DEFAULT true,
    has_life boolean DEFAULT false
);


ALTER TABLE public.star OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.black_hole VALUES (1, 'Sagittarius A*', 1, 4000000, true, 'Supermassive black hole at center of Milky Way');
INSERT INTO public.black_hole VALUES (2, 'TON 618', 3, 66000000000, true, 'One of the most massive black holes known');
INSERT INTO public.black_hole VALUES (3, 'Cygnus X-1', 1, 21, false, 'First confirmed black hole');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0.00, 'Our home galaxy', false, 13600, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2537000.00, 'Nearest spiral galaxy', false, 10000, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3000000.00, 'Third largest in Local Group', false, 11000, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 23000000.00, 'Grand design spiral galaxy', false, 8000, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 28000000.00, 'Unusual appearance with dust lane', false, 9000, true);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 13000000.00, 'Radio galaxy with dust lane', false, 12000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 384400.00, true, false, 4540);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 9377.00, false, false, 4540);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 23463.00, false, false, 4540);
INSERT INTO public.moon VALUES (4, 'Io', 3, 421700.00, true, false, 4540);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 671034.00, true, false, 4540);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 1070412.00, true, false, 4540);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 1882709.00, true, false, 4540);
INSERT INTO public.moon VALUES (8, 'Titan', 4, 1221870.00, true, false, 4540);
INSERT INTO public.moon VALUES (9, 'Enceladus', 4, 238037.00, true, false, 4540);
INSERT INTO public.moon VALUES (10, 'Mimas', 4, 185539.00, true, false, 4540);
INSERT INTO public.moon VALUES (11, 'Tethys', 4, 294619.00, true, false, 4540);
INSERT INTO public.moon VALUES (12, 'Dione', 4, 377396.00, true, false, 4540);
INSERT INTO public.moon VALUES (13, 'Rhea', 4, 527108.00, true, false, 4540);
INSERT INTO public.moon VALUES (14, 'Iapetus', 4, 3560820.00, true, false, 4540);
INSERT INTO public.moon VALUES (15, 'Miranda', 7, 129390.00, true, false, 4540);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 190900.00, true, false, 4540);
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, 266000.00, true, false, 4540);
INSERT INTO public.moon VALUES (18, 'Titania', 7, 435840.00, true, false, 4540);
INSERT INTO public.moon VALUES (19, 'Oberon', 7, 583520.00, true, false, 4540);
INSERT INTO public.moon VALUES (20, 'Triton', 8, 354759.00, true, false, 4540);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1.00, 'Terrestrial', true, true, 4540);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 1.52, 'Terrestrial', false, true, 4540);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 5.20, 'Gas Giant', false, true, 4540);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 9.58, 'Gas Giant', false, true, 4540);
INSERT INTO public.planet VALUES (5, 'Venus', 1, 0.72, 'Terrestrial', false, true, 4540);
INSERT INTO public.planet VALUES (6, 'Mercury', 1, 0.39, 'Terrestrial', false, true, 4540);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 19.22, 'Ice Giant', false, true, 4540);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 30.05, 'Ice Giant', false, true, 4540);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 2, 0.05, 'Terrestrial', false, true, 4800);
INSERT INTO public.planet VALUES (10, 'Sirius B planet', 3, 2.50, 'Gas Giant', false, true, 230);
INSERT INTO public.planet VALUES (11, 'Betelgeuse planet', 4, 5.00, 'Gas Giant', false, true, 1000);
INSERT INTO public.planet VALUES (12, 'Alpha Centauri Bb', 5, 0.04, 'Terrestrial', false, true, 4800);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1, 5778, true, false);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 0, 3042, true, false);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 2, 9940, true, false);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 12, 3500, true, false);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 1, 1, 5790, true, false);
INSERT INTO public.star VALUES (6, 'Vega', 1, 2, 9602, true, false);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: black_hole fk_galaxy_bh; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT fk_galaxy_bh FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

