-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 03, 2025 at 02:43 PM
-- Server version: 8.0.30
-- PHP Version: 8.2.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_pwd` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verified_at`, `password`, `show_pwd`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', NULL, '$2y$12$U1xSwTYBfCvw8VJYfH7bWeTL6bFp9fqtnc/pXYNmtAS8GoyW8yJHq', '123456', NULL, '2025-04-03 05:20:25', '2025-04-03 05:20:25');

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `teacher_id` bigint UNSIGNED DEFAULT NULL,
  `admin_id` bigint UNSIGNED DEFAULT NULL,
  `type` enum('ADMIN','TEACHER','STUDENT','PARENT','BOTH') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `title`, `content`, `teacher_id`, `admin_id`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Teacher of the Month – Congratulations!', 'We are proud to announce that Mr. Jonathan Smith has been awarded Teacher of the Month for his outstanding dedication and contributions to student success! 🎖️👏', NULL, 1, 'ADMIN', '2025-04-03 09:02:03', '2025-04-03 09:02:03'),
(2, 'New Parent-Teacher Meeting Scheduled', 'Dear Parents,\r\nWe invite you to the upcoming Parent-Teacher Meeting to discuss your child’s progress.', 1, NULL, 'BOTH', '2025-04-03 09:03:11', '2025-04-03 09:03:11'),
(3, 'Important Exam Schedule Update', 'Dear Students & Parents,\r\nPlease note that the exam schedule for the upcoming semester has been updated. Kindly check the student portal for the latest timetable.', 1, NULL, 'BOTH', '2025-04-03 09:05:40', '2025-04-03 09:05:40'),
(4, 'System Maintenance Notice', 'System Maintenance Notice', 2, NULL, 'STUDENT', '2025-04-03 09:06:33', '2025-04-03 09:06:33'),
(5, 'demo', 'demo', 2, NULL, 'STUDENT', '2025-04-03 09:08:28', '2025-04-03 09:08:28'),
(6, 'demo', 'demo', 2, NULL, 'PARENT', '2025-04-03 09:08:43', '2025-04-03 09:08:43'),
(7, 'demo', 'demo', 2, NULL, 'TEACHER', '2025-04-03 09:08:57', '2025-04-03 09:08:57'),
(8, 'demo', 'demo', NULL, 1, 'ADMIN', '2025-04-03 09:09:18', '2025-04-03 09:09:18');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`, `failed_at`) VALUES
(1, 'f840af16-0a47-4047-a6dd-03bb3348f16a', 'database', 'default', '{\"uuid\":\"f840af16-0a47-4047-a6dd-03bb3348f16a\",\"displayName\":\"App\\\\Jobs\\\\SendMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendMailJob\",\"command\":\"O:20:\\\"App\\\\Jobs\\\\SendMailJob\\\":2:{s:7:\\\"\\u0000*\\u0000user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:19:\\\"App\\\\Models\\\\MyParent\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:15:\\\"\\u0000*\\u0000announcement\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Announcement\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"}}', 'BadMethodCallException: Call to undefined method App\\Models\\MyParent::notify() in C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\ForwardsCalls.php:67\nStack trace:\n#0 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\ForwardsCalls.php(36): Illuminate\\Database\\Eloquent\\Model::throwBadMethodCallException(\'notify\')\n#1 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2392): Illuminate\\Database\\Eloquent\\Model->forwardCallTo(Object(Illuminate\\Database\\Eloquent\\Builder), \'notify\', Array)\n#2 C:\\laragon\\www\\school\\app\\Jobs\\SendMailJob.php(28): Illuminate\\Database\\Eloquent\\Model->__call(\'notify\', Array)\n#3 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\SendMailJob->handle()\n#4 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#5 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#6 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#7 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#8 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(125): Illuminate\\Container\\Container->call(Array)\n#9 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendMailJob))\n#10 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailJob))\n#11 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(129): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#12 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendMailJob), false)\n#13 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendMailJob))\n#14 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailJob))\n#15 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#16 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\SendMailJob))\n#17 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#18 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#19 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#21 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#22 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#23 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#24 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#25 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#26 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#27 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#28 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#29 C:\\laragon\\www\\school\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#30 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#31 C:\\laragon\\www\\school\\vendor\\symfony\\console\\Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\laragon\\www\\school\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\laragon\\www\\school\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#36 C:\\laragon\\www\\school\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#37 {main}', '2025-04-03 07:47:30'),
(2, 'efa0c969-9eed-4b93-856e-2c37d15f0f99', 'database', 'default', '{\"uuid\":\"efa0c969-9eed-4b93-856e-2c37d15f0f99\",\"displayName\":\"App\\\\Jobs\\\\SendMailJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendMailJob\",\"command\":\"O:20:\\\"App\\\\Jobs\\\\SendMailJob\\\":2:{s:7:\\\"\\u0000*\\u0000user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:19:\\\"App\\\\Models\\\\MyParent\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}s:15:\\\"\\u0000*\\u0000announcement\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":5:{s:5:\\\"class\\\";s:23:\\\"App\\\\Models\\\\Announcement\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";s:15:\\\"collectionClass\\\";N;}}\"}}', 'BadMethodCallException: Call to undefined method App\\Models\\MyParent::notify() in C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\ForwardsCalls.php:67\nStack trace:\n#0 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Support\\Traits\\ForwardsCalls.php(36): Illuminate\\Database\\Eloquent\\Model::throwBadMethodCallException(\'notify\')\n#1 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Database\\Eloquent\\Model.php(2392): Illuminate\\Database\\Eloquent\\Model->forwardCallTo(Object(Illuminate\\Database\\Eloquent\\Builder), \'notify\', Array)\n#2 C:\\laragon\\www\\school\\app\\Jobs\\SendMailJob.php(28): Illuminate\\Database\\Eloquent\\Model->__call(\'notify\', Array)\n#3 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\SendMailJob->handle()\n#4 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#5 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#6 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#7 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#8 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(125): Illuminate\\Container\\Container->call(Array)\n#9 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\SendMailJob))\n#10 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailJob))\n#11 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(129): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#12 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(125): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\SendMailJob), false)\n#13 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(169): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\SendMailJob))\n#14 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(126): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\SendMailJob))\n#15 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#16 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(68): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\SendMailJob))\n#17 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(102): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#18 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(441): Illuminate\\Queue\\Jobs\\Job->fire()\n#19 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(391): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(177): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#21 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(148): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#22 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(131): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#23 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#24 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(43): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#25 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(96): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#26 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(35): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#27 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(754): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#28 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(211): Illuminate\\Container\\Container->call(Array)\n#29 C:\\laragon\\www\\school\\vendor\\symfony\\console\\Command\\Command.php(279): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#30 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(180): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#31 C:\\laragon\\www\\school\\vendor\\symfony\\console\\Application.php(1094): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\laragon\\www\\school\\vendor\\symfony\\console\\Application.php(342): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\laragon\\www\\school\\vendor\\symfony\\console\\Application.php(193): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(197): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 C:\\laragon\\www\\school\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Application.php(1234): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#36 C:\\laragon\\www\\school\\artisan(16): Illuminate\\Foundation\\Application->handleCommand(Object(Symfony\\Component\\Console\\Input\\ArgvInput))\n#37 {main}', '2025-04-03 07:47:30');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_04_03_042754_create_admins_table', 2),
(5, '2025_04_03_043838_create_teachers_table', 2),
(6, '2025_04_03_044105_create_students_table', 2),
(7, '2025_04_03_050222_create_my_parents_table', 2),
(8, '2025_04_03_050236_create_my_parent_students_table', 2),
(9, '2025_04_03_051237_create_announcements_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `my_parents`
--

CREATE TABLE `my_parents` (
  `id` bigint UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` text COLLATE utf8mb4_unicode_ci,
  `full_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `my_parents`
--

INSERT INTO `my_parents` (`id`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `full_name`, `phone`, `teacher_id`, `created_at`, `updated_at`) VALUES
(1, 'alaric', 'niravsolanki334@gmail.com', NULL, '$2y$12$U1xSwTYBfCvw8VJYfH7bWeTL6bFp9fqtnc/pXYNmtAS8GoyW8yJHq', '0', 'Alaric Winslow', '1234567890', 1, '2025-04-03 12:32:17', '2025-04-03 12:32:17'),
(2, 'selene', 'niravsolanki334@gmail.com', NULL, '$2y$12$U1xSwTYBfCvw8VJYfH7bWeTL6bFp9fqtnc/pXYNmtAS8GoyW8yJHq', '0', 'Selene Hawthorne\n\n', '1234567890', 2, '2025-04-03 12:32:17', '2025-04-03 12:32:17');

-- --------------------------------------------------------

--
-- Table structure for table `my_parent_students`
--

CREATE TABLE `my_parent_students` (
  `id` bigint UNSIGNED NOT NULL,
  `my_parent_id` bigint UNSIGNED NOT NULL,
  `student_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `my_parent_students`
