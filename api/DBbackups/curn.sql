-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.26 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla db_ucourses.api_all_user_answers
CREATE TABLE IF NOT EXISTS `api_all_user_answers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `exam_name` varchar(200) NOT NULL,
  `question` varchar(200) NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  `user` int DEFAULT NULL,
  `course` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db_ucourses.api_all_user_answers: ~12 rows (aproximadamente)
DELETE FROM `api_all_user_answers`;
/*!40000 ALTER TABLE `api_all_user_answers` DISABLE KEYS */;
INSERT INTO `api_all_user_answers` (`id`, `exam_name`, `question`, `is_correct`, `user`, `course`) VALUES
	(1, 'Examen de Python Básico', '¿que siginifica str?', 1, 1, 1),
	(2, 'Examen de Python Básico', '¿que siginifica int?', 0, 1, 1),
	(3, 'Examen de Python Básico', '¿como se crea y asigna un valor a una variable?', 0, 1, 1),
	(4, 'Examen de Python Básico', '¿como se crea y asigna un valor a una variable?', 0, 1, 1),
	(5, 'Examen de Python Básico', '¿que siginifica str?', 1, 1, 1),
	(6, 'Examen de Python Básico', '¿que siginifica int?', 0, 1, 1),
	(7, 'Examen de Python Básico', '¿que siginifica str?', 0, 1, 1),
	(8, 'Examen de Python Básico', '¿como se crea y asigna un valor a una variable?', 0, 1, 1),
	(9, 'Examen de Python Básico', '¿que siginifica int?', 1, 1, 1),
	(10, 'Examen de Python Básico', '¿que siginifica str?', 1, 1, 1),
	(11, 'Examen de Python Básico', '¿que siginifica int?', 0, 1, 1),
	(12, 'Examen de Python Básico', '¿como se crea y asigna un valor a una variable?', 0, 1, 1);
/*!40000 ALTER TABLE `api_all_user_answers` ENABLE KEYS */;

-- Volcando estructura para tabla db_ucourses.api_courses
CREATE TABLE IF NOT EXISTS `api_courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `duration` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `author_id` int NOT NULL,
  `image_url` varchar(200) DEFAULT NULL,
  `path` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_courses_author_id_cb74f9e4_fk_auth_user_id` (`author_id`),
  CONSTRAINT `api_courses_author_id_cb74f9e4_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db_ucourses.api_courses: ~3 rows (aproximadamente)
DELETE FROM `api_courses`;
/*!40000 ALTER TABLE `api_courses` DISABLE KEYS */;
INSERT INTO `api_courses` (`id`, `title`, `duration`, `created_at`, `updated_at`, `author_id`, `image_url`, `path`) VALUES
	(1, 'Python Basico', 3, '2022-05-11 20:31:43.000000', '2022-05-19 04:50:23.428873', 1, '../assets/logo-python.png', '/python'),
	(2, 'Python Intermedio', 2, '2022-05-17 15:20:44.000000', '2022-05-19 03:15:44.346753', 1, '../assets/logo-js.png', '/javascript'),
	(3, 'Python Avanzado', 3, '2022-05-17 15:21:18.000000', '2022-05-19 03:15:55.708962', 1, '../assets/logo-go.png', '/go');
/*!40000 ALTER TABLE `api_courses` ENABLE KEYS */;

-- Volcando estructura para tabla db_ucourses.api_exams
CREATE TABLE IF NOT EXISTS `api_exams` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `time` int NOT NULL,
  `minimun_correct_answers` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `course_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_exams_course_id_3411b4be_fk_api_courses_id` (`course_id`),
  CONSTRAINT `api_exams_course_id_3411b4be_fk_api_courses_id` FOREIGN KEY (`course_id`) REFERENCES `api_courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db_ucourses.api_exams: ~3 rows (aproximadamente)
DELETE FROM `api_exams`;
/*!40000 ALTER TABLE `api_exams` DISABLE KEYS */;
INSERT INTO `api_exams` (`id`, `title`, `time`, `minimun_correct_answers`, `created_at`, `updated_at`, `course_id`) VALUES
	(1, 'Examen de Python Basico', 3000, 3, '2022-05-11 20:54:30.000000', '2022-05-11 20:54:31.000000', 1),
	(2, 'Examen de Python Intermedio', 174610, 2, '2022-05-18 22:46:16.000000', '2022-05-19 03:17:30.682481', 2),
	(3, 'Examen de Python Avanzado', 174645, 3, '2022-05-18 22:46:49.000000', '2022-05-19 03:17:38.215214', 3);
/*!40000 ALTER TABLE `api_exams` ENABLE KEYS */;

-- Volcando estructura para tabla db_ucourses.api_exam_answers
CREATE TABLE IF NOT EXISTS `api_exam_answers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `answer` varchar(200) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `question_id` int NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_exam_answers_question_id_3dd8818b_fk_api_questions_id` (`question_id`),
  CONSTRAINT `api_exam_answers_question_id_3dd8818b_fk_api_questions_id` FOREIGN KEY (`question_id`) REFERENCES `api_questions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db_ucourses.api_exam_answers: ~5 rows (aproximadamente)
DELETE FROM `api_exam_answers`;
/*!40000 ALTER TABLE `api_exam_answers` DISABLE KEYS */;
INSERT INTO `api_exam_answers` (`id`, `answer`, `created_at`, `updated_at`, `question_id`, `is_correct`) VALUES
	(1, 'string', '2022-05-11 20:59:31.000000', '2022-05-11 20:59:33.000000', 1, 1),
	(2, 'strong', '2022-05-11 20:59:47.000000', '2022-05-11 20:59:49.000000', 1, 0),
	(3, 'system threat resource', '2022-05-11 21:19:47.000000', '2022-05-11 21:19:50.779443', 1, 0),
	(4, 'string nombre = new "carlos"', '2022-05-11 22:05:14.000000', '2022-05-11 22:05:15.830920', 2, 0),
	(5, 'nombre = "carlos"', '2022-05-11 22:05:30.000000', '2022-05-11 22:05:31.871851', 2, 1);
/*!40000 ALTER TABLE `api_exam_answers` ENABLE KEYS */;

-- Volcando estructura para tabla db_ucourses.api_questions
CREATE TABLE IF NOT EXISTS `api_questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `exam_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_questions_exam_id_508abfbb_fk_api_exams_id` (`exam_id`),
  CONSTRAINT `api_questions_exam_id_508abfbb_fk_api_exams_id` FOREIGN KEY (`exam_id`) REFERENCES `api_exams` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db_ucourses.api_questions: ~4 rows (aproximadamente)
DELETE FROM `api_questions`;
/*!40000 ALTER TABLE `api_questions` DISABLE KEYS */;
INSERT INTO `api_questions` (`id`, `question`, `created_at`, `updated_at`, `exam_id`) VALUES
	(1, '¿que significa str?', '2022-05-11 20:55:27.000000', '2022-05-11 20:55:28.000000', 1),
	(2, '¿como se define una variable?', '2022-05-11 22:04:15.000000', '2022-05-11 22:04:16.770918', 1),
	(3, '¿Que es un Closure?', '2022-05-19 05:19:33.000000', '2022-05-19 05:19:36.409420', 3),
	(4, '¿Para que sirve la función split()?', '2022-05-19 05:20:29.000000', '2022-05-19 05:20:30.914943', 2);
/*!40000 ALTER TABLE `api_questions` ENABLE KEYS */;

-- Volcando estructura para tabla db_ucourses.api_topics
CREATE TABLE IF NOT EXISTS `api_topics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `author_id` int NOT NULL,
  `course_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_topics_author_id_fa44fb9b_fk_auth_user_id` (`author_id`),
  KEY `api_topics_course_id_2e9c5c13_fk_api_courses_id` (`course_id`),
  CONSTRAINT `api_topics_author_id_fa44fb9b_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `api_topics_course_id_2e9c5c13_fk_api_courses_id` FOREIGN KEY (`course_id`) REFERENCES `api_courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db_ucourses.api_topics: ~13 rows (aproximadamente)
