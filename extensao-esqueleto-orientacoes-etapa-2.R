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
# Só inicie esta Etapa quando a professora orientar
# Altere o script esqueleto nas partes que se refere a ETAPA 2 e envie para o repositório Extensao tendo feito o commite "Esqueleto atualizado na Etapa 2"
# A partir de main crie a branch SIM
# ESTANDO NA BRANCH SIM, NÃO ALTERE NADA NO SCRIPT REFERENTE A ETAPA 1 e só insira comandos na ETAPA 2
# Para realizar as tarefas da ETAPA 2, ABRIR ANTES uma branch de nome SIM no main de Extensao e ir para ela

# Tarefa 1. Leitura do banco de dados Mortalidade_Geral_2015 do SIM 2015 com 1264175 linhas e 87 colunas
# verificar se a leitura foi feita corretamente e a estrutura dos dados
# nomeie o banco de dados como dados_sim



library(readr)
Mortalidade_Geral_2015 <- read_delim("Mortalidade_Geral_2015.csv",delim = ";", escape_double = FALSE, trim_ws = TRUE)
head(Mortalidade_Geral_2015)
summary(Mortalidade_Geral_2015)
# Tarefa 2. Reduzir dados_sim apenas para as colunas que serão utilizadas, nomeando este novo banco de dados como dados_sim_1
# as colunas serão: 1, 3, 4, 8, 9, 10, 11, 14, 17, 35, 36, 37, 47, 77, 84
# nomes das respectivas variáveis: CONTADOR, TIPOBITO, DTOBITO, DTNASC, IDADE, SEXO, RACACOR, ESC2010, CODMUNRES, TPMORTEOCO, 
# OBITOGRAV, OBITOPUERP, CAUSABAS, TPOBITOCOR, MORTEPARTO
dados_sim_1 = Mortalidade_Geral_2015[, c(1,3,4,8,9,10,11,14,17,35,36,37,47,77,84)]

# Tarefa 3. Reduzir dados_sim_1 apenas para o estado que o aluno irá trabalhar (utilizar os dois primeiros dígitos de CODMUNRES), nomeando este novo banco de dados como dados_sim_2
# Códigos das UF: 11: RO, 12: AC, 13: AM, 14: RR, 15: PA, 16: AP, 17: TO, 21: MA, 22: PI, 23: CE, 24: RN
# 25: PB, 26: PE, 27: AL, 28: SE, 29: BA, 31: MG, 32: ES, 33: RJ, 35: SP, 41: PR, 42: SC, 43: RS
# 50: MS, 51: MT, 52: GO, 53: DF 
UF = substr(as.character(dados_sim_1$CODMUNRES), 1, 2)
dados_sim_2 = dados_sim_1[UF == "15", ]

write.csv(dados_sim_2, "dados_sim_2.csv", row.names = FALSE)



# Ao concluir a Tarefa 3 da Etapa 2 commite e envie para o repositório REMOTO o script e dados_sim_2.csv com o comentário "Dados do estado UF (coloque o nome da UF) e script de sua obtenção"


# Tarefa 4. Verificar em dados_sim_2 a frequência das categorias das seguintes variáveis: TIPOBITO, SEXO, RACACOR, 
# TPMORTEOCO, OBITOGRAV, OBITOPUERP, CAUSABAS, TPOBITOCOR, MORTEPARTO

vars_frequencia <- c("TIPOBITO", "SEXO", "RACACOR", "TPMORTEOCO", "OBITOGRAV", "OBITOPUERP",
                     "CAUSABAS", "TPOBITOCOR", "MORTEPARTO")

lapply(dados_sim_2[, vars_frequencia], table)

# Tarefa 5. Atribuir para cada variável de dados_sim_2 como sendo NA a categoria de "Não informado ou Ignorado", geralmente com código 9
# veja o dicionário do SIM para identificar qual o código das categorias de cada variável
# Em variáveis quantitativas como IDADE verificar se existem valores como 99 para NA

