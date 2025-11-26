🏥 Sistema de Gestão de Consultas Médicas 

Este repositório reúne todos os materiais desenvolvidos para a 2ª VA da disciplina de Banco de Dados(IAAD-UFRPE). O projeto foi dividido em duas partes:

a criação de um sistema CRUD com interface gráfica usando MySQL, e uma análise prática sobre bancos NoSQL utilizando MongoDB.

📋 Sobre o Projeto

A proposta é simular um pequeno sistema de consultas médicas, permitindo gerenciar pacientes, médicos, clínicas e seus respectivos agendamentos.

🚀 Tecnologias Utilizadas
Linguagem: Python 3.10+
Interface: Streamlit
Banco Relacional: MySQL 8.0
Banco NoSQL: MongoDB

⚙️ Parte 1: Implementação MySQL

Nesta primeira parte, estamos desenvolvendo um sistema web simples para administrar informações da clínica.

 CRUD completo: cadastrar, visualizar, editar e excluir registros.
 Controle de integridade: tratamento de chaves estrangeiras e deleção em cascata (ex.: excluir um paciente remove suas consultas).
 Trigger de auditoria: registro automático de ações críticas na tabela log_auditoria.
 Dashboard: gráficos e métricas para acompanhar o funcionamento da clínica.

🗄️ Estrutura do Banco de Dados (DER)

O banco consultasmedicas é formado pelas seguintes tabelas:
clinica – informações das unidades de atendimento
medico – dados dos profissionais e suas especialidades
paciente – informações pessoais dos pacientes
consulta – agendamentos, relacionando médico + paciente + clínica
log_auditoria – histórico de logs gerado pelo trigger
