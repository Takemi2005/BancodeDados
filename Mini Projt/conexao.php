<?php

// 1. Defina as variáveis de conexão
$servername = "localhost"; // Geralmente 'localhost' para desenvolvimento
$username = "root"; // O nome de usuário do seu banco de dados
$password = "senaisp";   // A senha do seu banco de dados
$dbname = "Oficina";     // O nome do banco de dados ao qual você quer se conectar

// 2. Cria a conexão
$conn = new mysqli($servername, $username, $password, $dbname);

// 3. Checa a conexão
if ($conn->connect_error) {
    // Se houver um erro, o script para e exibe a mensagem de erro
    die("❌ Falha na conexão: " . $conn->connect_error);
}

// 4. Define o charset para evitar problemas com acentuação
$conn->set_charset("utf8mb4");

echo "✅ Conexão estabelecida com sucesso!";

// --- Aqui você faria suas consultas SQL ---

// 5. Fecha a conexão (Importante para liberar recursos)
$conn->close();

?>