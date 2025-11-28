<?php
include 'conexao.php'; // Inclui a conexão única

$mensagem = "";
$veiculo_edicao = null;

// --- CREATE (INSERT) ---
if (isset($_POST['adicionar'])) {
    $modelo = $conexao->real_escape_string($_POST['modelo']);
    $marca = $conexao->real_escape_string($_POST['marca']);
    $placa = $conexao->real_escape_string($_POST['placa']);
    $descricao = $conexao->real_escape_string($_POST['descricao']);
    $id_cliente = intval($_POST['id_cliente']);

    $sql = "INSERT INTO VEICULO (modelo_veiculo, marca_veiculo, placa_veiculo, descricao_veiculo, id_cliente) 
            VALUES ('$modelo', '$marca', '$placa', '$descricao', $id_cliente)";

    if ($conexao->query($sql) === TRUE) {
        $mensagem = "<p style='color: green;'>✅ Veículo adicionado com sucesso!</p>";
    } else {
        $mensagem = "<p style='color: red;'>❌ Erro: " . $conexao->error . "</p>";
    }
}

// --- DELETE ---
if (isset($_GET['deletar'])) {
    $id = intval($_GET['deletar']);
    $sql = "DELETE FROM VEICULO WHERE id_veiculo = $id";

    if ($conexao->query($sql) === TRUE) {
        $mensagem = "<p style='color: green;'>🗑️ Veículo deletado com sucesso!</p>";
    } else {
        $mensagem = "<p style='color: red;'>❌ Erro ao deletar: " . $conexao->error . "</p>";
    }
}

// --- UPDATE - Etapa 1: Carregar dados ---
if (isset($_GET['editar'])) {
    $id_edicao = intval($_GET['editar']);
    $sql_edicao = "SELECT * FROM VEICULO WHERE id_veiculo = $id_edicao";
    $resultado_edicao = $conexao->query($sql_edicao);
    if ($resultado_edicao->num_rows == 1) {
        $veiculo_edicao = $resultado_edicao->fetch_assoc();
    }
}

// --- UPDATE - Etapa 2: Salvar edição ---
if (isset($_POST['editar_salvar'])) {
    $id = intval($_POST['id_veiculo']);
    $modelo = $conexao->real_escape_string($_POST['modelo']);
    $marca = $conexao->real_escape_string($_POST['marca']);
    $placa = $conexao->real_escape_string($_POST['placa']);
    $descricao = $conexao->real_escape_string($_POST['descricao']);
    $id_cliente = intval($_POST['id_cliente']);

    $sql = "UPDATE VEICULO SET modelo_veiculo='$modelo', marca_veiculo='$marca', placa_veiculo='$placa', descricao_veiculo='$descricao', id_cliente=$id_cliente WHERE id_veiculo=$id";

    if ($conexao->query($sql) === TRUE) {
        $mensagem = "<p style='color: green;'>📝 Veículo atualizado com sucesso!</p>";
        header("Location: veiculo_crud.php");
        exit();
    } else {
        $mensagem = "<p style='color: red;'>❌ Erro ao atualizar: " . $conexao->error . "</p>";
    }
}

// --- READ (SELECT) e Lista de Clientes ---
$sql_select = "SELECT V.*, C.nome_cliente FROM VEICULO V JOIN CLIENTE C ON V.id_cliente = C.id_cliente ORDER BY V.placa_veiculo";
$resultado = $conexao->query($sql_select);

$sql_clientes = "SELECT id_cliente, nome_cliente FROM CLIENTE ORDER BY nome_cliente";
$clientes_result = $conexao->query($sql_clientes);

