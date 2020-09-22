-- tworzenie tabel
create table pracownicy(
    id_pracownika number(4) constraint pracownicy_pk primary key,
    imie_nazwisko varchar(40) constraint pracownicy_im_na_nn not null,
    zarobki number(6,2),
    stanowisko varchar(30) constraint pracownicy_sta_ch check(stanowisko in ('obsluga filmu','kierownik','kasjer','barista')),
    data_zatrudnienia date constraint pracownicy_zat_nn not null,
    data_zwolnienia date default null
);
create table filmy(
    id_filmu number(4) constraint filmy_pk primary key,
    nazwa_filmu varchar(40) constraint seanse_nazwa_nn not null,
    gatunek varchar(15) constraint seanse_gatunek_nn not null,
    cena_biletu number(4,2) default 0,
    wymagany_wiek number default 0,
    czas_filmu number(3) default 0
);
create table seanse(
    id_seansu number(2) constraint sala_pk primary key,
    id_filmu  number(4),
    godzina_seansu timestamp constraint sala_godzina_nn not null,
    liczba_miejsc number(3) default 180,
    liczba_zajetych_miejsc number(3) check(liczba_zajetych_miejsc < 180),
    id_obslugi number(4),
    constraint id_filmu_fk foreign key (id_filmu) references filmy(id_filmu),
    constraint id_obslugi_fk foreign key (id_obslugi) references pracownicy(id_pracownika)
);
create table faktura(
    id_faktury number(6) constraint faktury_pk primary key,
    id_pracownika number(4),
    id_seansu number(4),
    ilosc_biletow number(2) default 0,
    calkowita_cena number(5,2) default 0,
    czas_trasakcji timestamp,
    constraint id_kasjera_faktura_fk foreign key (id_pracownika) references pracownicy(id_pracownika),
    constraint id_seansu_faktura_fk foreign key (id_seansu) references seanse(id_seansu)
);
-- wartosci poczatkowe pracownikow
insert into pracownicy (id_pracownika, imie_nazwisko, zarobki, stanowisko, data_zatrudnienia) values
(1001,'Jan Kompa',2900, 'obsluga filmu',to_date('14.08.2018','DD.MM.YYYY'));
insert into pracownicy (id_pracownika, imie_nazwisko, zarobki, stanowisko, data_zatrudnienia) values
(1002,'Agnieszka Kanapa',2500, 'kasjer',to_date('04.09.2016','DD.MM.YYYY'));
insert into pracownicy (id_pracownika, imie_nazwisko, zarobki, stanowisko, data_zatrudnienia, data_zwolnienia) values
(1003,'Karol Kupon',3100, 'barista',to_date('17.01.2017','DD.MM.YYYY'),to_date('21.02.2019','DD.MM.YYYY'));
insert into pracownicy (id_pracownika, imie_nazwisko, zarobki, stanowisko, data_zatrudnienia) values
(1004,'Anna Ogon',2400, 'kasjer',to_date('19.03.2018','DD.MM.YYYY'));
insert into pracownicy (id_pracownika, imie_nazwisko, zarobki, stanowisko, data_zatrudnienia) values
(1005,'Paulina Zajac',2500, 'obsluga filmu',to_date('08.10.2019','DD.MM.YYYY'));
insert into pracownicy (id_pracownika, imie_nazwisko, zarobki, stanowisko, data_zatrudnienia) values
(1006,'Adam Donald',4200, 'kierownik',to_date('21.01.2017','DD.MM.YYYY'));

