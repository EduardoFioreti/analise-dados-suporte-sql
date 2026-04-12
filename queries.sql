-- ============================================================
-- Análise de Dados - Suporte Técnico
-- Eduardo Fioreti
-- ============================================================

-- ── 1. Faturamento total por marca de equipamento ──────────
SELECT 
    e.marca,
    COUNT(o.id_os) AS total_ordens,
    SUM(o.valor_total) AS faturamento_total
FROM Equipamentos e
JOIN Ordens_Servico o ON e.id_equipamento = o.id_equipamento
WHERE o.status_os = 'Concluído'
GROUP BY e.marca
ORDER BY faturamento_total DESC;

-- ── 2. Serviços mais realizados ────────────────────────────
SELECT 
    servico_realizado,
    COUNT(*) AS total_realizados,
    SUM(valor_total) AS receita_gerada
FROM Ordens_Servico
WHERE status_os = 'Concluído'
GROUP BY servico_realizado
ORDER BY total_realizados DESC;

-- ── 3. Quantidade de OS por cliente ───────────────────────
SELECT 
    c.nome AS cliente,
    c.telefone,
    COUNT(o.id_os) AS total_os,
    SUM(o.valor_total) AS valor_total_gasto
FROM Clientes c
JOIN Equipamentos e ON c.id_cliente = e.id_cliente
JOIN Ordens_Servico o ON e.id_equipamento = o.id_equipamento
GROUP BY c.id_cliente, c.nome, c.telefone
ORDER BY total_os DESC;

-- ── 4. OS pendentes vs concluídas ─────────────────────────
SELECT 
    status_os,
    COUNT(*) AS quantidade,
    SUM(valor_total) AS valor_total,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Ordens_Servico), 2) AS percentual
FROM Ordens_Servico
GROUP BY status_os;

-- ── 5. Faturamento mensal ──────────────────────────────────
SELECT 
    DATE_FORMAT(data_entrada, '%Y-%m') AS mes,
    COUNT(id_os) AS total_ordens,
    SUM(valor_total) AS faturamento
FROM Ordens_Servico
WHERE status_os = 'Concluído'
GROUP BY mes
ORDER BY mes DESC;

-- ── 6. Tipo de aparelho mais atendido ─────────────────────
SELECT 
    e.tipo_aparelho,
    COUNT(o.id_os) AS total_atendimentos,
    ROUND(AVG(o.valor_total), 2) AS ticket_medio
FROM Equipamentos e
JOIN Ordens_Servico o ON e.id_equipamento = o.id_equipamento
GROUP BY e.tipo_aparelho
ORDER BY total_atendimentos DESC;

-- ── 7. Clientes com OS pendentes (follow-up) ──────────────
SELECT 
    c.nome AS cliente,
    c.telefone,
    e.marca,
    e.modelo,
    o.servico_realizado,
    o.data_entrada AS entrada
FROM Clientes c
JOIN Equipamentos e ON c.id_cliente = e.id_cliente
JOIN Ordens_Servico o ON e.id_equipamento = o.id_equipamento
WHERE o.status_os = 'Pendente'
ORDER BY o.data_entrada ASC;

-- ── 8. Ticket médio por tipo de serviço ───────────────────
SELECT 
    servico_realizado,
    COUNT(*) AS total,
    ROUND(AVG(valor_total), 2) AS ticket_medio,
    MIN(valor_total) AS menor_valor,
    MAX(valor_total) AS maior_valor
FROM Ordens_Servico
GROUP BY servico_realizado
ORDER BY ticket_medio DESC;
