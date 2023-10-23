<html>
<head>
<title>12_04_b</title>
</head>
<body>
    <body background='fundal3.webp'>
<style>
table{ font-size:18;
	   background-color:  #F6D8F5}
td{padding: 7px}
body{ background-color: #aaff80}
</style>

<h2>Care sunt perechile (id_actor, id_actor2) de actori de sex diferit ce au jucat în același film? O pereche este unică în rezultat.
    (Se foloseste operatorul JOIN)</h2>
<?php


$user='root';
$pass='';
$host='localhost';
$db_name='popesc';

$conn=mysqli_connect($host,$user,$pass,$db_name);

$query = "SELECT Distributie1.id_actor as "Actor 1", Distributie2.id_actor  as "Actor 2", Distributie1.titlu_film
          FROM Persoana Persoana1
          JOIN Distributie Distributie1 ON (Distributie1.id_actor = Persoana1.id_persoana) 
          JOIN Distributie Distributie2 ON (Distributie2.titlu_film = Distributie1.titlu_film) 
          JOIN Persoana Persoana2 ON (Distributie2.id_actor = Persoana2.id_persoana) 
          WHERE (Persoana1.sex = 'F' AND Persoana2.sex = 'M');"; 

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
      echo '<table border = "2" ><tr align="center"><td></td><td>(idpers, nrcard1, nrcard2)</td></tr>';
      for ($i = 0; $i < $num_results ; $i++) {
          $row = mysqli_fetch_array($result);

          echo '<tr align="center"><td>' . ($i + 1) . '.</td><td>( ';
          echo htmlspecialchars(stripslashes($row[0]));
          echo ',&nbsp';
          echo stripslashes($row[1]);
          echo ',&nbsp ';
          echo stripslashes($row[2]);
          echo ' )</td></tr>';
        }
      echo '</table><br><br>';
  }
}

mysqli_close($conn);
?>
<a href="#" onclick="history.back(1);">Back</a>


</body>
</html>