<?php
include 'conexao.php';

$mensagem = "";
$mecanico_edicao = null;

// --- CREATE (INSERT) ---
if (isset($_POST['adicionar'])) {
    $nome = $conexao->real_escape_string($_POST['nome']);
    $cpf = $conexao->real_escape_string($_POST['cpf']);
    $endereco = $conexao->real_escape_string($_POST['endereco']);
    $contato = $conexao->real_escape_string($_POST['contato']);
    $salario = floatval($_POST['salario']);

    $sql = "INSERT INTO MECANICOS (nome_mecanico, cpf_mecanico, endereco_mecanico, contato_mecanico, salario_mecanico) 
            VALUES ('$nome', '$cpf', '$endereco', '$contato', $salario)";

    if ($conexao->query($sql) === TRUE) {
        $mensagem = "<p style='color: green;'>✅ Mecânico adicionado com sucesso!</p>";
    } else {
        $mensagem = "<p style='color: red;'>❌ Erro: " . $conexao->error . "</p>";
    }
}

// --- DELETE ---
if (isset($_GET['deletar'])) {
    $id = intval($_GET['deletar']);
    $sql = "DELETE FROM MECANICOS WHERE id_mecanico = $id";

    if ($conexao->query($sql) === TRUE) {
        $mensagem = "<p style='color: green;'>🗑️ Mecânico deletado com sucesso!</p>";
    } else {
        $mensagem = "<p style='color: red;'>❌ Erro ao deletar: " . $conexao->error . "</p>";
    }
}

// --- UPDATE - Etapa 1: Carregar dados ---
if (isset($_GET['editar'])) {
    $id_edicao = intval($_GET['editar']);
    $sql_edicao = "SELECT * FROM MECANICOS WHERE id_mecanico = $id_edicao";
    $resultado_edicao = $conexao->query($sql_edicao);
    if ($resultado_edicao->num_rows == 1) {
        $mecanico_edicao = $resultado_edicao->fetch_assoc();
    }
}

// --- UPDATE - Etapa 2: Salvar edição ---
if (isset($_POST['editar_salvar'])) {
    $id = intval($_POST['id_mecanico']);
    $nome = $conexao->real_escape_string($_POST['nome']);
    $cpf = $conexao->real_escape_string($_POST['cpf']);
    $endereco = $conexao->real_escape_string($_POST['endereco']);
    $contato = $conexao->real_escape_string($_POST['contato']);
    $salario = floatval($_POST['salario']);

    $sql = "UPDATE MECANICOS SET nome_mecanico='$nome', cpf_mecanico='$cpf', endereco_mecanico='$endereco', contato_mecanico='$contato', salario_mecanico=$salario WHERE id_mecanico=$id";

    if ($conexao->query($sql) === TRUE) {
        $mensagem = "<p style='color: green;'>📝 Mecânico atualizado com sucesso!</p>";
        header("Location: mecanicos_crud.php"); 
        exit();
    } else {
        $mensagem = "<p style='color: red;'>❌ Erro ao atualizar: " . $conexao->error . "</p>";
    }
}

// --- READ (SELECT) ---
$sql_select = "SELECT * FROM MECANICOS ORDER BY nome_mecanico";
$resultado = $conexao->query($sql_select);

$conexao->close();
?>


<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>CRUD de Mecânicos</title>
    <style>
        body { 
            font-family: Arial, sans-serif; 
            margin: 20px; 
            background-color: #f4f4f9; 
        }
        .container { 
            max-width: 900px; 
            margin: auto; 
            background: white; 
            padding: 20px; 
            border-radius: 8px; 
            box-shadow: 0 0 10px rgba(0,0,0,0.1); 
        }
        h1 { 
            color: #4CAF50; 
        }
        h2 { 
            border-bottom: 2px solid #eee; 
            padding-bottom: 5px; 
        }
        table { 
            width: 100%; 
            border-collapse: collapse; 
            margin-top: 20px; 
        }
        th, td { 
            border: 1px solid #ddd; 
            padding: 10px; 
            text-align: left; 
        }
        th { 
            background-color: #4CAF50; 
            color: white; 
        }
        .form-container { 
            margin-bottom: 30px; 
        }
        .form-container label { 
            display: block; 
            margin-top: 10px; 
            font-weight: bold; 
        }
        .form-container input[type="text"], 
        .form-container input[type="number"] { 
            padding: 8px; 
            margin: 5px 0; 
            border: 1px solid #ccc; 
            border-radius: 4px; 
            width: 100%; 
            box-sizing: border-box; 
        }
        .form-container input[type="submit"], 
        .btn { 
            padding: 10px 15px; 
            margin-top: 10px; 
            margin-right: 5px;
            border: none; 
            border-radius: 4px; 
            cursor: pointer; 
            color: white; 
            text-decoration: none;
            display: inline-block;
        }
        .btn-add { 
            background-color: #4CAF50; 
        }
        .btn-edit { 
            background-color: #2196F3; 
        }
        .btn-delete { 
            background-color: #f44336; 
        }
        .btn-cancel { 
            background-color: #777; 
        }
        .btn-back { 
            display: block; 
            width: 150px; 
            text-align: center; 
            text-decoration: none; 
            background-color: #555; 
            margin-top: 20px; 
        }
    </style>
