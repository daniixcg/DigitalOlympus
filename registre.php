<?php
// Connexió a la base de dades
$servidor = "localhost";
$usuari = "root";
$contrasenya = "";
$base_dades = "registre_usuaris";

$connexio = new mysqli($servidor, $usuari, $contrasenya, $base_dades);

// Comprovar connexió
if ($connexio->connect_error) {
    die("Error de connexió: " . $connexio->connect_error);
}

// Obtenir dades del formulari
$nom = $_POST['nom'];
$email = $_POST['email'];
$descripcio = $_POST['descripcio'];



$email = "usuario@example.com"; 

// La clave debe tener 32 bytes para AES-256
$key = "esta_es_una_clave_de_32_bytes_123"; // Debe ser exactamente de 32 caracteres

// Generar un IV (vector de inicialización) aleatorio
$iv = openssl_random_pseudo_bytes(openssl_cipher_iv_length('AES-256-CBC'));

// Encriptar el correo electrónico usando AES-256-CBC
$email_encriptado = openssl_encrypt($email, 'AES-256-CBC', $key, 0, $iv);

// Codificar el resultado en base64 para hacerlo fácilmente almacenable o transmisible
$email_encriptado_base64 = base64_encode($iv . $email_encriptado);

echo "Email encriptado: " . $email_encriptado_base64;



echo "Email encriptado: " . $email_encriptado_base64;

// Inserir dades a la base de dades
$sql = "INSERT INTO incendias (nom, email, descripcio) 
        VALUES ('$nom', '$email', '$descripcio')";

if ($connexio->query($sql) === TRUE) {
    echo "Incidencia reportada  amb exit.";
} else {
    echo "Error: " . $sql . "<br>" . $connexio->error;
}

// Tancar connexió
$connexio->close();
?>