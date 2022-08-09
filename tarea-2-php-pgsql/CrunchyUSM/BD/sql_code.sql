--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

-- Started on 2022-07-20 23:37:10

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
-- TOC entry 210 (class 1259 OID 16781)
-- Name: anime; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.anime (
    anime_name character varying(64) NOT NULL,
    anime_synopsis character varying(3200),
    anime_airdate date NOT NULL,
    anime_picture character varying(512),
    anime_avg_score real,
    ismovie boolean
);


ALTER TABLE public.anime OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16801)
-- Name: animeinlist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.animeinlist (
    from_list bigint NOT NULL,
    time_added time without time zone NOT NULL,
    date_added date NOT NULL,
    anime_in_list_id character varying(64) NOT NULL,
    creator_name character varying(32)
);


ALTER TABLE public.animeinlist OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16800)
-- Name: animeinlist_from_list_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.animeinlist_from_list_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.animeinlist_from_list_seq OWNER TO postgres;

--
-- TOC entry 3378 (class 0 OID 0)
-- Dependencies: 213
-- Name: animeinlist_from_list_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.animeinlist_from_list_seq OWNED BY public.animeinlist.from_list;


--
-- TOC entry 220 (class 1259 OID 16853)
-- Name: calificacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.calificacion (
    score_id bigint NOT NULL,
    which_anime character varying(64) NOT NULL,
    which_user character varying(32) NOT NULL,
    score_value integer NOT NULL,
    CONSTRAINT valid_number CHECK ((score_value <= 100))
);


ALTER TABLE public.calificacion OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16852)
-- Name: calificacion_score_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.calificacion_score_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.calificacion_score_id_seq OWNER TO postgres;

--
-- TOC entry 3379 (class 0 OID 0)
-- Dependencies: 219
-- Name: calificacion_score_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.calificacion_score_id_seq OWNED BY public.calificacion.score_id;


--
-- TOC entry 218 (class 1259 OID 16834)
-- Name: comentario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comentario (
    comment_id bigint NOT NULL,
    which_anime character varying(64) NOT NULL,
    which_user character varying(32) NOT NULL,
    comment_text character varying(1024)
);


ALTER TABLE public.comentario OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16833)
-- Name: comentario_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comentario_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comentario_comment_id_seq OWNER TO postgres;

--
-- TOC entry 3380 (class 0 OID 0)
-- Dependencies: 217
-- Name: comentario_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comentario_comment_id_seq OWNED BY public.comentario.comment_id;


--
-- TOC entry 215 (class 1259 OID 16815)
-- Name: genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genre (
    genre_name character varying(16) NOT NULL
);


ALTER TABLE public.genre OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16820)
-- Name: genreofanime; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genreofanime (
    which_genre character varying(16) NOT NULL,
    which_anime character varying(64) NOT NULL
);


ALTER TABLE public.genreofanime OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16789)
-- Name: playlist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playlist (
    playlist_id bigint NOT NULL,
    creator_name character varying(32) NOT NULL,
    playlist_name character varying(64) NOT NULL
);


ALTER TABLE public.playlist OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16788)
-- Name: playlist_playlist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.playlist_playlist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.playlist_playlist_id_seq OWNER TO postgres;

--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 211
-- Name: playlist_playlist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.playlist_playlist_id_seq OWNED BY public.playlist.playlist_id;


--
-- TOC entry 209 (class 1259 OID 16776)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    user_name character varying(32) NOT NULL,
    user_email character varying(128) NOT NULL,
    user_password character varying(128) NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 3196 (class 2604 OID 16804)
-- Name: animeinlist from_list; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animeinlist ALTER COLUMN from_list SET DEFAULT nextval('public.animeinlist_from_list_seq'::regclass);


--
-- TOC entry 3198 (class 2604 OID 16856)
-- Name: calificacion score_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calificacion ALTER COLUMN score_id SET DEFAULT nextval('public.calificacion_score_id_seq'::regclass);


--
-- TOC entry 3197 (class 2604 OID 16837)
-- Name: comentario comment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentario ALTER COLUMN comment_id SET DEFAULT nextval('public.comentario_comment_id_seq'::regclass);