-- wartosci poczatkowe filmow
insert into filmy (id_filmu, nazwa_filmu, gatunek, cena_biletu, wymagany_wiek, czas_filmu) values
(901, 'Na bank siê uda', 'Komedia', 24, 15, 105);
insert into filmy (id_filmu, nazwa_filmu, gatunek, cena_biletu, wymagany_wiek, czas_filmu) values
(902, 'Pewnego razu... w Hollywood', 'Thriller', 22, 15, 159);
insert into filmy (id_filmu, nazwa_filmu, gatunek, cena_biletu, wymagany_wiek, czas_filmu) values
(903, 'Toy Story 4', 'Animacja', 20, 0, 100);
insert into filmy (id_filmu, nazwa_filmu, gatunek, cena_biletu, wymagany_wiek, czas_filmu) values
(904, 'Król Lew', 'Animacja', 24, 6, 118);
insert into filmy (id_filmu, nazwa_filmu, gatunek, cena_biletu, wymagany_wiek, czas_filmu) values
(905, 'Szybcy i wœciekli: Hobbs i Shaw', 'Akcja', 22, 15, 138);
insert into filmy (id_filmu, nazwa_filmu, gatunek, cena_biletu, wymagany_wiek, czas_filmu) values
(906, 'Wilk w owczej skórze 2', 'Animacja', 19, 0, 85);

-- wartosci poczatkowe seansow
insert into seanse (id_seansu, id_filmu, godzina_seansu, liczba_miejsc, liczba_zajetych_miejsc, id_obslugi) values
(09, 901, to_date('2019/08/15 17:20:00', 'yyyy/mm/dd hh24:mi:ss'), 150, 0, 1001);
insert into seanse (id_seansu, id_filmu, godzina_seansu, liczba_miejsc, liczba_zajetych_miejsc, id_obslugi) values
(10, 901, to_date('2019/08/24 15:20:00', 'yyyy/mm/dd hh24:mi:ss'), 150, 0, 1005);
insert into seanse (id_seansu, id_filmu, godzina_seansu, liczba_miejsc, liczba_zajetych_miejsc, id_obslugi) values
(11, 902, to_date('2019/08/26 19:30:00', 'yyyy/mm/dd hh24:mi:ss'), 130, 0, 1001);
insert into seanse (id_seansu, id_filmu, godzina_seansu, liczba_miejsc, liczba_zajetych_miejsc, id_obslugi) values
(12, 903, to_date('2019/08/30 12:10:00', 'yyyy/mm/dd hh24:mi:ss'), 180, 0, 1005);
insert into seanse (id_seansu, id_filmu, godzina_seansu, liczba_miejsc, liczba_zajetych_miejsc, id_obslugi) values
(13, 904, to_date('2019/09/15 14:45:00', 'yyyy/mm/dd hh24:mi:ss'), 150, 0, 1001);
insert into seanse (id_seansu, id_filmu, godzina_seansu, liczba_miejsc, liczba_zajetych_miejsc, id_obslugi) values
(14, 905, to_date('2019/09/19 19:30:00', 'yyyy/mm/dd hh24:mi:ss'), 130, 0, 1005);
insert into seanse (id_seansu, id_filmu, godzina_seansu, liczba_miejsc, liczba_zajetych_miejsc, id_obslugi) values
(15, 906, to_date('2019/10/14 14:05:00', 'yyyy/mm/dd hh24:mi:ss'), 150, 0, 1001);
-- wartosci poczatkowe faktury

