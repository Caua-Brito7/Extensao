# Script para leitura de bancos de dados diversos para geração de um data frame de uma única linha referente as informações do estado do aluno

# Ao receber este script esqueleto colocá-lo no repositório LOCAL Extensao, que deve ter sido clonado do GitHub
# Enviar o script esqueleto para o repositório REMOTO com o nome extensao-esqueleto.R

# Para realizar as tarefas da ETAPA 1, ABRIR ANTES uma branch de nome SINASC no main de Extensao e ir para ela
# Após os alunos concluírem a ETAPA 1 a professora orientará fazer o merge into main e depois abrir outro branch. Aguarde...


####################################
# ETAPA 1: BANCO DE DADOS DO SINASC
####################################

# A ALTERAÇÃO DO SCRIPT ESQUELETO - ETAPA 1 - DEVERÁ SER FEITA DENTRO DA BRANCH SINASC

# Tarefa 1. Leitura do banco de dados do SINASC 2015  com 3017668 linhas e 61 colunas
# verificar se a leitura foi feita corretamente e a estrutura dos dados
# nomeie o banco de dados como dados_sinasc


# Tarefa 2. Reduzir dados_sinasc apenas para as colunas que serão utilizadas, nomeando este novo banco de dados como dados_sinasc_1
# as colunas serão 1, 4, 5, 6, 7, 12, 13, 14, 15, 19, 21, 22, 23, 24, 35, 38, 44, 46, 48, 59, 60, 61
# nomes das respectivas variáveis: CONTADOR, CODMUNNASC, LOCNASC, IDADEMAE, ESTCIVMAE, CODMUNRES, GESTACAO, GRAVIDEZ, PARTO,
# SEXO, APGAR5, RACACOR, PESO, IDANOMAL, ESCMAE2010, RACACORMAE, SEMAGESTAC, CONSPRENAT, TPAPRESENT, TPROBSON, PARIDADE, KOTELCHUCK


# Tarefa 3. Reduzir dados_sinasc_1 apenas para o estado que o aluno irá trabalhar (utilizar os dois primeiros dígitos de CODMUNRES), nomeando este novo banco de dados como dados_sinasc_2
# Códigos das UF: 11: RO, 12: AC, 13: AM, 14: RR, 15: PA, 16: AP, 17: TO, 21: MA, 22: PI, 23: CE, 24: RN
# 25: PB, 26: PE, 27: AL, 28: SE, 29: BA, 31: MG, 32: ES, 33: RJ, 35: SP, 41: PR, 42: SC, 43: RS
# 50: MS, 51: MT, 52: GO, 53: DF 

# observar abaixo o número de nascimentos por UF de residência para certificar-se que seu banco de dados está correto
# 11: 27918     12: 16980     13: 80097     14: 11412     15: 143657    16: 15750      17: 25110
# 21: 117564    22: 49253     23: 132516    24: 49099     25: 59089     26: 145024     27: 52257     28: 34917     29: 206655
# 31: 268305    32: 56941     33: 236960    35: 634026     
# 41: 160947    42: 97223     43: 148359
# 50: 44142     51: 56673     52: 100672    53: 46122 

# Exportar o arquivo com o nome dados_sinasc_2.csv


# Ao concluir a Tarefa 3 da Etapa 1 commite e envie para o repositório REMOTO o script e dados_sinasc_2.csv com o comentário "Dados do estado UF (coloque o nome da UF) e script de sua obtenção"


# Tarefa 4. Verificar em dados_sinasc_2 a frequência das categorias das seguintes variáveis: LOCNASC, ESTCIVMAE, GESTACAO, GRAVIDEZ, PARTO,
# SEXO, RACACOR, IDANOMAL, ESCMAE2010, RACACORMAE, TPAPRESENT, TPROBSON, PARIDADE, KOTELCHUCK


# Tarefa 5. Atribuir para cada variável de dados_sinasc_2 como sendo NA a categoria de "Não informado ou Ignorado", geralmente com código 9
# KOTELCHUCK = 9 significa "não informado"   TPROBSON = 11 significa "não classificado por falta de informação"
# veja o dicionário do SINASC para identificar qual o código das categorias de cada variável
# Em variáveis quantitativas como IDADEMAE, CONSPRENAT, APGAR5 e PESO e SEMAGESTAC verificar se existem valores como 99 para NA


