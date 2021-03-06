-- PROCEDURE DODAJ_REZERWACJE3
CREATE OR REPLACE
PROCEDURE prc_dodaj_rezerwacje3
    (id_wycieczki WYCIECZKI.ID_WYCIECZKI%TYPE, id_osoby OSOBY.ID_OSOBY%TYPE) AS
    is_table             INTEGER;
    new_reservation_id   INTEGER;
    BEGIN
        SELECT COUNT(*) INTO is_table
        FROM OSOBY o
        WHERE o.ID_OSOBY = prc_dodaj_rezerwacje3.id_osoby;

        IF is_table = 0 THEN
            raise_application_error(-20014, 'Brak osoby o podanym id');
        END IF;

        SELECT COUNT(*) INTO is_table
        FROM VIEW_WYCIECZKI_DOSTEPNE2 wd
        WHERE wd.ID_WYCIECZKI = prc_dodaj_rezerwacje3.id_wycieczki;

        IF is_table = 0 THEN
          raise_application_error(-20014, 'Brak dostepnej wycieczki o podanym id');
        END IF;

        SELECT COUNT(*) INTO is_table
        FROM REZERWACJE r
        WHERE r.ID_WYCIECZKI = prc_dodaj_rezerwacje3.id_wycieczki
            AND r.ID_OSOBY = prc_dodaj_rezerwacje3.id_osoby;

        IF is_table > 0 THEN
          raise_application_error(-20014, 'Rezerwacja juz istnieje');
        END IF;

        INSERT INTO REZERWACJE r (r.ID_WYCIECZKI, r.ID_OSOBY, r.STATUS)
        VALUES (id_wycieczki, id_osoby, 'N')
        RETURNING r.NR_REZERWACJI INTO new_reservation_id;
    END prc_dodaj_rezerwacje3;
