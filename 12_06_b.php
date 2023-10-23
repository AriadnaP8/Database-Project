<html>
<head>
<title>12_06_b</title>
</head>
<body>
	<body background='fundal7.webp'>
<style>
table{ font-size:18;
	   background-color:  #F6D8F5}
td{padding: 7px}
body{ background-color: #aaff80}
</style>

<h3>Să se găsească pentru fiecare studio, câștigul net minim, câștigul net mediu și câștigul net maxim al producătorilor filmelor studioului.
    (folosind funcții de agregare)</h3>
<?php

$user='root';
$pass='';
$host='localhost';
$db_name='popesc';

$conn=mysqli_connect($host,$user,$pass,$db_name);
$query = "  SELECT Film.studio AS "Studio",
            MIN(Persoana.castig_net) AS "Castig net minim", 
            AVG(Persoana.castig_net) AS "Castig net mediu",
            MAX(Persoana.castig_net) AS "Castig net maxim"
            FROM Film
            JOIN Persoana ON(Persoana.id_persoana = Film.id_producator)
            GROUP BY Film.studio;"; 
  

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
    echo '<table border = "2" ><tr align="center"><td>Studio</td>Castig net minim</td></td><td>Castig net mediu</td></td><td>Castig net maxim</td></tr>';
    for ($i = 0; $i < $num_results ; $i++) 
    {
        $row = mysqli_fetch_assoc($result);

        echo '<tr align="center"><td>' ;
           echo stripslashes($row['Studio']).'</td>';
        echo '<td>';
           echo stripslashes($row['Castig net minim']).'</td>';
        echo '<td>';
           echo stripslashes($row['Castig net mediu']).'</td>';
        echo '<td>';
           echo stripslashes($row['Castig net maxim']).'</td>';
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