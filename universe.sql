--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: blackhole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.blackhole (
    blackhole_id integer NOT NULL,
    name character varying(30) NOT NULL,
    solar_mass_in_millions numeric(6,2),
    distance_in_mly numeric,
    photo_exists boolean NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.blackhole OWNER TO freecodecamp;

--
-- Name: blackhole_bh_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.blackhole_bh_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blackhole_bh_id_seq OWNER TO freecodecamp;

--
-- Name: blackhole_bh_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.blackhole_bh_id_seq OWNED BY public.blackhole.blackhole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_bln_years numeric(3,1),
    galaxy_type character varying(30) NOT NULL,
    distance_in_mly numeric NOT NULL,
    diameter_in_ly integer,
    constellation character varying(30)
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
    name character varying(30) NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_planet_in_km integer,
    planet_id integer,
    discovery_year integer NOT NULL
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
    name character varying(30) NOT NULL,
    in_solar_system boolean NOT NULL,
    distance_from_earth character varying(30),
    star_id integer,
    orbital_period_in_days numeric,
    earth_volume numeric,
    discovery_year integer
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
    name character varying(30) NOT NULL,
    solar_radii numeric NOT NULL,
    galaxy_id integer,
    notes text,
    age_in_bln_years numeric
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
-- Name: blackhole blackhole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole ALTER COLUMN blackhole_id SET DEFAULT nextval('public.blackhole_bh_id_seq'::regclass);


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
-- Data for Name: blackhole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.blackhole VALUES (1, 'Sagittarius A', 4.15, 0.027, true, 2);
INSERT INTO public.blackhole VALUES (2, 'M87', 6500.00, 55, true, 8);
INSERT INTO public.blackhole VALUES (3, '3C 273', 886.00, 2400, false, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 10.0, 'Barred spiral', 2.5, 220000, 'Andromeda');
INSERT INTO public.galaxy VALUES (4, 'Backward galaxy', NULL, 'Unbarred spiral', 111, NULL, 'Centaurus');
INSERT INTO public.galaxy VALUES (5, 'Hoags Object', 12.8, 'Ring', 612.8, 121000, 'Serpens');
INSERT INTO public.galaxy VALUES (6, 'HD1', 13.5, 'Unknown', 33400, NULL, 'Sextans');
INSERT INTO public.galaxy VALUES (7, 'Triangulum galaxy', NULL, 'Spiral', 2.73, 60000, 'Triangulum');
INSERT INTO public.galaxy VALUES (8, 'Messier 87', 13.2, 'Elliptical', 55, 980000, 'Virgo');
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 13.6, 'Barred spiral', 0, 105000, 'Sagitarrius');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, 384400, 3, -2000000);
INSERT INTO public.moon VALUES (2, 'Phobos', false, 9376, 4, 1877);
INSERT INTO public.moon VALUES (3, 'Deimos', false, 23463, 4, 1877);
INSERT INTO public.moon VALUES (4, 'Io', true, 421700, 5, 1810);
INSERT INTO public.moon VALUES (5, 'Europa', true, 670900, 5, 1610);
INSERT INTO public.moon VALUES (6, 'Ganymede', true, 1070400, 5, 1610);
INSERT INTO public.moon VALUES (7, 'Callisto', true, 1882700, 5, 1610);
INSERT INTO public.moon VALUES (8, 'Titan', true, 1221870, 6, 1655);
INSERT INTO public.moon VALUES (9, 'Rhea', true, 527108, 6, 1672);
INSERT INTO public.moon VALUES (10, 'Puck', false, 86004, 7, 1985);
INSERT INTO public.moon VALUES (11, 'Miranda', true, 129390, 7, 1948);
INSERT INTO public.moon VALUES (12, 'Ariel', true, 191020, 7, 1851);
INSERT INTO public.moon VALUES (13, 'Umbriel', true, 266000, 7, 1851);
INSERT INTO public.moon VALUES (14, 'Titania', true, 435910, 7, 1787);
INSERT INTO public.moon VALUES (15, 'Oberon', true, 583520, 7, 1787);
INSERT INTO public.moon VALUES (16, 'Triton', true, 354759, 8, 1846);
INSERT INTO public.moon VALUES (17, 'Nereid', false, 5513940, 8, 1949);
INSERT INTO public.moon VALUES (18, 'Neso', false, 49500000, 8, 2002);
INSERT INTO public.moon VALUES (19, 'Hyperion', false, 1481009, 6, 1848);
INSERT INTO public.moon VALUES (20, 'Iapetus', true, 3560820, 6, 1671);
INSERT INTO public.moon VALUES (21, 'Amalthea', false, 181365, 5, 1892);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', true, '77 million km', 1, 88, 0.056, 1631);
INSERT INTO public.planet VALUES (2, 'Venus', true, '40 million km', 1, 224.7, 0.857, 1610);
INSERT INTO public.planet VALUES (3, 'Earth', true, 'We are here', 1, 365, 1, -2000000);
INSERT INTO public.planet VALUES (4, 'Mars', true, '65 million km', 1, 687, 0.151, 1610);
INSERT INTO public.planet VALUES (5, 'Jupiter', true, '611 million km', 1, 4332.59, 1321, 6001);
INSERT INTO public.planet VALUES (6, 'Saturn', true, '1.4 billion km', 1, 10759.22, 763.59, 1655);
INSERT INTO public.planet VALUES (7, 'Uranus', true, '2.8 billion km', 1, 30688.5, 63.086, 1781);
INSERT INTO public.planet VALUES (8, 'Neptune', true, '4.4 billion km', 1, 60195, 57.74, 1846);
INSERT INTO public.planet VALUES (9, 'AB Aur B', false, '508 light-years', 9, NULL, 2640, 2022);
INSERT INTO public.planet VALUES (10, 'β pic b', false, '63 light-years', 10, 7890, NULL, 2008);
INSERT INTO public.planet VALUES (11, '55 Cnc f', false, '41 light-years', 11, 260, 47, 2005);
INSERT INTO public.planet VALUES (12, 'Proxima b', false, '4.2 light-years', 12, 11.186, 1.07, 2016);
INSERT INTO public.planet VALUES (13, 'Kepler-62e', false, '1200 light-years', 13, 122.39, 4.5, 2013);
INSERT INTO public.planet VALUES (14, 'Kepler-62f', false, '900 light-years', 13, 267.291, 2.8, 2013);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 2, 'The best star in the Universe', 4.6);
INSERT INTO public.star VALUES (5, 'UY Scuti', 1708, 2, 'Red Hypergiant. If placed in the center of solar system, will engulf the orbit of Jupyter', NULL);
INSERT INTO public.star VALUES (7, 'Polaris Aa', 5.4, 2, 'Yellow supergiant in the triple star system named Polaris. Also known as polar star', 0.07);
INSERT INTO public.star VALUES (6, 'VY Canis Majoris', 1420, 2, 'One of the most luminus stars in Milky way', 0.01);
INSERT INTO public.star VALUES (8, 'B416', 113.37, 7, '10 million times more luminous than sun', NULL);
INSERT INTO public.star VALUES (9, 'AB Aurigae', 2.5, NULL, 'A young star', 0.01);
INSERT INTO public.star VALUES (10, 'Beta Pictoris', 1.8, 2, NULL, 0.023);
INSERT INTO public.star VALUES (11, '55 Cancri', 0.943, 2, 'Binary star system', 8.6);
INSERT INTO public.star VALUES (12, 'Proxima Centauri', 0.154, 2, 'The nearest known star to our Sun', 4.85);
INSERT INTO public.star VALUES (13, 'Kepler-62', 0.16, 2, 'The star has five planets. Two of  them in habitable zone', 7);


--
-- Name: blackhole_bh_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.blackhole_bh_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 13, true);


--
-- Name: blackhole blackhole_bh_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_bh_id_key UNIQUE (blackhole_id);


--
-- Name: blackhole blackhole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_pkey PRIMARY KEY (blackhole_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: blackhole blackhole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

