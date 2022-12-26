--
-- PostgreSQL database dump
--

-- Dumped from database version 14.6
-- Dumped by pg_dump version 14.6

-- Started on 2022-12-26 21:04:15

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
-- TOC entry 231 (class 1255 OID 16395)
-- Name: hastaekle(bigint, character varying, character varying, character); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.hastaekle(tc bigint, ad character varying, soyad character varying, cinsiyet character) RETURNS integer
    LANGUAGE plpgsql
    AS $$ 
BEGIN
    INSERT into "Hasta"("TC","Hasta"."ad","Hasta"."soyad","Hasta"."cinsiyet")
    VALUES(tc,ad,soyad,cinsiyet);
    if found then 
        return 1;
    else 
        return 0;
    end if;
END;
$$;


ALTER FUNCTION public.hastaekle(tc bigint, ad character varying, soyad character varying, cinsiyet character) OWNER TO postgres;

--
-- TOC entry 237 (class 1255 OID 16606)
-- Name: hastasayisiarttir(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.hastasayisiarttir() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
update public."hastaSayi" set sayi=sayi+1;
return new;
end;
$$;


ALTER FUNCTION public.hastasayisiarttir() OWNER TO postgres;

--
-- TOC entry 238 (class 1255 OID 16608)
-- Name: hastasayisiazalt(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.hastasayisiazalt() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
update public."hastaSayi" set sayi=sayi-1;
return new;
end;
$$;


ALTER FUNCTION public.hastasayisiazalt() OWNER TO postgres;

--
-- TOC entry 232 (class 1255 OID 16396)
-- Name: ilacsil(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.ilacsil(ilac character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$ 
BEGIN
    DELETE from "Ilac" WHERE "ilacAdi" = ilac;
    if found then 
        return 1;
    else 
        return 0;
    end if;
END;
$$;


ALTER FUNCTION public.ilacsil(ilac character varying) OWNER TO postgres;

--
-- TOC entry 233 (class 1255 OID 16397)
-- Name: maasode(integer, bigint, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.maasode(miktar integer, tc bigint, mesai integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
begin
	INSERT into "Maas" ("miktar", "personelTC", "mesai")
    VALUES(miktar,tc, mesai);
	
	
end;
$$;


ALTER FUNCTION public.maasode(miktar integer, tc bigint, mesai integer) OWNER TO postgres;

--
-- TOC entry 236 (class 1255 OID 16616)
-- Name: randevusayisiarttir(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.randevusayisiarttir() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
update public."randevuSayi" set sayi=sayi+1;
return new;
end;
$$;


ALTER FUNCTION public.randevusayisiarttir() OWNER TO postgres;

--
-- TOC entry 239 (class 1255 OID 16604)
-- Name: recetesayisiarttir(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.recetesayisiarttir() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
update public."receteSayi" set sayi=sayi+1;
return new;
end;
$$;


ALTER FUNCTION public.recetesayisiarttir() OWNER TO postgres;

--
-- TOC entry 234 (class 1255 OID 16398)
-- Name: toplammaas(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.toplammaas() RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare
	toplam integer;
begin
	toplam:=(select sum("miktar") from "Maas");
	return toplam;
end;
$$;


ALTER FUNCTION public.toplammaas() OWNER TO postgres;

--
-- TOC entry 235 (class 1255 OID 16399)
-- Name: toplammesai(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.toplammesai() RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare
	toplam integer;
begin
	toplam:=(select sum(mesai) from "Maas");
	return toplam;
end;
$$;


ALTER FUNCTION public.toplammesai() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 16400)
-- Name: Ameliyathane; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ameliyathane" (
    "ameliyathaneNo" integer NOT NULL,
    "ameliyatTarihi" date
);


ALTER TABLE public."Ameliyathane" OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16403)
-- Name: Hasta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Hasta" (
    "TC" bigint NOT NULL,
    ad character varying,
    soyad character varying,
    sifre character varying,
    cinsiyet character(1),
    telno integer
);


ALTER TABLE public."Hasta" OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16408)
-- Name: Hastane; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Hastane" (
    "hastaneNo" integer NOT NULL,
    "hastaneAdi" character varying,
    "odaSayisi" integer
);


ALTER TABLE public."Hastane" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16413)
-- Name: HastaneMal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."HastaneMal" (
    "malzemeId" integer NOT NULL,
    "malzemeAdi" character varying,
    miktar integer
);


ALTER TABLE public."HastaneMal" OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16418)
-- Name: Ilac; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Ilac" (
    "ilacId" integer NOT NULL,
    "ilacAdi" character varying
);


ALTER TABLE public."Ilac" OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16423)
-- Name: Klinik; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Klinik" (
    "klinikNo" integer NOT NULL,
    "klinikAdi" character varying
);