DELETE FROM `api_topics`;
/*!40000 ALTER TABLE `api_topics` DISABLE KEYS */;
INSERT INTO `api_topics` (`id`, `title`, `content`, `created_at`, `updated_at`, `author_id`, `course_id`) VALUES
	(1, 'Zen de Python', 'Bello es mejor que feo.\r\nExplícito es mejor que implícito.\r\nSimple es mejor que complejo.\r\nComplejo es mejor que complicado.\r\nPlano es mejor que anidado.\r\nEspaciado es mejor que denso.\r\nLa legibilidad es importante.\r\nLos casos especiales no son lo suficientemente especiales como para romper las reglas.\r\nSin embargo, la practicidad le gana a la pureza.\r\nLos errores nunca deberían pasar silenciosamente.\r\nA menos que se silencien explícitamente.\r\nFrente a la ambigüedad, evitar la tentación de adivinar.\r\nDebería haber una, y preferiblemente solo una, manera obvia de hacerlo.\r\nA pesar de que eso no sea obvio al principio, a menos que seas Holandés.\r\nAhora es mejor que nunca.\r\nA pesar de que nunca es muchas veces mejor que *ahora* mismo.\r\nSi la implementación es difícil de explicar, es una mala idea.\r\nSi la implementación es fácil de explicar, puede que sea una buena idea.\r\nLos espacios de nombres son una gran idea, ¡tengamos más de esos!', '2022-05-11 21:25:22.000000', '2022-05-11 21:25:37.893490', 1, 1),
	(2, 'Strings', 'Como muchos otros lenguajes de programación populares, las cadenas en Python son matrices de bytes que representan caracteres Unicode. Sin embargo, Python no tiene un tipo de datos de caracteres, un solo carácter es simplemente una cadena con una longitud de 1. Los corchetes se pueden usar para acceder a elementos de la cadena.', '2022-05-18 16:49:27.000000', '2022-05-18 16:49:35.837077', 2, 1),
	(3, 'If ... Else', 'Python admite las condiciones lógicas habituales de las matemáticas:\r\n\r\nEs igual a : a == b\r\nNo es igual a: a != b\r\nMenos que: a < b\r\nMenor o igual que: a <= b\r\nMayor que: a > b\r\nMayor o igual que: a >= b\r\nEstas condiciones se pueden usar de varias maneras, más comúnmente en "sentencias if" y bucles.\r\n\r\nUna "sentencia if" se escribe utilizando la palabra clave if .\r\n\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\na = 33\r\nb = 200\r\nif b > a:\r\n  print("b is greater than a")\r\n</code>\r\n</pre>\r\n\r\nEn este ejemplo, usamos dos variables, a y b , que se usan como parte de la declaración if para probar si b es mayor que a . Como a es 33 y b es 200 , sabemos que 200 es mayor que 33, por lo que imprimimos en pantalla que "b es mayor que a".\r\n\r\n<strong>Sangría</strong>\r\nPython se basa en la sangría (espacio en blanco al comienzo de una línea) para definir el alcance en el código. Otros lenguajes de programación a menudo usan corchetes para este propósito.\r\n\r\nSi declaración, sin sangría (generará un error):\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\na = 33\r\nb = 200\r\nif b > a:\r\nprint("b is greater than a") # you will get an error\r\n</code>\r\n</pre>\r\n\r\n<strong>elif</strong>\r\nLa palabra clave elif es la forma de Python de decir "si las condiciones anteriores no fueron ciertas, intente esta condición".\r\n\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\na = 33\r\nb = 33\r\nif b > a:\r\n  print("b is greater than a")\r\nelif a == b:\r\n  print("a and b are equal")\r\n</code>\r\n</pre>\r\n\r\nEn este ejemplo , a es igual a b , por lo que la primera condición no es verdadera, pero la condición elif es verdadera, por lo que imprimimos en la pantalla que "a y b son iguales".\r\n\r\n<strong>else</strong>\r\nLa palabra clave else captura cualquier cosa que no esté capturada por las condiciones anteriores.\r\n\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\na = 200\r\nb = 33\r\nif b > a:\r\n  print("b is greater than a")\r\nelif a == b:\r\n  print("a and b are equal")\r\nelse:\r\n  print("a is greater than b")\r\n</code>\r\n</pre>\r\n\r\nEn este ejemplo , a es mayor que b , por lo que la primera condición no es verdadera, tampoco la condición elif es verdadera, así que vamos a la condición else e imprimimos en la pantalla que "a es mayor que b".\r\n\r\nTambién puede tener un elsesin el elif:\r\n\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\na = 200\r\nb = 33\r\nif b > a:\r\n  print("b is greater than a")\r\nelse:\r\n  print("b is not greater than a")\r\n</code>\r\n</pre>', '2022-05-18 16:50:43.000000', '2022-05-20 04:21:48.127040', 2, 2),
	(4, 'Ciclos while', '<strong>\r\nBucles de Python\r\n</strong>\r\nPython tiene dos comandos de bucle primitivos:\r\n\r\n<br />\r\n\r\n- mientras que los bucles\r\n<br />\r\n- para bucles\r\n\r\n<br />\r\nCon el bucle while podemos ejecutar un conjunto de declaraciones siempre que una condición sea verdadera.\r\n\r\n<strong>\r\nEjemplo\r\n</strong>\r\nImprima i siempre que i sea menor que 6:\r\n\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\ni = 1\r\nwhile i < 6:\r\n  print(i)\r\n  i += 1\r\n</code>\r\n</pre>\r\n\r\n<strong>Nota: </strong>recuerda incrementar i, o de lo contrario el ciclo continuará para siempre.\r\n\r\n<br />\r\n<br />\r\nEl ciclo while requiere que las variables relevantes estén listas, en este ejemplo necesitamos definir una variable de indexación, i , que establecemos en 1.\r\n\r\n\r\n<br />\r\n<strong>La declaración de ruptura</strong>\r\nCon la instrucción break podemos detener el bucle incluso si la condición while es verdadera:\r\n<br />\r\n</strong>Ejemplo<strong>\r\nSalga del bucle cuando tenga 3 años:\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\ni = 1\r\nwhile i < 6:\r\n  print(i)\r\n  if i == 3:\r\n    break\r\n  i += 1\r\n</code>\r\n</pre>', '2022-05-18 16:52:35.000000', '2022-05-20 04:38:29.903367', 2, 2),
	(5, 'lambda', 'Una función lambda es una pequeña función anónima.\r\n<br /><br />\r\nUna función lambda puede tomar cualquier cantidad de argumentos, pero solo puede tener una expresión.\r\n<br /><br />\r\n\r\n<strong>\r\nSintaxis\r\n</strong><br /><br />\r\n<quote>lambda arguments : expression</quote><br />\r\nSe ejecuta la expresión y se devuelve el resultado:<br /><br />\r\n\r\n<strong>Ejemplo<strong><br />\r\nAgregue 10 al argumento ay devuelva el resultado:\r\n\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\nx = lambda a : a + 10\r\nprint(x(5))\r\n</code>\r\n</pre>\r\nLas funciones Lambda pueden tomar cualquier cantidad de argumentos:\r\n<br />\r\n\r\n<br />\r\n<strong>Ejemplo</strong>\r\n<br />\r\nMultiplique argumento acon argumento by devuelva el resultado:\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\nx = lambda a, b : a * b\r\nprint(x(5, 6))\r\n</code>\r\n</pre>\r\n<strong>Ejemplo</strong>\r\n<br />\r\nResumir argumento a, by cy devolver el resultado:\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\nx = lambda a, b, c : a + b + c\r\nprint(x(5, 6, 2))\r\n</code>\r\n</pre>\r\n\r\n<strong>¿Por qué utilizar las funciones de Lambda?</strong>\r\n<br />\r\n<br />\r\nEl poder de lambda se muestra mejor cuando los usa como una función anónima dentro de otra función.\r\n<br />\r\n\r\n<br />\r\nDigamos que tiene una definición de función que toma un argumento, y ese argumento se multiplicará con un número desconocido:\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\ndef myfunc(n):\r\n  return lambda a : a * n\r\n</code>\r\n</pre>\r\nUse esa definición de función para hacer una función que siempre duplique el número que envía:\r\n<br />\r\n\r\n<br />\r\n<strong>Ejemplo</strong>\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\ndef myfunc(n):\r\n  return lambda a : a * n\r\n\r\nmydoubler = myfunc(2)\r\n\r\nprint(mydoubler(11))\r\n</code>\r\n</pre>\r\n<br />\r\n<br />\r\nO use la misma definición de función para hacer una función que siempre triplique el número que envía:\r\n<br />\r\n\r\n<br />\r\n<strong>Ejemplo</strong>\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\ndef myfunc(n):\r\n  return lambda a : a * n\r\n\r\nmytripler = myfunc(3)\r\n\r\nprint(mytripler(11))\r\n</code>\r\n</pre>\r\nO use la misma definición de función para hacer ambas funciones, en el mismo programa:\r\n<br />\r\n\r\n<br />\r\n<strong>Ejemplo</strong>\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\ndef myfunc(n):\r\n  return lambda a : a * n\r\n\r\nmydoubler = myfunc(2)\r\nmytripler = myfunc(3)\r\n\r\nprint(mydoubler(11))\r\nprint(mytripler(11))\r\n</code>\r\n</pre>', '2022-05-18 22:13:48.000000', '2022-05-20 04:58:54.083533', 2, 3),
	(6, 'Números', 'El intérprete puede utilizarse como una simple calculadora; puedes introducir una expresión y este escribirá los valores. La sintaxis es sencilla: los operadores +, -, * y /``funcionan como en la mayoría de los lenguajes (por ejemplo, Pascal o C); los paréntesis (``()) pueden ser usados para agrupar. Por ejemplo:\r\n\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\n<br />\r\n>>> 2 + 2\r\n4\r\n>>> 50 - 5*6\r\n20\r\n>>> (50 - 5*6) / 4\r\n5.0\r\n>>> 8 / 5  # division always returns a floating point number\r\n1.6</code>\r\n</pre>\r\nLos números enteros (ej. 2, 4, 20) tienen tipo int, los que tienen una parte fraccionaria (por ejemplo 5.0, 1.6) tiene el tipo float. Vamos a ver más acerca de los tipos numéricos más adelante en el tutorial.\r\n\r\nLa división (/) siempre retorna un punto flotante. Para hacer floor division y obtener un resultado entero (descartando cualquier resultado fraccionario) puede usarse el operador //; para calcular el resto puedes usar %:\r\n\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\n>>> 17 / 3  # classic division returns a float\r\n5.666666666666667\r\n>>>\r\n>>> 17 // 3  # floor division discards the fractional part\r\n5\r\n>>> 17 % 3  # the % operator returns the remainder of the division\r\n2\r\n>>> 5 * 3 + 2  # floored quotient * divisor + remainder\r\n17\r\n</code>\r\n</pre>\r\n\r\nCon Python, es posible usar el operador ** para calcular potencias 1:\r\n\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\n>>> 5 ** 2  # 5 squared\r\n25\r\n>>> 2 ** 7  # 2 to the power of 7\r\n128\r\n</code>\r\n</pre>\r\n\r\nEl signo igual (=) se usa para asignar un valor a una variable. Ningún resultado se mostrará antes del siguiente prompt interactivo:\r\n\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\n>>> width = 20\r\n>>> height = 5 * 9\r\n>>> width * height\r\n900\r\n</code>\r\n</pre>', '2022-05-20 04:00:27.000000', '2022-05-20 04:10:28.243866', 2, 1),
	(7, 'Listas', 'Python tiene varios tipos de datos compuestos, utilizados para agrupar otros valores. El más versátil es la lista, la cual puede ser escrita como una lista de valores separados por coma (ítems) entre corchetes. Las listas pueden contener ítems de diferentes tipos, pero usualmente los ítems son del mismo tipo.\r\n\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\n>>> squares = [1, 4, 9, 16, 25]\r\n>>> squares\r\n[1, 4, 9, 16, 25]\r\n</code>\r\n</pre>\r\n\r\nAl igual que las cadenas (y todas las demás tipos integrados sequence), las listas se pueden indexar y segmentar:\r\n\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\n>>> squares[0]  # indexing returns the item\r\n1\r\n>>> squares[-1]\r\n25\r\n>>> squares[-3:]  # slicing returns a new list\r\n[9, 16, 25]\r\n</code>\r\n</pre>\r\n\r\nTodas las operaciones de rebanado retornan una nueva lista que contiene los elementos pedidos. Esto significa que la siguiente rebanada retorna una shallow copy de la lista:\r\n\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\n>>> squares[:]\r\n[1, 4, 9, 16, 25]\r\n</code>\r\n</pre>\r\n\r\nLas listas también admiten operaciones como concatenación:\r\n\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\n>>> squares + [36, 49, 64, 81, 100]\r\n[1, 4, 9, 16, 25, 36, 49, 64, 81, 100]\r\n</code>\r\n</pre>\r\n\r\n\r\nA diferencia de las cadenas, que son immutable, las listas son de tipo mutable, es decir, es posible cambiar su contenido:\r\n\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\n>>> cubes = [1, 8, 27, 65, 125]  # something\'s wrong here\r\n>>> 4 ** 3  # the cube of 4 is 64, not 65!\r\n64\r\n>>> cubes[3] = 64  # replace the wrong value\r\n>>> cubes\r\n[1, 8, 27, 64, 125]\r\n</code>\r\n</pre>\r\n\r\nTambién puede agregar nuevos elementos al final de la lista, utilizando el método append() (vamos a ver más sobre los métodos luego):\r\n\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\n>>> cubes.append(216)  # add the cube of 6\r\n>>> cubes.append(7 ** 3)  # and the cube of 7\r\n>>> cubes\r\n[1, 8, 27, 64, 125, 216, 343]\r\n</code>\r\n</pre>\r\n\r\nTambién es posible asignar a una rebanada, y esto incluso puede cambiar la longitud de la lista o vaciarla totalmente:\r\n\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\n>>> letters = [\'a\', \'b\', \'c\', \'d\', \'e\', \'f\', \'g\']\r\n>>> letters\r\n[\'a\', \'b\', \'c\', \'d\', \'e\', \'f\', \'g\']\r\n>>> # replace some values\r\n>>> letters[2:5] = [\'C\', \'D\', \'E\']\r\n>>> letters\r\n[\'a\', \'b\', \'C\', \'D\', \'E\', \'f\', \'g\']\r\n>>> # now remove them\r\n>>> letters[2:5] = []\r\n>>> letters\r\n[\'a\', \'b\', \'f\', \'g\']\r\n>>> # clear the list by replacing all the elements with an empty list\r\n>>> letters[:] = []\r\n>>> letters\r\n[]\r\n</code>\r\n</pre>\r\n\r\nLa función predefinida len() también sirve para las listas\r\n\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\n>>> letters = [\'a\', \'b\', \'c\', \'d\']\r\n>>> len(letters)\r\n4\r\n</code>\r\n</pre>\r\nEs posible anidar listas (crear listas que contengan otras listas), por ejemplo:\r\n\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\n>>> a = [\'a\', \'b\', \'c\']\r\n>>> n = [1, 2, 3]\r\n>>> x = [a, n]\r\n>>> x\r\n[[\'a\', \'b\', \'c\'], [1, 2, 3]]\r\n>>> x[0]\r\n[\'a\', \'b\', \'c\']\r\n>>> x[0][1]\r\n\'b\'\r\n</code>\r\n</pre>', '2022-05-20 04:15:39.000000', '2022-05-20 04:15:39.865615', 2, 1),
	(8, 'Bucles for', 'Un bucle for se usa para iterar sobre una secuencia (es decir, una lista, una tupla, un diccionario, un conjunto o una cadena).\r\n\r\nEsto se parece menos a la palabra clave for en otros lenguajes de programación y funciona más como un método iterador como se encuentra en otros lenguajes de programación orientados a objetos.\r\n\r\nCon el bucle for podemos ejecutar un conjunto de sentencias, una vez por cada elemento de una lista, tupla, conjunto, etc.\r\n<br />\r\n<br />\r\n<strong>\r\nEjemplo\r\n</strong><br />\r\nImprime cada fruta en una lista de frutas:\r\n\r\n\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\nfruits = ["apple", "banana", "cherry"]\r\nfor x in fruits:\r\n  print(x)\r\n</code>\r\n</pre>\r\n\r\n\r\n<strong>Bucle a través de una cadena</strong><br />\r\nIncluso las cadenas son objetos iterables, contienen una secuencia de caracteres:\r\n<br />\r\n<br />\r\n<strong>Ejemplo</strong>\r\nRepasa las letras de la palabra "banana":\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\nfor x in "banana":\r\n  print(x)\r\n</code>\r\n</pre>\r\n\r\n\r\n<strong>La declaración de ruptura</strong>\r\nCon la instrucción break podemos detener el bucle antes de que haya recorrido todos los elementos:\r\n\r\n<br />\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\nfruits = ["apple", "banana", "cherry"]\r\nfor x in fruits:\r\n  print(x)\r\n  if x == "banana":\r\n    break\r\n</code>\r\n</pre>\r\n\r\n\r\n\r\n<strong>La declaración de continuación</strong>\r\n<br />\r\nCon la instrucción continuar podemos detener la iteración actual del ciclo y continuar con la siguiente:\r\n\r\n\r\n<br />\r\n<br />\r\n\r\n<strong>Ejemplo</strong>\r\nNo imprimir plátano:\r\n\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\nfruits = ["apple", "banana", "cherry"]\r\nfor x in fruits:\r\n  if x == "banana":\r\n    continue\r\n  print(x)\r\n</code>\r\n</pre>', '2022-05-20 04:42:58.000000', '2022-05-20 04:48:17.885940', 2, 2),
	(9, 'Funciones', 'Una función es un bloque de código que solo se ejecuta cuando se le llama.\r\n<br />\r\n<br />\r\nPuede pasar datos, conocidos como parámetros, a una función.\r\n<br />\r\n<br />\r\nUna función puede devolver datos como resultado.\r\n<br />\r\n<br />\r\n\r\n<strong>Crear una función</strong><br />\r\nEn Python, una función se define usando la palabra clave def :\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\ndef my_function():\r\n  print("Hello from a function")\r\n</code>\r\n</pre>\r\n\r\n<strong>Llamar a una función</strong><br />\r\nPara llamar a una función, use el nombre de la función seguido de paréntesis:\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\ndef my_function():\r\n  print("Hello from a function")\r\n\r\nmy_function()\r\n</code>\r\n</pre>\r\n\r\n\r\n<strong>Argumentos</strong><br />\r\nLa información se puede pasar a funciones como argumentos.\r\n\r\nLos argumentos se especifican después del nombre de la función, entre paréntesis. Puede agregar tantos argumentos como desee, simplemente sepárelos con una coma.\r\n\r\nEl siguiente ejemplo tiene una función con un argumento (fname). Cuando se llama a la función, pasamos un nombre, que se usa dentro de la función para imprimir el nombre completo:\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\ndef my_function(fname):\r\n  print(fname + " Refsnes")\r\n\r\nmy_function("Emil")\r\nmy_function("Tobias")\r\nmy_function("Linus")\r\n</code>\r\n</pre>\r\n<strong>Número de argumentos</strong><br />\r\n\r\nPor defecto, una función debe llamarse con el número correcto de argumentos. Lo que significa que si su función espera 2 argumentos, debe llamar a la función con 2 argumentos, ni más ni menos.\r\n<br />\r\n<strong>Ejemplo</strong><br />\r\nEsta función espera 2 argumentos y obtiene 2 argumentos:\r\n\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\ndef my_function(fname, lname):\r\n  print(fname + " " + lname)\r\n\r\nmy_function("Emil", "Refsnes")\r\n</code>\r\n</pre>', '2022-05-20 04:47:05.000000', '2022-05-20 04:47:40.089732', 2, 2),
	(10, 'Objetos y clases', '<strong>Clases/Objetos de Python</strong><br /><br />\r\nPython es un lenguaje de programación orientado a objetos.<br /><br />\r\n\r\nCasi todo en Python es un objeto, con sus propiedades y métodos.<br /><br />\r\n\r\nUna clase es como un constructor de objetos o un "modelo" para crear objetos.<br /><br />\r\n\r\n<strong>Crear una clase</strong><br /><br />\r\nPara crear una clase, utilice la palabra clave class:\r\n<br /><br />\r\n\r\n<strong>Ejemplo</strong><br /><br />\r\nCree una clase llamada MyClass, con una propiedad llamada x:\r\n\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\nclass MyClass:\r\n  x = 5\r\n</code>\r\n</pre>\r\n<strong>Crear objeto</strong><br /><br />\r\nAhora podemos usar la clase llamada MyClass para crear objetos:\r\n\r\n\r\n<strong>Ejemplo</strong><br /><br />\r\nCree un objeto llamado p1 e imprima el valor de x:\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\np1 = MyClass()\r\nprint(p1.x)\r\n</code>\r\n</pre>\r\n<strong>La función __init__()</strong><br /><br />\r\nLos ejemplos anteriores son clases y objetos en su forma más simple y no son realmente útiles en aplicaciones de la vida real.<br /><br />\r\n\r\nPara comprender el significado de las clases, debemos comprender la función __init__() incorporada.\r\n<br /><br />\r\nTodas las clases tienen una función llamada __init__(), que siempre se ejecuta cuando se inicia la clase.\r\n<br /><br />\r\nUse la función __init__() para asignar valores a las propiedades del objeto u otras operaciones que sean necesarias cuando se crea el objeto:\r\n<br /><br />\r\n<strong>Ejemplo</strong><br /><br />\r\nCree una clase llamada Persona, use la función __init__() para asignar valores para el nombre y la edad:\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\nclass Person:\r\n  def __init__(self, name, age):\r\n    self.name = name\r\n    self.age = age\r\n\r\np1 = Person("John", 36)\r\n\r\nprint(p1.name)\r\nprint(p1.age)\r\n</code>\r\n</pre>\r\n\r\n<strong>Nota:</strong> La __init__() función se llama automáticamente cada vez que la clase se usa para crear un nuevo objeto.', '2022-05-20 05:04:35.000000', '2022-05-20 05:04:37.198288', 2, 3),
	(11, 'Métodos de objetos', 'Los objetos también pueden contener métodos. Los métodos en los objetos son funciones que pertenecen al objeto.<br /><br />\r\n\r\nVamos a crear un método en la clase Person:<br /><br />\r\n\r\n<strong>Ejemplo</strong><br />\r\nInserte una función que imprima un saludo y ejecútela en el objeto p1:<br /><br />\r\n\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\nclass Person:\r\n  def __init__(self, name, age):\r\n    self.name = name\r\n    self.age = age\r\n\r\n  def myfunc(self):\r\n    print("Hello my name is " + self.name)\r\n\r\np1 = Person("John", 36)\r\np1.myfunc()\r\n</code>\r\n</pre>\r\n\r\n\r\n<strong>Nota: </strong>El selfparámetro es una referencia a la instancia actual de la clase y se utiliza para acceder a las variables que pertenecen a la clase.\r\n<br /><br />\r\n\r\n\r\n<strong>El auto parámetro</strong><br /><br />\r\nEl selfparámetro es una referencia a la instancia actual de la clase y se utiliza para acceder a las variables que pertenecen a la clase.\r\n<br /><br />\r\nNo tiene que ser nombrado self, puedes llamarlo como quieras, pero tiene que ser el primer parámetro de cualquier función en la clase:<br /><br />\r\n\r\n<strong>Ejemplo</strong><br />\r\nUsa las palabras mysillyobject y abc en lugar de self :\r\n\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\nclass Person:\r\n  def __init__(mysillyobject, name, age):\r\n    mysillyobject.name = name\r\n    mysillyobject.age = age\r\n\r\n  def myfunc(abc):\r\n    print("Hello my name is " + abc.name)\r\n\r\np1 = Person("John", 36)\r\np1.myfunc()\r\n</code>\r\n</pre>\r\n\r\n<strong>Modificar propiedades de objetos</strong><br />\r\nPuede modificar propiedades en objetos como este:<br /><br />\r\n\r\n<strong>Ejemplo</strong><br />\r\nEstablezca la edad de p1 en 40:\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\np1.age = 40\r\n</code>\r\n</pre>\r\n<strong>\r\nEliminar propiedades de objeto\r\n</strong><br /><br />\r\nPuede eliminar propiedades en objetos usando la delpalabra clave:\r\n<br /><br />\r\n\r\n<strong>\r\nEjemplo\r\n</strong><br />\r\nElimine la propiedad de edad del objeto p1:\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\ndel p1.age\r\n</code>\r\n</pre>\r\n\r\n\r\nEliminar objetos</strong><br /><br />\r\nPuede eliminar objetos utilizando la delpalabra clave:<br /><br />\r\n\r\n<strong>Ejemplo</strong><br />\r\nEliminar el objeto p1:\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\ndel p1\r\n</code>\r\n</pre>\r\n\r\n\r\n<strong>La declaración de pase</strong><br /><br />\r\nclasslas definiciones no pueden estar vacías, pero si por algún motivo tiene una classdefinición sin contenido, introdúzcala en la passdeclaración para evitar que se produzca un error.\r\n<br /><br />\r\n<strong>Ejemplo</strong>\r\n\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\nclass Person:\r\n  pass\r\n</code>\r\n</pre>', '2022-05-20 05:06:52.000000', '2022-05-20 05:10:48.665363', 2, 3),
	(12, 'Manejo de archivos', 'La función clave para trabajar con archivos en Python es la open()función.\r\n<br /><br />\r\nLa open()función toma dos parámetros; nombre de archivo y modo .\r\n<br /><br />\r\nHay cuatro métodos (modos) diferentes para abrir un archiv\r\n\r\n"r"- Leer - Valor por defecto. Abre un archivo para lectura, error si el archivo no existe\r\n<br /><br />\r\n"a"- Agregar: abre un archivo para agregar, crea el archivo si no existe\r\n<br /><br />\r\n"w"- Escribir: abre un archivo para escribir, crea el archivo si no existe\r\n<br /><br />\r\n"x"- Crear: crea el archivo especificado, devuelve un error si el archivo existe\r\n\r\n<br /><br /><br /><br />\r\nAdemás, puede especificar si el archivo debe manejarse como modo binario o de texto.\r\n<br /><br />\r\n"t"- Texto - Valor por defecto. Modo de texto\r\n<br /><br />\r\n"b"- Binario - Modo binario (por ejemplo, imágenes)\r\n<br /><br />\r\n\r\n<strong>Sintaxis</strong><br />\r\nPara abrir un archivo para leerlo, basta con especificar el nombre del archivo:\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\nf = open("demofile.txt")\r\n</code>\r\n</pre>\r\nEl código anterior es el mismo que:<br /><br />\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\nf = open("demofile.txt", "rt")\r\n</code>\r\n</pre>\r\nDebido a que "r"para leer y "t"para texto son los valores predeterminados, no necesita especificarlos.<br /><br />', '2022-05-20 05:14:55.000000', '2022-05-20 05:14:56.181053', 2, 3),
	(13, 'Escritura de archivo', '<strong>Escribir en un archivo existente</strong><br />\r\n<br />\r\nPara escribir en un archivo existente, debe agregar un parámetro a la open()función:\r\n<br />\r\n<br />\r\n\r\n"a"- Agregar: se agregará al final del archivo\r\n<br />\r\n<br />\r\n\r\n"w"- Escribir: sobrescribirá cualquier contenido existente\r\n<br />\r\n<br />\r\n\r\n\r\n<strong>Ejemplo\r\n</strong><br />\r\nAbra el archivo "demofile2.txt" y agregue contenido al archivo:\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\nf = open("demofile2.txt", "a")\r\nf.write("Now the file has more content!")\r\nf.close()\r\n\r\n#open and read the file after the appending:\r\nf = open("demofile2.txt", "r")\r\nprint(f.read())\r\n</code>\r\n</pre>\r\n\r\n<strong>Ejemplo</strong><br /><br />\r\nAbra el archivo "demofile3.txt" y sobrescriba el contenido:\r\n\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\nf = open("demofile3.txt", "w")\r\nf.write("Woops! I have deleted the content!")\r\nf.close()\r\n\r\n#open and read the file after the appending:\r\nf = open("demofile3.txt", "r")\r\nprint(f.read())\r\n</code>\r\n</pre>\r\n\r\n\r\n<strong>Crear un nuevo archivo</strong><br /><br />\r\nPara crear un nuevo archivo en Python, use el open()método, con uno de los siguientes parámetros:\r\n<br /><br />\r\n"x"- Create - creará un archivo, devuelve un error si el archivo existe\r\n<br /><br />\r\n"a"- Agregar: creará un archivo si el archivo especificado no existe\r\n<br /><br />\r\n"w"- Escribir: creará un archivo si el archivo especificado no existe\r\n<br /><br />\r\n\r\n<strong>Ejemplo</strong><br />\r\nCree un archivo llamado "myfile.txt":\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\nf = open("myfile.txt", "x")\r\n</code>\r\n</pre>\r\n\r\nResultado: ¡se crea un nuevo archivo vacío!\r\n<br /><br />\r\n\r\n<strong>Ejemplo</strong><br />\r\nCree un nuevo archivo si no existe:\r\n\r\n<pre style="background-color: lightblue; color: darkblue;">\r\n<code >\r\nf = open("myfile.txt", "w")\r\n</code>\r\n</pre>', '2022-05-20 05:19:17.000000', '2022-05-20 05:19:18.234922', 2, 3);