dados_sim_2$TIPOBITO[dados_sim_2$TIPOBITO == 9] <- NA
dados_sim_2$SEXO[dados_sim_2$SEXO == 0 | dados_sim_2$SEXO == 9 | dados_sim_2$SEXO == "I"] <- NA
dados_sim_2$RACACOR[dados_sim_2$RACACOR == 9] <- NA
dados_sim_2$TPMORTEOCO[dados_sim_2$TPMORTEOCO == 9] <- NA
dados_sim_2$OBITOGRAV[dados_sim_2$OBITOGRAV == 9] <- NA
dados_sim_2$OBITOPUERP[dados_sim_2$OBITOPUERP == 9] <- NA
dados_sim_2$MORTEPARTO[dados_sim_2$MORTEPARTO == 9] <- NA
dados_sim_2$IDADE[dados_sim_2$IDADE == 999] <- NA
# Tarefa 6. Atribuir legendas para as categorias das variáveis qualitativas investigadas na tarefa 4.

dados_sim_2$TIPOBITO <- factor(dados_sim_2$TIPOBITO, levels = c(1, 2), labels = c("Fetal", "Não fetal"))

dados_sim_2$SEXO <- factor(dados_sim_2$SEXO, levels = c(1, 2), labels = c("Masculino", "Feminino"))

dados_sim_2$RACACOR <- factor(dados_sim_2$RACACOR, levels = c(1, 2, 3, 4, 5), 
                              labels = c("Branca", "Preta", "Amarela", "Parda", "Indígena"))

dados_sim_2$TPMORTEOCO <- factor(dados_sim_2$TPMORTEOCO, levels = c(1, 2, 3, 4, 5, 8, 9),
                                 labels = c("Estabelecimento saúde", "Via pública", "Domicílio", 
                                            "Outros", "Aldeia indígena", "Fora do país", "Ignorado"))

dados_sim_2$MORTEPARTO <- factor(dados_sim_2$MORTEPARTO, levels = c(1, 2, 3), 
                                 labels = c("Antes", "Durante", "Depois"))

dados_sim_2$ESC2010 <- factor(dados_sim_2$ESC2010, levels = c(0, 1, 2, 3, 4, 5),
                              labels = c("Sem escolaridade", "Fundamental I", "Fundamental II", 
                                         "Medio", "Superior incompleto", "Superior completo"))

dados_sim_2$OBITOGRAV <- factor(dados_sim_2$OBITOGRAV, levels = c(1, 2),
                                labels = c("Sim", "Nao"))

dados_sim_2$TPMORTEOCO <- factor(dados_sim_2$TPMORTEOCO, levels = c(1, 2, 3, 4, 5, 8),
                                 labels = c("Na gravidez", "No parto", "No abortamento", 
                                            "Ate 42 dias pos-parto", "De 43 dias a 1 ano pos-parto", 
                                            "Nao ocorreu nesses periodos"))

dados_sim_2$OBITOPUERP <- factor(dados_sim_2$OBITOPUERP, levels = c(1, 2, 3),
                                 labels = c("Ate 42 dias", "De 43 dias a 1 ano", "Nao"))



# Tarefa 7. Crie um banco de dados, de nome SIM_UF.csv (Exemplo: SIM_RJ.csv), contendo as 41 variáveis listadas no arquivo “Variáveis - Projeto - Tarefa 7 da Etapa 2.pdf”
# Atenção:
# 1. Para informações gerais utilize CAUSABAS, SEXO e IDADE
# 2. Para informações fetais utilize TIPOBITO
# 3. Para informações neonatais utilize TIPOBITO não fetal e IDADE entre 0 e 27 dias e RACACOR
# 4. Para informações maternas utilize TPMORTEOCO, ESC e IDADE
TO_NT <- nrow(dados_sim_2[dados_sim_2$IDADE < 228, ])

TO_MIF <- nrow(dados_sim_2[dados_sim_2$SEXO == "Feminino" & 
                             dados_sim_2$IDADE >= 415 & 
                             dados_sim_2$IDADE <= 449, ])

TO_MAT_GRAV <- nrow(dados_sim_2[dados_sim_2$TPMORTEOCO == "Na gravidez", ])

ANO_VAL <- 2015
NIVEL_VAL <- "UF"
CODMUN_VAL <- 15 


# Coluna 4: 
TO_UF <- nrow(dados_sim_2)

# Coluna 5:
TORC_UF <- sum(complete.cases(dados_sim_1)) 

# Coluna 6: R
TORCR_UF <- sum(complete.cases(dados_sim_2))

# Coluna 7: 
TO_NN_UF <- nrow(dados_sim_2[substr(dados_sim_2$CAUSABAS, 1, 1) %in% c("V", "W", "X", "Y"), ])

