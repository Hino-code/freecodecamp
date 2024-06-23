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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    orbit_period numeric,
    discovered_by character varying(255)
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_type character varying(255),
    description text,
    distance_from_earth numeric,
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
    name character varying(255) NOT NULL,
    planet_id integer,
    description text,
    age_in_millions_of_years integer NOT NULL,
    has_life boolean NOT NULL
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
    name character varying(255) NOT NULL,
    star_id integer,
    planet_type character varying(255),
    description text,
    has_life boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer,
    star_type character varying(255),
    description text,
    has_planets boolean NOT NULL
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley''s Comet', 'Famous short-period comet', 76, 'Edmond Halley');
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 'One of the most observed comets', 2533, 'Alan Hale and Thomas Bopp');
INSERT INTO public.comet VALUES (3, 'Comet Encke', 'Shortest period among bright comets', 3.3, 'Johann Franz Encke');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 'Our home galaxy', 0, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'Nearest major galaxy', 2537000, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 'Part of the Local Group', 3000000, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 'Famous for its spiral structure', 23000000, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Elliptical', 'Notable for its bright nucleus', 29000000, false);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical', 'A supergiant elliptical galaxy', 53000000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 'Earth''s natural satellite', 4500, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 'One of Mars'' moons', 4500, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 'One of Mars'' moons', 4500, false);
INSERT INTO public.moon VALUES (4, 'Europa', 3, 'Moon of Jupiter', 4500, false);
INSERT INTO public.moon VALUES (5, 'Ganymede', 3, 'Moon of Jupiter', 4500, false);
INSERT INTO public.moon VALUES (6, 'Callisto', 3, 'Moon of Jupiter', 4500, false);
INSERT INTO public.moon VALUES (7, 'Io', 3, 'Moon of Jupiter', 4500, false);
INSERT INTO public.moon VALUES (8, 'Titan', 4, 'Moon of Saturn', 4500, false);
INSERT INTO public.moon VALUES (9, 'Enceladus', 4, 'Moon of Saturn', 4500, false);
INSERT INTO public.moon VALUES (10, 'Triton', 6, 'Moon of Neptune', 4500, false);
INSERT INTO public.moon VALUES (11, 'Proxima b I', 7, 'Moon of Proxima b', 4500, false);
INSERT INTO public.moon VALUES (12, 'Alpha Centauri Bb I', 8, 'Moon of Alpha Centauri Bb', 4500, false);
INSERT INTO public.moon VALUES (13, 'Betelgeuse I a', 9, 'Moon of Betelgeuse I', 4500, false);
INSERT INTO public.moon VALUES (14, 'Betelgeuse II a', 10, 'Moon of Betelgeuse II', 4500, false);
INSERT INTO public.moon VALUES (15, 'Rigel I a', 11, 'Moon of Rigel I', 4500, false);
INSERT INTO public.moon VALUES (16, 'Rigel II a', 12, 'Moon of Rigel II', 4500, false);
INSERT INTO public.moon VALUES (17, 'Earth II', 1, 'A second moon of Earth', 4500, false);
INSERT INTO public.moon VALUES (18, 'Mars III', 2, 'Another moon of Mars', 4500, false);
INSERT INTO public.moon VALUES (19, 'Jupiter III', 3, 'A third moon of Jupiter', 4500, false);
INSERT INTO public.moon VALUES (20, 'Saturn II', 4, 'Another moon of Saturn', 4500, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Terrestrial', 'Our home planet', true, 4500);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'Terrestrial', 'Known as the Red Planet', false, 4500);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 'Gas Giant', 'Largest planet in the Solar System', false, 4500);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 'Gas Giant', 'Famous for its rings', false, 4500);
INSERT INTO public.planet VALUES (5, 'Alpha Centauri Bb', 3, 'Terrestrial', 'An exoplanet orbiting Alpha Centauri B', false, 4500);
INSERT INTO public.planet VALUES (6, 'Proxima b', 5, 'Terrestrial', 'An exoplanet orbiting Proxima Centauri', false, 4500);
INSERT INTO public.planet VALUES (7, 'Betelgeuse I', 4, 'Gas Giant', 'A hypothetical planet around Betelgeuse', false, 4500);
INSERT INTO public.planet VALUES (8, 'Betelgeuse II', 4, 'Terrestrial', 'Another hypothetical planet around Betelgeuse', false, 4500);
INSERT INTO public.planet VALUES (9, 'Rigel I', 6, 'Gas Giant', 'A hypothetical planet around Rigel', false, 4500);
INSERT INTO public.planet VALUES (10, 'Rigel II', 6, 'Terrestrial', 'Another hypothetical planet around Rigel', false, 4500);
INSERT INTO public.planet VALUES (11, 'Proxima c', 5, 'Gas Giant', 'Another exoplanet around Proxima Centauri', false, 4500);
INSERT INTO public.planet VALUES (12, 'Alpha Centauri Bc', 3, 'Terrestrial', 'Another exoplanet around Alpha Centauri B', false, 4500);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-Type', 'Our solar system star', true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'A-Type', 'Brightest star in the night sky', false);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 1, 'G-Type', 'Part of the closest star system', true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 'M-Type', 'A red supergiant', false);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 2, 'M-Type', 'Closest known star to the Sun', true);
INSERT INTO public.star VALUES (6, 'Rigel', 3, 'B-Type', 'A blue supergiant', false);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


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
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

