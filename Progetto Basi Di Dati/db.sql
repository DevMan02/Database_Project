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

--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


--
-- Name: tipofiume; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tipofiume AS ENUM (
    'Fiume',
    'Emissario',
    'Immissario',
    'Emissario ed Immissario'
);


ALTER TYPE public.tipofiume OWNER TO postgres;

--
-- Name: controlla_attraversamento(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.controlla_attraversamento() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

declare

new_NomeFiume varchar (60);

begin

    SELECT NomeFiume into new_NomeFiume from ATTRAVERSA

    where NomeFiume = new. NomeFiume ;

    IF not found

        THEN

        raise exception 'Il fiume non attraversa nessuna nazione';

        return null ;

    end IF;

end;

$$;


ALTER FUNCTION public.controlla_attraversamento() OWNER TO postgres;

--
-- Name: controlla_bagna(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.controlla_bagna() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

declare

new_NomeLago varchar (20);

begin

    SELECT NomeLago into new_NomeLago from BAGNA

    where NomeLago = new.Nomelago ;

    IF not found

        THEN

        raise exception 'Il lago non bagna nessuna nazione';

        end IF;

end;

$$;


ALTER FUNCTION public.controlla_bagna() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: CORSO D’ ACQUA; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CORSO D’ ACQUA" (
    nomefiume character varying(60) NOT NULL,
    tipo public.tipofiume NOT NULL,
    lunghezzatotale integer NOT NULL,
    nomemare character varying(15),
    fiumeaffluente character varying(60),
    lagoentra character varying(20),
    lagoesce character varying(20)
);


ALTER TABLE public."CORSO D’ ACQUA" OWNER TO postgres;

--
-- Name: attraversa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.attraversa (
    lunghezzatratto smallint NOT NULL,
    nomenazione character varying(20) NOT NULL,
    nomefiume character varying(60) NOT NULL
);


ALTER TABLE public.attraversa OWNER TO postgres;

--
-- Name: bagna; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bagna (
    nomelago character varying(20) NOT NULL,
    nomenazione character varying(20) NOT NULL,
    superficiebagnata smallint NOT NULL
);


ALTER TABLE public.bagna OWNER TO postgres;

--
-- Name: confina; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.confina (
    nomenazione character varying(20) NOT NULL,
    nomenazione2 character varying(20) NOT NULL
);


ALTER TABLE public.confina OWNER TO postgres;

--
-- Name: lago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lago (
    nomelago character varying(20) NOT NULL,
    "profondità" smallint NOT NULL,
    superficietotale smallint NOT NULL
);


ALTER TABLE public.lago OWNER TO postgres;

--
-- Name: mare; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mare (
    nomemare character varying(30) NOT NULL
);


ALTER TABLE public.mare OWNER TO postgres;

--
-- Name: nazione; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nazione (
    nomenazione character varying(20) NOT NULL,
    capitale character varying(20) NOT NULL,
    superficie integer NOT NULL,
    popolazione real NOT NULL
);


ALTER TABLE public.nazione OWNER TO postgres;