</head>
<body>

    <div class="container">
        <h1> Gerenciamento de Mecânicos</h1>
        <?= $mensagem ?>

        <h2><?= $mecanico_edicao ? '✏️ Editar Mecânico' : '➕ Adicionar Novo Mecânico' ?></h2>

        <div class="form-container">
            <form method="POST">
                <?php if ($mecanico_edicao): ?>
                    <input type="hidden" name="id_mecanico" value="<?= $mecanico_edicao['id_mecanico'] ?>">
                <?php endif; ?>

                <label for="nome">Nome:</label>
                <input type="text" id="nome" name="nome" value="<?= $mecanico_edicao ? $mecanico_edicao['nome_mecanico'] : '' ?>" required>

                <label for="cpf">CPF:</label>
                <input type="text" id="cpf" name="cpf" value="<?= $mecanico_edicao ? $mecanico_edicao['cpf_mecanico'] : '' ?>">

                <label for="endereco">Endereço:</label>
                <input type="text" id="endereco" name="endereco" value="<?= $mecanico_edicao ? $mecanico_edicao['endereco_mecanico'] : '' ?>">
                
                <label for="contato">Contato:</label>
                <input type="text" id="contato" name="contato" value="<?= $mecanico_edicao ? $mecanico_edicao['contato_mecanico'] : '' ?>">

                <label for="salario">Salário (R$):</label>
                <input type="number" step="0.01" id="salario" name="salario" value="<?= $mecanico_edicao ? $mecanico_edicao['salario_mecanico'] : '' ?>" required min="0.00">

                <?php if ($mecanico_edicao): ?>
                    <input type="submit" name="editar_salvar" value="Salvar Edição" class="btn-edit">
                    <a href="mecanicos_crud.php" class="btn btn-cancel">Cancelar</a>
                <?php else: ?>
                    <input type="submit" name="adicionar" value="Adicionar Mecânico" class="btn-add">
                <?php endif; ?>
            </form>
        </div>

        <h2>📝 Lista de Mecânicos</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>CPF</th>
                    <th>Endereço</th>
                    <th>Contato</th>
                    <th>Salário (R$)</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <?php
                if ($resultado->num_rows > 0) {
                    while($row = $resultado->fetch_assoc()) {
                        echo "<tr>";
                        echo "<td>" . $row["id_mecanico"] . "</td>";
                        echo "<td>" . $row["nome_mecanico"] . "</td>";
                        echo "<td>" . $row["cpf_mecanico"] . "</td>";
                        echo "<td>" . $row["endereco_mecanico"] . "</td>";
                        echo "<td>" . $row["contato_mecanico"] . "</td>";
                        echo "<td>R$ " . number_format($row["salario_mecanico"], 2, ',', '.') . "</td>";
                        echo "<td>
                                <a href='?editar=" . $row["id_mecanico"] . "' class='btn btn-edit'>Editar</a>
                                <a href='?deletar=" . $row["id_mecanico"] . "' onclick=\"return confirm('Tem certeza que deseja deletar este mecânico?');\" class='btn btn-delete'>Deletar</a>
                              </td>";
                        echo "</tr>";
                    }
                } else {
                    echo "<tr><td colspan='7'>Nenhum mecânico cadastrado.</td></tr>";
                }
                ?>
            </tbody>
        </table>
        
        <a href="index.php" class="btn btn-back">Voltar ao Menu</a>
    </div>
</body>
</html>