ALTER TABLE public."Klinik" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16428)
-- Name: Maas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Maas" (
    "ucretNo" integer NOT NULL,
    miktar integer,
    "personelTC" bigint,
    mesai integer
);


ALTER TABLE public."Maas" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16431)
-- Name: Muayene; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Muayene" (
    "muayeneNo" integer NOT NULL,
    "hastaTC" bigint,
    "doktorTC" bigint
);


ALTER TABLE public."Muayene" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16434)
-- Name: Muayene_muayeneNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Muayene_muayeneNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Muayene_muayeneNo_seq" OWNER TO postgres;

--
-- TOC entry 3462 (class 0 OID 0)
-- Dependencies: 217
-- Name: Muayene_muayeneNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Muayene_muayeneNo_seq" OWNED BY public."Muayene"."muayeneNo";


--
-- TOC entry 218 (class 1259 OID 16435)
-- Name: Nakil; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Nakil" (
    "nakilId" integer NOT NULL,
    "hastaTC" bigint
);


ALTER TABLE public."Nakil" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16438)
-- Name: Personel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Personel" (
    "TC" bigint NOT NULL,
    ad character varying,
    soyad character varying,
    sifre character varying,
    mesai integer,
    durum character varying,
    "klinikNo" integer
);


ALTER TABLE public."Personel" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16443)
-- Name: Randevu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Randevu" (
    "randevuNo" integer NOT NULL,
    "hastaTC" bigint,
    "randevuTarih" date
);


ALTER TABLE public."Randevu" OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16446)
-- Name: Randevu_randevuNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Randevu_randevuNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Randevu_randevuNo_seq" OWNER TO postgres;

--
-- TOC entry 3463 (class 0 OID 0)
-- Dependencies: 221
-- Name: Randevu_randevuNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Randevu_randevuNo_seq" OWNED BY public."Randevu"."randevuNo";


--
-- TOC entry 222 (class 1259 OID 16447)
-- Name: Recete; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Recete" (
    "receteNo" integer NOT NULL,
    "doktorTC" bigint,
    "hastaTC" bigint,
    "ilacId" integer
);


ALTER TABLE public."Recete" OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16450)
-- Name: Recete_Ilac; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Recete_Ilac" (
    "ilacId" integer NOT NULL,
    "receteNo" integer NOT NULL
);


ALTER TABLE public."Recete_Ilac" OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16453)
-- Name: TaburcuOlanlar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TaburcuOlanlar" (
    "taburcuId" integer NOT NULL,
    "hastaTC" bigint
);


ALTER TABLE public."TaburcuOlanlar" OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16456)
-- Name: TaburcuOlanlar_taburcuId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."TaburcuOlanlar_taburcuId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."TaburcuOlanlar_taburcuId_seq" OWNER TO postgres;

--
-- TOC entry 3464 (class 0 OID 0)
-- Dependencies: 225
-- Name: TaburcuOlanlar_taburcuId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."TaburcuOlanlar_taburcuId_seq" OWNED BY public."TaburcuOlanlar"."taburcuId";


--
-- TOC entry 226 (class 1259 OID 16457)
-- Name: YatanHastalar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."YatanHastalar" (
    "yatanNo" integer NOT NULL,
    "klinikNo" integer,
    "yatisTarihi" date,
    "hastaTC" bigint
);


ALTER TABLE public."YatanHastalar" OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16460)
-- Name: YatanHastalar_yatanNo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."YatanHastalar_yatanNo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."YatanHastalar_yatanNo_seq" OWNER TO postgres;

