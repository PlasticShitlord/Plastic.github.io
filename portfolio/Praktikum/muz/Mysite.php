<?php
include "lib/functions.php";

?>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link rel="styleheat" type="text/css" href="styles/main.css"/>
		<meta http-equiv="Content-type" content="text/html; charset=utf-8"/>
		<link rel="stylesheet" href="main.css">
		<title>Тестовый Сайт</title>
	</head>
	<body>
		<table id="main">
			<tr>
				<td colspan="2">
				<hl>Заголовок сайта </hl>
				<img src="pic/top.png"/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<hr/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<table id="topmenu">
						<tr>
						<td class="top">
							<a href ="Mysite.php"> Главная </a>
						</td>
						<td class="top">
							<a href ="top_articles.php"> Статья </a>
						</td>
						<td class="top">
							<a href ="top_reg.php"> Регистрация </a>
						</td>
						<td class="top">
							<a href ="top_guestbook.php"> Гостевая книга </a>
						</td>
						<td>
							<form id="auth" method="POST" action="auth.php">
								<table id="form_auth">
									<tr>
										<td>E-mail:</td>
										<td><input type="text" id="email"></td>
										<td>Пароль:</td>
										<td><input type="text" id="password"></td>
										</tr>
										<tr>
										<td colspan="4">
										<input type="submit" name="button_auth" value="Войти">
										</td>
									</tr>
								</table>

							</form>
						</td>
						</tr>
						</table>
					</td>
					</tr>
					<tr>
						<td colspan="2">
						<hr/>
						</td>

					</tr>
					<tr>
						<td id="articles">
							<div class="content">
								<h2>Заголовок статьи</h2>
								<p>ТЕкст1</p>
								<p>ТЕкст2</p>
								<p>ТЕкст3</p>
								<p>ТЕкст4</p>
							</div>
						</td>
						<td id="banners">
							<h2> Реклама </h2>
							<hr/>
							<a href="Mysite.php">
							<img src="pic/images.png"/>
							</a>
							<hr/>
							<a href="Mysite.php">
							<img src="pic/images.png"/>
							</a>
						</td>
					</tr>
					<tr>
						<td colspan="2">
						<hr/>
						</td>
						</tr>
						<tr>
						<td colspan="2" id="bottom">
						Все права защищены @copy Мой сайт 2018г.
						</td>
					</tr>
				</table>
			</body>
</html>