/*!40000 ALTER TABLE `api_topics` ENABLE KEYS */;

-- Volcando estructura para tabla db_ucourses.api_user_answers
CREATE TABLE IF NOT EXISTS `api_user_answers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `answer_id` int NOT NULL,
  `exam_id` int NOT NULL,
  `question_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_user_answers_answer_id_c7a7c43a_fk_api_exam_answers_id` (`answer_id`),
  KEY `api_user_answers_exam_id_d07ebca9_fk_api_exams_id` (`exam_id`),
  KEY `api_user_answers_question_id_df204e72_fk_api_questions_id` (`question_id`),
  KEY `api_user_answers_user_id_199e73cb_fk_auth_user_id` (`user_id`),
  CONSTRAINT `api_user_answers_answer_id_c7a7c43a_fk_api_exam_answers_id` FOREIGN KEY (`answer_id`) REFERENCES `api_exam_answers` (`id`),
  CONSTRAINT `api_user_answers_exam_id_d07ebca9_fk_api_exams_id` FOREIGN KEY (`exam_id`) REFERENCES `api_exams` (`id`),
  CONSTRAINT `api_user_answers_question_id_df204e72_fk_api_questions_id` FOREIGN KEY (`question_id`) REFERENCES `api_questions` (`id`),
  CONSTRAINT `api_user_answers_user_id_199e73cb_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db_ucourses.api_user_answers: ~0 rows (aproximadamente)
