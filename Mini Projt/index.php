<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Sistema de Gerenciamento da Oficina</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; background-color: #f4f4f9; }
        .container { max-width: 800px; margin: auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        h1 { text-align: center; color: #333; }
        .menu-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 20px; margin-top: 30px; }
        .menu-item {
            text-decoration: none;
            background-color: #007bff;
            color: white;
            padding: 25px;
            border-radius: 6px;
            text-align: center;
            font-size: 18px;
            font-weight: bold;
            transition: background-color 0.3s;
        }
        .menu-item:hover { background-color: #0056b3; }
        .item-cliente { background-color: #4CAF50; }
        .item-veiculo { background-color: #FFC107; }
        .item-estoque { background-color: #9C27B0; }
        .item-mecanico { background-color: #2196F3; }
        .item-servico { background-color: #FF5722; }
    </style>
</head>
<body>

    <div class="container">
        <h1>Gerenciamento da Oficina Mecânica</h1>
        <p style="text-align: center;">Selecione a área para gerenciar os dados.</p>
        
        <div class="menu-grid">
            <a href="cliente_crud.php" class="menu-item item-cliente">👤 Cliente</a>
            <a href="veiculo_crud.php" class="menu-item item-veiculo">🚗 Veículo</a>
            <a href="estoque_crud.php" class="menu-item item-estoque">📦 Estoque/Peças</a>
            <a href="mecanicos_crud.php" class="menu-item item-mecanico">👨‍🔧 Mecânicos</a>
            <a href="servico_crud.php" class="menu-item item-servico">📝 Ordem de Serviço</a>
        </div>
        <p style="margin-top: 40px; text-align: center; font-size: 0.9em;"></p>
    </div>
</body>
</html>