$conexao->close(); // Fecha a conexão
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>CRUD de Veículos</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background-color: #f4f4f9; }
        .container { max-width: 900px; margin: auto; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        h1 { color: #4CAF50; }
        h2 { border-bottom: 2px solid #eee; padding-bottom: 5px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        th { background-color: #4CAF50; color: white; }
        .form-container input[type="text"] { padding: 8px; margin: 5px 0; border: 1px solid #ccc; border-radius: 4px; width: 100%; box-sizing: border-box; }
        .form-container input[type="submit"], .btn { padding: 10px 15px; margin-top: 10px; border: none; border-radius: 4px; cursor: pointer; color: white; }
        .btn-add { background-color: #4CAF50; }
        .btn-edit { background-color: #2196F3; }
        .btn-delete { background-color: #f44336; }
        .btn-cancel { background-color: #777; }
        .btn-back { display: block; width: 150px; text-align: center; text-decoration: none; background-color: #555; margin-top: 20px; }
    </style>
</head>
<body>

    <div class="container">
        <h1> Gerenciamento de Veículos</h1>
        <?= $mensagem ?>

        <h2><?= $veiculo_edicao ? '✏️ Editar Veículo' : '➕ Adicionar Novo Veículo' ?></h2>

        <div class="form-container">
            <form method="POST">
                <?php if ($veiculo_edicao): ?>
                    <input type="hidden" name="id_veiculo" value="<?= $veiculo_edicao['id_veiculo'] ?>">
                <?php endif; ?>

                <label for="placa">Placa (7 caracteres):</label>
                <input type="text" id="placa" name="placa" value="<?= $veiculo_edicao ? $veiculo_edicao['placa_veiculo'] : '' ?>" required>

                <label for="modelo">Modelo:</label>
                <input type="text" id="modelo" name="modelo" value="<?= $veiculo_edicao ? $veiculo_edicao['modelo_veiculo'] : '' ?>">

                <label for="marca">Marca:</label>
                <input type="text" id="marca" name="marca" value="<?= $veiculo_edicao ? $veiculo_edicao['marca_veiculo'] : '' ?>">
                
                <label for="descricao">Descrição:</label>
                <input type="text" id="descricao" name="descricao" value="<?= $veiculo_edicao ? $veiculo_edicao['descricao_veiculo'] : '' ?>">

                <label for="id_cliente">Proprietário (Cliente):</label>
                <select id="id_cliente" name="id_cliente" required>
                    <?php 
                    // Garante que o SELECT de clientes rode antes de fechar a conexão
                    if ($clientes_result->num_rows > 0) {
                        while($cliente = $clientes_result->fetch_assoc()) {
                            $selected = ($veiculo_edicao && $cliente['id_cliente'] == $veiculo_edicao['id_cliente']) ? 'selected' : '';
                            echo "<option value='" . $cliente['id_cliente'] . "' $selected>" . $cliente['nome_cliente'] . "</option>";
                        }
                    } else {
                        echo "<option value=''>Cadastre um cliente primeiro</option>";
                    }
                    ?>
                </select>

                <?php if ($veiculo_edicao): ?>
                    <input type="submit" name="editar_salvar" value="Salvar Edição" class="btn-edit">
                    <a href="veiculo_crud.php" class="btn btn-cancel">Cancelar</a>
                <?php else: ?>
                    <input type="submit" name="adicionar" value="Adicionar Veículo" class="btn-add">
                <?php endif; ?>
            </form>
        </div>

        <h2>📝 Lista de Veículos</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Placa</th>
                    <th>Modelo</th>
                    <th>Marca</th>
                    <th>Descrição</th>
                    <th>Proprietário</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <?php
                // O resultado do SELECT já está pronto (Resultado da query com JOIN)
                if ($resultado->num_rows > 0) {
                    while($row = $resultado->fetch_assoc()) {
                        echo "<tr>";
                        echo "<td>" . $row["id_veiculo"] . "</td>";
                        echo "<td>" . $row["placa_veiculo"] . "</td>";
                        echo "<td>" . $row["modelo_veiculo"] . "</td>";
                        echo "<td>" . $row["marca_veiculo"] . "</td>";
                        echo "<td>" . $row["descricao_veiculo"] . "</td>";
                        echo "<td>" . $row["nome_cliente"] . "</td>";
                        echo "<td>
                                <a href='?editar=" . $row["id_veiculo"] . "' class='btn btn-edit'>Editar</a>
                                <a href='?deletar=" . $row["id_veiculo"] . "' onclick=\"return confirm('Tem certeza que deseja deletar este veículo?');\" class='btn btn-delete'>Deletar</a>
                              </td>";
                        echo "</tr>";
                    }
                } else {
                    echo "<tr><td colspan='7'>Nenhum veículo encontrado.</td></tr>";
                }
                ?>
            </tbody>
        </table>
        
        <a href="index.php" class="btn btn-back">Voltar ao Menu</a>
    </div>
</body>
</html>