DELETE FROM `api_user_answers`;
/*!40000 ALTER TABLE `api_user_answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_user_answers` ENABLE KEYS */;

-- Volcando estructura para tabla db_ucourses.api_user_courses
CREATE TABLE IF NOT EXISTS `api_user_courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_state` tinyint(1) NOT NULL,
  `course_id` int NOT NULL,
  `user_id` int NOT NULL,
  `progress_percent` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_user_courses_course_id_85a411dd_fk_api_courses_id` (`course_id`),
  KEY `api_user_courses_user_id_46da129b_fk_auth_user_id` (`user_id`),
  CONSTRAINT `api_user_courses_course_id_85a411dd_fk_api_courses_id` FOREIGN KEY (`course_id`) REFERENCES `api_courses` (`id`),
  CONSTRAINT `api_user_courses_user_id_46da129b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db_ucourses.api_user_courses: ~0 rows (aproximadamente)
DELETE FROM `api_user_courses`;
/*!40000 ALTER TABLE `api_user_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_user_courses` ENABLE KEYS */;

-- Volcando estructura para tabla db_ucourses.authtoken_token
CREATE TABLE IF NOT EXISTS `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db_ucourses.authtoken_token: ~2 rows (aproximadamente)
DELETE FROM `authtoken_token`;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` (`key`, `created`, `user_id`) VALUES
	('4b6ea4eac07b6bbd9dc703e783a9ee3f21e7daed', '2022-05-17 15:45:13.476944', 1),
	('b240a8ad8d08de3bcd1562f109428d36c5a0dd85', '2022-05-18 05:11:49.411812', 2);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;