--
-- TOC entry 3465 (class 0 OID 0)
-- Dependencies: 227
-- Name: YatanHastalar_yatanNo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."YatanHastalar_yatanNo_seq" OWNED BY public."YatanHastalar"."yatanNo";


--
-- TOC entry 228 (class 1259 OID 16597)
-- Name: hastaSayi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."hastaSayi" (
    sayi integer
);


ALTER TABLE public."hastaSayi" OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16613)
-- Name: randevuSayi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."randevuSayi" (
    sayi integer
);


ALTER TABLE public."randevuSayi" OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16600)
-- Name: receteSayi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."receteSayi" (
    sayi integer
);


ALTER TABLE public."receteSayi" OWNER TO postgres;

--
-- TOC entry 3244 (class 2604 OID 16461)
-- Name: Muayene muayeneNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Muayene" ALTER COLUMN "muayeneNo" SET DEFAULT nextval('public."Muayene_muayeneNo_seq"'::regclass);


--
-- TOC entry 3245 (class 2604 OID 16462)
-- Name: Randevu randevuNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Randevu" ALTER COLUMN "randevuNo" SET DEFAULT nextval('public."Randevu_randevuNo_seq"'::regclass);


--
-- TOC entry 3246 (class 2604 OID 16463)
-- Name: TaburcuOlanlar taburcuId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TaburcuOlanlar" ALTER COLUMN "taburcuId" SET DEFAULT nextval('public."TaburcuOlanlar_taburcuId_seq"'::regclass);


--
-- TOC entry 3247 (class 2604 OID 16464)
-- Name: YatanHastalar yatanNo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."YatanHastalar" ALTER COLUMN "yatanNo" SET DEFAULT nextval('public."YatanHastalar_yatanNo_seq"'::regclass);


--
-- TOC entry 3435 (class 0 OID 16400)
-- Dependencies: 209
-- Data for Name: Ameliyathane; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Ameliyathane" ("ameliyathaneNo", "ameliyatTarihi") FROM stdin;
1	2021-09-24
2	2021-10-15
3	2021-12-12
\.


--
-- TOC entry 3436 (class 0 OID 16403)
-- Dependencies: 210
-- Data for Name: Hasta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Hasta" ("TC", ad, soyad, sifre, cinsiyet, telno) FROM stdin;
12345678916	rüveyda\n	namlı	756	k	44455577
12345678917	kaya	demirci	159	e	11335566
12345678918	ceyda	taş	152	k	1125448
12345678919	nuri	açık	\N	e	\N
12345678915	zey	kapkara	789	k	55522245
12345678921	merve	Unal	\N	k	\N
12345678999	Michael	Jordan	\N	e	\N
12345678914	yasin	elec	\N	e	\N
99870790852	nihad	asgarov	\N	e	\N
\.


--
-- TOC entry 3437 (class 0 OID 16408)
-- Dependencies: 211
-- Data for Name: Hastane; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Hastane" ("hastaneNo", "hastaneAdi", "odaSayisi") FROM stdin;
1	Ankara şehir hastanesi	550
\.


--
-- TOC entry 3438 (class 0 OID 16413)
-- Dependencies: 212
-- Data for Name: HastaneMal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."HastaneMal" ("malzemeId", "malzemeAdi", miktar) FROM stdin;
1	eldiven	100
2	maske	105
3	dezenfektan	25
4	pamuk	500
\.


--
-- TOC entry 3439 (class 0 OID 16418)
-- Dependencies: 213
-- Data for Name: Ilac; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Ilac" ("ilacId", "ilacAdi") FROM stdin;
1	asprin
2	majezik
3	parol
4	dolorex
5	xyz
6	abc
\.


--
-- TOC entry 3440 (class 0 OID 16423)
-- Dependencies: 214
-- Data for Name: Klinik; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Klinik" ("klinikNo", "klinikAdi") FROM stdin;
1	kulak burun boğaz
2	diş
3	dahiliye
4	genel cerrahi
5	kalp
\.


--
-- TOC entry 3441 (class 0 OID 16428)
-- Dependencies: 215
-- Data for Name: Maas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Maas" ("ucretNo", miktar, "personelTC", mesai) FROM stdin;
1	10000	12345678910	50
2	15000	12345678911	60
\.


