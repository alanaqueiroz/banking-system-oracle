# 🏦 Projeto Sistema Bancário em PL/SQL (Oracle)

Este projeto demonstra a contrução de de sistema bancário simples em Oracle Database XE utilizando PL/SQL, triggers, packages e container Docker.
Inclui criação de usuário, tabelas, trigger de saldo negativo, package de operações bancárias e testes práticos.

- Criação de usuário dedicado
- Tabelas de clientes, contas e transações
- Trigger para impedir saldo negativo
- Package com regras de negócio (abrir conta, depósito, saque)
- Scripts de teste e casos de erro (auditoria)
- Execução em Oracle XE via Docker

## 🚀 Tecnologias Utilizadas

### 🐧 Ambiente
- **Windows 10/11**
- **WSL2**
- **Ubuntu (via WSL)**

### 🐳 Containerização
- **Docker Desktop**
- **Docker Engine**
- **Oracle Database Express Edition em Docker (Docker Image: gvenzl/oracle-xe)**

### 🛢 Banco de Dados
- **Oracle Database XE 21c**
- **Oracle Listener**
- **Oracle PDB (XEPDB1)**

### 🧰 Ferramentas SQL
- **SQL*Plus**
- **PL/SQL**
- **Triggers**
- **Packages**
- **Foreign Keys**
- **Constraints**

---

### 📦 Estrutura do Projeto
```bash
/banking-system-plsql
│
├── sql/
│ ├── create_user.sql
│ ├── create_tables.sql
│ ├── create_trigger.sql
│ ├── pkg_bancario_spec.sql
│ ├── pkg_bancario_body.sql
│ ├── test_data.sql
│
└── README.md
```

## 📌 Funcionalidades do Projeto

- Cadastro de cliente
- Abertura de conta
- Depósitos
- Saques
- Registro automático de transações bancárias
- Trigger que impede saldo negativo
- Package PL/SQL com operações bancárias (regras de negócio)



## 📝 Scripts Incluídos

### Criação de tabelas
- CLIENTE
- CONTA
- TRANSACAO

### Trigger
trg_prevent_saldo_negativo impede atualizações que deixem saldo negativo.

### Package bancário
Procedures:
- abrir_conta(p_id_cliente, p_numero)
- deposito(p_id_conta, p_valor)
- saque(p_id_conta, p_valor)

### Testes
- Criar cliente
- Abrir conta
- Depositar
- Sacar
- Ver registros (transacao)

---

## ⚙️ Como Rodar o Projeto

### 1) Subir a imagem Oracle XE no Docker
```bash
docker pull gvenzl/oracle-xe
docker run -d --name oracle-xe -p 1521:1521 gvenzl/oracle-xe
```

### 2) Acesse o container Oracle XE

```bash
docker exec -it oracle-xe bash
sqlplus sys/oracle as sysdba
```

### 3) Selecionar o PDB

```bash
ALTER SESSION SET CONTAINER = XEPDB1;
SHOW CON_NAME;
```

### 3) Executar os scripts

```bash
@sql/create_user.sql
conn bancario_test/bancario@XEPDB1
@sql/create_tables.sql
@sql/create_trigger.sql
@sql/pkg_bancario_spec.sql
@sql/pkg_bancario_body.sql
@sql/test_data.sql
```

### 4) Finalizar teste (opcional)

```bash
ALTER SESSION SET CONTAINER = XEPDB1;
-- Finaliza sessões ativas (se necessário, troque SID,SERIAL pelo real)
ALTER SYSTEM KILL SESSION 'SID,SERIAL#' IMMEDIATE;
DROP USER bancario_test CASCADE;
```

## 📊 Resultado Esperado

- Cliente criado
- Conta aberta
- Depósito
- Saque
- Trigger impede saque acima do saldo
- Registro de todas as transações