# Tarefa 6. Atribuir legendas para as categorias das variáveis qualitativas investigadas na tarefa 4.
# Exemplo: dados_sinasc_2$KOTELCHUCK = factor(dados_sinasc_2$KOTELCHUCK, levels = c(1,2,3,4,5), 
# labels = c("Não realizou pré-natal", "Inadequado", "Intermediário", "Adequado",  
# "Mais que adequado")

# ATENçÃO: 1. Na hora de escrever os labels, somente a primeira letra da palavra é maiúscula. Exemplo para SEXO: Feminino e Masculino
#          2. Nesta Tarefa 6 não crie novas variáveis no banco de dados


# Tarefa 7. Categorizar as variáveis IDADEMAE, PESO e APGAR5 e criar variáveis referentes ao deslocamento materno (peregrinação) e estado civil
# nova variável: dados_sinasc_2$F_PESO com PESO: < 2500: Baixo peso, >=2500 e < 4000: Peso normal, >= 4000: Macrossomia
# nova variável dados_sinasc_2$F_IDADE com IDADEMAE: <15, 15-19, 20-24, 25-29, 30-34, 35-39, 40-44, 45-49, 50+
# nova variável dados_sinasc_2$F_APGAR5 com APGAR5: < 7: Baixo, >= 7: Normal
# Atenção para casos de NA em IDADEMAE, PESO e APGAR5

# nova variável: dados_sinasc_2$PERIG: Não: CODMUNNASC igual a CODMUNRES, Sim: CODMUNNASC diferente de CODMUNRES
# nova variável: dados_sinasc_2$ESTCIV: Sem companheiro: ESTCIVMAE 1, 3 ou 4, Com companheiro: ESTCIVMAE 2 ou 5
# Ao categorizar as variáveis, garantir que sejam transformadas em tipo fator


# Tarefa 8. Agregar ao banco de dados_sinasc_2 as informações PESO_P10 e PESO_P90 a partir de Tabela_PIG_Brasil.csv
# a Tabela PIG informa P10 e P90 dos pesos, de acordo com a idade gestacional
# criar nova variável referente ao peso, de acordo com a idade gestacional, conforme indicado abaixo
# nova variável apenas para casos de GRAVIDEZ Única: dados_sinasc_2$F_PIG: PIG: PESO < PESO_P10, AIG: PESO_P10 <= PESO <= PESO_P90, GIG: PESO > PESO_P90
# Atenção para casos de NA em SEMAGESTAC, PESO ou SEXO. Lembre-se também que em dados_sinasc_2 SEXO está como fator com as categorias Feminino e Masculino.


# Tarefas 9 e 10 (reformulada) do script esqueleto:

# Crie um banco de dados, de nome SINASC_UF.csv (Exemplo: SINASC_RJ.csv), contendo as 103 variáveis listadas no arquivo “Variáveis - Projeto - Tarefas 9 e 10 da Etapa 1.pdf”

# O banco final deverá possuir:
#  • 103 colunas, correspondentes às variáveis especificadas;
#  • n + 1 linhas, onde:
#  • n corresponde ao número de municípios distintos da UF em análise
#  a primeira linha corresponde aos valores agregados para a UF como um todo;
# as demais linhas correspondem aos municípios da UF.
# As variáveis devem ser construídas a partir dos microdados do SINASC (dados_sinasc, dados_sinasc_1 e dados_sinasc_2), respeitando os nomes e a ordem especificados.


# Tarefa 11: Exporte o banco de dados com o nome SINASC_UF.csv

# Ao terminar a ETAPA 1 commite e envie para o repositório REMOTO com o comentário "Dados da UF e Script Etapa 1"
# Faça um merge de script de SINASC para main



##################################
# ETAPA 2: BANCO DE DADOS DO SIM
##################################
library(readr)

dados_sim_PA <-"https://raw.githubusercontent.com/Caua-Brito7/Extensao/refs/heads/SIM/dados_sim_2.csv"
dados_sim_2 <- read_csv(dados_sim_PA)
head(dados_sim_2)
summary(dados_sim_2)

