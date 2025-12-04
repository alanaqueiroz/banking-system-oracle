INSERT INTO cliente (nome, cpf) VALUES ('João Silva','12345678901');

BEGIN
    pkg_bancario.abrir_conta(1,'12345-1');
END;
/

BEGIN
    pkg_bancario.deposito(1, 500);
END;
/

-- Sacar
BEGIN
    pkg_bancario.saque(1, 200);
END;
/

SELECT * FROM cliente;
SELECT * FROM conta;
SELECT * FROM transacao;

BEGIN
    pkg_bancario.saque(1, -1000);
END;
/

BEGIN
    pkg_bancario.saque(1, 1000);
END;
/

INSERT INTO cliente (nome, cpf) VALUES ('Maria Souza', '12345678901');

BEGIN
    pkg_bancario.abrir_conta(1, '12345-1');
END;
/

BEGIN
    pkg_bancario.deposito(999, 100);
END;
/

BEGIN
    pkg_bancario.saque(1, 0);
END;
/

BEGIN
    pkg_bancario.deposito(1, 0);
END;
/

BEGIN
    pkg_bancario.deposito(1, -50);
END;
/

SELECT saldo FROM conta WHERE id_conta = 1;

BEGIN
    pkg_bancario.deposito(1, 250);
END;
/

SELECT * FROM transacao ORDER BY id_transacao DESC;