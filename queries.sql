-- consultas por dia 
SELECT 
    DATE(c.Data_Hora) AS 'Dia', 
    COUNT(c.IdConsulta) AS 'Total de Consultas'
FROM consulta c
GROUP BY DATE(c.Data_Hora)
ORDER BY 'Dia';

-- consultas por medicos 
SELECT 
    m.NomeMed AS 'Médico', 
    m.Especialidade AS 'Especialidade', 
    COUNT(c.IdConsulta) AS 'Total de Consultas'
FROM medico m
LEFT JOIN consulta c ON m.CodMed = c.CodMed
GROUP BY m.CodMed, m.NomeMed, m.Especialidade
ORDER BY 'Total de Consultas' DESC;

-- consultas por clinicas 
SELECT 
    cl.NomeCli AS 'Clínica', 
    COUNT(c.IdConsulta) AS 'Total de Consultas'
FROM clinica cl
JOIN consulta c ON cl.CodCli = c.CodCli
GROUP BY cl.NomeCli
ORDER BY 'Total de Consultas' DESC;

-- medicos por clinica
SELECT 
    cli.NomeCli AS 'Clínica',
    m.NomeMed AS 'Médico',
    COUNT(c.IdConsulta) AS 'Total de Consultas'
FROM clinica cli
JOIN consulta c ON cli.CodCli = c.CodCli
JOIN medico m ON c.CodMed = m.CodMed
GROUP BY cli.NomeCli, m.NomeMed
ORDER BY cli.NomeCli, 'Total de Consultas' DESC;

-- numero de medicos por genero
SELECT 
    CASE 
        WHEN m.Sexo = 'M' THEN 'Masculino'
        WHEN m.Sexo = 'F' THEN 'Feminino'
        ELSE 'Outro'
    END AS 'Gênero',
    COUNT(*) AS 'Quantidade'
FROM medico m
GROUP BY m.Sexo;

-- Quantidade de consultas por hora do dia
SELECT 
    HOUR(c.Data_Hora) AS 'Hora do Dia',
    COUNT(c.IdConsulta) AS 'Total de Consultas'
FROM consulta c
GROUP BY HOUR(c.Data_Hora)
ORDER BY 'Hora do Dia';


-- consultas detalhadas clinica/medico/paciente
SELECT 
    DATE_FORMAT(c.Data_Hora, '%d/%m/%Y %H:%i') AS 'Data e Hora',
    cl.NomeCli AS 'Clínica',
    m.NomeMed AS 'Médico',
    p.NomePac AS 'Paciente'
FROM consulta c
JOIN clinica cl ON c.CodCli = cl.CodCli
JOIN medico m ON c.CodMed = m.CodMed
JOIN paciente p ON c.CpfPaciente = p.CpfPaciente
ORDER BY cl.NomeCli, c.Data_Hora;

-- clinica com mais consultas
SELECT 
    cl.NomeCli AS 'Clínica', 
    COUNT(c.IdConsulta) AS 'Total de Atendimentos'
FROM clinica cl
JOIN consulta c ON cl.CodCli = c.CodCli
GROUP BY cl.NomeCli
ORDER BY 'Total de Atendimentos' DESC;

-- medicos com mais consultas
SELECT 
    m.NomeMed AS 'Médico', 
    COUNT(c.IdConsulta) AS 'Total de Consultas'
FROM medico m
JOIN consulta c ON m.CodMed = c.CodMed
GROUP BY m.NomeMed
ORDER BY 'Total de Consultas' DESC;

-- ordem idade dos pacientes
SELECT 
    p.NomePac AS 'Paciente',
    TIMESTAMPDIFF(YEAR, p.DataNascimento, CURDATE()) AS 'Idade'
FROM paciente p
JOIN consulta c ON p.CpfPaciente = c.CpfPaciente
ORDER BY 'Idade' DESC;

-- media de idade dos pacientes por medico
SELECT 
    m.NomeMed AS 'Médico', 
    ROUND(AVG(TIMESTAMPDIFF(YEAR, p.DataNascimento, CURDATE())), 1) AS 'Média de Idade'
FROM medico m
LEFT JOIN consulta c ON m.CodMed = c.CodMed
LEFT JOIN paciente p ON c.CpfPaciente = p.CpfPaciente
GROUP BY m.NomeMed
ORDER BY 'Média de Idade' DESC;