--

INSERT INTO `my_parent_students` (`id`, `my_parent_id`, `student_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2025-04-03 12:35:04', '2025-04-03 12:35:04'),
(2, 1, 2, '2025-04-03 12:35:04', '2025-04-03 12:35:04'),
(3, 2, 3, '2025-04-03 12:35:04', '2025-04-03 12:35:04');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('wkm5JAc68R6DiQ44NaUJHPhxGylq8fnmKKAMpX6P', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiWW1GeDZGNFRrRVBQckhNUTlabzFBVVZENTh3N0M4M0JrWWoyZnBldCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9zY2hvb2wudGVzdC9hZG1pbi9hbm5vdW5jZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTI6ImxvZ2luX2FkbWluXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjU0OiJsb2dpbl90ZWFjaGVyXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1743691395);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` text COLLATE utf8mb4_unicode_ci,
  `full_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enrollment_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `teacher_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `full_name`, `enrollment_number`, `teacher_id`, `created_at`, `updated_at`) VALUES
(1, 'jaxon', 'niravsolanki334@gmail.com', NULL, '$2y$12$U1xSwTYBfCvw8VJYfH7bWeTL6bFp9fqtnc/pXYNmtAS8GoyW8yJHq', NULL, 'Jaxon Everhart', '00001', 1, '2025-04-03 12:27:35', '2025-04-03 12:27:35'),
(2, 'emmy', 'niravsolanki334@gmail.com', NULL, '$2y$12$U1xSwTYBfCvw8VJYfH7bWeTL6bFp9fqtnc/pXYNmtAS8GoyW8yJHq', NULL, 'Emmy Everhart', '00002', 1, '2025-04-03 12:27:35', '2025-04-03 12:27:35'),
(3, 'oxon', 'niravsolanki334@gmail.com', NULL, '$2y$12$U1xSwTYBfCvw8VJYfH7bWeTL6bFp9fqtnc/pXYNmtAS8GoyW8yJHq', NULL, 'Oxon Everhart', '00003', 2, '2025-04-03 12:27:35', '2025-04-03 12:27:35');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` bigint UNSIGNED NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_pwd` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `username`, `password`, `show_pwd`, `full_name`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'eldon', '$2y$12$z4HSMpWP.qnHD2EGMRD2IOC32Ex4sq7z6AElR9IDrsEKF8L.DS/LO', '123456', 'Eldon Hargrave', '9745655656', '2025-04-03 05:40:13', '2025-04-03 05:52:19'),
(2, 'sylvia', '$2y$12$tERfDihPu/Svorb564M.BeGvMi/qxOkIycQwEkL13hYHczV1UBnDS', '123456', 'Sylvia Montclair', '7894561230', '2025-04-03 05:41:03', '2025-04-03 05:53:31');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `announcements_teacher_id_foreign` (`teacher_id`),
  ADD KEY `announcements_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `my_parents`
--
ALTER TABLE `my_parents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `my_parents_teacher_id_foreign` (`teacher_id`);

--
-- Indexes for table `my_parent_students`
--
ALTER TABLE `my_parent_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `my_parent_students_my_parent_id_foreign` (`my_parent_id`),
  ADD KEY `my_parent_students_student_id_foreign` (`student_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `students_teacher_id_foreign` (`teacher_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `my_parents`
--
ALTER TABLE `my_parents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `my_parent_students`
--
ALTER TABLE `my_parent_students`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `announcements_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `announcements_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `my_parents`
--
ALTER TABLE `my_parents`
  ADD CONSTRAINT `my_parents_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `my_parent_students`
--
ALTER TABLE `my_parent_students`
  ADD CONSTRAINT `my_parent_students_my_parent_id_foreign` FOREIGN KEY (`my_parent_id`) REFERENCES `my_parents` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `my_parent_students_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
