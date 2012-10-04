<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <link rel ="stylesheet" type = "text/css" href= "./css/bootstrap.css">
    <link rel ="stylesheet" type = "text/css" href= "./css/styles.css">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
    <script type="text/javascript"
      src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDB8hSxJc0O5AOlzvYVAle7ARvFENvFqbI&sensor=true">
    </script>
    <script type = "text/javascript" src = "./js/putMarkers.js"></script>
  </head>
  <body>
    <div class="navbar">
      <div class="navbar-inner">
        <div class="container">
          <a class= "brand" href= "#">SECE Geoloc</a>
          <ul class="nav">
            <li class="active">
              <a href="#">Home</a>
            </li>
            <li><a href="newSObj.php">Add SmartObject</a></li>
            <li><a href="indoorcheck.php">Indoor Maps</a></li>
          </ul>
          <ul class = "nav pull-right"><a href = "logout.php"><li> Logout </a></li></ul>
        </div>
      </div>
    </div>
    <div class = "container">
      <div class = "span4" id = "sidebar">
        <?php 
          session_start();
          $con = mysql_connect('localhost', 'root', '');
          if (!$con)
          {
            die('Could not connect: ' . mysql_error());
          }

          mysql_select_db("secedb", $con);
      
          $query2 = "select * from smartobj where userID = '11'"; //. $_SESSION['userid']."';";
          $result2 = mysql_query($query2, $con);
          $i = 1;
          while($row = mysql_fetch_array($result2)){
            echo "<br>";
            echo "<h2>Smart Object ID: ".$row['smartID']."<br> Name: ".$row['name']."</h2></a>Latitude:".$row['lat']." Longitude:".$row['lng']."<br><br>&nbsp&nbsp<a href='deleteSObj.php?id=".$row['smartID']."'><input type = 'button' class = 'btn btn-danger' onclick = 'deleteSObj.php?id = ".$row['smartID']."' value = 'Delete Smart Object'></a>&nbsp&nbsp<hr>";
            echo "<input type = \"hidden\" id =".$i." value = ".$row['smartID'].":".$row['name'].":".$row['lat'].":".$row['lng'].":".$row['address'].">";
            $i++;
          }
        ?>
      </div>
      <div class = "span12">
        <div id="map_canvas" class = "map"></div>
      </div>
    </div>
  </body>
</html>