insert into faktura (id_faktury, id_pracownika, id_seansu, ilosc_biletow, calkowita_cena, czas_trasakcji) values
(2001, 1002, 10, 3, 3 * 24, to_date('2019/08/24 12:20:00', 'yyyy/mm/dd hh24:mi:ss'));
update seanse set liczba_miejsc=liczba_miejsc-3, liczba_zajetych_miejsc=liczba_zajetych_miejsc+3
where id_seansu=10;
insert into faktura (id_faktury, id_pracownika, id_seansu, ilosc_biletow, calkowita_cena, czas_trasakcji) values
(2002, 1004, 11, 10, 10 * 22, to_date('2019/08/25 11:10:00', 'yyyy/mm/dd hh24:mi:ss'));
update seanse set liczba_miejsc=liczba_miejsc-10, liczba_zajetych_miejsc=liczba_zajetych_miejsc+10
where id_seansu=11;
insert into faktura (id_faktury, id_pracownika, id_seansu, ilosc_biletow, calkowita_cena, czas_trasakcji) values
(2003, 1002, 12, 4, 4 * 20, to_date('2019/08/30 19:10:00', 'yyyy/mm/dd hh24:mi:ss'));
update seanse set liczba_miejsc=liczba_miejsc-4, liczba_zajetych_miejsc=liczba_zajetych_miejsc+4
where id_seansu=12;
insert into faktura (id_faktury, id_pracownika, id_seansu, ilosc_biletow, calkowita_cena, czas_trasakcji) values
(2004, 1004, 13, 12, 12 * 24, to_date('2019/09/14 12:30:00', 'yyyy/mm/dd hh24:mi:ss'));
update seanse set liczba_miejsc=liczba_miejsc-12, liczba_zajetych_miejsc=liczba_zajetych_miejsc+12
where id_seansu=13;
insert into faktura (id_faktury, id_pracownika, id_seansu, ilosc_biletow, calkowita_cena, czas_trasakcji) values
(2005, 1002, 14, 2, 2 * 22, to_date('2019/09/20 18:50:32', 'yyyy/mm/dd hh24:mi:ss'));
update seanse set liczba_miejsc=liczba_miejsc-2, liczba_zajetych_miejsc=liczba_zajetych_miejsc+2
where id_seansu=14;
insert into faktura (id_faktury, id_pracownika, id_seansu, ilosc_biletow, calkowita_cena, czas_trasakcji) values
(2006, 1004, 15, 5, 5 * 19, to_date('2019/10/17 21:30:00', 'yyyy/mm/dd hh24:mi:ss'));
update seanse set liczba_miejsc=liczba_miejsc-5, liczba_zajetych_miejsc=liczba_zajetych_miejsc+5
where id_seansu=15;

-- zapytanie 1 
-- Wyœwietl alfabetczynie posortowane nazwy filmów, które sa aktulanie w kinie i kiedy mozna je obejrzeæ.
select nazwa_filmu, gatunek, to_char(godzina_seansu, 'YYYY-MM-DD day HH24:Mi') Godzina,
liczba_miejsc, cena_biletu, case 
when wymagany_wiek = 0 then 'brak ograniczenia wiekowego'
when wymagany_wiek = 6 then '6 lat'
when wymagany_wiek = 12 then '12 lat'
when wymagany_wiek = 15 then '15 lat'
end as "ograniczenie wiekowe"
from seanse join filmy using(id_filmu)
where Systimestamp < godzina_seansu 
order by nazwa_filmu;

-- zapytanie 2 
--Wyœwietl filmy które najwiecej zarobily i najmniej oraz najlepszego kasjera, który sprzedal najwiecej biletów.
select (select nazwa_filmu "Najwiecej zarobil" from faktura join seanse using(id_seansu) join filmy using(id_filmu)
where calkowita_cena = (select max(calkowita_cena) from faktura join seanse using(id_seansu))) Najwieksze_Zyski,
(select nazwa_filmu "Najwiecej zarobil" from faktura join seanse using(id_seansu) join filmy using(id_filmu)
where calkowita_cena = (select min(calkowita_cena) from faktura join seanse using(id_seansu))) Najmniejsze_Zyski,
(select * from (select id_pracownika from faktura join seanse using(id_seansu)
group by id_pracownika 
order by sum(calkowita_cena) desc) where rownum = 1) ID_Najlepszego_Kasjera
from dual; 

-- zapytanie 3
-- Znajdz najkrótszy i najdluzszy film i wyœwietl w dodatkowej kolumnie czy jest najdlu¿szy czy najkrótszy
select * from (select nazwa_filmu, gatunek, cena_biletu, czas_filmu, case
when czas_filmu = (select max(czas_filmu) from filmy) then 'najdluszy'
when czas_filmu = (select min(czas_filmu) from filmy) then 'najkrótszy'
end Film
from filmy) where Film is not null;

