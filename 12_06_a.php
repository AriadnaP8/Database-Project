<html>
<head>
<title>12_06_a</title>
</head>
<body>
	<body background='fundal6.webp'>
<style>
table{ font-size:18;
	   background-color:  #F6D8F5}
td{padding: 7px}
body{ background-color: #aaff80}
</style>

<h3>Să se găsească pentru fiecare actor în câte filme de gen "SF" a jucat, folosind funcții de agregare.</h3>
<?php

$user='root';
$pass='';
$host='localhost';
$db_name='popesc';

$conn=mysqli_connect($host,$user,$pass,$db_name);
$query = "SELECT COUNT(Film.titlu) AS "Numar filme SF", p1.nume AS "Actor"
          FROM Distributie
          JOIN Persoana p1 ON(p1.id_persoana = Distributie.id_actor)
          JOIN Film ON(Distributie.titlu_film = Film.titlu)
          WHERE Film.gen = 'SF' 
          GROUP BY p1.id_persoana, p1.nume;"; 
  

if($result = mysqli_query($conn,$query))
{
  $num_results=mysqli_num_rows($result);

  if($num_results <=0 )
  {
    echo "Not found!";
    exit;
  }
  else
  {
      echo '<table border = "2" ><tr align="center"><td>Numar filme SF</td></td><td>Actor</td></tr>';
      for ($i = 0; $i < $num_results ; $i++) 
      {
        $row = mysqli_fetch_assoc($result);

            echo '<tr align="center"><td>' ;
              echo stripslashes($row['Numar filme SF']).'</td>';
            echo '<td>';
              echo stripslashes($row['Actor']).'</td>';
          echo '</tr>';
      }
      echo '</table><br><br>';
  }
}

mysqli_close($conn);
?>
<a href="#" onclick="history.back(1);">Back</a>


</body>
</html>