#tarefa 4:
vars_frequencia <- c("TIPOBITO", "SEXO", "RACACOR", "TPMORTEOCO", "OBITOGRAV", "OBITOPUERP",
                     "CAUSABAS", "TPOBITOCOR", "MORTEPARTO")

lapply(dados_sim_2[, vars_frequencia], table)


# CORREÇÃO CRUCIAL: Forçar as colunas a serem tratadas como números
dados_sim_2$TIPOBITO   <- as.numeric(dados_sim_2$TIPOBITO)
dados_sim_2$SEXO       <- as.character(dados_sim_2$SEXO) # Sexo pode conter "I"
dados_sim_2$RACACOR    <- as.numeric(dados_sim_2$RACACOR)
dados_sim_2$TPMORTEOCO <- as.numeric(dados_sim_2$TPMORTEOCO)
dados_sim_2$OBITOGRAV  <- as.numeric(dados_sim_2$OBITOGRAV)
dados_sim_2$OBITOPUERP <- as.numeric(dados_sim_2$OBITOPUERP)
dados_sim_2$MORTEPARTO <- as.numeric(dados_sim_2$MORTEPARTO)
dados_sim_2$ESC2010    <- as.numeric(dados_sim_2$ESC2010)
dados_sim_2$IDADE      <- as.numeric(dados_sim_2$IDADE)



# Tarefa 5: Atribuição de NA de acordo com o dicionário oficial (COMPLETO)
# ==============================================================================

dados_sim_2$TIPOBITO[dados_sim_2$TIPOBITO == 9] <- NA
dados_sim_2$SEXO[dados_sim_2$SEXO == 0 | dados_sim_2$SEXO == 9 | dados_sim_2$SEXO == "I"] <- NA
dados_sim_2$RACACOR[dados_sim_2$RACACOR == 9] <- NA
dados_sim_2$TPMORTEOCO[dados_sim_2$TPMORTEOCO == 9] <- NA
dados_sim_2$OBITOGRAV[dados_sim_2$OBITOGRAV == 9] <- NA
dados_sim_2$OBITOPUERP[dados_sim_2$OBITOPUERP == 9] <- NA
dados_sim_2$MORTEPARTO[dados_sim_2$MORTEPARTO == 9] <- NA

# [CORREÇÃO 1]: Escolaridade ignorada também é representada pelo número 9
dados_sim_2$ESC2010[dados_sim_2$ESC2010 == 9] <- NA  

# [CORREÇÃO 2]: No SIM, idades ignoradas começam com 9 (ex: 999, 900, etc.)
dados_sim_2$IDADE[dados_sim_2$IDADE >= 900 | dados_sim_2$IDADE == 999] <- NA




# CORREÇÃO DA TAREFA 6: AJUSTE DOS FATORES (SEM SOBRESCREVER)
# ==============================================================================

dados_sim_2$TIPOBITO <- factor(dados_sim_2$TIPOBITO, levels = c(1, 2), labels = c("Fetal", "Não fetal"))
dados_sim_2$SEXO <- factor(dados_sim_2$SEXO, levels = c(1, 2), labels = c("Masculino", "Feminino"))

# Salvando com acento para manter a consistência
dados_sim_2$RACACOR <- factor(dados_sim_2$RACACOR, levels = c(1, 2, 3, 4, 5), 
                              labels = c("Branca", "Preta", "Amarela", "Parda", "Indígena"))

# Atenção: Ajustei para OBITOGRAV receber os períodos da gestação corretos, liberando TPMORTEOCO
dados_sim_2$OBITOGRAV <- factor(dados_sim_2$OBITOGRAV, levels = c(1, 2, 3, 4, 5, 8),
                                labels = c("Na gravidez", "No parto", "No abortamento", 
                                           "Ate 42 dias pos-parto", "De 43 dias a 1 ano pos-parto", 
                                           "Nao ocorreu nesses periodos"))

dados_sim_2$TPMORTEOCO <- factor(dados_sim_2$TPMORTEOCO, levels = c(1, 2, 3, 4, 5, 8, 9),
                                 labels = c("Estabelecimento saúde", "Via pública", "Domicílio", 
                                            "Outros", "Aldeia indígena", "Fora do país", "Ignorado"))

dados_sim_2$MORTEPARTO <- factor(dados_sim_2$MORTEPARTO, levels = c(1, 2, 3), 
                                 labels = c("Antes", "Durante", "Depois"))

