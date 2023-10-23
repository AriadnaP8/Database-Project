<html>
<head>
<title>12_03_b</title>
</head>
<body>
    <body background='fundal1.webp'>
<style>
table{ font-size:18;
	   background-color:  #F6D8F5}
td{padding: 7px}
body{ background-color: #aaff80}
</style>

<h2>------------------------------------------Să se găsească numele persoanelor de sex masculin cu câștig net sub 500000 USD, ordonate crescător.----------------------------------------</h2>

<?php


$user='root';
$pass='';
$host='localhost';
$db_name='popesc';

$conn=mysqli_connect($host,$user,$pass,$db_name);


$query = "SELECT * FROM Persoana
          WHERE sex='M' AND castig_net<500000 AND moneda='USD'
          ORDER BY nume"; 

if($result = mysqli_query($conn, $query))

{
$num_results = mysqli_num_rows($result);

if($num_results <=0 )
{
    echo "Not found!";
    exit;
}
else
{
	
	echo '<br><br><table border = "2" ><tr align="center"><td></td><td>id_persoana</td><td>nume</td><td>adresa</td><td>sex</td><td>data_nasterii</td><td>castig_net</td></td><td>moneda</td></td><td>email</td></tr>';
	for ($i = 0; $i < $num_results ; $i++) {
      $row = mysqli_fetch_assoc($result);
	
	  echo '<tr align="center">';
      echo '<td>' . ($i + 1) . '.</td><td>';
          echo htmlspecialchars(stripslashes($row['id_persoana'])) . '</td>';
      echo '<td>';
          echo stripslashes($row['nume']).'</td>';
      echo '<td>';
          echo stripslashes($row['adresa']).'</td>';
      echo '<td>';
          echo stripslashes($row['sex']).'</td>';
      echo '<td>';
          echo stripslashes($row['data_nasterii']).'</td>';
      echo '<td>';
          echo stripslashes($row['castig_net']).'</td>';
      echo '<td>';
          echo stripslashes($row['moneda']).'</td>';
      echo '<td>';
          echo stripslashes($row['email']).'</td>';  
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