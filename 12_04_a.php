<html>
<head>
<title>12_04_a</title>
</head>
<body>
    <body background='fundal.webp'>
<style>
table{ font-size:18;
	   background-color:  #F6D8F5}
td{padding: 7px}
body{ background-color: #aaff80}
</style>

<h2>Să se afișeze detaliile numele studioului, numele președintelui studioului și numele producătorului ce au produs filmul "CODA", folosind operatorul JOIN.</h2>
<?php

$user='root';
$pass='';
$host='localhost';
$db_name='popesc';

$conn=mysqli_connect($host,$user,$pass,$db_name);

$query = "SELECT Studio.nume, Persoana1.nume, Persoana2.nume, Film.titlu
        FROM Film
        JOIN Persoana Persoana2 ON (Film.id_producator = Persoana2.id_persoana) 
        JOIN Studio ON (Film.studio = Studio.nume) JOIN Persoana Persoana1 ON (Studio.id_presedinte=Persoana1.id_persoana) WHERE Film.titlu = 'CODA'"; 

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
      echo '<table border = "2" ><tr align="center"><td>Studio</td>Presedinte Studio</td></td><td>Producator</td></td><td>Titlu</td></tr>';
      for ($i = 0; $i < $num_results ; $i++) 
      {
          $row = mysqli_fetch_assoc($result);

          echo '<tr align="center"><td>' ;
             echo stripslashes($row['Studio']).'</td>';
          echo '<td>';
             echo stripslashes($row['Presedinte Studio']).'</td>';
          echo '<td>';
             echo stripslashes($row['Producator']).'</td>';
          echo '<td>';
             echo stripslashes($row['Titlu']).'</td>';
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