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
-- Name: element; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.element (
    element_id integer NOT NULL,
    name character varying(100) NOT NULL,
    symbol character varying(10) NOT NULL,
    atomic_number integer NOT NULL,
    atomic_weight numeric(10,4),
    is_noble_gas boolean NOT NULL
);


ALTER TABLE public.element OWNER TO postgres;

--
-- Name: element_element_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.element_element_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.element_element_id_seq OWNER TO postgres;

--
-- Name: element_element_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.element_element_id_seq OWNED BY public.element.element_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth numeric(10,2),
    has_black_hole boolean NOT NULL
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
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    composition character varying(50),
    orbital_period_days integer,
    diameter_km numeric(10,2),
    is_spherical boolean NOT NULL
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
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_type character varying(50),
    number_of_moons integer,
    radius_km numeric(10,2),
    has_life boolean NOT NULL
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
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    spectral_type character varying(10),
    age_in_millions_of_years integer,
    mass_solar_masses numeric(10,2),
    is_spherical boolean NOT NULL
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
-- Name: element element_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.element ALTER COLUMN element_id SET DEFAULT nextval('public.element_element_id_seq'::regclass);


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
-- Data for Name: element; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.element VALUES (1, 'Hydrogen', 'H', 1, 1.0080, false);
INSERT INTO public.element VALUES (2, 'Helium', 'He', 2, 4.0026, true);
INSERT INTO public.element VALUES (3, 'Lithium', 'Li', 3, 6.9400, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 13600, 0.00, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral galaxy nearby', 10000, 2.53, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third largest in Local Group', 12000, 3.00, true);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Unbarred spiral galaxy', 13000, 29.35, true);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Grand design spiral galaxy', 400, 23.00, true);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Face-on spiral galaxy', 10000, 20.87, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.moon VALUES (1, 3, 'Moon', 'Rock', 27, 3474.80, true);
INSERT INTO public.moon VALUES (2, 4, 'Phobos', 'Rock and Ice', 0, 22.50, false);
INSERT INTO public.moon VALUES (3, 4, 'Deimos', 'Rock and Ice', 1, 12.40, false);
INSERT INTO public.moon VALUES (4, 5, 'Io', 'Silicate Rock', 2, 3643.20, true);
INSERT INTO public.moon VALUES (5, 5, 'Europa', 'Silicate Rock & Ice', 4, 3121.60, true);
INSERT INTO public.moon VALUES (6, 5, 'Ganymede', 'Silicate & Ice', 7, 5268.20, true);
INSERT INTO public.moon VALUES (7, 5, 'Callisto', 'Rock and Ice', 17, 4820.60, true);
INSERT INTO public.moon VALUES (8, 6, 'Titan', 'Ice and Rock', 16, 5149.50, true);
INSERT INTO public.moon VALUES (9, 6, 'Enceladus', 'Ice', 1, 504.20, true);
INSERT INTO public.moon VALUES (10, 6, 'Mimas', 'Ice', 1, 396.40, true);
INSERT INTO public.moon VALUES (11, 6, 'Iapetus', 'Ice and Rock', 79, 1469.00, true);
INSERT INTO public.moon VALUES (12, 6, 'Rhea', 'Ice', 5, 1527.00, true);
INSERT INTO public.moon VALUES (13, 7, 'Titania', 'Ice and Rock', 9, 1577.80, true);
INSERT INTO public.moon VALUES (14, 7, 'Oberon', 'Ice and Rock', 13, 1522.80, true);
INSERT INTO public.moon VALUES (15, 7, 'Umbriel', 'Ice and Rock', 4, 1169.40, true);
INSERT INTO public.moon VALUES (16, 7, 'Ariel', 'Ice and Rock', 3, 1157.80, true);
INSERT INTO public.moon VALUES (17, 7, 'Miranda', 'Ice and Rock', 1, 471.60, true);
INSERT INTO public.moon VALUES (18, 8, 'Triton', 'Ice and Rock', 6, 2706.80, true);
INSERT INTO public.moon VALUES (19, 8, 'Proteus', 'Rock and Ice', 1, 420.00, false);
INSERT INTO public.moon VALUES (20, 8, 'Nereid', 'Ice', 360, 340.00, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 'Terrestrial', 0, 2439.70, false);
INSERT INTO public.planet VALUES (2, 1, 'Venus', 'Terrestrial', 0, 6051.80, false);
INSERT INTO public.planet VALUES (3, 1, 'Earth', 'Terrestrial', 1, 6371.00, true);
INSERT INTO public.planet VALUES (4, 1, 'Mars', 'Terrestrial', 2, 3389.50, false);
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', 'Gas Giant', 95, 69911.00, false);
INSERT INTO public.planet VALUES (6, 1, 'Saturn', 'Gas Giant', 146, 58232.00, false);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', 'Ice Giant', 28, 25362.00, false);
INSERT INTO public.planet VALUES (8, 1, 'Neptune', 'Ice Giant', 16, 24622.00, false);
INSERT INTO public.planet VALUES (9, 2, 'Proxima b', 'Terrestrial', 0, 7000.00, false);
INSERT INTO public.planet VALUES (10, 2, 'Proxima c', 'Super-Earth', 0, 9000.00, false);
INSERT INTO public.planet VALUES (11, 3, 'Sirius b Planet Alpha', 'Exoplanet', 0, 5000.00, false);
INSERT INTO public.planet VALUES (12, 4, 'Andromeda Prime', 'Exoplanet', 5, 12000.00, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 'G2V', 4600, 1.00, true);
INSERT INTO public.star VALUES (2, 1, 'Proxima Centauri', 'M5.5Ve', 4850, 0.12, true);
INSERT INTO public.star VALUES (3, 1, 'Sirius', 'A1V', 242, 2.06, true);
INSERT INTO public.star VALUES (4, 2, 'Andromeda Alpha', 'B8III', 300, 3.80, true);
INSERT INTO public.star VALUES (5, 3, 'Triangulum Star A', 'O9V', 100, 15.00, true);
INSERT INTO public.star VALUES (6, 4, 'Sombrero Central', 'K0III', 8000, 1.20, true);


--
-- Name: element_element_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.element_element_id_seq', 3, true);


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
-- Name: element element_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.element
    ADD CONSTRAINT element_name_key UNIQUE (name);


--
-- Name: element element_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.element
    ADD CONSTRAINT element_pkey PRIMARY KEY (element_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: TABLE element; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.element TO freecodecamp;


--
-- Name: TABLE galaxy; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.galaxy TO freecodecamp;


--
-- Name: TABLE moon; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.moon TO freecodecamp;


--
-- Name: TABLE planet; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.planet TO freecodecamp;


--
-- Name: TABLE star; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.star TO freecodecamp;


--
-- PostgreSQL database dump complete
--

