-- TABLE REZERWACJE
CREATE TABLE REZERWACJE
(
    NR_REZERWACJI INT GENERATED ALWAYS AS IDENTITY NOT NULL
    , ID_WYCIECZKI INT
    , ID_OSOBY INT
    , STATUS CHAR(1)
    , CONSTRAINT REZERWACJE_PK PRIMARY KEY
    (
        NR_REZERWACJI
    )
    ENABLE
);