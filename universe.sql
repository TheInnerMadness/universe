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
-- Name: anomaly; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.anomaly (
    anomaly_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer NOT NULL,
    type text,
    is_active boolean NOT NULL,
    danger_level integer NOT NULL,
    discovery_log text
);


ALTER TABLE public.anomaly OWNER TO freecodecamp;

--
-- Name: anomaly_anomaly_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.anomaly_anomaly_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.anomaly_anomaly_id_seq OWNER TO freecodecamp;

--
-- Name: anomaly_anomaly_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.anomaly_anomaly_id_seq OWNED BY public.anomaly.anomaly_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    ag_in_millions_years numeric NOT NULL,
    number_of_stars integer NOT NULL,
    is_active boolean NOT NULL,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_planet_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_planet_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer NOT NULL,
    diameter_km numeric NOT NULL,
    has_atmosphere boolean NOT NULL,
    orbital_period_days integer NOT NULL,
    surface_composition text
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
    name character varying NOT NULL,
    star_id integer NOT NULL,
    radius_km numeric NOT NULL,
    has_life boolean NOT NULL,
    orbital_period_days integer NOT NULL,
    composition text
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
    name character varying(40) NOT NULL,
    galaxy_id integer NOT NULL,
    mass_in_solar_units numeric NOT NULL,
    temperture_kelvin integer NOT NULL,
    is_main_sequence boolean NOT NULL,
    spectral_type text
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
-- Name: anomaly anomaly_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.anomaly ALTER COLUMN anomaly_id SET DEFAULT nextval('public.anomaly_anomaly_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_planet_id_seq'::regclass);


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
-- Data for Name: anomaly; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.anomaly VALUES (1, 'Temporal Distortion', 1, 'Time Loop', true, 8, 'Temporal anomaly discovered near the galactic center. Early tests suggest time moves slower within the anomaly, but the exact nature remains elusive.');
INSERT INTO public.anomaly VALUES (2, 'Gravitational Rift', 1, 'Gravity Well', true, 7, 'A massive gravitational rift detected. Ships experience intense gravitational forces as they get closer, making escape difficult.');
INSERT INTO public.anomaly VALUES (3, 'Dark Matter Veil', 1, 'Energy Field', true, 6, 'We’ve discovered a large pocket of dark matter near the galactic edge. Initial scans show it disrupts normal communication channels.');
INSERT INTO public.anomaly VALUES (4, 'Dimensional Fracture', 2, 'Dimensional Rift', true, 9, 'The anomaly seems to be a dimensional fracture. A few ships have gone missing after entering the region. We are monitoring for any strange changes.');
INSERT INTO public.anomaly VALUES (5, 'Quantum Singularity', 2, 'Quantum Anomaly', true, 10, 'A quantum singularity was detected. Its mass changes unpredictably, and it seems to distort time and space around it.');
INSERT INTO public.anomaly VALUES (6, 'Void Echoes', 2, 'Energy Echo', true, 5, 'There’s an eerie resonance detected in deep space. Some say it’s the ghost of a lost civilization, others claim it’s just space noise.');
INSERT INTO public.anomaly VALUES (7, 'Antimatter Storm', 3, 'Antimatter Event', true, 8, 'An antimatter storm was detected on the edge of Triangulum. Its energy field is capable of disintegrating anything caught within.');
INSERT INTO public.anomaly VALUES (8, 'Hypernova Remnant', 3, 'Stellar Anomaly', true, 6, 'The remains of a hypernova create strange magnetic waves. It’s disrupting communications and causing havoc for ships navigating too close.');
INSERT INTO public.anomaly VALUES (9, 'Energy Sinkhole', 3, 'Energy Absorption', true, 7, 'We’ve identified an energy sinkhole near the Triangulum edge. Any ship within proximity loses all energy and power systems are knocked out.');
INSERT INTO public.anomaly VALUES (10, 'Inverted Nebula', 4, 'Nebula Distortion', true, 6, 'The nebula near Sombrero is unlike any we’ve seen. It radiates strange energy and causes anomalies in navigation systems.');
INSERT INTO public.anomaly VALUES (11, 'Frozen Time Bubble', 4, 'Temporal Bubble', true, 7, 'A strange bubble of frozen time has been observed in the Sombrero galaxy. Ships entering seem to be stuck in stasis.');
INSERT INTO public.anomaly VALUES (12, 'Starship Graveyard', 4, 'Spatial Distortion', true, 5, 'A graveyard of lost starships. All of them seem to have been trapped in some form of spatial distortion. Nothing can leave the area unscathed.');
INSERT INTO public.anomaly VALUES (13, 'Tidal Time Flux', 5, 'Temporal Tidal Wave', true, 8, 'The anomaly is a tidal time flux, where time itself is being distorted in periodic waves. Anyone who survives the wave has either aged or regressed.');
INSERT INTO public.anomaly VALUES (14, 'Dimensional Whirlpool', 5, 'Dimensional Rift', true, 9, 'A dimensional whirlpool is located in the heart of the Whirlpool galaxy. Once inside, there is no guarantee you’ll return to the same reality.');
INSERT INTO public.anomaly VALUES (15, 'Energy Amplification Zone', 5, 'Energy Surge', true, 7, 'A zone of immense energy amplification. Ships entering the zone experience extreme energy surges that could cause devastating consequences.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 10000, 100000, true, 'The closest galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 13000, 300000, true, 'Our home galaxy, containing billions of stars.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 8000, 50000, true, 'A smaller galaxy located near Andromeda.');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 11000, 200000, false, 'A galaxy known for its spiral shape.');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 7000, 80000, true, 'A galaxy known for its bright nucleus.');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 9000, 150000, true, 'A galaxy characterized by its vibrant arms.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474.8, false, 27, 'Rocky');
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22.2, false, 0, 'Rocky');
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12.4, false, 1, 'Rocky');
INSERT INTO public.moon VALUES (4, 'Europa', 9, 3121.6, false, 4, 'Icy');
INSERT INTO public.moon VALUES (5, 'Titan', 10, 5150, true, 16, 'Icy');
INSERT INTO public.moon VALUES (6, 'Io', 11, 1821.6, false, 2, 'Sulfuric');
INSERT INTO public.moon VALUES (7, 'Callisto', 9, 4800, false, 17, 'Icy');
INSERT INTO public.moon VALUES (8, 'Ganymede', 9, 5268, true, 7, 'Icy');
INSERT INTO public.moon VALUES (9, 'Mimas', 6, 396, false, 23, 'Rocky');
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, 504, true, 34, 'Icy');
INSERT INTO public.moon VALUES (11, 'Triton', 7, 2706, true, 6, 'Icy');
INSERT INTO public.moon VALUES (12, 'Nereid', 7, 340, false, 360, 'Rocky');
INSERT INTO public.moon VALUES (13, 'Hyperion', 6, 270, false, 21, 'Rocky');
INSERT INTO public.moon VALUES (14, 'Miranda', 7, 471.6, false, 35, 'Rocky');
INSERT INTO public.moon VALUES (15, 'Rhea', 6, 1528.5, true, 5, 'Icy');
INSERT INTO public.moon VALUES (16, 'Iapetus', 6, 1469.5, false, 79, 'Icy');
INSERT INTO public.moon VALUES (17, 'Phoebe', 6, 213.5, false, 550, 'Rocky');
INSERT INTO public.moon VALUES (18, 'Ariel', 7, 1158.8, false, 34, 'Rocky');
INSERT INTO public.moon VALUES (19, 'Umbriel', 7, 1170.6, false, 41, 'Rocky');
INSERT INTO public.moon VALUES (20, 'Luna', 1, 3474.8, false, 27, 'Regolith, Rocky Terrain, Craters');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4, 6371, true, 365, 'Rocky');
INSERT INTO public.planet VALUES (2, 'Mars', 4, 3389, false, 687, 'Rocky');
INSERT INTO public.planet VALUES (3, 'Venus', 4, 6052, false, 225, 'Rocky');
INSERT INTO public.planet VALUES (4, 'Jupiter', 5, 69911, false, 4333, 'Gaseous');
INSERT INTO public.planet VALUES (5, 'Saturn', 5, 58232, false, 10759, 'Gaseous');
INSERT INTO public.planet VALUES (6, 'Uranus', 5, 25362, false, 30687, 'Gaseous');
INSERT INTO public.planet VALUES (7, 'Neptune', 5, 24622, false, 60190, 'Gaseous');
INSERT INTO public.planet VALUES (8, 'Mercury', 4, 2439, false, 88, 'Rocky');
INSERT INTO public.planet VALUES (9, 'Titan', 5, 5150, false, 183, 'Rocky');
INSERT INTO public.planet VALUES (10, 'Io', 5, 1821.6, false, 2, 'Rocky');
INSERT INTO public.planet VALUES (11, 'Europa', 5, 1560.8, false, 4, 'Rocky');
INSERT INTO public.planet VALUES (12, 'Exoplanet X', 6, 12000, false, 700, 'Gaseous');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 2, 2.1, 9940, true, 'A1V');
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 2, 1.1, 5790, true, 'G2V');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 10.0, 3500, false, 'M1-M2');
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 2, 0.1, 3050, true, 'M5.5V');
INSERT INTO public.star VALUES (5, 'Rigel', 1, 21.0, 12000, false, 'B8Ia');
INSERT INTO public.star VALUES (6, 'Antares', 3, 12.0, 3300, false, 'M1.5Iab');


--
-- Name: anomaly_anomaly_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.anomaly_anomaly_id_seq', 15, true);


--
-- Name: galaxy_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_planet_id_seq', 6, true);


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
-- Name: anomaly anomaly_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.anomaly
    ADD CONSTRAINT anomaly_name_key UNIQUE (name);


--
-- Name: anomaly anomaly_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.anomaly
    ADD CONSTRAINT anomaly_pkey PRIMARY KEY (anomaly_id);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


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
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


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
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


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
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: anomaly anomaly_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.anomaly
    ADD CONSTRAINT anomaly_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