--
-- TOC entry 3442 (class 0 OID 16431)
-- Dependencies: 216
-- Data for Name: Muayene; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Muayene" ("muayeneNo", "hastaTC", "doktorTC") FROM stdin;
1	12345678915	12345678910
2	12345678916	12345678911
\.


--
-- TOC entry 3444 (class 0 OID 16435)
-- Dependencies: 218
-- Data for Name: Nakil; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Nakil" ("nakilId", "hastaTC") FROM stdin;
1	12345678915
2	12345678916
\.


--
-- TOC entry 3445 (class 0 OID 16438)
-- Dependencies: 219
-- Data for Name: Personel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Personel" ("TC", ad, soyad, sifre, mesai, durum, "klinikNo") FROM stdin;
12345678910	ahmet	uysal	123	50	doktor	1
12345678911	mahmut	demir	124	45	doktor	2
12345678912	fatma	yazar	456	60	yönetici	3
\.


--
-- TOC entry 3446 (class 0 OID 16443)
-- Dependencies: 220
-- Data for Name: Randevu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Randevu" ("randevuNo", "hastaTC", "randevuTarih") FROM stdin;
1	12345678918	2022-12-25
2	12345678917	2022-12-29
3	12345678916	2022-12-12
\.


--
-- TOC entry 3448 (class 0 OID 16447)
-- Dependencies: 222
-- Data for Name: Recete; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Recete" ("receteNo", "doktorTC", "hastaTC", "ilacId") FROM stdin;
1	12345678910	12345678915	1
2	12345678911	12345678916	2
3	12345678911	12345678917	2
4	12345678910	12345678915	4
7	12345678911	12345678916	1
8	12345678911	12345678917	2
5	12345678910	12345678917	3
9	12345678910	12345678915	2
\.


--
-- TOC entry 3449 (class 0 OID 16450)
-- Dependencies: 223
-- Data for Name: Recete_Ilac; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Recete_Ilac" ("ilacId", "receteNo") FROM stdin;
\.


--
-- TOC entry 3450 (class 0 OID 16453)
-- Dependencies: 224
-- Data for Name: TaburcuOlanlar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TaburcuOlanlar" ("taburcuId", "hastaTC") FROM stdin;
1	12345678915
2	12345678917
\.


--
-- TOC entry 3452 (class 0 OID 16457)
-- Dependencies: 226
-- Data for Name: YatanHastalar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."YatanHastalar" ("yatanNo", "klinikNo", "yatisTarihi", "hastaTC") FROM stdin;
1	1	2021-12-12	12345678915
2	2	2021-12-13	12345678916
\.


--
-- TOC entry 3454 (class 0 OID 16597)
-- Dependencies: 228
-- Data for Name: hastaSayi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."hastaSayi" (sayi) FROM stdin;
9
\.


--
-- TOC entry 3456 (class 0 OID 16613)
-- Dependencies: 230
-- Data for Name: randevuSayi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."randevuSayi" (sayi) FROM stdin;
3
\.


--
-- TOC entry 3455 (class 0 OID 16600)
-- Dependencies: 229
-- Data for Name: receteSayi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."receteSayi" (sayi) FROM stdin;
8
\.


--
-- TOC entry 3466 (class 0 OID 0)
-- Dependencies: 217
-- Name: Muayene_muayeneNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Muayene_muayeneNo_seq"', 2, true);


--
-- TOC entry 3467 (class 0 OID 0)
-- Dependencies: 221
-- Name: Randevu_randevuNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Randevu_randevuNo_seq"', 3, true);


--
-- TOC entry 3468 (class 0 OID 0)
-- Dependencies: 225
-- Name: TaburcuOlanlar_taburcuId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."TaburcuOlanlar_taburcuId_seq"', 2, true);


--
-- TOC entry 3469 (class 0 OID 0)
-- Dependencies: 227
-- Name: YatanHastalar_yatanNo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."YatanHastalar_yatanNo_seq"', 2, true);


--
-- TOC entry 3249 (class 2606 OID 16466)
-- Name: Ameliyathane Ameliyathane_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ameliyathane"
    ADD CONSTRAINT "Ameliyathane_pkey" PRIMARY KEY ("ameliyathaneNo");


