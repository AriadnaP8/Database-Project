<html>
<head>
<title>12_05_b</title>
</head>
<body>
	<body background='fundal5.webp'>
<style>
table{ font-size:18;
	   background-color:  #F6D8F5}
td{padding: 7px}
body{ background-color: #aaff80}
</style>


<h3>Să se găsească titlul, anul, genul și durata filmelor cu durata cea mai mică.</h3>
<?php


$user='root';
$pass='';
$host='localhost';
$db_name='popesc';

$conn=mysqli_connect($host,$user,$pass,$db_name);

$query = "SELECT titlu, gen, an, durata
		  FROM Film
		  WHERE Film.durata <= ALL(SELECT Film.durata FROM Film);"; 

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
		echo '<table border = "2" ><tr align="center"><td>titlu</td>gen</td></td><td>an</td></td><td>durata</td></tr>';
		for ($i = 0; $i < $num_results ; $i++) 
		{
			$row = mysqli_fetch_assoc($result);

          echo '<tr align="center"><td>' ;
             echo stripslashes($row['titlu']).'</td>';
          echo '<td>';
             echo stripslashes($row['gen']).'</td>';
          echo '<td>';
             echo stripslashes($row['an']).'</td>';
          echo '<td>';
             echo stripslashes($row['durata']).'</td>';
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