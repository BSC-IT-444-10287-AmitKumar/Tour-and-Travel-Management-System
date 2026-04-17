<?php
include('includes/config.php');
$mobile=$_POST['mobile'];

$sql="SELECT MobileNumber FROM tblusers WHERE MobileNumber=:mobile";
$query=$dbh->prepare($sql);
$query->bindParam(':mobile',$mobile,PDO::PARAM_STR);
$query->execute();

echo ($query->rowCount()>0) ? "<span style='color:red'>Mobile exists</span>" : "<span style='color:green'>Available</span>";
?>