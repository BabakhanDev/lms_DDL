// Console

CREATE TABLE pokupatel (
                           pokupatel_id SERIAL PRIMARY KEY,
                           imya VARCHAR(50) NOT NULL);

CREATE TABLE zakaz (
                       zakaz_id SERIAL PRIMARY KEY,
                       pokupatel_id INT REFERENCES pokupatel(pokupatel_id),
                       data_zakaza DATE NOT NULL
);
CREATE TABLE produkt (
                         produkt_id SERIAL PRIMARY KEY,
                         nazvanie VARCHAR(100) NOT NULL);

CREATE TABLE kategoriya (
                            kategoriya_id SERIAL PRIMARY KEY,
                            nazvanie VARCHAR(100) NOT NULL);

CREATE TABLE postavshchik (
                              postavshchik_id SERIAL PRIMARY KEY,
                              nazvanie VARCHAR(100) NOT NULL
);

CREATE TABLE sotrudnik (
                           sotrudnik_id SERIAL PRIMARY KEY,
                           imya VARCHAR(50) NOT NULL
);
CREATE TABLE sklad (
                       sklad_id SERIAL PRIMARY KEY,
                       mesto VARCHAR(100) NOT NULL
);

CREATE TABLE klient (
                        klient_id SERIAL PRIMARY KEY,
                        imya VARCHAR(50) NOT NULL,
                        telefon VARCHAR(15)
);

CREATE TABLE dostavka (
                          dostavka_id SERIAL PRIMARY KEY,
                          zakaz_id INT REFERENCES zakaz(zakaz_id),
                          data_dostavki DATE NOT NULL
);

CREATE TABLE oplaty (
                        oplata_id SERIAL PRIMARY KEY,
                        zakaz_id INT REFERENCES zakaz(zakaz_id),
                        summa DECIMAL(10, 2) NOT NULL
);



// PGADMIN

CREATE TABLE avtomobil(avtomobil_id serial PRIMARY KEY,
marka VARCHAR(50) NOT NULL,
model VARCHAR (50) NOT NULL);

CREATE TABLE vladeltsy (
    vladeltsy_id SERIAL PRIMARY KEY,
    imya VARCHAR(50) NOT NULL
);
CREATE TABLE prodazha (
    prodazha_id SERIAL PRIMARY KEY,
    avtomobil_id INT REFERENCES avtomobil(avtomobil_id),
    vladeltsy_id INT REFERENCES vladeltsy(vladeltsy_id),
    tsena DECIMAL(10, 2) NOT NULL
);
CREATE TABLE postavka (
    postavka_id SERIAL PRIMARY KEY,
    avtomobil_id INT REFERENCES avtomobil(avtomobil_id),
    kolichestvo INT NOT NULL
);
CREATE TABLE remont (
    remont_id SERIAL PRIMARY KEY,
    avtomobil_id INT REFERENCES avtomobil(avtomobil_id),
    summa DECIMAL(10, 2) NOT NULL
);
CREATE TABLE strahovka (
    strahovka_id SERIAL PRIMARY KEY,
    avtomobil_id INT REFERENCES avtomobil(avtomobil_id),
    data_nachala DATE NOT NULL,
    data_okonchaniya DATE NOT NULL,
    stoimost DECIMAL(10, 2) NOT NULL
);
CREATE TABLE dealer (
    dealer_id SERIAL PRIMARY KEY,
    nazvanie VARCHAR(100) NOT NULL,
    adres VARCHAR(200),
    kontakt_telefon VARCHAR(15)
);

CREATE TABLE servis (
    servis_id SERIAL PRIMARY KEY,
    nazvanie VARCHAR(100) NOT NULL,
    adres VARCHAR(200),
    kontakt_telefon VARCHAR(15)
);
CREATE TABLE obsluzhivanie (
    obsluzhivanie_id SERIAL PRIMARY KEY,
    avtomobil_id INT REFERENCES avtomobil(avtomobil_id),
    data_obsluzhivaniya DATE NOT NULL,
    summa DECIMAL(10, 2) NOT NULL
);
CREATE TABLE kredit (
    kredit_id SERIAL PRIMARY KEY,
    avtomobil_id INT REFERENCES avtomobil(avtomobil_id),
    summa DECIMAL(10, 2) NOT NULL,
    srok INT NOT NULL
);


//Terminal