--
-- TOC entry 3195 (class 2604 OID 16792)
-- Name: playlist playlist_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlist ALTER COLUMN playlist_id SET DEFAULT nextval('public.playlist_playlist_id_seq'::regclass);


--
-- TOC entry 3362 (class 0 OID 16781)
-- Dependencies: 210
-- Data for Name: anime; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.anime (anime_name, anime_synopsis, anime_airdate, anime_picture, anime_avg_score, ismovie) FROM stdin;
Gintama	La historia tiene lugar en Edo —antiguo nombre por el cual era \r\nconocida la ciudad de Tokio—, la cual ha sido conquistada por \r\nunos extraños seres extraterrestres llamados Amanto. Los samuráis \r\nde entonces lucharon contra los invasores, pero los Amanto los \r\nderrotaron y prohibieron a todas las personas de la ciudad portar \r\nespadas. La obra se centra en las aventuras de un samurái de \r\ncabello plateado conocido como Gintoki Sakata, quien ayuda a un \r\nadolescente llamado Shinpachi Shimura a salvar a su hermana de un \r\ngrupo de alienígenas que querían hacerla parte de un burdel. \r\nImpresionado con Gintoki, Shinpachi decide convertirse en su aprendiz \r\ny trabajar con él como un profesional independiente a fin de poder \r\npagar la renta mensual del alquiler de Gintoki.	2015-04-08	\N	\N	f
Fullmetal Alchemist: Brotherhood	La historia se centra en los hermanos Edward y Alphonse Elric, quienes viven en un pequeño pueblo de un país ficticio llamado Amestris.9​ Su padre, Hohenheim, se había marchado de su casa cuando aún eran pequeños y años más tarde su madre, Trisha Elric, muere por una enfermedad terminal, dejando a los hermanos Elric solos. Después de la muerte de su madre, Edward decide resucitarla a través de la alquimia,23​ una de las técnicas científicas más avanzadas conocidas por el hombre. Sin embargo, el intento resulta fallido y como consecuencia Edward pierde su pierna izquierda, y Alphonse su cuerpo. En un esfuerzo por salvar a su hermano, Edward sacrifica su brazo derecho para sellar el alma de Alphonse en una armadura.24​ Tras esto, un alquimista llamado Roy Mustang visita a los hermanos Elric y le propone a Edward convertirse en un miembro de las Fuerzas Armadas del Estado y así encontrar una forma de recuperar sus cuerpos. Posteriormente la pierna izquierda y el brazo derecho de Edward son sustituidos por un Automail, un tipo de prótesis avanzada creada por su amiga Winry Rockbell y la abuela de esta, Pinako.	2009-08-26	\N	\N	f
Hunter X Hunter (2011)	Doce años antes del inicio de la historia, Ging Freecss \r\nabandonó a su hijo Gon en manos de su tía Mito en Isla \r\nBallena. Gon, quien siempre creyó que sus padres habían \r\nmuerto, descubre un día gracias al aprendiz de su padre, \r\nKite, que este aún se encuentra con vida y se ha convertido \r\nen uno de los mejores cazadores, individuos de élite y \r\nacreditados para el rastreo de tesoros secretos, bestias \r\nexóticas e, incluso, otros individuos.8 Motivado por esta \r\nrevelación, Gon decide dejar su hogar y presentarse al \r\nexamen de cazador,​ una serie de desafíos que buscan probar \r\nlas habilidades, supervivencia y trabajo en equipo de sus \r\nparticipantes.​ Durante el examen, Gon conoce y se hace \r\namigo de tres de los otros participantes: Killua Zoldyck, \r\nun joven de la misma edad que el protagonista, quién abandonó \r\nsu anterior vida como miembro de una de las más famosa familia \r\nde asesinos;​ Leorio, quién busca ser cazador para poder pagar \r\nsus estudios de medicina; y Kurapika, el último miembro del clan \r\nKurta, que desea convertirse en cazador con el fin de vengar a \r\nsu familia y recuperar los ojos escarlata que fueron robados de \r\nsus cuerpos por un grupo de mercenarios conocidos como Genei\r\nRyodan. \t	2011-10-02	\N	\N	f
Shingeki no Kyojin	La población humana fue capaz de vivir en una paz incómoda \r\ndentro de las murallas hasta el día en que apareció un enorme \r\ntitán quien logra crear una grieta en el Muro María y permitió \r\nla entrada de otros titanes a la ciudad, lo que provocó la \r\nevacuación masiva de toda la población superviviente hacia \r\nel interior de la muralla intermedia de Rose. Durante dicho \r\nataque, Eren observa aterrado como su madre es devorada por \r\nun titán mientras que su padre desapareció de forma extraña \r\n—más adelante se reveló que se hizo devorar por Eren para \r\ntransferirle sus poderes de titán— lo que lo dejó solo con \r\nMikasa y Armin como sus únicos compañeros. Eren jura vengar \r\nla muerte de su madre y la pérdida de su ciudad, por lo que \r\nse enlista en el Ejército de las Murallas junto con sus amigos. 	2013-09-28	\N	\N	f
Boku No Pico	La historia sigue a Pico, un niño prepúber que cada verano \r\ntrabaja en el bar de su abuelo. En una de estas ocasiones, \r\nPico conoce a un hombre llamado Tamotsu que lo seduce creyendo \r\nque era una niña y pronto inician una relación sexual. También \r\nse relata las historias de Pico con sus amigos Chico y Coco. 	2006-09-07	\N	\N	f
Code Geass	10 de agosto de 2010 del calendario imperial, el Sacro Imperio \r\nde Britannia declaró la guerra a Japón. Sobrepasó a las fuerzas \r\njaponesas y conquistó el país en menos de un mes, haciendo uso \r\nde sus nuevas armas robóticas, los Knightmare Frames. Japón \r\nperdió su libertad y derechos, y la ahora colonia pasó a ser \r\nllamada "Área 11". Sus habitantes, ahora llamados "Elevens" \r\n(En español: Onces), fueron obligados a sobrevivir en guetos. \r\nSin embargo aún persisten grupos que se resisten y luchan \r\ncontra el Imperio por la independencia de Japón. \t	2008-04-06	\N	\N	f
Mob Psycho	Shigeo Kageyama es un estudiante de secundaria promedio conocido como "Mob" \r\n(que literalmente significa personaje de fondo), por carecer de un sentido \r\nde presencia. A pesar de parecer una persona discreta, Mob es en realidad \r\nun poderoso psíquico. Mientras crece, Mob se da cuenta de que sus poderes \r\nse hacen cada vez más poderosos y por ende, también más peligrosos. Para \r\nevitar que sus poderes se salgan de control, constantemente vive una vida \r\npoco emocional y no permite que sus emociones le dominen. Mob quiere vivir \r\nsu vida como los otros, pero una gran cantidad de problemas vienen hacia él.\r\nCon sus emociones suprimidas creciendo poco a poco dentro de él, su poder \r\namenaza con ir más allá de sus límites. 	2018-01-18	\N	\N	f
Shimoneta to Iu Gainen ga Sonzai Shinai Taikutsu na Sekai	En un mundo distópico, las autoridades japonesas están reprimiendo \r\ncualquier actividad inmoral percibida desde usar el arriesgado \r\nlenguaje hasta distribuir materiales obscenos en el país, hasta \r\nel punto en donde todos los ciudadanos son obligados a usar \r\ndispositivos de alta tecnología llamados Peace Makers (fabricantes \r\nde paz), que pueden analizar en todo momento el vocabulario de la \r\npersona y los movimientos de las manos y/o cualquiera de otras \r\nacciones que podrían violar la nueva ley. Un nuevo estudiante de \r\npreparatoria llamado Tanukichi Okuma entra a una "Escuela de moral \r\npública" de élite líder en el país, para encontrarse con su amor \r\nplatónico y presidenta del consejo estudiantil de esa escuela, \r\nAnna Nishikinomiya. Sin embargo, Tanukichi rápidamente se encuentra \r\nenlazado con el terrorista perverso "blue snow" quien lo "secuestra" \r\ny obliga a unirse a su organización, SOX, en la creación y distribución \r\nde material pornográfico a través de toda la ciudad. 	2015-07-04	\N	\N	f
Ouran High School Host Club	Haruhi Fujioka es una estudiante becada en la prestigiosa \r\nAcademia Ouran, una escuela secundaria ficticia para niños \r\nricos ubicada en Bunkyo, Tokio. Buscando un lugar tranquilo \r\nen el cual estudiar, Haruhi tropieza con el club de anfitriones \r\nde dicha escuela, un grupo de seis estudiantes varones que se \r\nreúnen para entretener a sus "clientes". Durante el encuentro, \r\nHaruhi accidentalmente tropieza y rompe un florero antiguo \r\nvalorado en Y 8,000,000 (80,000 dólares, de acuerdo con la \r\ntraducción oficial de Viz Media).​ Para pagar el costo del \r\nflorero, se le dice que debe trabajar en el club como el \r\nchico de los recados. Sin embargo, la apariencia ambigua de \r\nHaruhi hace que sea confundida por los miembros como un \r\nestudiante varón y termina por convertirse en uno de los \r\nanfitriones del club, luego de que notasen que sabía como \r\nentretener a las chicas. Haruhi acepta convertirse en \r\nanfitrión debido a que piensa que esto le ayudará a pagar \r\nsu deuda más rápido. Los miembros del club descubren su \r\nverdadero sexo uno por uno, pero mantienen este hecho en \r\nsecreto. 	2006-09-30	\N	\N	f
Seishun Buta Yaro wa Bunny Girl Senpai no Yume wo Mina	La vida de Sakuta Azusagawa da un giro inesperado cuando \r\nconoce a la actriz adolescente Mai Sakurajima, quien se \r\npasea por una biblioteca vestida como una conejita. Mai \r\nestá intrigada de que Sakuta sea el único que puede verla, \r\nya que otras personas no pueden, incluso cuando se viste \r\nnormalmente o intenta mantenerse alejada de la vida de las \r\ncelebridades. Llamando a este fenómeno "Síndrome de la \r\nPubertad", Sakuta decide resolver este misterio, mientras \r\ncontinúa acercándose a Mai y conoce a otras chicas que \r\ntambién sufren el "Síndrome de la Pubertad". 	2018-10-04	\N	\N	f
Tate no Yusha no Nariagari	Naofumi Iwatani fue invocado en un mundo paralelo junto\r\na otras tres personas para convertirse en los héroes de \r\nese mundo. Cada uno de los héroes fue equipado con su \r\npropia arma legendaria cuando fueron convocados. Naofumi \r\nrecibió el Escudo, el único equipo defensivo, mientras \r\nque los otros recibieron armas capaces de atacar. Debido \r\na la falta de carisma y experiencia, Naofumi terminó con \r\nuna sola compañera de equipo la cual lo traiciona \r\nhaciéndolo pasar como un criminal haciendo que tanto su \r\nreputación como su personalidad a ojos de otros y así \r\nmismo cambien a un ser antipático y deprimente perdiendo \r\nla confianza en los demás, debido a que su arma es \r\ndefensiva Naofumi consigue aliadas para ayudarlo en combate, \r\ncomo Raphtalia una semi-humana mapache, Filo una filolial \r\ny Melty una princesa guerrera, que pronto formarán algo \r\nmás que un simple grupo. 	2019-01-09	\N	\N	f
Sword Art Online	La historia se desarrolla en el año 2022, cuando un videojuego de rol \r\nmultijugador masivo en línea de realidad virtual —VRMMORPG, por sus \r\nsiglas en inglés (Virtual Reality Massive Multiplayer Online Role \r\nPlaying Game)— llamado Sword Art Online acaba de ser lanzado. Allí, \r\nlos jugadores pueden entrar a un mundo denominado Aincrad y controlar \r\nsus avatares tal como lo harían con sus cuerpos reales por medio del \r\nNerveGear, un casco de realidad virtual capaz de estimular sus cinco \r\nsentidos a través de sus cerebros. Sin embargo, los jugadores se dan \r\ncuenta de que no pueden salir del videojuego; poco tiempo después, el \r\ncreador de SAO, Akihiko Kayaba, aparece y les informa que si mueren \r\nen el mundo virtual también lo harán en el mundo real, así como les \r\nrevela que para poder salir del juego primero deben superar los cien \r\npisos del juego.​ A medida que los jugadores tratan de hacer frente a \r\nsu situación, dos de ellos Kazuto Kirigaya y Asuna Yuuki, están \r\ndecididos a ganar y ser libres.	2012-07-07	\N	\N	f
Tonari no Totoro	Satsuki y Mei descubren que la casa está habitada por diminutas \r\ncriaturas de hollín llamadas susuwatari —espíritus pequeños, oscuros y \r\nsimilares al hollín que viven en lugares abandonados—. Cuando las niñas y su \r\npadre se sienten cómodos en su nueva casa y los susuwatari observan que son \r\npersonas buenas, estos abandonan la residencia, presumiblemente en busca de \r\notro sitio para vivir. Un día, Mei observa a una criatura similar a un conejo \r\nblanco y lo sigue por debajo de la casa. Luego descubre que en realidad se \r\ntrata de un pequeño espíritu, que junto a otra criatura la conducen a través \r\nde un camino del bosque y posteriormente hasta el hueco de un gran árbol de \r\nalcanfor. Allí, conoce y se hace amiga de una versión mucho más grande del \r\nmismo tipo de espíritu, a quien ella identifica como Totoro.\t	1988-04-16	\N	\N	t
\.


