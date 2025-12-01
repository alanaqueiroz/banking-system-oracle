-- Criar cliente
INSERT INTO cliente (nome, cpf) VALUES ('João Silva','12345678901');

-- Abrir conta
BEGIN
    pkg_bancario.abrir_conta(1,'12345-1');
END;
/

-- Depositar
BEGIN
    pkg_bancario.deposito(1, 500);
END;
/

-- Sacar
BEGIN
    pkg_bancario.saque(1, 200);
END;
/

-- Consultas
SELECT * FROM cliente;
SELECT * FROM conta;
SELECT * FROM transacao;

-- Testar erro de saldo negativo
BEGIN
    pkg_bancario.saque(1, -1000);
END;
/

-- Teste: saque além do saldo
BEGIN
    pkg_bancario.saque(1, 1000);
END;
/

-- Teste: CPF duplicado
INSERT INTO cliente (nome, cpf) VALUES ('Maria Souza', '12345678901');

-- Teste: Abrir conta com número já existente
BEGIN
    pkg_bancario.abrir_conta(1, '12345-1');
END;
/

-- Teste: Depósito em conta inexistente
BEGIN
    pkg_bancario.deposito(999, 100);
END;
/

-- Teste: Saque valor zero
BEGIN
    pkg_bancario.saque(1, 0);
END;
/

-- Teste: Depósito valor zero
BEGIN
    pkg_bancario.deposito(1, 0);
END;
/

-- Teste: Depósito negativo
BEGIN
    pkg_bancario.deposito(1, -50);
END;
/

-- Consultar saldo após erros
SELECT saldo FROM conta WHERE id_conta = 1;

-- Realizar novo depósito
BEGIN
    pkg_bancario.deposito(1, 250);
END;
/

SELECT * FROM transacao ORDER BY id_transacao DESC;