-- Volcando estructura para tabla db_ucourses.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db_ucourses.auth_group: ~0 rows (aproximadamente)
DELETE FROM `auth_group`;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- Volcando estructura para tabla db_ucourses.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db_ucourses.auth_group_permissions: ~0 rows (aproximadamente)
DELETE FROM `auth_group_permissions`;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- Volcando estructura para tabla db_ucourses.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db_ucourses.auth_permission: ~68 rows (aproximadamente)
DELETE FROM `auth_permission`;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add courses', 7, 'add_courses'),
	(26, 'Can change courses', 7, 'change_courses'),
	(27, 'Can delete courses', 7, 'delete_courses'),
	(28, 'Can view courses', 7, 'view_courses'),
	(29, 'Can add exams', 8, 'add_exams'),
	(30, 'Can change exams', 8, 'change_exams'),
	(31, 'Can delete exams', 8, 'delete_exams'),
	(32, 'Can view exams', 8, 'view_exams'),
	(33, 'Can add posible_ answers', 9, 'add_posible_answers'),
	(34, 'Can change posible_ answers', 9, 'change_posible_answers'),
	(35, 'Can delete posible_ answers', 9, 'delete_posible_answers'),
	(36, 'Can view posible_ answers', 9, 'view_posible_answers'),
	(37, 'Can add questions', 10, 'add_questions'),
	(38, 'Can change questions', 10, 'change_questions'),
	(39, 'Can delete questions', 10, 'delete_questions'),
	(40, 'Can view questions', 10, 'view_questions'),
	(41, 'Can add user_ courses', 11, 'add_user_courses'),
	(42, 'Can change user_ courses', 11, 'change_user_courses'),
	(43, 'Can delete user_ courses', 11, 'delete_user_courses'),
	(44, 'Can view user_ courses', 11, 'view_user_courses'),
	(45, 'Can add user_ answers', 12, 'add_user_answers'),
	(46, 'Can change user_ answers', 12, 'change_user_answers'),
	(47, 'Can delete user_ answers', 12, 'delete_user_answers'),
	(48, 'Can view user_ answers', 12, 'view_user_answers'),
	(49, 'Can add topics', 13, 'add_topics'),
	(50, 'Can change topics', 13, 'change_topics'),
	(51, 'Can delete topics', 13, 'delete_topics'),
	(52, 'Can view topics', 13, 'view_topics'),
	(53, 'Can add Token', 14, 'add_token'),
	(54, 'Can change Token', 14, 'change_token'),
	(55, 'Can delete Token', 14, 'delete_token'),
	(56, 'Can view Token', 14, 'view_token'),
	(57, 'Can add token', 15, 'add_tokenproxy'),
	(58, 'Can change token', 15, 'change_tokenproxy'),
	(59, 'Can delete token', 15, 'delete_tokenproxy'),
	(60, 'Can view token', 15, 'view_tokenproxy'),
	(61, 'Can add exam_ answers', 9, 'add_exam_answers'),
	(62, 'Can change exam_ answers', 9, 'change_exam_answers'),
	(63, 'Can delete exam_ answers', 9, 'delete_exam_answers'),
	(64, 'Can view exam_ answers', 9, 'view_exam_answers'),
	(65, 'Can add all_ user_ answers', 16, 'add_all_user_answers'),
	(66, 'Can change all_ user_ answers', 16, 'change_all_user_answers'),
	(67, 'Can delete all_ user_ answers', 16, 'delete_all_user_answers'),
	(68, 'Can view all_ user_ answers', 16, 'view_all_user_answers');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- Volcando estructura para tabla db_ucourses.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db_ucourses.auth_user: ~2 rows (aproximadamente)