dados_sim_2$ESC2010 <- factor(dados_sim_2$ESC2010, levels = c(0, 1, 2, 3, 4, 5),
                              labels = c("Sem escolaridade", "Fundamental I", "Fundamental II", 
                                         "Medio", "Superior incompleto", "Superior completo"))

dados_sim_2$OBITOPUERP <- factor(dados_sim_2$OBITOPUERP, levels = c(1, 2, 3),
                                 labels = c("Ate 42 dias", "De 43 dias a 1 ano", "Nao"))


# ==============================================================================

#Tarefas 7 a 10: Agregação por Município (VERSÃO BLINDADA)
# ------------------------------------------------------------------------------
lista_municipios <- unique(dados_sim_2$CODMUNRES)
resultados_lista <- list()

for (municipio in lista_municipios) {
  
  # Filtro do município atual
  sub <- dados_sim_2[dados_sim_2$CODMUNRES == municipio, ]
  
  # 1. Correção Geral de Linhas (Contando linhas reais por município)
  
  TO_UF        <- nrow(sub)
  TORC_UF      <- sum(!is.na(sub$CODMUNRES))   # Conta todos os registros do município ignorando NAs
  TORCR_UF     <- sum(!is.na(sub$CAUSABAS))    # Conta quantos têm a causa preenchida
  
  # 2. Condição de Morte Materna Precoce usando busca segura por texto (grepl)
  morte_precoce_num <- grepl("gravidez|parto|abortamento|42 dias", sub$OBITOGRAV, ignore.case = TRUE)
  
  # Causas Básicas (CID-10)
  TO_NN_UF     <- sum(substr(sub$CAUSABAS, 1, 1) %in% c("V", "W", "X", "Y"), na.rm = TRUE)
  TO_N_UF      <- sum(!substr(sub$CAUSABAS, 1, 1) %in% c("V", "W", "X", "Y"), na.rm = TRUE)
  TO_CB_I_UF   <- sum(substr(sub$CAUSABAS, 1, 1) %in% c("A", "B"), na.rm = TRUE)
  TO_CB_N_UF   <- sum(substr(sub$CAUSABAS, 1, 1) %in% c("C", "D"), na.rm = TRUE)
  TO_CB_C_UF   <- sum(substr(sub$CAUSABAS, 1, 1) == "I", na.rm = TRUE)
  TO_CB_R_UF   <- sum(substr(sub$CAUSABAS, 1, 1) == "J", na.rm = TRUE)
  TO_CB_O_UF   <- sum(!substr(sub$CAUSABAS, 1, 1) %in% c("A", "B", "C", "D", "I", "J", "V", "W", "X", "Y"), na.rm = TRUE)
  
  # Sexo e Idade Fértil (Busca híbrida segura)
  TO_M_UF      <- sum(grepl("Masc", sub$SEXO, ignore.case = TRUE), na.rm = TRUE)
  TO_F_UF      <- sum(grepl("Fem", sub$SEXO, ignore.case = TRUE), na.rm = TRUE)
  TO_F_IF_UF   <- sum(grepl("Fem", sub$SEXO, ignore.case = TRUE) & sub$IDADE >= 415 & sub$IDADE <= 449, na.rm = TRUE)
  
  # Tipos de Óbito e Idades Infantis
  TO_FT_UF     <- sum(grepl("Fetal", sub$TIPOBITO, ignore.case = TRUE) & !grepl("Não", sub$TIPOBITO, ignore.case = TRUE), na.rm = TRUE)
  nao_fetal    <- grepl("Não fetal", sub$TIPOBITO, ignore.case = TRUE)
  
  TO_NT_UF     <- sum(nao_fetal & sub$IDADE >= 200 & sub$IDADE <= 227, na.rm = TRUE)
  TO_NT_P_UF   <- sum(nao_fetal & sub$IDADE >= 200 & sub$IDADE <= 206, na.rm = TRUE)
  TO_NT_T_UF   <- sum(nao_fetal & sub$IDADE >= 207 & sub$IDADE <= 227, na.rm = TRUE)
  TO_PNT_UF    <- sum(nao_fetal & ((sub$IDADE >= 228 & sub$IDADE <= 229) | (sub$IDADE >= 301 & sub$IDADE <= 311)), na.rm = TRUE)
  
  # Óbitos Maternos na Gestação
  TO_MT_G_UF   <- sum(grepl("gravidez", sub$OBITOGRAV, ignore.case = TRUE), na.rm = TRUE)
  
  # Óbitos Neonatais por Raça/Cor
  escala_neonatal <- nao_fetal & sub$IDADE >= 200 & sub$IDADE <= 227
  TONT_B_UF    <- sum(escala_neonatal & grepl("Branca", sub$RACACOR, ignore.case = TRUE), na.rm = TRUE)
  TONT_PT_UF   <- sum(escala_neonatal & grepl("Preta", sub$RACACOR, ignore.case = TRUE), na.rm = TRUE)
  TONT_A_UF    <- sum(escala_neonatal & grepl("Amarela", sub$RACACOR, ignore.case = TRUE), na.rm = TRUE)
  TONT_PD_UF   <- sum(escala_neonatal & grepl("Parda", sub$RACACOR, ignore.case = TRUE), na.rm = TRUE)
  TONT_I_UF    <- sum(escala_neonatal & grepl("Indí|Indi", sub$RACACOR, ignore.case = TRUE), na.rm = TRUE)
  
  # Detalhes de Óbito Materno
  morte_materna <- grepl("gravidez|parto|abortamento|42 dias|1 ano", sub$OBITOGRAV, ignore.case = TRUE)
  TO_MT_UF     <- sum(morte_materna, na.rm = TRUE)
  TO_MT_DG_UF  <- sum(grepl("gravidez", sub$OBITOGRAV, ignore.case = TRUE), na.rm = TRUE)
  TO_MT_PT_UF  <- sum(grepl("parto", sub$OBITOGRAV, ignore.case = TRUE), na.rm = TRUE)
  TO_MT_AB_UF  <- sum(grepl("abortamento", sub$OBITOGRAV, ignore.case = TRUE), na.rm = TRUE)
  TO_MT_42_UF  <- sum(grepl("42 dias", sub$OBITOGRAV, ignore.case = TRUE), na.rm = TRUE)
  TO_MT_43_UF  <- sum(grepl("43 dias", sub$OBITOGRAV, ignore.case = TRUE), na.rm = TRUE)
  
  # Agregações de Morte Materna Precoce
  TO_MT_P_UF   <- sum(morte_precoce_num, na.rm = TRUE)
  TO_MT_P_I_UF <- sum(morte_precoce_num & sub$IDADE >= 415 & sub$IDADE <= 449, na.rm = TRUE)
  
  # Morte Materna Precoce por Escolaridade
  TO_MT_P_ES_UF   <- sum(morte_precoce_num & grepl("Sem", sub$ESC2010, ignore.case = TRUE), na.rm = TRUE)
  TO_MT_P_EFI_UF  <- sum(morte_precoce_num & grepl("Fundamental I", sub$ESC2010, ignore.case = TRUE) & !grepl("II", sub$ESC2010), na.rm = TRUE)
  TO_MT_P_EFII_UF <- sum(morte_precoce_num & grepl("Fundamental II", sub$ESC2010, ignore.case = TRUE), na.rm = TRUE)
  TO_MT_P_EM_UF   <- sum(morte_precoce_num & grepl("Medio|Médio", sub$ESC2010, ignore.case = TRUE), na.rm = TRUE)
  TO_MT_P_ESI_UF  <- sum(morte_precoce_num & grepl("Superior incompleto", sub$ESC2010, ignore.case = TRUE), na.rm = TRUE)
  TO_MT_P_ESC_UF  <- sum(morte_precoce_num & grepl("Superior completo", sub$ESC2010, ignore.case = TRUE), na.rm = TRUE)
  
  # Montagem segura da linha da cidade
  
  # Montagem cirúrgica e explicitamente NUMÉRICA da linha da cidade
  resultados_lista[[as.character(municipio)]] <- data.frame(
    ANO = 2015, 
    NIVEL = "MUNICIPIO", 
    CODMUNRES = as.numeric(municipio),
    TO = as.numeric(TO_UF), 
    TORC = as.numeric(TORC_UF), 
    TORCR = as.numeric(TORCR_UF), 
    TO_NN = as.numeric(TO_NN_UF), 
    TO_N = as.numeric(TO_N_UF), 
    TO_CB_I = as.numeric(TO_CB_I_UF), 
    TO_CB_N = as.numeric(TO_CB_N_UF), 
    TO_CB_C = as.numeric(TO_CB_C_UF), 
    TO_CB_R = as.numeric(TO_CB_R_UF), 
    TO_CB_O = as.numeric(TO_CB_O_UF), 
    TO_M = as.numeric(TO_M_UF), 
    TO_F = as.numeric(TO_F_UF), 
    TO_F_IF = as.numeric(TO_F_IF_UF),
    TO_FT = as.numeric(TO_FT_UF), 
    TO_NT = as.numeric(TO_NT_UF), 
    TO_NT_P = as.numeric(TO_NT_P_UF), 
    TO_NT_T = as.numeric(TO_NT_T_UF), 
    TO_PNT = as.numeric(TO_PNT_UF), 
    TO_MT_G = as.numeric(TO_MT_G_UF), 
    TONT_B = as.numeric(TONT_B_UF), 
    TONT_PT = as.numeric(TONT_PT_UF), 
    TONT_A = as.numeric(TONT_A_UF), 
    TONT_PD = as.numeric(TONT_PD_UF), 
    TONT_I = as.numeric(TONT_I_UF),
    TO_MT = as.numeric(TO_MT_UF), 
    TO_MT_DG = as.numeric(TO_MT_DG_UF), 
    TO_MT_PT = as.numeric(TO_MT_PT_UF), 
    TO_MT_AB = as.numeric(TO_MT_AB_UF), 
    TO_MT_42 = as.numeric(TO_MT_42_UF), 
    TO_MT_43 = as.numeric(TO_MT_43_UF), 
    TO_MT_P = as.numeric(TO_MT_P_UF), 
    TO_MT_P_I = as.numeric(TO_MT_P_I_UF),
    TO_MT_P_ES = as.numeric(TO_MT_P_ES_UF), 
    TO_MT_P_EFI = as.numeric(TO_MT_P_EFI_UF), 
    TO_MT_P_EFII = as.numeric(TO_MT_P_EFII_UF), 
    TO_MT_P_EM = as.numeric(TO_MT_P_EM_UF), 
    TO_MT_P_ESI = as.numeric(TO_MT_P_ESI_UF), 
    TO_MT_P_ESC = as.numeric(TO_MT_P_ESC_UF),
    stringsAsFactors = FALSE
  )
}

