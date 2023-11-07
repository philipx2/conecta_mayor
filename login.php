<?php

  session_start();
  error_reporting(0);
  require 'db.php';
  if(!empty($_POST['user']) && empty($_POST['password'])){
    echo  "Ingrese su Contraseña";
    exit;
  }
  if(empty($_POST['user']) && !empty($_POST['password'])){
    echo  "Ingrese su Rut";
    exit;
  }
  if(empty($_POST['user']) && empty($_POST['password'])){
    echo  "Ingrese su Rut y Contraseña";
    exit;
  }
  if (!empty($_POST['user']) && !empty($_POST['password'])) {
    $records = $conn->prepare("SELECT * FROM x_usuario WHERE user_email = :email AND user_pass = :pass");
    $records->bindParam(':email', $_POST['user']);
    $records->bindParam(':pass', $_POST['password']);
    $records->execute();
    $results = $records->fetch(PDO::FETCH_ASSOC);
    if ($results) {
      $query = "UPDATE x_usuario set last_login = NOW() WHERE user_email= :user";
      $stmt = $conn->prepare($query);
      if ($stmt === false) {
        die(print_r($conn->errorInfo(), true));
      }
      $stmt->bindParam(':user', $_POST['user']);
      if ($stmt->execute() === false) {
        die(print_r($stmt->errorInfo(), true));
      }
      echo "Sesion iniciada satisfactoriamente";
      exit;
    }
    else{
      echo "Usuario no encontrado";
    }
  }
  else{
      echo "Fallo, sus datos no son correctos";
  }

?>