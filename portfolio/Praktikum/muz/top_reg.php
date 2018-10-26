<!DOCTYPE html>
<?php
include "lib/functions.php";
initSession();
 ?>
<html>
  <head>
    <link rel="stylesheet" href="css/main.css">
    <meta charset="utf-8">
    <title>Мой сайт</title>
  </head>
  <body>
    <table id="main">
      <tr>
        <td colspan="2">
          <h1>Хранилище МОРГа</h1>
          <img src="pic/images.png" alt="">
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
                <a href="mysite.php">Главная</a>
              </td>
              <td class="top">
                <a href="top_articles.php">Статьи</a>
              </td>
              <td class="top">
                <a href="top_reg.php">Регистрация</a>
              </td>
              <td class="top">
                <a href="top_guestbook.php">Гостевая книга</a>
              </td>
              <td>
                <?php
                if (checkUser($_SESSION["email"],$_SESSION["password"])) require_once "blocks/user_panel.php";
                else require_once "auth.php";
                ?>
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
        <?php  require_once "blocks/reg.php" ?>
        <td id="banners">
          <h2>Реклама</h2>
          <hr/>
          <a href="mysite.php">
            <img src="">
          </a>
          <hr/>
          <a href="mysite.php">
            <img src="">
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
          Все права защищены &copy Мой сайт 2017г.
        </td>
      </tr>
    </table>
  </body>
</html>