--
-- TOC entry 3251 (class 2606 OID 16468)
-- Name: Hasta Hasta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Hasta"
    ADD CONSTRAINT "Hasta_pkey" PRIMARY KEY ("TC");


--
-- TOC entry 3255 (class 2606 OID 16470)
-- Name: HastaneMal HastaneMal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."HastaneMal"
    ADD CONSTRAINT "HastaneMal_pkey" PRIMARY KEY ("malzemeId");


--
-- TOC entry 3253 (class 2606 OID 16472)
-- Name: Hastane Hastane_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Hastane"
    ADD CONSTRAINT "Hastane_pkey" PRIMARY KEY ("hastaneNo");


--
-- TOC entry 3257 (class 2606 OID 16474)
-- Name: Ilac Ilac_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Ilac"
    ADD CONSTRAINT "Ilac_pkey" PRIMARY KEY ("ilacId");


--
-- TOC entry 3259 (class 2606 OID 16476)
-- Name: Klinik Klinik_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Klinik"
    ADD CONSTRAINT "Klinik_pkey" PRIMARY KEY ("klinikNo");


--
-- TOC entry 3261 (class 2606 OID 16478)
-- Name: Maas Maas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Maas"
    ADD CONSTRAINT "Maas_pkey" PRIMARY KEY ("ucretNo");


--
-- TOC entry 3263 (class 2606 OID 16480)
-- Name: Muayene Muayene_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Muayene"
    ADD CONSTRAINT "Muayene_pkey" PRIMARY KEY ("muayeneNo");


--
-- TOC entry 3265 (class 2606 OID 16482)
-- Name: Nakil Nakil_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Nakil"
    ADD CONSTRAINT "Nakil_pkey" PRIMARY KEY ("nakilId");


--
-- TOC entry 3267 (class 2606 OID 16484)
-- Name: Personel Personel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Personel"
    ADD CONSTRAINT "Personel_pkey" PRIMARY KEY ("TC");


--
-- TOC entry 3269 (class 2606 OID 16486)
-- Name: Randevu Randevu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Randevu"
    ADD CONSTRAINT "Randevu_pkey" PRIMARY KEY ("randevuNo");


--
-- TOC entry 3273 (class 2606 OID 16488)
-- Name: Recete_Ilac Recete_Ilac_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recete_Ilac"
    ADD CONSTRAINT "Recete_Ilac_pkey" PRIMARY KEY ("ilacId", "receteNo");


--
-- TOC entry 3271 (class 2606 OID 16490)
-- Name: Recete Recete_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recete"
    ADD CONSTRAINT "Recete_pkey" PRIMARY KEY ("receteNo");


--
-- TOC entry 3275 (class 2606 OID 16492)
-- Name: TaburcuOlanlar TaburcuOlanlar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TaburcuOlanlar"
    ADD CONSTRAINT "TaburcuOlanlar_pkey" PRIMARY KEY ("taburcuId");


--
-- TOC entry 3277 (class 2606 OID 16494)
-- Name: YatanHastalar YatanHastalar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."YatanHastalar"
    ADD CONSTRAINT "YatanHastalar_pkey" PRIMARY KEY ("yatanNo");


--
-- TOC entry 3292 (class 2620 OID 16607)
-- Name: Hasta hastaarttir; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER hastaarttir AFTER INSERT ON public."Hasta" FOR EACH ROW EXECUTE FUNCTION public.hastasayisiarttir();


--
-- TOC entry 3293 (class 2620 OID 16609)
-- Name: Hasta hastaazalt; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER hastaazalt AFTER DELETE ON public."Hasta" FOR EACH ROW EXECUTE FUNCTION public.hastasayisiazalt();


--
-- TOC entry 3294 (class 2620 OID 16617)
-- Name: Randevu randevuarttir; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER randevuarttir AFTER INSERT ON public."Randevu" FOR EACH ROW EXECUTE FUNCTION public.randevusayisiarttir();


--
-- TOC entry 3295 (class 2620 OID 16612)
-- Name: Recete recetearttir; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER recetearttir AFTER INSERT ON public."Recete" FOR EACH ROW EXECUTE FUNCTION public.recetesayisiarttir();


