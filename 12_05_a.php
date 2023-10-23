<html>
<head>
<title>12_05_a</title>
</head>
<body>
    <body background='fundal4.webp'>
<style>
table{ font-size:18;
	   background-color:  #F6D8F5}
td{padding: 7px}
body{ background-color: #aaff80}
</style>

<h3>Sa se gaseasca numele producatorilor care au jucat in cel putin un film pe care l-au produs, folosind cel putin o interogare imbricata si operatori de genul EXISTS, IN, ALL, ANY.	</h3>
<?php

$user='root';
$pass='';
$host='localhost';
$db_name='popesc';

$conn=mysqli_connect($host,$user,$pass,$db_name);

$query = "	SELECT Persoana.nume as "Producator", Film.titlu AS "Titlu"
			FROM Film
			JOIN Persoana ON (Film.id_producator = Persoana.id_persoana) 
			WHERE Persoana.id_persoana = ANY
			(SELECT Distributie.id_actor
			FROM Distributie
			WHERE Distributie.titlu_film=Film.titlu);"; 

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
		echo '<table border = "2" ><tr align="center"><td></td><td>Producator</td></td><td>Titlu</td></tr>';
		for ($i = 0; $i < $num_results ; $i++)
		{
			$row = mysqli_fetch_assoc($result);
			echo '<tr align="center"><td>' ;
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