--
-- TOC entry 3366 (class 0 OID 16801)
-- Dependencies: 214
-- Data for Name: animeinlist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.animeinlist (from_list, time_added, date_added, anime_in_list_id, creator_name) FROM stdin;
\.


--
-- TOC entry 3372 (class 0 OID 16853)
-- Dependencies: 220
-- Data for Name: calificacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.calificacion (score_id, which_anime, which_user, score_value) FROM stdin;
1	Code Geass	elmaikina	100
2	Boku No Pico	fernanchankleta	20
3	Code Geass	fernanchankleta	30
4	Fullmetal Alchemist: Brotherhood	fernanchankleta	100
5	Gintama	fernanchankleta	20
6	Hunter X Hunter (2011)	fernanchankleta	80
7	Shingeki no Kyojin	fernanchankleta	100
8	Sword Art Online	fernanchankleta	100
9	Tonari no Totoro	elmaikina	34
10	Boku No Pico	elmaikina	100
\.


--
-- TOC entry 3370 (class 0 OID 16834)
-- Dependencies: 218
-- Data for Name: comentario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comentario (comment_id, which_anime, which_user, comment_text) FROM stdin;
5	Boku No Pico	elmaikina	anime culiao cochino esto no es boku no hero
6	Boku No Pico	elmaikina	AAAAAAAAAAAAAAA estan en pelota
8	Code Geass	elmaikina	god.    
9	Fullmetal Alchemist: Brotherhood	elmaikina	creo que al final termina  
10	Fullmetal Alchemist: Brotherhood	elmaikina	aweonao te van a bajar los puntos
11	Fullmetal Alchemist: Brotherhood	diego_beltran	confirmo
12	Boku No Pico	diego_beltran	cosita rica
14	Shingeki no Kyojin	elmaikina	un poco racista pero me gusto
15	Hunter X Hunter (2011)	CristobalOTAKU	una mierda no me gusto saquenlo        
16	Tate no Yusha no Nariagari	CristobalOTAKU	furro cochino
17	Tate no Yusha no Nariagari	CristobalOTAKU	    ta bien    
18	Boku No Pico	CristobalOTAKU	la vida de un critico es sencilla es muchos aspectos, arriesgamos poco...
19	Mob Psycho	diegomobsaico	pa cuando la segunda temporada
20	Boku No Pico	fernanchankleta	        muy otseno lo estaba viendo con mi hermanita chica me repugna
21	Code Geass	fernanchankleta	     no lo vi me quede zzz   
22	Hunter X Hunter (2011)	fernanchankleta	 wenardo       
23	Shingeki no Kyojin	fernanchankleta	       sasageio sasageio 
24	Sword Art Online	elmaikina	uuu la wea mala
\.