# Juntando as linhas calculadas de forma segura
SIM_PA <- do.call(rbind, resultados_lista)

# Visualização instantânea no laboratório
View(SIM_PA)

write.csv(SIM_PA, "SIM_PA.csv", row.names = FALSE)

 
#####################################################
# ETAPA 3: OUTROS BANCOS DE DADOS: IBGE, SNIS, ...
#####################################################
# Só inicie esta Etapa quando a professora orientar
# ESTANDO NA BRANCH SINASC, NÃO ALTERE NADA NO SCRIPT REFERENTE A ETAPA 3

# Tarefa 1. Acesso aos bancos de dados e obtenção da informação



#####################################################################################################
# ETAPA 4: GERAR BANCO DE DADOS FINAL DO ESTADO, BASEADO NAS ANÁLISES DE SINASC, SIM, IBGE, SNIS,...
######################################################################################################
# Só inicie esta Etapa quando a professora orientar
# ESTANDO NA BRANCH SINASC, NÃO ALTERE NADA NO SCRIPT REFERENTE A ETAPA 4

# Cada aluno gerar um dataframe de uma única linha (referente ao seu estado) com as variáveis na ordem indicada pela professora



############################################################################################
# ETAPA 5: EMPILHAMENTO DOS DATAFRAMES DE CADA ESTADO, GERANDO UM DATAFRAME DE 27 LINHAS
############################################################################################
# Só inicie esta Etapa quando a professora orientar
# ESTANDO NA BRANCH SINASC, NÃO ALTERE NADA NO SCRIPT REFERENTE A ETAPA 5

# 1. Enviar arquivos para as pastas do repositório da Professora no GitHUb
# 2. A professora fará o empilhamentos dos dataframes