--
-- TOC entry 3278 (class 2606 OID 16495)
-- Name: Maas Maas_personelTC_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Maas"
    ADD CONSTRAINT "Maas_personelTC_fkey" FOREIGN KEY ("personelTC") REFERENCES public."Personel"("TC");


--
-- TOC entry 3279 (class 2606 OID 16500)
-- Name: Muayene Muayene_doktorTC_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Muayene"
    ADD CONSTRAINT "Muayene_doktorTC_fkey" FOREIGN KEY ("doktorTC") REFERENCES public."Personel"("TC");


--
-- TOC entry 3280 (class 2606 OID 16505)
-- Name: Muayene Muayene_hastaTC_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Muayene"
    ADD CONSTRAINT "Muayene_hastaTC_fkey" FOREIGN KEY ("hastaTC") REFERENCES public."Hasta"("TC");


--
-- TOC entry 3281 (class 2606 OID 16510)
-- Name: Nakil Nakil_hastaTC_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Nakil"
    ADD CONSTRAINT "Nakil_hastaTC_fkey" FOREIGN KEY ("hastaTC") REFERENCES public."Hasta"("TC");


--
-- TOC entry 3282 (class 2606 OID 16515)
-- Name: Personel Personel_klinikNo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Personel"
    ADD CONSTRAINT "Personel_klinikNo_fkey" FOREIGN KEY ("klinikNo") REFERENCES public."Klinik"("klinikNo");


--
-- TOC entry 3283 (class 2606 OID 16520)
-- Name: Randevu Randevu_hastaTC_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Randevu"
    ADD CONSTRAINT "Randevu_hastaTC_fkey" FOREIGN KEY ("hastaTC") REFERENCES public."Hasta"("TC");


--
-- TOC entry 3287 (class 2606 OID 16525)
-- Name: Recete_Ilac Recete_Ilac_ilacId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recete_Ilac"
    ADD CONSTRAINT "Recete_Ilac_ilacId_fkey" FOREIGN KEY ("ilacId") REFERENCES public."Ilac"("ilacId");


--
-- TOC entry 3288 (class 2606 OID 16530)
-- Name: Recete_Ilac Recete_Ilac_receteNo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recete_Ilac"
    ADD CONSTRAINT "Recete_Ilac_receteNo_fkey" FOREIGN KEY ("receteNo") REFERENCES public."Recete"("receteNo");


--
-- TOC entry 3284 (class 2606 OID 16535)
-- Name: Recete Recete_doktorTC_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recete"
    ADD CONSTRAINT "Recete_doktorTC_fkey" FOREIGN KEY ("doktorTC") REFERENCES public."Personel"("TC");


--
-- TOC entry 3285 (class 2606 OID 16540)
-- Name: Recete Recete_hastaTC_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recete"
    ADD CONSTRAINT "Recete_hastaTC_fkey" FOREIGN KEY ("hastaTC") REFERENCES public."Hasta"("TC");


--
-- TOC entry 3286 (class 2606 OID 16545)
-- Name: Recete Recete_ilacId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recete"
    ADD CONSTRAINT "Recete_ilacId_fkey" FOREIGN KEY ("ilacId") REFERENCES public."Ilac"("ilacId");


--
-- TOC entry 3289 (class 2606 OID 16550)
-- Name: TaburcuOlanlar TaburcuOlanlar_hastaTC_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TaburcuOlanlar"
    ADD CONSTRAINT "TaburcuOlanlar_hastaTC_fkey" FOREIGN KEY ("hastaTC") REFERENCES public."Hasta"("TC");


--
-- TOC entry 3290 (class 2606 OID 16555)
-- Name: YatanHastalar YatanHastalar_hastaTC_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."YatanHastalar"
    ADD CONSTRAINT "YatanHastalar_hastaTC_fkey" FOREIGN KEY ("hastaTC") REFERENCES public."Hasta"("TC");


--
-- TOC entry 3291 (class 2606 OID 16560)
-- Name: YatanHastalar YatanHastalar_klinikNo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."YatanHastalar"
    ADD CONSTRAINT "YatanHastalar_klinikNo_fkey" FOREIGN KEY ("klinikNo") REFERENCES public."Klinik"("klinikNo");


-- Completed on 2022-12-26 21:04:15

--
-- PostgreSQL database dump complete
--