DELETE FROM `auth_user`;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$180000$RZIPLejsDUqh$DpI/j1fQMAuko+4RQWj0Kj2y5tmJsq+gytNVNmibfXs=', '2022-05-18 16:46:19.889908', 1, 'admin', '', '', 'admin@email.com', 1, 1, '2022-05-11 20:23:10.244507'),
	(2, 'pbkdf2_sha256$180000$7fTHSrjVtkdJ$d2CG/Fnyewjm4/JYRNMa6FXAdkzHWwYOcNvvNqrT+Pw=', NULL, 1, 'chris', '', '', 'chris@email.com', 1, 1, '2022-05-18 04:20:25.962900');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

-- Volcando estructura para tabla db_ucourses.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db_ucourses.auth_user_groups: ~0 rows (aproximadamente)
DELETE FROM `auth_user_groups`;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

-- Volcando estructura para tabla db_ucourses.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db_ucourses.auth_user_user_permissions: ~0 rows (aproximadamente)
DELETE FROM `auth_user_user_permissions`;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

-- Volcando estructura para tabla db_ucourses.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db_ucourses.django_admin_log: ~56 rows (aproximadamente)
DELETE FROM `django_admin_log`;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2022-05-11 20:31:47.131626', '1', 'Courses object (1)', 1, '[{"added": {}}]', 7, 1),
	(2, '2022-05-11 20:54:33.143439', '1', 'Exams object (1)', 1, '[{"added": {}}]', 8, 1),
	(3, '2022-05-11 20:55:29.657466', '1', 'Questions object (1)', 1, '[{"added": {}}]', 10, 1),
	(4, '2022-05-11 20:59:37.212544', '1', 'string', 1, '[{"added": {}}]', 9, 1),
	(5, '2022-05-11 20:59:50.941505', '2', 'strong', 1, '[{"added": {}}]', 9, 1),
	(6, '2022-05-11 21:19:50.782444', '3', 'system threat resource', 1, '[{"added": {}}]', 9, 1),
	(7, '2022-05-11 21:25:37.895487', '1', 'Zen de Python', 1, '[{"added": {}}]', 13, 1),
	(8, '2022-05-11 22:04:16.774790', '2', '¿como se define una variable?', 1, '[{"added": {}}]', 10, 1),
	(9, '2022-05-11 22:05:15.835664', '4', 'string nombre = new "carlos"', 1, '[{"added": {}}]', 9, 1),
	(10, '2022-05-11 22:05:31.875843', '5', 'nombre = "carlos"', 1, '[{"added": {}}]', 9, 1),
	(11, '2022-05-17 15:20:46.915883', '2', 'JavaScrip Basico', 1, '[{"added": {}}]', 7, 1),
	(12, '2022-05-17 15:21:19.828117', '3', 'GO Basico', 1, '[{"added": {}}]', 7, 1),
	(13, '2022-05-17 15:23:20.836747', '3', 'GO Basico', 2, '[{"changed": {"fields": ["Image url"]}}]', 7, 1),
	(14, '2022-05-17 15:23:30.372414', '2', 'JavaScrip Basico', 2, '[{"changed": {"fields": ["Image url"]}}]', 7, 1),
	(15, '2022-05-17 15:23:39.166921', '1', 'Python Basico', 2, '[{"changed": {"fields": ["Image url"]}}]', 7, 1),
	(16, '2022-05-18 16:49:35.851844', '2', 'Strings', 1, '[{"added": {}}]', 13, 1),
	(17, '2022-05-18 16:50:44.347813', '3', 'Strings', 1, '[{"added": {}}]', 13, 1),
	(18, '2022-05-18 16:52:37.162517', '4', 'Number', 1, '[{"added": {}}]', 13, 1),
	(19, '2022-05-18 22:13:49.303292', '5', 'string', 1, '[{"added": {}}]', 13, 1),
	(20, '2022-05-18 22:46:21.239810', '2', 'Examen de JavaScript Basico', 1, '[{"added": {}}]', 8, 1),
	(21, '2022-05-18 22:46:50.984878', '3', 'Examen de Go Basico', 1, '[{"added": {}}]', 8, 1),
	(23, '2022-05-19 03:15:44.348753', '2', 'Python Intermedio', 2, '[{"changed": {"fields": ["Title"]}}]', 7, 1),
	(24, '2022-05-19 03:15:55.710967', '3', 'Python Avanzado', 2, '[{"changed": {"fields": ["Title"]}}]', 7, 1),
	(25, '2022-05-19 03:17:30.686472', '2', 'Examen de Python Intermedio', 2, '[{"changed": {"fields": ["Title"]}}]', 8, 1),
	(26, '2022-05-19 03:17:38.218213', '3', 'Examen de Python Avanzado', 2, '[{"changed": {"fields": ["Title"]}}]', 8, 1),
	(27, '2022-05-19 04:50:23.431898', '1', 'Python Basico', 2, '[]', 7, 1),
	(28, '2022-05-19 05:19:36.412423', '3', '¿Que es un Closure?', 1, '[{"added": {}}]', 10, 1),
	(29, '2022-05-19 05:20:30.918731', '4', '¿Para que sirve la función split()?', 1, '[{"added": {}}]', 10, 1),
	(30, '2022-05-20 04:00:29.567876', '6', 'Números', 1, '[{"added": {}}]', 13, 1),
	(31, '2022-05-20 04:01:18.741684', '6', 'Números', 2, '[{"changed": {"fields": ["Content"]}}]', 13, 1),
	(32, '2022-05-20 04:01:33.304084', '6', 'Números', 2, '[{"changed": {"fields": ["Content"]}}]', 13, 1),
	(33, '2022-05-20 04:02:06.374101', '6', 'Números', 2, '[{"changed": {"fields": ["Content"]}}]', 13, 1),
	(34, '2022-05-20 04:04:03.364846', '6', 'Números', 2, '[{"changed": {"fields": ["Content"]}}]', 13, 1),
	(35, '2022-05-20 04:04:36.691192', '6', 'Números', 2, '[{"changed": {"fields": ["Content"]}}]', 13, 1),
	(36, '2022-05-20 04:05:10.836248', '6', 'Números', 2, '[{"changed": {"fields": ["Content"]}}]', 13, 1),
	(37, '2022-05-20 04:05:36.050905', '6', 'Números', 2, '[{"changed": {"fields": ["Content"]}}]', 13, 1),
	(38, '2022-05-20 04:05:53.475266', '6', 'Números', 2, '[{"changed": {"fields": ["Content"]}}]', 13, 1),
	(39, '2022-05-20 04:06:11.435949', '6', 'Números', 2, '[{"changed": {"fields": ["Content"]}}]', 13, 1),
	(40, '2022-05-20 04:06:28.216526', '6', 'Números', 2, '[{"changed": {"fields": ["Content"]}}]', 13, 1),
	(41, '2022-05-20 04:07:53.628186', '6', 'Números', 2, '[{"changed": {"fields": ["Content"]}}]', 13, 1),
	(42, '2022-05-20 04:10:28.247825', '6', 'Números', 2, '[{"changed": {"fields": ["Content"]}}]', 13, 1),
	(43, '2022-05-20 04:15:39.867122', '7', 'Listas', 1, '[{"added": {}}]', 13, 1),
	(44, '2022-05-20 04:21:48.132043', '3', 'If ... Else', 2, '[{"changed": {"fields": ["Title", "Content"]}}]', 13, 1),
	(45, '2022-05-20 04:35:39.732072', '4', 'Ciclos while', 2, '[{"changed": {"fields": ["Title", "Content"]}}]', 13, 1),
	(46, '2022-05-20 04:37:00.402614', '4', 'Ciclos while', 2, '[{"changed": {"fields": ["Content"]}}]', 13, 1),
	(47, '2022-05-20 04:38:29.912367', '4', 'Ciclos while', 2, '[{"changed": {"fields": ["Content"]}}]', 13, 1),
	(48, '2022-05-20 04:43:04.137285', '8', 'Bucles for', 1, '[{"added": {}}]', 13, 1),
	(49, '2022-05-20 04:47:06.824229', '9', 'Funciones', 1, '[{"added": {}}]', 13, 1),
	(50, '2022-05-20 04:47:40.092754', '9', 'Funciones', 2, '[{"changed": {"fields": ["Content"]}}]', 13, 1),
	(51, '2022-05-20 04:48:17.893653', '8', 'Bucles for', 2, '[{"changed": {"fields": ["Content"]}}]', 13, 1),
	(52, '2022-05-20 04:58:54.087534', '5', 'lambda', 2, '[{"changed": {"fields": ["Title", "Content"]}}]', 13, 1),
	(53, '2022-05-20 05:04:37.201272', '10', 'Objetos y clases', 1, '[{"added": {}}]', 13, 1),
	(54, '2022-05-20 05:06:53.267088', '11', 'Métodos de objetos', 1, '[{"added": {}}]', 13, 1),
	(55, '2022-05-20 05:10:48.668476', '11', 'Métodos de objetos', 2, '[{"changed": {"fields": ["Content"]}}]', 13, 1),
	(56, '2022-05-20 05:14:56.182374', '12', 'Manejo de archivos', 1, '[{"added": {}}]', 13, 1),
	(57, '2022-05-20 05:19:18.237921', '13', 'Escritura de archivo', 1, '[{"added": {}}]', 13, 1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Volcando estructura para tabla db_ucourses.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db_ucourses.django_content_type: ~16 rows (aproximadamente)
DELETE FROM `django_content_type`;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(16, 'api', 'all_user_answers'),
	(7, 'api', 'courses'),
	(9, 'api', 'exam_answers'),
	(8, 'api', 'exams'),
	(10, 'api', 'questions'),
	(13, 'api', 'topics'),
	(12, 'api', 'user_answers'),
	(11, 'api', 'user_courses'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(14, 'authtoken', 'token'),
	(15, 'authtoken', 'tokenproxy'),
	(5, 'contenttypes', 'contenttype'),
	(6, 'sessions', 'session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- Volcando estructura para tabla db_ucourses.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db_ucourses.django_migrations: ~40 rows (aproximadamente)
DELETE FROM `django_migrations`;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2022-05-11 20:10:51.921178'),
	(2, 'auth', '0001_initial', '2022-05-11 20:10:52.966440'),
	(3, 'admin', '0001_initial', '2022-05-11 20:10:55.287537'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2022-05-11 20:10:55.863727'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-05-11 20:10:55.878101'),
	(6, 'api', '0001_initial', '2022-05-11 20:10:57.492410'),
	(7, 'contenttypes', '0002_remove_content_type_name', '2022-05-11 20:11:02.765568'),
	(8, 'auth', '0002_alter_permission_name_max_length', '2022-05-11 20:11:02.988074'),
	(9, 'auth', '0003_alter_user_email_max_length', '2022-05-11 20:11:03.082956'),
	(10, 'auth', '0004_alter_user_username_opts', '2022-05-11 20:11:03.104958'),
	(11, 'auth', '0005_alter_user_last_login_null', '2022-05-11 20:11:03.270764'),
	(12, 'auth', '0006_require_contenttypes_0002', '2022-05-11 20:11:03.278909'),
	(13, 'auth', '0007_alter_validators_add_error_messages', '2022-05-11 20:11:03.301874'),
	(14, 'auth', '0008_alter_user_username_max_length', '2022-05-11 20:11:03.590655'),
	(15, 'auth', '0009_alter_user_last_name_max_length', '2022-05-11 20:11:04.129568'),
	(16, 'auth', '0010_alter_group_name_max_length', '2022-05-11 20:11:04.168045'),
	(17, 'auth', '0011_update_proxy_permissions', '2022-05-11 20:11:04.190351'),
	(18, 'authtoken', '0001_initial', '2022-05-11 20:11:04.294706'),
	(19, 'authtoken', '0002_auto_20160226_1747', '2022-05-11 20:11:05.793484'),
	(20, 'authtoken', '0003_tokenproxy', '2022-05-11 20:11:05.846977'),
	(21, 'sessions', '0001_initial', '2022-05-11 20:11:06.483519'),
	(22, 'api', '0002_auto_20220511_1604', '2022-05-11 21:04:45.394574'),
	(23, 'api', '0003_auto_20220511_1605', '2022-05-11 21:15:20.515666'),
	(24, 'api', '0004_auto_20220511_1610', '2022-05-11 21:15:20.721376'),
	(25, 'api', '0005_auto_20220511_1612', '2022-05-11 21:15:20.888810'),
	(26, 'api', '0006_auto_20220511_1617', '2022-05-11 21:17:07.760454'),
	(27, 'api', '0007_auto_20220511_1633', '2022-05-11 21:33:57.067282'),
	(28, 'api', '0008_auto_20220516_0930', '2022-05-16 14:30:36.546962'),
	(29, 'api', '0009_courses_path', '2022-05-18 06:37:35.734516'),
	(30, 'api', '0010_auto_20220518_1731', '2022-05-18 22:32:04.680014'),
	(31, 'api', '0011_auto_20220518_1736', '2022-05-18 22:36:24.454934'),
	(32, 'api', '0012_auto_20220518_1749', '2022-05-18 22:49:12.801637'),
	(33, 'api', '0013_auto_20220518_2210', '2022-05-19 03:10:33.422119'),
	(34, 'api', '0014_auto_20220519_0001', '2022-05-19 05:01:55.167640'),
	(35, 'api', '0015_questions_exam', '2022-05-19 05:14:22.208763'),
	(36, 'api', '0016_all_user_answers', '2022-05-19 21:41:27.625177'),
	(37, 'api', '0017_all_user_answers_course', '2022-05-19 21:46:00.289068'),
	(38, 'api', '0018_remove_all_user_answers_answer', '2022-05-19 21:53:48.110630'),
	(39, 'api', '0019_auto_20220519_1854', '2022-05-19 23:54:11.794060'),
	(40, 'api', '0020_auto_20220519_1859', '2022-05-19 23:59:07.402812');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Volcando estructura para tabla db_ucourses.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla db_ucourses.django_session: ~2 rows (aproximadamente)
DELETE FROM `django_session`;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('dqawbqy6ylpheiokmqrcr6onbu5bq2ww', 'ZjE2ZjQ2NDk1NWZjMjlmZDlhM2ZjNTdiNjhjMDc3YmI0M2FjYjlmMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjA0Mzc5OTUzYzcxOWZjZmRjZWQ2YWRjMzhjYmJhNjc2OTBjYmE5In0=', '2022-05-25 20:23:42.645905'),
	('ds8p8zqx2ochbu17rhjkbuqx5hhy3adh', 'ZjE2ZjQ2NDk1NWZjMjlmZDlhM2ZjNTdiNjhjMDc3YmI0M2FjYjlmMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YjA0Mzc5OTUzYzcxOWZjZmRjZWQ2YWRjMzhjYmJhNjc2OTBjYmE5In0=', '2022-06-01 16:46:19.914726');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
