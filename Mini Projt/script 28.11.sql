USE Oficina;

SELECT *
FROM VEICULO
WHERE marca_veiculo = 'Ford';

SELECT DISTINCT C.nome_cliente, C.id_cliente
FROM CLIENTE C
JOIN VEICULO V ON C.id_cliente = V.id_cliente
JOIN ordem_servico OS ON V.id_veiculo = OS.id_veiculo
WHERE OS.data_abertura >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

SELECT nome_mecanico, especialidade
FROM MECANICOS
WHERE especialidade = 'Injeção Eletrônica';

SELECT id_servico, id_veiculo, data_abertura, status_os
FROM ordem_servico
WHERE status_os = 'Aguardando Peça';

SELECT DISTINCT id_servico
FROM realiza -- Tabela que liga SERVICO (OS) a MECANICOS
WHERE id_mecanico = 3;

SELECT nome_peca, qtde_estoque
FROM ESTOQUE
WHERE qtde_estoque < 5;

SELECT placa_veiculo, modelo_veiculo
FROM VEICULO V
WHERE (
    SELECT COUNT(*)
    FROM ordem_servico OS
    WHERE OS.id_veiculo = V.id_veiculo
) > 1;

SELECT nome_peca, preco_venda, preco_custo
FROM ESTOQUE
WHERE preco_custo > 200.00;

UPDATE ESTOQUE
SET valor_peca = valor_peca * 1.05
WHERE fabricante = 'Bosch';

UPDATE ordem_servico
SET status_os = 'Concluída'
WHERE id_servico = 105
AND status_os = 'Em Execução';

UPDATE ordem_servico
SET data_conclusao = CURDATE(),
    status_os = 'Concluída'
WHERE status_os = 'Em Execução'
AND data_abertura < DATE_SUB(CURDATE(), INTERVAL 30 DAY);

UPDATE ESTOQUE
SET qtde_estoque = qtde_estoque * 2
WHERE id_peca = 20;

ALTER TABLE CLIENTE
ADD COLUMN email VARCHAR(100);

ALTER TABLE MECANICOS
MODIFY COLUMN especialidade VARCHAR(150);

ALTER TABLE ordem_servico
DROP COLUMN diagnostico_entrada;

ALTER TABLE ESTOQUE
ADD CONSTRAINT chk_preco_venda_maior_custo CHECK (preco_venda >= preco_custo);