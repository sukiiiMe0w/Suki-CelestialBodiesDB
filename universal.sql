--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    type character varying(30) NOT NULL,
    distance_from_earth integer NOT NULL,
    number_of_stars integer NOT NULL,
    has_life boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    diameter_in_km numeric(10,2) NOT NULL,
    description text NOT NULL,
    is_spherical boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    type character varying(30) NOT NULL,
    distance_from_star integer NOT NULL,
    has_life boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: space_station; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_station (
    space_station_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    capacity integer NOT NULL,
    is_operational boolean NOT NULL,
    distance_from_planet numeric(10,2) NOT NULL
);


ALTER TABLE public.space_station OWNER TO freecodecamp;

--
-- Name: space_station_station_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_station_station_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_station_station_id_seq OWNER TO freecodecamp;

--
-- Name: space_station_station_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_station_station_id_seq OWNED BY public.space_station.space_station_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    type character varying(30) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: space_station space_station_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station ALTER COLUMN space_station_id SET DEFAULT nextval('public.space_station_station_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 0, 100000000, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2500000, 1000000000, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3000000, 40000000, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 23000000, 300000000, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 29000000, 80000000, false);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Spiral', 21000000, 100000000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474.80, 'Earth''s only natural satellite', true);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22.40, 'Mars'' innermost moon', true);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12.40, 'Mars'' outermost moon', true);
INSERT INTO public.moon VALUES (4, 'Io', 3, 3643.20, 'Jupiter''s innermost moon', true);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 3121.60, 'Jupiter''s icy moon', true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 5262.40, 'Largest moon of Jupiter', true);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 4820.60, 'Jupiter''s outermost moon', true);
INSERT INTO public.moon VALUES (8, 'Titan', 4, 5149.50, 'Saturn''s largest moon', true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 4, 504.20, 'Saturn''s icy moon', true);
INSERT INTO public.moon VALUES (10, 'Mimas', 4, 396.40, 'Saturn''s smallest moon', true);
INSERT INTO public.moon VALUES (11, 'Oberon', 8, 1522.80, 'Uranus'' second largest moon', true);
INSERT INTO public.moon VALUES (12, 'Titania', 8, 1577.80, 'Uranus'' largest moon', true);
INSERT INTO public.moon VALUES (13, 'Triton', 9, 2706.80, 'Neptune''s largest moon', true);
INSERT INTO public.moon VALUES (14, 'Charon', 10, 1212.20, 'Pluto''s largest moon', true);
INSERT INTO public.moon VALUES (15, 'Proxima Centauri c', 6, 200.00, 'Moon of Proxima Centauri b', true);
INSERT INTO public.moon VALUES (16, 'Rigel c', 7, 300.00, 'Moon of Rigel b', true);
INSERT INTO public.moon VALUES (17, 'Betelgeuse c', 8, 400.00, 'Moon of Betelgeuse b', true);
INSERT INTO public.moon VALUES (18, 'Kepler-442c', 9, 1500.00, 'Moon of Kepler-442b', true);
INSERT INTO public.moon VALUES (19, 'Gliese 581e', 10, 30.00, 'Moon of Gliese 581d', true);
INSERT INTO public.moon VALUES (20, 'HD 209458 c', 11, 200.00, 'Moon of HD 209458 b', true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Terrestrial', 150, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'Terrestrial', 228, false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 'Gas Giant', 778, false);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 'Gas Giant', 1429, false);
INSERT INTO public.planet VALUES (5, 'Alpha Centauri Bb', 2, 'Terrestrial', 10, false);
INSERT INTO public.planet VALUES (6, 'Proxima Centauri b', 5, 'Terrestrial', 4, false);
INSERT INTO public.planet VALUES (7, 'Rigel b', 6, 'Gas Giant', 200, false);
INSERT INTO public.planet VALUES (8, 'Betelgeuse b', 4, 'Gas Giant', 1200, false);
INSERT INTO public.planet VALUES (9, 'Kepler-442b', 3, 'Terrestrial', 1120, false);
INSERT INTO public.planet VALUES (10, 'Gliese 581d', 5, 'Terrestrial', 20, false);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 6, 'Gas Giant', 153, false);
INSERT INTO public.planet VALUES (12, 'Tau Ceti e', 2, 'Terrestrial', 11, false);


--
-- Data for Name: space_station; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_station VALUES (1, 'International Space Station', 1, 10, true, 408.00);
INSERT INTO public.space_station VALUES (2, 'Mars Base Alpha', 2, 50, false, 300.00);
INSERT INTO public.space_station VALUES (3, 'Europa Station', 5, 20, true, 5.00);
INSERT INTO public.space_station VALUES (4, 'Titan Research Outpost', 8, 30, true, 10.00);
INSERT INTO public.space_station VALUES (5, 'Proxima Centauri Base', 6, 15, false, 2.00);
INSERT INTO public.space_station VALUES (6, 'Rigel Observation Deck', 7, 5, true, 15.00);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-Type Main-Sequence', 4600, true);
INSERT INTO public.star VALUES (2, 'Sirius', 2, 'A-Type Main-Sequence', 300, true);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 1, 'G-Type Main-Sequence', 5500, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 3, 'Red Supergiant', 10000, true);
INSERT INTO public.star VALUES (5, 'Rigel', 4, 'Blue Supergiant', 8000, true);
INSERT INTO public.star VALUES (6, 'Vega', 5, 'A-Type Main-Sequence', 450, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: space_station_station_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_station_station_id_seq', 6, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: space_station space_station_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_name_key UNIQUE (name);


--
-- Name: space_station space_station_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_pkey PRIMARY KEY (space_station_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: space_station space_station_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