--
-- TOC entry 3367 (class 0 OID 16815)
-- Dependencies: 215
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genre (genre_name) FROM stdin;
Accion
Comedia
Romance
Terror
Misterio
Deportes
Isekai
Mechas
Drama
Ecchi
Hentai
Otro
\.


--
-- TOC entry 3368 (class 0 OID 16820)
-- Dependencies: 216
-- Data for Name: genreofanime; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genreofanime (which_genre, which_anime) FROM stdin;
Accion	Fullmetal Alchemist: Brotherhood
Drama	Fullmetal Alchemist: Brotherhood
Accion	Gintama
Comedia	Gintama
Accion	Hunter X Hunter (2011)
Misterio	Hunter X Hunter (2011)
Drama	Hunter X Hunter (2011)
Accion	Shingeki no Kyojin
Terror	Shingeki no Kyojin
Misterio	Shingeki no Kyojin
Drama	Shingeki no Kyojin
Accion	Code Geass
Mechas	Code Geass
Drama	Code Geass
Otro	Code Geass
Accion	Mob Psycho
Comedia	Mob Psycho
Otro	Mob Psycho
Comedia	Shimoneta to Iu Gainen ga Sonzai Shinai Taikutsu na Sekai
Ecchi	Shimoneta to Iu Gainen ga Sonzai Shinai Taikutsu na Sekai
Otro	Shimoneta to Iu Gainen ga Sonzai Shinai Taikutsu na Sekai
Comedia	Ouran High School Host Club
Romance	Ouran High School Host Club
Ecchi	Ouran High School Host Club
Otro	Ouran High School Host Club
Comedia	Seishun Buta Yaro wa Bunny Girl Senpai no Yume wo Mina
Romance	Seishun Buta Yaro wa Bunny Girl Senpai no Yume wo Mina
Drama	Seishun Buta Yaro wa Bunny Girl Senpai no Yume wo Mina
Accion	Tate no Yusha no Nariagari
Romance	Tate no Yusha no Nariagari
Isekai	Tate no Yusha no Nariagari
Hentai	Boku No Pico
Accion	Sword Art Online
Romance	Sword Art Online
Isekai	Sword Art Online
Otro	Sword Art Online
Otro	Tonari no Totoro
\.