-- zapytanie 4
-- Wyœwietl kiedy i jakie aktualne filmy sa dla dzieci(wiek <= 12) i kiedy dla nastaoltkow (wiek > 12)
select nazwa_filmu, gatunek, to_char(godzina_seansu, 'YYYY-MM-DD day HH24:Mi') Kiedy, 'Dla dzieci' Dla_Kogo
from seanse join filmy using(id_filmu)
where Systimestamp < godzina_seansu and wymagany_wiek <= 12
union all
select nazwa_filmu, gatunek, to_char(godzina_seansu, 'YYYY-MM-DD day HH24:Mi') Kiedy, 'Dla Doroslych' Dla_Kogo
from seanse join filmy using(id_filmu)
where Systimestamp < godzina_seansu and wymagany_wiek > 12;

-- zapytanie 5
-- Wyswietl aktualnych srednie zarobki osob z poszczegolnego stanowisk i wszyskich stanowisk
select stanowisko, avg(zarobki) Srednie_zarobki from pracownicy
where data_zwolnienia is null
group by stanowisko
union all
select 'Wszyscy Pracownicy' stanowisko, trunc(avg(zarobki)) Srednie_zarobki from pracownicy;

-- zarobek pieniêdzy w posczegolnych dniach
create or replace view zarobki as
select to_char(godzina_seansu,'YYYY/MM/DD') Dnia, sum(calkowita_cena) Zarobek, sum(ilosc_biletow) Sprzedanych_Biletow
from faktura join seanse using(id_seansu) join filmy using(id_filmu)
group by to_char(godzina_seansu,'YYYY/MM/DD');

-- jeden film na ktorych jest najwiecej wolnych miejsc i jeden na ktorych jest najmniej
create or replace view najw_najm_miejsca as 
select Nazwa_filmu, gatunek, liczba_miejsc, to_char(godzina_seansu, 'YYYY-MM-DD day HH24:Mi') Godzina, 'Najwiecej miejsc' Miejsca
from seanse join filmy using(id_filmu)
where liczba_miejsc =(
select max(liczba_miejsc)
from seanse join filmy using(id_filmu))
union all
select Nazwa_filmu, gatunek, liczba_miejsc, to_char(godzina_seansu, 'YYYY-MM-DD day HH24:Mi') Godzina, 'Najmniej miejsc' Miejsca
from seanse join filmy using(id_filmu)
where liczba_miejsc =(
select min(liczba_miejsc)
from seanse join filmy using(id_filmu));

-- statystyki wszystkich filmow 
create or replace view statystyki as 
select trunc(avg(cena_biletu),2) Sredni_Koszt_Biletu, trunc(avg(wymagany_wiek),2) Sredni_Wiek,
trunc(avg(czas_filmu),2) Sredni_Czas_Filmu, trunc(avg(liczba_miejsc),2) Srednia_Ilosc_Miejsc,
trunc(avg(liczba_zajetych_miejsc),2) Srednia_ilosc_zajetych_miejsc, 
trunc(avg(ilosc_biletow),2) Srednia_Ilosc_Biletow, trunc(avg(calkowita_cena),2) Srednia_Calkowitej_ceny
from faktura join seanse using (id_seansu) join filmy using(id_filmu); 

--  lista od najczesciej puszczanych gatunkow w kinie do najmniejszej i najpopularnieszy film z danego gatunku'
create or replace view najpopularniejsze as 
select Gatunek_Filmu,Popularnosc, nazwa_filmu Najpopularniejszy from filmy join seanse using(id_filmu)
join (select gatunek Gatunek_Filmu, count(*) Popularnosc, max(liczba_zajetych_miejsc) liczba_zajetych_miejsc
from filmy join seanse using(id_filmu)
group by gatunek) using(liczba_zajetych_miejsc)
order by Popularnosc desc;


select * from filmy join seanse using(id_filmu);

-- Wyswietlanie tabel
select * from pracownicy;
select * from filmy;
select * from seanse;
select * from faktura;
-- Wyswietlanie perspektyw
select * from zarobki;
select * from najw_najm_miejsca;
select * from statystyki;
select * from najpopularniejsze;
-- usuniecie tabel
drop table pracownicy cascade constraints;
drop table filmy cascade constraints;
drop table seanse cascade constraints;
drop table faktura cascade constraints;
-- usuniecie perspektw
drop view zarobki;
drop view najw_najm_miejsca;
drop view statystyki;
drop view najpopularniejsze;