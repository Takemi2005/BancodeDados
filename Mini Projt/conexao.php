<?php

$host = "localhost";
$usuario = "root";   
$senha = "senaisp";         
$banco = "Oficina"; //setup_db.sql


$conexao = new mysqli($host, $usuario, $senha, $banco);

// Verifica a conexão
if ($conexao->connect_error) {
    die("Falha na conexão com o Banco de Dados: " . $conexao->connect_error);
}

// Charset para UTF-8 (acentuação)
$conexao->set_charset("utf8");
?>