--
-- TOC entry 3364 (class 0 OID 16789)
-- Dependencies: 212
-- Data for Name: playlist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.playlist (playlist_id, creator_name, playlist_name) FROM stdin;
2	elmaikina	Historial
3	toro	Historial
4	diego_beltran	Historial
5	CristobalOTAKU	Historial
6	diegomobsaico	Historial
8	alexander	Historial
9	fernn	Historial
11	fernanchankleta	Historial
12	admin	Historial
13	admin	Favoritos
14	fernanchankleta	Favoritos
16	fernn	Favoritos
17	alexander	Favoritos
19	diegomobsaico	Favoritos
20	CristobalOTAKU	Favoritos
21	diego_beltran	Favoritos
22	toro	Favoritos
23	elmaikina	Favoritos
\.


--
-- TOC entry 3361 (class 0 OID 16776)
-- Dependencies: 209
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (user_name, user_email, user_password) FROM stdin;
elmaikina	maiki@email	caca
toro	pene	2
diego_beltran	big_diego	aa
CristobalOTAKU	cris@email	caca
diegomobsaico	dieguin@mail	ee
alexander	alex	12
fernn		
fernan 	fernndo.carrasco	1234
fernanchankleta	fernando.carrascot	1234
admin	admin	admin
deborah_alayo	deb@mail.com	admin
\.


