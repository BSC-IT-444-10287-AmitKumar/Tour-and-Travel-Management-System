<?php
include('includes/config.php');
$fname=$_POST['fname'];

$sql="SELECT FullName FROM tblusers WHERE FullName=:fname";
$query=$dbh->prepare($sql);
$query->bindParam(':fname',$fname,PDO::PARAM_STR);
$query->execute();

echo ($query->rowCount()>0) ? "<span style='color:red'>Username exists</span>" : "<span style='color:green'>Available</span>";
?>