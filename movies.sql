-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Okt 14. 15:47
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `movies`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '1_create_movies_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2_create_releases_table', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `movies`
--

CREATE TABLE `movies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `age_rating` int(11) NOT NULL,
  `language` varchar(255) NOT NULL,
  `cover_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `movies`
--

INSERT INTO `movies` (`id`, `title`, `description`, `age_rating`, `language`, `cover_image`) VALUES
(1, 'Próba film11', 'Próba film leírás', 12, 'Magyar', 'https://img.freepik.com/premium-psd/movie-poster-movie-starring-actor_1144036-5351.jpg?w=740'),
(2, 'A Sárkányok Birodalma', 'Egy bátor lovag elindul, hogy megmentse a királyságot a sárkányok támadásától. Útja során barátokra lel és felfedezi a sárkányok titkos világát, ahol nem minden az, aminek látszik. Vajon sikerül megmentenie a birodalmat és megtalálnia a békét?', 12, 'Magyar', 'https://img.freepik.com/premium-psd/movie-poster-movie-starring-actor_1144036-5351.jpg?w=740'),
(3, 'A Rejtélyes Sziget', 'Egy csapat fiatal felfedező egy titokzatos szigetre hajózik, ahol különös lények és ősi titkok várnak rájuk. Ahogy egyre mélyebbre hatolnak a sziget belsejébe, rájönnek, hogy a sziget múltja sötétebb, mint gondolták, és hogy a túlélésükért kell küzdeniük.', 12, 'Magyar', 'https://img.freepik.com/premium-psd/movie-poster-movie-starring-actor_1144036-5351.jpg?w=740'),
(4, 'Az Elveszett Város', 'Egy régészcsapat egy ősi, elveszett város nyomára bukkan a dzsungel mélyén. Ahogy feltárják a város titkait, rájönnek, hogy egy ősi átok sújtja a helyet, és hogy a múlt titkai veszélyesebbek, mint hitték. Vajon sikerül megtörniük az átkot és élve kijutniu', 12, 'Magyar', 'https://img.freepik.com/premium-psd/movie-poster-movie-starring-actor_1144036-5351.jpg?w=740'),
(5, 'A Jövő Árnyai', 'Egy disztópikus jövőben, ahol a technológia uralja a világot, egy kis csoport lázadó harcol a szabadságért és az emberiség megmentéséért. A vezetőjük, egy karizmatikus nő, mindent megtesz, hogy megdöntse a zsarnoki rendszert és visszaadja az embereknek a ', 16, 'Magyar', 'https://img.freepik.com/premium-psd/movie-poster-movie-starring-actor_1144036-5351.jpg?w=740'),
(6, 'Próba film', 'Próba film leírás', 12, 'Magyar', 'https://img.freepik.com/premium-psd/movie-poster-movie-starring-actor_1144036-5351.jpg?w=740'),
(7, 'Próba film', 'Próba film leírás', 12, 'Magyar', 'https://img.freepik.com/premium-psd/movie-poster-movie-starring-actor_1144036-5351.jpg?w=740');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `releases`
--

CREATE TABLE `releases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `available_seats` int(11) NOT NULL,
  `movie_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `releases`
--

INSERT INTO `releases` (`id`, `date`, `available_seats`, `movie_id`) VALUES
(1, '2024-10-16 20:40:42', 80, 1),
(2, '2024-10-15 20:00:00', 100, 2),
(3, '2024-10-13 20:00:00', 90, 3),
(4, '2024-10-13 20:00:00', 100, 4),
(5, '2024-10-13 20:00:00', 90, 5),
(8, '2024-10-14 15:28:09', 50, 6),
(9, '2024-10-14 15:28:09', 100, 7);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- A tábla indexei `releases`
--
ALTER TABLE `releases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`movie_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `movies`
--
ALTER TABLE `movies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT a táblához `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `releases`
--
ALTER TABLE `releases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `releases`
--
ALTER TABLE `releases`
  ADD CONSTRAINT `id` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
