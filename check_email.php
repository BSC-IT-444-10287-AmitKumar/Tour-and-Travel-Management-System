<?php
include('includes/config.php');
$email=$_POST['email'];

$sql="SELECT EmailId FROM tblusers WHERE EmailId=:email";
$query=$dbh->prepare($sql);
$query->bindParam(':email',$email,PDO::PARAM_STR);
$query->execute();

echo ($query->rowCount()>0) ? "<span style='color:red'>Email exists</span>" : "<span style='color:green'>Available</span>";
?>