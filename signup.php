<?php
session_start();
include('includes/config.php');
error_reporting(0);

if(isset($_POST['submit']))
{
$fname = $_POST['fname'];
$mnumber = $_POST['mobilenumber'];
$email = strtolower($_POST['email']);
$mnumber = $_POST['mobilenumber'];
$password = $_POST['password'];

// 🔴 ADD THIS BLOCK HERE 👇

// ❌ GMAIL VALIDATION
if (!preg_match('/^[a-z0-9._%+-]+@gmail\.com,@outlook\.com$/', $email)) {
    echo "<script>alert('Only Gmail addresses are allowed');</script>";
    exit();
}

// 🔴 THEN CONTINUE YOUR CODE

// ❌ EMAIL FORMAT
if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
    echo "<script>alert('Invalid Email Format');</script>";
    exit();
}
$password = $_POST['password'];


// ❌ PASSWORD LENGTH
if(strlen($password) < 8){
    echo "<script>alert('Password must be at least 8 characters');</script>";
    exit();
}

// ❌ MOBILE VALIDATION
if(!preg_match('/^[0-9]{10}$/', $mnumber)){
    echo "<script>alert('Mobile must be 10 digits');</script>";
    exit();
}

// ❌ EMAIL EXISTS
$sql1 = "SELECT EmailId FROM tblusers WHERE EmailId=:email";
$query1 = $dbh->prepare($sql1);
$query1->bindParam(':email', $email, PDO::PARAM_STR);
$query1->execute();
if($query1->rowCount() > 0){
    echo "<script>alert('Email already exists');</script>";
    exit();
}

// ❌ MOBILE EXISTS
$sql2 = "SELECT MobileNumber FROM tblusers WHERE MobileNumber=:mnumber";
$query2 = $dbh->prepare($sql2);
$query2->bindParam(':mnumber', $mnumber, PDO::PARAM_STR);
$query2->execute();
if($query2->rowCount() > 0){
    echo "<script>alert('Mobile already exists');</script>";
    exit();
}

// ❌ USER EXISTS
$sql3 = "SELECT FullName FROM tblusers WHERE FullName=:fname";
$query3 = $dbh->prepare($sql3);
$query3->bindParam(':fname', $fname, PDO::PARAM_STR);
$query3->execute();
if($query3->rowCount() > 0){
    echo "<script>alert('Username already exists');</script>";
    exit();
}

// ✅ INSERT
$password = md5($password);

$sql="INSERT INTO tblusers(FullName,MobileNumber,EmailId,Password) 
VALUES(:fname,:mnumber,:email,:password)";
$query = $dbh->prepare($sql);

$query->bindParam(':fname',$fname,PDO::PARAM_STR);
$query->bindParam(':mnumber',$mnumber,PDO::PARAM_STR);
$query->bindParam(':email',$email,PDO::PARAM_STR);
$query->bindParam(':password',$password,PDO::PARAM_STR);

$query->execute();

echo "<script>alert('Registration Successful'); window.location='thankyou.php';</script>";
}
?>
<!DOCTYPE html>
<html>
<head>
    <style>
body {
    background: #020c1b;
    font-family: Arial, sans-serif;
}

.container-box {
    width: 350px;
    margin: 100px auto;
    padding: 30px;
    background: #04152d;
    border-radius: 15px;
    box-shadow: 0 0 25px #00f0ff;
    text-align: center;
}

.container-box h2 {
    color: #00f0ff;
    margin-bottom: 20px;
}

input {
    width: 100%;
    padding: 12px;
    margin: 10px 0;
    border-radius: 25px;
    border: none;
    outline: none;
    background: #1e2a38;
    color: black;
    font-weight: bold;
}

input::placeholder {
    color: #aaa;
}

button, input[type="submit"] {
    width: 50%;
    padding: 10px;
    border-radius: 25px;
    border: none;
    background: linear-gradient(45deg, #00f0ff, #008cff);
    color: black;
    font-weight: bold;
    cursor: pointer;
    transition: 0.3s;
}

button:hover, input[type="submit"]:hover {
    box-shadow: 0 0 15px #00f0ff;
}

a {
    color: #00f0ff;
    text-decoration: none;
}

a:hover {
    text-decoration: underline;
}
</style>
<title>Signup</title>
<style>
span{font-size:13px;}
</style>
</head>

<body>

<div class="container-box">
    <h2>Create Account</h2>

    <form method="post">

        <input style="color: black; font-weight: bold;" type="text" name="fname" placeholder="Full Name" required>

        <input style="color: black; font-weight: bold;" type="text" name="mobilenumber" placeholder="Mobile Number" maxlength="10" required>

        <input style="color: black; font-weight: bold;" type="email" name="email" placeholder="Email" required>

        <input style="color: black; font-weight: bold;" type="password" name="password" placeholder="Password (min 8 chars)" required>

        <input style="color: black; font-weight: bold;" type="submit" name="submit" value="Register">

    </form>

    <br>
    <a href="index.php">Back to home</a>
</div>

<script>
let submitBtn = document.getElementById("submit");

function checkEmail() {
    let email = document.getElementById("email").value;

    fetch("check_email.php", {
        method: "POST",
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: "email=" + email
    })
    .then(res => res.text())
    .then(data => {
        document.getElementById("email-status").innerHTML = data;

        if(data.includes("exists")){
            submitBtn.disabled = true;
        } else {
            submitBtn.disabled = false;
        }
    });
}

function checkMobile() {
    let mobile = document.getElementById("mobile").value;

    fetch("check_mobile.php", {
        method: "POST",
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: "mobile=" + mobile
    })
    .then(res => res.text())
    .then(data => {
        document.getElementById("mobile-status").innerHTML = data;
        
        if(data.includes("exists")){
            submitBtn.disabled = true;
        } else {
            submitBtn.disabled = false;
        }
    });
}

function checkUser() {
    let fname = document.getElementById("fname").value;

    fetch("check_user.php", {
        method: "POST",
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: "fname=" + fname
    })
    .then(res => res.text())
    .then(data => {
        document.getElementById("user-status").innerHTML = data;
        
        if(data.includes("exists")){
            submitBtn.disabled = true;
        } else {
            submitBtn.disabled = false;
        }
    });
}
</script>

</body>
</html>