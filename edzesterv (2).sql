-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Ápr 17. 20:29
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
-- Tábla szerkezet ehhez a táblához `bemutatok`
--

CREATE TABLE `bemutatok` (
  `id` int(10) NOT NULL,
  `feladatid` int(10) NOT NULL,
  `fajlNeve` varchar(255) NOT NULL,
  `fajlTipusa` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `bemutatok`
--

INSERT INTO `bemutatok` (`id`, `feladatid`, `fajlNeve`, `fajlTipusa`) VALUES
(1, 1, 'felhuzas', 'jpg'),
(2, 2, 'guggolas', 'mp4');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cel`
--

CREATE TABLE `cel` (
  `id` int(10) NOT NULL,
  `felhasznaloid` int(10) NOT NULL,
  `elerendosuly` int(3) NOT NULL,
  `kezdes` date NOT NULL,
  `vege` date NOT NULL,
  `megjegyzes` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `cel`
--

INSERT INTO `cel` (`id`, `felhasznaloid`, `elerendosuly`, `kezdes`, `vege`, `megjegyzes`) VALUES
(1, 2, 100, '2022-02-09', '2022-04-23', 'Tömegelés'),
(2, 1, 70, '2020-02-12', '2022-06-17', 'Fogyás'),
(3, 3, 60, '2019-02-14', '2019-02-21', 'Fogyjál le!'),
(4, 4, 95, '2022-02-01', '2022-03-18', 'Tömegelj');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `feladat`
--

CREATE TABLE `feladat` (
  `id` int(10) NOT NULL,
  `nev` varchar(128) NOT NULL,
  `elegetettKcal` int(4) NOT NULL,
  `leiras` varchar(512) NOT NULL,
  `megjegyzes` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `feladat`
--

INSERT INTO `feladat` (`id`, `nev`, `elegetettKcal`, `leiras`, `megjegyzes`) VALUES
(1, 'felhúzás', 10, 'Húzd fel a súlyt.', 'Ne törjön el a hátad'),
(2, 'Guggolás', 15, 'Guggolj.', 'Ne törjön el a lábad.'),
(3, 'Fekvenyomás', 30, 'Nyomd ki a rudat', 'Nyomjad már!'),
(4, 'Tárogatás', 5, 'Tárd ki a karod', 'Tárjad!');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalo`
--

CREATE TABLE `felhasznalo` (
  `id` int(10) NOT NULL,
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
(1, 'gecliángos@gmail.com', 'Kiss János', '2018-02-15', 185, ''),
(2, 'pelda2@gmail.com', 'Nagy Péter', '2003-07-15', 167, ''),
(3, 'pelda6@gmail.com', 'Kósa Erzsi', '2013-03-28', 193, 'Kósa'),
(4, 'pelda4@gmail.com', 'Kovács Lajos', '1984-02-15', 176, 'Kovács');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `javasoltedzes`
--

CREATE TABLE `javasoltedzes` (
  `id` int(10) NOT NULL,
  `celid` int(10) NOT NULL,
  `feladatid` int(10) NOT NULL,
  `datum` date NOT NULL,
  `idotartam` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- A tábla adatainak kiíratása `javasoltedzes`
--

INSERT INTO `javasoltedzes` (`id`, `celid`, `feladatid`, `datum`, `idotartam`) VALUES
(1, 1, 2, '2022-03-16', 10),
(2, 2, 1, '2022-02-09', 30),
(3, 4, 2, '2022-02-08', 30),
(4, 1, 1, '2022-02-25', 10),
(5, 2, 4, '2022-04-14', 30),
(6, 3, 1, '2022-02-02', 5);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `testsulnaplo`
--

CREATE TABLE `testsulnaplo` (
  `felhasznaloid` int(10) NOT NULL,
  `datum` date NOT NULL,
  `suly` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `bemutatok`
--
ALTER TABLE `bemutatok`
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
-- A tábla indexei `javasoltedzes`
--
ALTER TABLE `javasoltedzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `celid` (`celid`),
  ADD KEY `feladatid` (`feladatid`),
  ADD KEY `id` (`id`);

--
-- A tábla indexei `testsulnaplo`
--
ALTER TABLE `testsulnaplo`
  ADD KEY `felhasznaloid` (`felhasznaloid`);

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `bemutatok`
--
ALTER TABLE `bemutatok`
  ADD CONSTRAINT `bemutatok_ibfk_1` FOREIGN KEY (`feladatid`) REFERENCES `feladat` (`id`);

--
-- Megkötések a táblához `cel`
--
ALTER TABLE `cel`
  ADD CONSTRAINT `cel_ibfk_1` FOREIGN KEY (`felhasznaloid`) REFERENCES `felhasznalo` (`id`);

--
-- Megkötések a táblához `javasoltedzes`
--
ALTER TABLE `javasoltedzes`
  ADD CONSTRAINT `javasoltedzes_ibfk_1` FOREIGN KEY (`celid`) REFERENCES `cel` (`id`),
  ADD CONSTRAINT `javasoltedzes_ibfk_2` FOREIGN KEY (`feladatid`) REFERENCES `feladat` (`id`);

--
-- Megkötések a táblához `testsulnaplo`
--
ALTER TABLE `testsulnaplo`
  ADD CONSTRAINT `testsulnaplo_ibfk_1` FOREIGN KEY (`felhasznaloid`) REFERENCES `felhasznalo` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
