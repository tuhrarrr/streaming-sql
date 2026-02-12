# 🎬 Projeto Banco de Dados – Streaming

Este projeto é um **banco de dados relacional** que simula o funcionamento de uma plataforma de **streaming**, com usuários, planos de assinatura, conteúdos disponíveis e histórico de visualizações.

O objetivo é **praticar modelagem de dados**, uso de **chaves estrangeiras**, **JOINs**, inserção de dados e reset de tabelas.

---

## 🧱 Estrutura do Banco de Dados

O banco é composto pelas seguintes tabelas:

### 👤 usuario
- Armazena os usuários da plataforma
- Cada usuário possui nome, email e data de cadastro

### 💳 planos
- Contém os planos disponíveis para assinatura
- Exemplo: Netflix, Amazon Prime

### 🎞️ conteudo
- Armazena filmes/séries disponíveis
- Inclui título, tipo e duração

### 📝 assinatura
- Relaciona usuários aos planos
- Controla período de assinatura (início e fim)

### ▶️ visualizacao
- Registra quais conteúdos os usuários assistiram
- Guarda data da visualização e progresso assistido

---

## 🔗 Relacionamentos

- Um **usuário** pode ter uma **assinatura**
- Uma **assinatura** está ligada a um **plano**
- Um **usuário** pode ter várias **visualizações**
- Cada **visualização** está ligada a um **conteúdo**

Todos os relacionamentos são feitos usando **FOREIGN KEY**.

---

## 🧪 Dados de Exemplo

O projeto já inclui:
- Usuários cadastrados
- Planos de streaming
- Conteúdos (filmes)
- Assinaturas ativas
- Histórico de visualizações

Isso permite testar consultas reais com `JOIN`.

---

## 🔍 Consulta Final (JOIN)

O projeto possui uma consulta que retorna:

- Nome do usuário.
- Plano assinado.
- Conteúdo assistido.
- Tipo do conteúdo.
- Data da visualização.

Usando múltiplos `JOINs` entre as tabelas.

---

## ♻️ Reset do Banco

O arquivo `reset.sql` permite:
- Limpar todas as tabelas.
- Resetar os `AUTO_INCREMENT`.
- Evitar problemas com chaves estrangeiras.

Ideal para testes e reaprendizado.

---

## 🛠️ Tecnologias Utilizadas

- MySQL.
- SQL puro.
- Modelagem Relacional.

---

## 🎯 Objetivo do Projeto

Projeto criado para fins de **estudo e portfólio**, focado em:
- Banco de dados relacional.
- Modelagem correta.
- Boas práticas com SQL.

---
