USE Oficina;
-- 1.1 
SELECT *
FROM VEICULO
WHERE marca_veiculo = 'Ford';

-- 1.2
SELECT DISTINCT C.nome_cliente, C.cpf_cliente
FROM CLIENTE C
INNER JOIN VEICULO V ON C.id_cliente = V.id_cliente
INNER JOIN ordem_servico OS ON V.id_veiculo = OS.id_veiculo
INNER JOIN SERVICO S ON OS.id_servico = S.id_servico
WHERE S.data_entrega_servico >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

-- 1.3 
-- ALTER TABLE MECANICOS ADD COLUMN especialidade_mecanico VARCHAR(100); 
-- (Comando de alteração não solicitado)
SELECT nome_mecanico, contato_mecanico
FROM MECANICOS
WHERE especialidade_mecanico = 'Injeção Eletrônica';

-- 1.4
-- ALTER TABLE SERVICO ADD COLUMN status_servico VARCHAR(50); 
-- (Comando de alteração não solicitado)
SELECT *
FROM SERVICO
WHERE status_servico = 'Aguardando Peça';

-- 1.5
SELECT nome_peca, qtde_estoque, local_estoque
FROM ESTOQUE
WHERE qtde_estoque < 5;

-- 1.6
SELECT V.modelo_veiculo, V.placa_veiculo, V.marca_veiculo
FROM VEICULO V
WHERE (
    SELECT COUNT(OS.id_servico)
    FROM ordem_servico OS
    WHERE OS.id_veiculo = V.id_veiculo
) > 1;

-- 1.7
SELECT S.id_servico, S.nome_servico, S.data_entrega_servico, S.valor_servico
FROM SERVICO S
INNER JOIN realiza R ON S.id_servico = R.id_servico
WHERE R.id_mecanico = 3;

-- 1.8
-- ALTER TABLE ESTOQUE ADD COLUMN preco_custo DECIMAL(5,2);  
-- (Comando de alteração não solicitado)
-- ALTER TABLE ESTOQUE RENAME COLUMN valor_peca TO preco_venda; 
-- (Comando de alteração não solicitado)

SELECT nome_peca, valor_peca AS preco_venda  -- Usando valor_peca como preco_venda
FROM ESTOQUE
WHERE preco_custo > 200.00;

-- 1.9
