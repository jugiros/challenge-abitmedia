-- Table: public.user_data

-- DROP TABLE IF EXISTS public.user_data;

CREATE TABLE IF NOT EXISTS public.user_data
(
    id bigint NOT NULL DEFAULT nextval('user_id_seq'::regclass),
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    email character varying(100) COLLATE pg_catalog."default" NOT NULL,
    password character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT user_pkey PRIMARY KEY (id)
)
    WITH (
        OIDS = FALSE
    )
    TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.user_data
    OWNER to postgres;