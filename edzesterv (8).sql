-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Ápr 27. 18:40
-- Kiszolgáló verziója: 10.4.22-MariaDB
-- PHP verzió: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `edzesterv`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `bemutato`
--

CREATE TABLE `bemutato` (
  `id` int(3) NOT NULL,
  `feladatid` int(10) NOT NULL,
  `fajl_neve` varchar(255) NOT NULL,
  `fajl_tipusa` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `bemutato`
--

INSERT INTO `bemutato` (`id`, `feladatid`, `fajl_neve`, `fajl_tipusa`) VALUES
(1, 1, 'felhuzas', 'jpg'),
(2, 2, 'guggolas', 'jpg'),
(3, 3, 'fekvenyomas', 'jpg'),
(4, 4, 'tarogatas', 'jpg'),
(5, 5, 'tolodzkodas', 'jpg'),
(6, 6, 'hiperhajlitas', 'jpg'),
(7, 7, 'mellhezhuzas', 'jpg'),
(8, 8, 'evezes', 'jpg'),
(9, 9, 'labtolas', 'jpg'),
(10, 10, 'kitores', 'jpg'),
(11, 11, 'labhajlitas', 'jpg'),
(12, 12, 'vadligep', 'png'),
(13, 13, 'oldalemeles', 'png'),
(14, 14, 'arnoldnyomas', 'jpg'),
(15, 15, 'eloreemeles', 'png'),
(16, 16, 'vallvonogatas', 'png'),
(17, 17, 'franciabicepsz', 'jpg'),
(18, 18, 'kalapacs', 'jpg'),
(19, 19, 'koncentraltbicpesz', 'png'),
(20, 20, 'csigasletolas', 'jpg'),
(21, 21, 'feltamasztotttolodzkodas', 'png'),
(22, 22, 'kabelestricepsz', 'jpg');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cel`
--

CREATE TABLE `cel` (
  `id` int(3) NOT NULL,
  `felhasznaloid` int(10) NOT NULL,
  `elerendo_suly` int(3) NOT NULL,
  `kezdes` date NOT NULL,
  `vege` date NOT NULL,
  `megjegyzes` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `cel`
--

INSERT INTO `cel` (`id`, `felhasznaloid`, `elerendo_suly`, `kezdes`, `vege`, `megjegyzes`) VALUES
(1, 2, 100, '2022-02-09', '2022-04-23', 'Tömegelés'),
(2, 1, 70, '2020-02-12', '2022-06-17', 'Fogyás'),
(3, 3, 60, '2019-02-14', '2019-02-21', 'Fogyás'),
(4, 4, 95, '2022-02-01', '2022-03-18', 'Tömegelés');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `feladat`
--

CREATE TABLE `feladat` (
  `id` int(3) NOT NULL,
  `nev` varchar(128) NOT NULL,
  `elegetett_kcal` int(4) NOT NULL,
  `leiras` varchar(512) NOT NULL,
  `megjegyzes` varchar(255) NOT NULL,
  `izomcsoport` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `feladat`
--

INSERT INTO `feladat` (`id`, `nev`, `elegetett_kcal`, `leiras`, `megjegyzes`, `izomcsoport`) VALUES
(1, 'Felhúzás', 10, 'A felhúzás rúddal végzendő gyakorlat minden esetben. Állj úgy, hogy lábszárcsont éppen érintse a súlyzót. Hajolj előre természetesen, és ragadd meg a rudat az egyik kezedet előre-, a másik kezedet hátrafordítva (a fogóerő növelésére). Egyenesedj ki, természetesen használva lábad és hátad együttes erejét. Az emelés kezdetétől tartsd a rudat a testedhez a lehető legközelebb.  Nagyon fontos, hogy a hát semmiképpen nem szabad, hogy domború legyen, ez egyenes út a porckorongsérvhez! Végig tartsd egyenesen, vagy ', 'Ha egyszer mestere lettél ennek a gyakorlatnak, végezheted a felhúzást nyújtott lábbal is. Ezt merev lábú felhúzásnak nevezik, és nagyon keményen megdolgoztatja a hát alsó részét.\r\n\r\n', 'Hát'),
(2, 'Guggolás', 15, 'Állj kiegyenesedve egy kétkezes súlyzó rúdját egyensúlyozva a nyakad mögött a hátadon keresztben, és a recézett rúdrészt a súlytárcsák közelében fogva. Tedd sarkaidat egymástól 30-50 cm-re úgy, hogy lábfejeid kissé kifelé mutassanak. Szemeddel nézz egy pontra magad elé, szemmagasságnál kicsit feljebb, és tartsd tekintetedet azon a ponton az egész mozgás során. Ezután lassan hajlítsd be térdedet, és ereszd le tested teljes guggolásba. Tartsd a törzsedet kihúzva, a hátadat egyenesen, és fejedet felfelé (a sze', 'Ha nem elég rugalmas a bokád, akkor nagyon nehéznek fogod találni a guggolás közbeni egyensúlyozást. Fokozni tudja az egyensúlyozás biztonságát, ha a sarkaddal egy 5x10 cm-es deszkára állsz.', 'Láb'),
(3, 'Fekvenyomás', 30, 'A fekvenyomás a legkedveltebb, néha már túlzásba is vitt gyakorlat, amely az egyik leghatékonyabb eszköz a mellizom fejlesztésére és az erőnövelésre. Dolgoztatja a mellizmokat, a tricepszet, a vállat és a hátizmokat is, így ha javítani akarsz a fekvenyomó eredményeken, akkor mindezeket az izmokat érdemes külön is megedzeni.', 'Széles fogással erőteljesebb hatás éri a mellizmokat, míg szűk fogással inkább a tricepsz kap terhelést. A gyakorlatnál mindig engedd mellkasig a rudat és teljes mozgástartományban dolgozz!', 'Mell'),
(4, 'Tárogatás (gépen)', 5, 'Ülj le kényelmesen az ülő mellgépre. Az alkarodat felfelé tartva fogd meg a gép fogantyúit. Ha fogantyús gépen dolgozol akkor egyszerűen fogd meg a fogantyúkat úgy, hogy a csuklód kb. vállmagasságban legyen. A mellizom megfeszítésével nyomd össze a karokat. Lassú, ellenőrzött mozgással engedd vissza a karokat a kiinduló helyzetbe.', 'A tárogatás pec-deck gépen remekül fejleszti a mellizom belső régióit, amennyiben már megfelelő tömeget építettél fel a mellkasodra.', 'Mell'),
(5, 'Tolódzkodás', 20, 'Engedd le magad olyan mélyre, amennyire csak bírod, a kinyomás végén pedig nyújtsd ki a karodat. Ügyelj rá hogy a könyék ne legyen kiakasztva a csúcsponton. A mozgás legyen végig kontrollált, ne rugózz az alsó ponton, és ne végezd túl gyorsan a gyakorlatot.', 'A szélesebbre állított korláton végzett gyakorlattal a mell külső része edzhető. Minél szűkebb a fogás, annál inkább a tricepszre helyeződik a hangsúly.', 'Mell'),
(6, 'Hiperhajlítás', 20, 'A gyakorlatot egy kifejezetten erre célra szolgáló padon végzik. Feküdj fel a gépre úgy, hogy a csípőd már lelógjon róla. A felsőtestnek teljesen szabadon kell mozognia. A kezedet tedd a tarkódra, vagy fond össze a mellkasodon, és engedd előre a törzsedet, hogy szabadon lógjon. Innen emelkedj fel, a hátizom erejét használva egészen addig, amíg a tested ki nem egyenesedik. Ereszkedj vissza, majd ismételd a mozdulatot. Soha ne legyen görbe a hátad, és ne is homorítsd túlságosan.', 'Később, ahogyan a keresztcsonti tájék már megerősödik, használhatsz plusz terhelést is, pl. a mellkasodhoz tudsz szorítani egy tárcsát, vagy a tarkód mögé tehetsz egy kézisúlyzót.', 'Hát'),
(7, 'Mellhez húzás széles fogással\r\n', 20, 'Fogd meg a rudat olyan széles fogással, hogy a lehúzáskor az alkarod függőleges pozícióban legyen. ​Húzd le a rudat a könyöködre koncentrálva - ez segít, hogy kikapcsold a bicepszedet a munkából amennyire lehet.', 'Ez a gyakorlat nem annyira hatékony, mint az alternatívaként végezhető, és nagyobb terhelést nyújtó széles fogású húzódzkodás, viszont megvan az az előnye, hogy kisebb súlyokat is használhatsz, így mélyebbre le tudod húzni a súlyt, ami azt jelenti, hogy a', 'Hát'),
(8, 'Kábeles evezés', 10, 'Ezt a gyakorlatot hosszú kábeles géppel kell végezni. Rögzítsd a lábadat a készüléken, majd húzd a fogantyút a tested középső része felé, vízszintes irányban. Maradj ebben a helyzetben egy másodpercig, majd engedd a karodat lassan kiegyenesedni, amíg a széles hátizmok meg nem nyúlnak teljesen. Húzd be a fogantyút újból, és ismételd a mozdulatot. A karok kinyúlásakor próbálj meg arra törekedni, hogy a hátizom is megnyúljon, ne csak a karodat nyújtsd ki.', 'A gyakorlat végezhető egykezes változatban is, így maximálisan rá tudunk koncentrálni a célizomra, és nem mellékesen, még hátrébb tudjuk húzni a fogantyút, ami még erőteljesebb izom összehúzódást eredményez.', 'Hát'),
(9, 'Lábtolás', 10, 'Helyezd a lábaidat egymástól mintegy harminc centiméterre a készülék taposólemeze alá. Nyomd ki a lábaidat, amíg a lábad ki nem egyenesedik, de a térdedet ne akaszd ki. Engedd vissza a súlyt, és ismételd a gyakorlatot.', 'A gyakorlat egy lábbal is végezhető, így koncentráltabban tudsz az adott izomra dolgozni, valamint aszimmetriaproblémák esetén is hasznos lehet ez a módszer. Ügyelj rá, hogy ne akaszd ki a térdedet a gyakorlat csúcspontján.', 'Láb'),
(10, 'Kitörés', 60, 'Állj egyenesen. Egy nagy lépést lépj előre, és kinyújtott lábaddal lassan süllyedj guggolásba. Amint leereszkedtél ebbe a helyzetbe, tégy egy újabb lépést előre a másik lábaddal, úgy, hogy közben kinyújtod az eddig behajlított lábadat, tehát fel-le ereszkedve lépegetsz előre, gyakorlatilag támadóállásban. A másik verzió, ha visszalépsz, és a másik lábaddal lépsz ki, majd azzal is vissza - így egy helyben kilépegetve, \"helytakarékosan\" tudod végezni a gyakorlatot.', 'Ha csak háromnegyedig nyomod fel magadat, vagy éppen csaknem teljesen, akkor állandó feszültséget tarthatsz fenn a négyfejű combizmokban. A kitörés edzés elején és végén egyaránt végezhető gyakorlat. A kitörés súllyal is végezhető.', 'Láb'),
(11, 'Lábhajlítás ülve', 10, 'Ülj a gépbe, támaszd ki a hátadat és tartsd is a támlához szorítva végig a gyakorlat ideje alatt. Akaszd be sarkad a görgőpárnák alá, és nyújtsd ki teljesen a lábad. Fogd meg a pad széleit, és tartsd a csípődet a párnázott felülethez szorítva. A láb kétfejű izmait használva hajlítsd be a lábadat, amennyire csak tudod. Tartsd ki ezt a leginkább összehúzott helyzetet 1-2 másodpercig, majd ereszkedj vissza a kiinduló pontig.', 'A lábhajlítást gépen egy lábbal is végezheted. A gyakorlatnak géptől függően van álló és fekvő változata is, ezekkel szükség esetén helyettesíthető a gyakorlat.', 'Láb'),
(12, 'Ülő vádligép', 15, 'Ülj be a gépbe, a térdedet szorítsd be a támasz alá úgy, hogy a vádlid megnyújtott állapotban legyen. Akaszd ki a rögzítő kart. Emeld meg a vádlidat amennyire tudod, feszíts rá a felső ponton, majd lassan engedd vissza. Ügyelj rá, hogy ne rugózz az alsó ponton!', 'Végezz annyi ismétlést, amennyit csak bírsz, és közben minden alkalommal összpontosíts a vádli teljes megfeszítésére.', 'Láb'),
(13, 'Oldalemelés állva', 20, 'Állj kiegyenesedve, tarts hajlított könyökkel egy-egy egykezes súlyzót mindkét kezedben. A súlyzókat egyszerre emeld ki oldalra a tested mellől addig, amíg vállmagasságnál egy kicsit fentebb nem kerül a súly. Engedd vissza lassan, és ismételd meg a gyakorlatot.', 'Ügyelj a kisujjadra! Mit jelent ez? A kisujjad a felső ponton legyen magasabban, mint a hüvelykujjad, mintha egy kannából akarnál vizet önteni. Ezzel az apró kis mozdulattal még több stimulációt tudsz az oldalsó deltaizmokra helyezni.', 'Váll'),
(14, 'Arnold-nyomás', 30, 'Állj vállszélességű terpeszállásba egyenes tartással. Fogj a kezeidbe egy-egy súlyzót úgy, hogy a súlyokat vállmagasságban az arcod előtt tartod. A tenyerek az arcod felé néznek. Emeld fel a súlyt a fejed fölé egyenes vonalban, miközben a tenyereidet kifelé fordítod. A súly a felső pozícióba úgy érkezik, hogy a tenyereid kifelé néznek. Ugyanezen az útvonalon engedd vissza a súlyt a kiinduló pozícióba.', 'Ez egy igen népszerű gyakorlat. A mechanikája ugyan egyáltalán nincs összhangban a megszokott \"természetes\" súlyfelemelési módszerrel, az izmokat azonban remekül stimulálja. Larry Scott és Arnold Schwarzenegger egyik kedvenc gyakorlata volt.', 'Váll'),
(15, 'Előreemelés', 20, 'Állj egyenesen, mindkét kezedben egy-egy egykezes súlyzót vagy egy egyenes rudat tartva kartávolságnyira, keresztben a combközépen. Emeld a kézisúlyzókat szemmagasságig akár egyenként, akár együtt, könyöködet enyhén behajlítva. Lassan ereszd vissza és ismételj. ', 'Ha egykezes súlyzót használsz, próbáld meg úgy tartani őket, hogy hüvelykujj legyen felfelé, és így is emeld a súlyt. Ez az elülső deltaizmot még jobban izolálja. A gyakorlatot végezheted páros karral, vagy kétkezes rúddal is akár.', 'Váll'),
(16, 'Vállvonogatás', 30, 'Állj egyenesen és tarts két nehezebb kézisúlyzót (a gyakorlat rúddal is végezhető) a tested mellett, a tenyereid befelé nézzenek. Ha rúddal végzed a gyakorlatot, kartávolságra a tested előtt vegyél fel vállszélességű vagy kissé szűkebb fogást. Emeld a válladat egyenesen felfelé, mintha a füledet szeretnéd megérinteni. Ne hajlítsd be könyöködet, és lassan ereszd vissza a rudat a kiinduló helyzetbe, majd ismételjen.', 'Ha csuklódat is hajlítod, és könyököd kifordítására összpontosítasz, még jobb összehúzódást érsz el. A felső ponton érdemes megtartani a súlyt egy pillanatra, mielőtt visszaengeded a válladat.', 'Váll'),
(17, 'Bicepsz állva francia rúddal', 30, 'Fogd meg a franciarudat tetszőleges fogással az ujjaiddal felfelé, és tartsd a rudat a combod előtt kinyújtott karokkal. Szűkebb fogással a bicepsz külső feje kap nagyobb szerepet, szélesebb fogás esetén a belső fej kapja a terhelés nagyobbik részét. Félkörívben emeld fel a rudat a karjaid behajlításával addig, míg a bicepszed el nem éri a csúcsösszehúzódás pontját. Figyelj rá hogy olyan pozícióban fejezd be a mozgást, amikor a bicepsz még dolgozik - ha túl magasra emeled a súlyt, azzal tehermentesítheted a', 'Ha behajlítod a derekadat és a törzseddel \"rásegítesz\" az emelésre (ez az ún. \"hintázás\"), az rontja a gyakorlat hatékonyságát.', 'Bicepsz'),
(18, 'Kalapács-bicepsz gyakorlat', 30, 'Ragadj meg mindkét kezedben egy-egy kézisúlyzót, és tartsd őket a tested mellett, a tenyereid nézzenek a tested irányába. Ha lehet, könyöködet egy helyben tartva, lassan és egyenletesen emeld az egyik súlyzót a válladhoz. Ereszd vissza, és a másik karral is ismételd a mozdulatot. Ügyelj rá, hogy a könyököd ne mozogjon ki oldalra.', 'A gyakorlatot végezheted állva és ülve is, mindkét karral egyszerre vagy felváltva.', 'Bicepsz'),
(19, 'Koncentrált bicepszgyakorlat', 20, 'Ülve vagy derékban előrehajolva szorítsd a karodat a belső combodhoz. Lassan hajlítsd alsó karodat mellkasod felé, de felkarod maradjon mozdulatlan belső combodhoz szorítva.', 'Ne hajlítsd a csuklódat a súly emelése közben, mivel ez az alkar izmait is igénybe veszi, megkönnyítve az emelést. A teljes mozgásfolyamatot érezd, legyen a mozgás lassú és kontrollált. Tartsd és fokozd az összehúzódást a gyakorlat csúcspontján amilyen ke', 'Bicepsz'),
(20, 'Csigás letolás', 25, 'Kiinduláskor úgy fogd meg a készülék rúdját, hogy kezeid 5-20 cm-re legyenek egymástól. Nyomd le a rudat egészen addig, amíg a karjaid ki nem egyenesednek. Engedd vissza a súlyt, és ismételd meg a mozdulatot. A legtöbben e gyakorlat során a könyöküket szorosan az oldalukhoz szorítják, de néhányan viszont oldalt kinyomják és \"belehajolnak\" a mozdulatba. Fontos azonban, hogy a könyök mozdulatlan legyen. ', 'Sokan végzik ezt a gyakorlatot helytelenül. A gyakorlat ún. tricepsz-kötél segítségével is végezhető, ami a rúddal ellentétben egy másmilyen fogást biztosít, és még koncentráltabb végrehajtást tesz lehetővé.', 'Tricepsz'),
(21, 'Tolódzkodás feltámasztott lábbal', 15, 'Támaszkodj meg a hátad mögött egy padon, a lábadat pedig tedd fel egy másik padra magad előtt úgy, hogy le tudd magad engedni a két pad között. Ereszkedj le annyira, hogy a felkarod a padlóval párhuzamos legyen. A lábaidat tartsd egyenesen és a fejedet emeld fel gyakorlat közben.', 'Amikor már a teljes testsúlyodat is ki tudod tolni, akkor érdemesebb áttérni a keskenyebb fogású teljes testes tolódzkodásra. Ez a gyakorlat a mellizmot is edzi, de ha nem túl széles a fogantyúk távolsága, akkor kiváló tricepsz gyakorlat is.', 'Tricepsz'),
(22, 'Kábeles tricepsznyújtás kötéllel', 25, 'Vegyél fel a hátgépnek háttal döntött törzsű, jól kiegyensúlyozott helyzetet, és fogd meg a hátizom gépre erősített tricepsz kötelet. Felsőkarjaid állandó mozdulatlan helyzetére nagyon ügyelve nyújtsd ki az alkarodat. Lassan, rángatás nélkül kezdd el a mozdulatot. Ez a gyakorlat kiválóan edzi a tricepsz külső fejét.', 'A negatív szakaszt próbáld meg néha egészen lassan végezni, míg a pozitív szakasz mehet robbanékonyan. Meglátod, mennyivel hamarabb elfárad így a tricepszed!\r\n\r\n', 'Tricepsz'),
(26, 'Felülés', 10, '	Feküdj a hátadra, a térdeidet húzd fel, tedd a tarkódra a kezed és tartsd is ott őket. Próbáld megérinteni meg a könyököddel a térded.', '', 'Has');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalo`
--

CREATE TABLE `felhasznalo` (
  `id` int(3) NOT NULL,
  `email` varchar(128) NOT NULL,
  `nev` varchar(64) NOT NULL,
  `szuldat` date NOT NULL,
  `magassag` int(3) NOT NULL,
  `megjegyzes` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `felhasznalo`
--

INSERT INTO `felhasznalo` (`id`, `email`, `nev`, `szuldat`, `magassag`, `megjegyzes`) VALUES
(1, 'pelda20@gmail.com', 'Kiss János', '2001-02-15', 185, ''),
(2, 'pelda9@gmail.com', 'Nagy Péter', '2003-07-15', 167, ''),
(3, 'pelda6@gmail.com', 'Kósa Erzsi', '2000-03-28', 193, 'Kósa'),
(4, 'pelda5@gmail.com', 'Kovács Lajos', '1984-02-15', 176, 'Kovács');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `javasolt_edzes`
--

CREATE TABLE `javasolt_edzes` (
  `id` int(3) NOT NULL,
  `celid` int(10) NOT NULL,
  `feladatid` int(10) NOT NULL,
  `nap` varchar(50) NOT NULL,
  `idotartam` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `javasolt_edzes`
--

INSERT INTO `javasolt_edzes` (`id`, `celid`, `feladatid`, `nap`, `idotartam`) VALUES
(1, 1, 2, 'Csütörtök', 10),
(2, 2, 1, 'Kedd', 30),
(3, 4, 6, 'Kedd', 30),
(4, 1, 9, 'Csütörtök', 10),
(5, 2, 4, 'Szerda', 30),
(6, 3, 3, 'Szerda', 5);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `testsulynaplo`
--

CREATE TABLE `testsulynaplo` (
  `felhasznaloid` int(10) NOT NULL,
  `datum` date NOT NULL,
  `suly` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `bemutato`
--
ALTER TABLE `bemutato`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feladatid` (`feladatid`);

--
-- A tábla indexei `cel`
--
ALTER TABLE `cel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `felhasznaloid` (`felhasznaloid`),
  ADD KEY `id` (`id`);

--
-- A tábla indexei `feladat`
--
ALTER TABLE `feladat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nev` (`nev`),
  ADD UNIQUE KEY `nev_2` (`nev`),
  ADD KEY `id` (`id`);

--
-- A tábla indexei `felhasznalo`
--
ALTER TABLE `felhasznalo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `email_2` (`email`),
  ADD KEY `email_3` (`email`),
  ADD KEY `id_2` (`id`),
  ADD KEY `id_3` (`id`);

--
-- A tábla indexei `javasolt_edzes`
--
ALTER TABLE `javasolt_edzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `celid` (`celid`),
  ADD KEY `feladatid` (`feladatid`),
  ADD KEY `id` (`id`);

--
-- A tábla indexei `testsulynaplo`
--
ALTER TABLE `testsulynaplo`
  ADD KEY `felhasznaloid` (`felhasznaloid`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `bemutato`
--
ALTER TABLE `bemutato`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT a táblához `cel`
--
ALTER TABLE `cel`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `feladat`
--
ALTER TABLE `feladat`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT a táblához `felhasznalo`
--
ALTER TABLE `felhasznalo`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT a táblához `javasolt_edzes`
--
ALTER TABLE `javasolt_edzes`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `bemutato`
--
ALTER TABLE `bemutato`
  ADD CONSTRAINT `bemutato_ibfk_1` FOREIGN KEY (`feladatid`) REFERENCES `feladat` (`id`);

--
-- Megkötések a táblához `cel`
--
ALTER TABLE `cel`
  ADD CONSTRAINT `cel_ibfk_1` FOREIGN KEY (`felhasznaloid`) REFERENCES `felhasznalo` (`id`);

--
-- Megkötések a táblához `javasolt_edzes`
--
ALTER TABLE `javasolt_edzes`
  ADD CONSTRAINT `javasolt_edzes_ibfk_1` FOREIGN KEY (`celid`) REFERENCES `cel` (`id`),
  ADD CONSTRAINT `javasolt_edzes_ibfk_2` FOREIGN KEY (`feladatid`) REFERENCES `feladat` (`id`);

--
-- Megkötések a táblához `testsulynaplo`
--
ALTER TABLE `testsulynaplo`
  ADD CONSTRAINT `testsulynaplo_ibfk_1` FOREIGN KEY (`felhasznaloid`) REFERENCES `felhasznalo` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