--
-- TOC entry 3382 (class 0 OID 0)
-- Dependencies: 213
-- Name: animeinlist_from_list_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.animeinlist_from_list_seq', 1, false);


--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 219
-- Name: calificacion_score_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.calificacion_score_id_seq', 11, true);


--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 217
-- Name: comentario_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comentario_comment_id_seq', 26, true);


--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 211
-- Name: playlist_playlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.playlist_playlist_id_seq', 25, true);


--
-- TOC entry 3203 (class 2606 OID 16787)
-- Name: anime anime_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.anime
    ADD CONSTRAINT anime_pkey PRIMARY KEY (anime_name);


--
-- TOC entry 3211 (class 2606 OID 16859)
-- Name: calificacion calificacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calificacion
    ADD CONSTRAINT calificacion_pkey PRIMARY KEY (score_id);


--
-- TOC entry 3209 (class 2606 OID 16841)
-- Name: comentario comentario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT comentario_pkey PRIMARY KEY (comment_id);


--
-- TOC entry 3207 (class 2606 OID 16819)
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (genre_name);


--
-- TOC entry 3205 (class 2606 OID 16794)
-- Name: playlist playlist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlist
    ADD CONSTRAINT playlist_pkey PRIMARY KEY (playlist_id);


--
-- TOC entry 3201 (class 2606 OID 16780)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (user_name);