# Coluna 8:
TO_N_UF <- nrow(dados_sim_2[!substr(dados_sim_2$CAUSABAS, 1, 1) %in% c("V", "W", "X", "Y"), ])

# Coluna 9: 
TO_CB_I_UF <- nrow(dados_sim_2[substr(dados_sim_2$CAUSABAS, 1, 1) %in% c("A", "B"), ])

# Coluna 10: 
TO_CB_N_UF <- nrow(dados_sim_2[substr(dados_sim_2$CAUSABAS, 1, 1) %in% c("C", "D"), ])

# Coluna 11: 
TO_CB_C_UF <- nrow(dados_sim_2[substr(dados_sim_2$CAUSABAS, 1, 1) == "I", ])

# Coluna 12: 
TO_CB_R_UF <- nrow(dados_sim_2[substr(dados_sim_2$CAUSABAS, 1, 1) == "J", ])

# Coluna 13: 
TO_CB_O_UF <- nrow(dados_sim_2[!substr(dados_sim_2$CAUSABAS, 1, 1) %in% c("A", "B", "C", "D", "I", "J", "V", "W", "X", "Y"), ])

# Coluna 14: 
TO_M_UF <- nrow(dados_sim_2[dados_sim_2$SEXO == "Masculino", ])

# Coluna 15: 
TO_F_UF <- nrow(dados_sim_2[dados_sim_2$SEXO == "Feminino", ])

# Coluna 16: 
TO_F_IF_UF <- nrow(dados_sim_2[dados_sim_2$SEXO == "Feminino" & dados_sim_2$IDADE >= 415 & dados_sim_2$IDADE <= 449, ])

# Coluna 17: 
TO_FT_UF <- nrow(dados_sim_2[dados_sim_2$TIPOBITO == "Fetal", ])

# Coluna 18: 
TO_NT_UF <- nrow(dados_sim_2[dados_sim_2$TIPOBITO == "Não fetal" & dados_sim_2$IDADE < 228, ])

# Coluna 19:
TO_NT_P_UF <- nrow(dados_sim_2[dados_sim_2$TIPOBITO == "Não fetal" & dados_sim_2$IDADE < 207, ])

# Coluna 20: 
TO_NT_T_UF <- nrow(dados_sim_2[dados_sim_2$TIPOBITO == "Não fetal" & dados_sim_2$IDADE >= 207 & dados_sim_2$IDADE <= 227, ])

# Coluna 21: 
TO_PNT_UF <- nrow(dados_sim_2[dados_sim_2$TIPOBITO == "Não fetal" & dados_sim_2$IDADE >= 228 & dados_sim_2$IDADE <= 311, ])

# Coluna 22: 
TO_MT_G_UF <- nrow(dados_sim_2[dados_sim_2$TPMORTEOCO == "Na gravidez", ])

# Coluna 23: 
TONT_B_UF <- nrow(dados_sim_2[dados_sim_2$IDADE < 228 & dados_sim_2$RACACOR == "Branca", ])

# Coluna 24: 
TONT_PT_UF <- nrow(dados_sim_2[dados_sim_2$IDADE < 228 & dados_sim_2$RACACOR == "Preta", ])


# Coluna 25: 
TONT_A_UF <- nrow(dados_sim_2[dados_sim_2$IDADE < 228 & dados_sim_2$RACACOR == "Amarela", ])

# Coluna 26: 
TONT_PD_UF <- nrow(dados_sim_2[dados_sim_2$IDADE < 228 & dados_sim_2$RACACOR == "Parda", ])

# Coluna 27: 
TONT_I_UF <- nrow(dados_sim_2[dados_sim_2$IDADE < 228 & dados_sim_2$RACACOR == "Indigena", ])


# Coluna 28: 
TO_MT_UF <- nrow(dados_sim_2[dados_sim_2$TPMORTEOCO != "Nao ocorreu nesses periodos", ])

# Coluna 29: 
TO_MT_DG_UF <- nrow(dados_sim_2[dados_sim_2$TPMORTEOCO == "Na gravidez", ])

# Coluna 30: 
TO_MT_PT_UF <- nrow(dados_sim_2[dados_sim_2$TPMORTEOCO == "No parto", ])

# Coluna 31: 
TO_MT_AB_UF <- nrow(dados_sim_2[dados_sim_2$TPMORTEOCO == "No abortamento", ])

