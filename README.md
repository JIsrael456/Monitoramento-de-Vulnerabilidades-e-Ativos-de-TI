# Monitoramento-de-Vulnerabilidades-e-Ativos-de-TI

# 🔐 Projeto de Monitoramento de Vulnerabilidades em Ativos de TI

Este projeto tem como objetivo analisar e monitorar vulnerabilidades de segurança em ativos de TI utilizando uma base de dados simulada com grande volume de registros. A solução foi desenvolvida com **SQL Server**, **Power BI** e **DAX**, seguindo práticas de segurança da informação e eficiência operacional.

---

## 🧠 Objetivo

Criar um pipeline de dados para:
- Gerenciar ativos de TI e vulnerabilidades detectadas.
- Avaliar criticidade e status de correção.
- Medir o tempo médio de resposta e eficiência de patches aplicados.
- Exibir indicadores estratégicos em um painel visual e interativo.

---

## 📁 Estrutura do Projeto

### Dados simulados (em CSV):
- `Ativos.csv`: Informações dos ativos da organização.
- `Vulnerabilidades.csv`: Vulnerabilidades detectadas por ativo.
- `Patches.csv`: Histórico de correções aplicadas.
- `Calendario.csv`: Tabela de datas para análises temporais.

---

## ⚙️ Tecnologias Utilizadas

- **SQL Server**: Criação de tabelas, views e ingestão de dados.
- **Power BI**: Visualizações e construção do painel interativo.
- **DAX**: Medidas analíticas para gerar insights.
- **Excel (opcional)**: Apoio na estruturação dos dados CSV.

---

## 🗂️ Etapas do Projeto

### 1. Modelagem SQL

Criação das tabelas:
```sql
```sql
CREATE TABLE Ativos (...)
CREATE TABLE Vulnerabilidades (...)
CREATE TABLE Patches (...)

2. Importação no Power BI
Conectar às views SQL.

Relacionar as tabelas no modelo de dados.

Adicionar a tabela de datas (Calendario) para análise temporal.

3. Criação de Medidas em DAX
📌 Indicadores Principais
dax
Copiar
Editar
Total Vulnerabilidades = COUNT(Vulnerabilidades[ID_Vulnerabilidade])

% Corrigidas = 
DIVIDE(
    CALCULATE(COUNT(Vulnerabilidades[ID_Vulnerabilidade]), Vulnerabilidades[Status_Correcao] = "Corrigida"),
    [Total Vulnerabilidades]
)
📌 Análise de Severidade
dax
Copiar
Editar
Score de Risco = 
SUMX(
    Vulnerabilidades,
    SWITCH(
        TRUE(),
        Vulnerabilidades[Severidade] = "Crítica", 3,
        Vulnerabilidades[Severidade] = "Alta", 2,
        Vulnerabilidades[Severidade] = "Média", 1,
        0
    )
)
📌 Correção e SLA
dax
Copiar
Editar
Dias Médios para Correção = AVERAGE(vw_TempoDeCorrecao[Dias_Para_Correcao])

Correções dentro do SLA = 
CALCULATE(
    COUNT(vw_TempoDeCorrecao[ID_Vulnerabilidade]),
    vw_TempoDeCorrecao[Dias_Para_Correcao] <= 15
)
📊 Principais Análises no Power BI
Total de vulnerabilidades e por severidade.

Percentual de correção.

Ativos mais vulneráveis.

Severidade por localização e responsável.

Tempo médio para correção.

Correções dentro e fora do SLA.

Análise temporal (linha do tempo).

Score de risco por tipo de ativo.

📦 Como usar
Clone este repositório:

bash
Copiar
Editar
git clone https://github.com/seuusuario/nome-do-repositorio.git
Importe os arquivos CSV no seu SGBD.

Execute os scripts SQL para criar as tabelas e views.

Abra o arquivo .pbix no Power BI Desktop e atualize a conexão com seu banco.

👨‍💻 Autor
Projeto desenvolvido por Jacó Israel
📧 jacoisrael384@gmail.com
💼 Estudante de Ciência de Dados com foco em Segurança da Informação, SQL, Power BI e Automação de Processos.