--
-- TOC entry 3214 (class 2606 OID 16810)
-- Name: animeinlist animeinlist_anime_in_list_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animeinlist
    ADD CONSTRAINT animeinlist_anime_in_list_id_fkey FOREIGN KEY (anime_in_list_id) REFERENCES public.anime(anime_name);


--
-- TOC entry 3215 (class 2606 OID 24846)
-- Name: animeinlist animeinlist_creator_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animeinlist
    ADD CONSTRAINT animeinlist_creator_name_fkey FOREIGN KEY (creator_name) REFERENCES public.usuario(user_name);


--
-- TOC entry 3213 (class 2606 OID 16805)
-- Name: animeinlist animeinlist_from_list_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.animeinlist
    ADD CONSTRAINT animeinlist_from_list_fkey FOREIGN KEY (from_list) REFERENCES public.playlist(playlist_id);


--
-- TOC entry 3220 (class 2606 OID 16860)
-- Name: calificacion calificacion_which_anime_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calificacion
    ADD CONSTRAINT calificacion_which_anime_fkey FOREIGN KEY (which_anime) REFERENCES public.anime(anime_name);


--
-- TOC entry 3221 (class 2606 OID 16865)
-- Name: calificacion calificacion_which_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calificacion
    ADD CONSTRAINT calificacion_which_user_fkey FOREIGN KEY (which_user) REFERENCES public.usuario(user_name);


--
-- TOC entry 3218 (class 2606 OID 16842)
-- Name: comentario comentario_which_anime_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT comentario_which_anime_fkey FOREIGN KEY (which_anime) REFERENCES public.anime(anime_name);


--
-- TOC entry 3219 (class 2606 OID 16847)
-- Name: comentario comentario_which_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comentario
    ADD CONSTRAINT comentario_which_user_fkey FOREIGN KEY (which_user) REFERENCES public.usuario(user_name);


--
-- TOC entry 3217 (class 2606 OID 16828)
-- Name: genreofanime genreofanime_which_anime_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genreofanime
    ADD CONSTRAINT genreofanime_which_anime_fkey FOREIGN KEY (which_anime) REFERENCES public.anime(anime_name);


--
-- TOC entry 3216 (class 2606 OID 16823)
-- Name: genreofanime genreofanime_which_genre_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genreofanime
    ADD CONSTRAINT genreofanime_which_genre_fkey FOREIGN KEY (which_genre) REFERENCES public.genre(genre_name);


--
-- TOC entry 3212 (class 2606 OID 16795)
-- Name: playlist playlist_creator_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.playlist
    ADD CONSTRAINT playlist_creator_name_fkey FOREIGN KEY (creator_name) REFERENCES public.usuario(user_name);


-- Completed on 2022-07-20 23:37:10

--
-- PostgreSQL database dump complete
--