# Coluna 32: 
TO_MT_42_UF <- nrow(dados_sim_2[dados_sim_2$TPMORTEOCO == "Ate 42 dias pos-parto", ])

# Coluna 33: 
TO_MT_43_UF <- nrow(dados_sim_2[dados_sim_2$TPMORTEOCO == "De 43 dias a 1 ano pos-parto", ])

# Coluna 34: 
TO_MT_P_UF <- nrow(dados_sim_2[dados_sim_2$TPMORTEOCO %in% c("Na gravidez", "No parto", "No abortamento", "Ate 42 dias pos-parto"), ])

# Coluna 35: 
TO_MT_P_I_UF <- nrow(dados_sim_2[dados_sim_2$TPMORTEOCO %in% c("Na gravidez", "No parto", "No abortamento", "Ate 42 dias pos-parto") & 
                                   dados_sim_2$IDADE >= 415 & dados_sim_2$IDADE <= 449, ])

morte_precoce <- dados_sim_2$TPMORTEOCO %in% c("Na gravidez", "No parto", "No abortamento", "Ate 42 dias pos-parto")

# Coluna 36: 
TO_MT_P_ES_UF <- nrow(dados_sim_2[morte_precoce & dados_sim_2$ESC2010 == 0, ])

# Coluna 37:
TO_MT_P_EFI_UF <- nrow(dados_sim_2[morte_precoce & dados_sim_2$ESC2010 == 1, ])

# Coluna 38: 
TO_MT_P_EFII_UF <- nrow(dados_sim_2[morte_precoce & dados_sim_2$ESC2010 == 2, ])

# Coluna 39: 
TO_MT_P_EM_UF <- nrow(dados_sim_2[morte_precoce & dados_sim_2$ESC2010 == 3, ])

# Coluna 40: 
TO_MT_P_ESI_UF <- nrow(dados_sim_2[morte_precoce & dados_sim_2$ESC2010 == 4, ])

# Coluna 41: 
TO_MT_P_ESC_UF <- nrow(dados_sim_2[morte_precoce & dados_sim_2$ESC2010 == 5, ])


SIM_PA <- data.frame(
  ANO = 2015, NIVEL = "UF", CODMUNRES = 15,
  TO = TO_UF, TORC = TORC_UF, TORCR = TORCR_UF, TO_NN = TO_NN_UF, TO_N = TO_N_UF, 
  TO_CB_I = TO_CB_I_UF, TO_CB_N = TO_CB_N_UF, TO_CB_C = TO_CB_C_UF, TO_CB_R = TO_CB_R_UF, 
  TO_CB_O = TO_CB_O_UF, TO_M = TO_M_UF, TO_F = TO_F_UF, TO_F_IF = TO_F_IF_UF,
  TO_FT = TO_FT_UF, TO_NT = TO_NT_UF, TO_NT_P = TO_NT_P_UF, TO_NT_T = TO_NT_T_UF, 
  TO_PNT = TO_PNT_UF, TO_MT_G = TO_MT_G_UF, TONT_B = TONT_B_UF, TONT_PT = TONT_PT_UF, 
  TONT_A = TONT_A_UF, TONT_PD = TONT_PD_UF, TONT_I = TONT_I_UF,
  TO_MT = TO_MT_UF, TO_MT_DG = TO_MT_DG_UF, TO_MT_PT = TO_MT_PT_UF, TO_MT_AB = TO_MT_AB_UF, 
  TO_MT_42 = TO_MT_42_UF, TO_MT_43 = TO_MT_43_UF, TO_MT_P = TO_MT_P_UF, TO_MT_P_I = TO_MT_P_I_UF,
  TO_MT_P_ES = TO_MT_P_ES_UF, TO_MT_P_EFI = TO_MT_P_EFI_UF, TO_MT_P_EFII = TO_MT_P_EFII_UF, 
  TO_MT_P_EM = TO_MT_P_EM_UF, TO_MT_P_ESI = TO_MT_P_ESI_UF, TO_MT_P_ESC = TO_MT_P_ESC_UF
)

# Tarefa 8: Exporte o banco de dados com o nome SIM_UF.csv
write.csv(SIM_PA, "SIM_PA.csv", row.names = FALSE)

# Ao terminar a ETAPA 2 commite e envie para o repositório REMOTO com o comentário "Dados da UF e Script Etapa 2"
# Faça um merge de script de SIM para main


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