lms-db=# create table tur (
                              lms-db(#     tur_id SERIAL PRIMARY KEY,
lms-db(#     nazvanie VARCHAR(100) NOT NULL,
lms-db(#     strana VARCHAR(50) NOT NULL,
lms-db(#     stoimost DECIMAL(10, 2) NOT NULL
lms-db(# );
CREATE TABLE
(0 rows)
lms-db=# INSERT INTO tur (nazvanie, strana, stoimost) VALUES ('tury', 'Kyrgyzstan', 5000);
INSERT 0 1
lms-db=#  SELECT * FROM tur;
tur_id | nazvanie |   strana   | stoimost
--------+----------+------------+----------
      1 | tury     | Kyrgyzstan |  5000.00
(1 row)
    lms-db=# CREATE TABLE klient_tura (
                                          lms-db(#     klient_tura_id SERIAL PRIMARY KEY,
                                          lms-db(#     klient_id INT REFERENCES klient(klient_id),
    lms-db(#     tur_id INT REFERENCES tur(tur_id),
    lms-db(#     data_brone DATE NOT NULL
           lms-db(# );
    CREATE TABLE
    lms-db=# CREATE TABLE bronirovanie (
                                           lms-db(#  bronirovanie_id SERIAL PRIMARY KEY,
                                           lms-db(#     klient_id INT REFERENCES klient(klient_id),
    lms-db(#     tur_id INT REFERENCES tur(tur_id),
    lms-db(#     status VARCHAR(20) DEFAULT 'Zabronirovano',
    lms-db(#     data_brone DATE NOT NULL
           lms-db(# );
    CREATE TABLE
    lms-db=# CREATE TABLE hotel (
                                    lms-db(#     hotel_id SERIAL PRIMARY KEY,
                                    lms-db(#     nazvanie VARCHAR(100) NOT NULL,
    lms-db(#     strana VARCHAR(50) NOT NULL,
    lms-db(#     kolichestvo_zvezd INT NOT NULL
           lms-db(# );CREATE TABLE nomer_v_otelye (
                                                      CREATE TABLE
                                                      lms-db(#     nomer_id SERIAL PRIMARY KEY,
                                                      lms-db(#     hotel_id INT REFERENCES hotel(hotel_id),
    lms-db(#     tip_nomer VARCHAR(50) NOT NULL,
    lms-db(#     cena DECIMAL(10, 2) NOT NULL
    lms-db(# );
    CREATE TABLE
    lms-db=# CREATE TABLE aviareys (
                                       lms-db(#     aviareys_id SERIAL PRIMARY KEY,
                                       lms-db(#     nomer_reys VARCHAR(10) NOT NULL,
    lms-db(#     punkt_naznacheniya VARCHAR(50) NOT NULL,
    lms-db(#     data_vylete TIMESTAMP NOT NULL
           lms-db(# );
    CREATE TABLE
    lms-db=# CREATE TABLE passazhir (
                                        lms-db(#     passazhir_id SERIAL PRIMARY KEY,
                                        lms-db(#     imya VARCHAR(50) NOT NULL,
    lms-db(#     familiya VARCHAR(50) NOT NULL,
    lms-db(#     passport VARCHAR(10) UNIQUE NOT NULL
    lms-db(# );
    CREATE TABLE
    lms-db=# CREATE TABLE bilet (
                                    lms-db(#     bilet_id SERIAL PRIMARY KEY,
                                    lms-db(#     aviareys_id INT REFERENCES aviareys(aviareys_id),
    lms-db(#     passazhir_id INT REFERENCES passazhir(passazhir_id),
    lms-db(#     mesta VARCHAR(5) NOT NULL,
    lms-db(#     cena DECIMAL(10, 2) NOT NULL
    lms-db(# );
    CREATE TABLE
    lms-db=# CREATE TABLE taksi (
                                    lms-db(#     taksi_id SERIAL PRIMARY KEY,
                                    lms-db(#     marka VARCHAR(50) NOT NULL,
    lms-db(#     nomer_kar VARCHAR(10) NOT NULL
    lms-db(# );
    CREATE TABLE
    lms-db=# CREATE TABLE zakaz_taksi (
                                          lms-db(#     zakaz_taksi_id SERIAL PRIMARY KEY,
                                          lms-db(#     taksi_id INT REFERENCES taksi(taksi_id),
    lms-db(#     passazhir_id INT REFERENCES passazhir(passazhir_id),
    lms-db(#     data_zakaza TIMESTAMP NOT NULL
           lms-db(# );
    CREATE TABLE
        lms-db=#