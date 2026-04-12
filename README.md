# 📊 Análise de Dados — Suporte Técnico

Projeto de modelagem e análise de banco de dados relacional simulando um sistema real de gestão de manutenção técnica. Desenvolvido com base na experiência prática em suporte técnico, unindo conhecimento de infraestrutura com visão analítica de dados.

---

## 🗂️ Estrutura do Banco de Dados

```
Clientes
    │
    └── Equipamentos (Notebook, Smartphone, etc.)
            │
            └── Ordens_Servico (OS)
```

| Tabela | Descrição |
|---|---|
| `Clientes` | Dados dos clientes atendidos |
| `Equipamentos` | Aparelhos vinculados a cada cliente |
| `Ordens_Servico` | Registros de atendimento, serviço e valor |

---

## 🔍 Análises Disponíveis

| # | Query | Insight gerado |
|---|---|---|
| 1 | Faturamento por marca | Quais marcas geram mais receita |
| 2 | Serviços mais realizados | Quais serviços têm maior demanda |
| 3 | OS por cliente | Clientes mais frequentes e valor gerado |
| 4 | Pendentes vs concluídas | Taxa de conclusão das ordens |
| 5 | Faturamento mensal | Evolução da receita ao longo do tempo |
| 6 | Aparelhos mais atendidos | Tipo de equipamento com maior volume |
| 7 | Clientes com OS pendentes | Lista para follow-up comercial |
| 8 | Ticket médio por serviço | Precificação e rentabilidade por serviço |

---

## 💡 Exemplo de Query e Resultado

```sql
-- Faturamento total por marca
SELECT 
    e.marca,
    COUNT(o.id_os) AS total_ordens,
    SUM(o.valor_total) AS faturamento_total
FROM Equipamentos e
JOIN Ordens_Servico o ON e.id_equipamento = o.id_equipamento
WHERE o.status_os = 'Concluído'
GROUP BY e.marca
ORDER BY faturamento_total DESC;
```

**Resultado esperado:**

| marca | total_ordens | faturamento_total |
|---|---|---|
| Samsung | 42 | R$ 8.750,00 |
| Apple | 35 | R$ 12.400,00 |
| Dell | 18 | R$ 5.200,00 |

---

## 🛠️ Tecnologias

- **MySQL** — banco de dados relacional
- **SQL Workbench / VS Code** — ambiente de desenvolvimento

---

## 📁 Arquivos

```
analise-dados-suporte-sql/
├── schema.sql     # criação das tabelas e relacionamentos
└── queries.sql    # consultas de análise de negócio
```

---

## 👨‍💻 Autor

**Eduardo Fioreti**
- LinkedIn: [linkedin.com/in/eduardofioreti](https://www.linkedin.com/in/eduardofioreti)
- Email: eduardofioretidev@gmail.com
