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

dados_sinasc <- read.csv("SINASC_2015.csv", sep = ";", header = TRUE)


# Tarefa 2:
dados_sinasc_1 = dados_sinasc[, c(1, 4, 5, 6, 7, 12, 13, 14, 15, 19, 21, 22, 23, 24, 35, 38, 44, 46, 48, 59, 60)]

# Tarefa 3:
UF = substr(as.character(dados_sinasc_1$CODMUNNASC), 1, 2)
dados_sinasc_2 = dados_sinasc_1[UF == "15", ]

write.csv(dados_sinasc_2, "dados_sinasc_2.csv", row.names = FALSE)



dados_sinasc_2 <- read_csv("dados_sinasc_2.csv")
# Tarefa 4:
vars_frequencia <- c("LOCNASC", "ESTCIVMAE", "GESTACAO", "GRAVIDEZ", "PARTO", 
                     "SEXO", "APGAR5", "RACACOR", "IDANOMAL", "ESCMAE2010", 
                     "RACACORMAE", "TPAPRESENT", "TPROBSON", "PARIDADE", "KOTELCHUCK")

lapply(dados_sinasc_2[, vars_frequencia], table)



# Tarefa 5:
dados_sinasc_2$TPROBSON[dados_sinasc_2$TPROBSON == 11] <- NA
dados_sinasc_2$APGAR5[dados_sinasc_2$APGAR5 == 99] <- NA
dados_sinasc_2$SEXO[dados_sinasc_2$SEXO == 9] <- NA
dados_sinasc_2$PESO[dados_sinasc_2$PESO == 9999] <- NA
dados_sinasc_2$LOCNASC[dados_sinasc_2$LOCNASC == 9] <- NA
dados_sinasc_2$IDADEMAE[dados_sinasc_2$IDADEMAE == 99] <- NA
dados_sinasc_2$ESTCIVMAE[dados_sinasc_2$ESTCIVMAE == 9] <- NA
dados_sinasc_2$GESTACAO[dados_sinasc_2$GESTACAO == 9] <- NA
dados_sinasc_2$GRAVIDEZ[dados_sinasc_2$GRAVIDEZ == 9] <- NA
dados_sinasc_2$PARTO[dados_sinasc_2$PARTO == 9] <- NA
dados_sinasc_2$SEXO[dados_sinasc_2$SEXO == 0] <- NA
dados_sinasc_2$SEXO[dados_sinasc_2$SEXO == 9] <- NA
dados_sinasc_2$APGAR5[dados_sinasc_2$APGAR5 == 99] <- NA
dados_sinasc_2$PESO[dados_sinasc_2$PESO == 9999] <- NA
dados_sinasc_2$IDANOMAL[dados_sinasc_2$IDANOMAL == 9] <- NA
dados_sinasc_2$ESCMAE2010[dados_sinasc_2$ESCMAE2010 == 9] <- NA
dados_sinasc_2$CONSPRENAT[dados_sinasc_2$CONSPRENAT == 99] <- NA
dados_sinasc_2$TPAPRESENT[dados_sinasc_2$TPAPRESENT == 9] <- NA
dados_sinasc_2$TPROBSON[dados_sinasc_2$TPROBSON == 11] <- NA
dados_sinasc_2$KOTELCHUCK[dados_sinasc_2$KOTELCHUCK == 9] <- NA

#Tarefa 6:

dados_sinasc_2$LOCNASC = factor(dados_sinasc_2$LOCNASC, levels = c(1,2,3,4), labels = c("Hospital", "Outros estabelecimentos de saúde", "Domicílio", "Outros"))
dados_sinasc_2$ESTCIVMAE = factor(dados_sinasc_2$ESTCIVMAE, levels = c(1,2,3,4,5), labels = c("Solteira", "Casada", "Viúva", "Separada judicialmente/divorciada", "União estável"))
dados_sinasc_2$GESTACAO = factor(dados_sinasc_2$GESTACAO, levels = c(1,2,3,4,5,6), labels = c("Menos de 22 semanas", "22 a 27 semanas", "28 a 31 semanas", "32 a 36 semanas", "32 a 36 semanas", "42 semanas e mais"))
dados_sinasc_2$GRAVIDEZ = factor(dados_sinasc_2$GRAVIDEZ, levels = c(1,2,3), labels = c("Única", "Dupla", "Tripla ou mais"))
dados_sinasc_2$PARTO = factor(dados_sinasc_2$PARTO, levels = c(1,2), labels = c("Vaginal", "Cesário"))
dados_sinasc_2$SEXO = factor(dados_sinasc_2$SEXO, levels = c(1,2), labels = c("Masculino", "Feminino"))
dados_sinasc_2$RACACOR = factor(dados_sinasc_2$RACACOR, levels = c(1,2,3,4,5), labels = c("Branca", "Preta", "Amarela", "Parda", "Indígena"))
dados_sinasc_2$IDANOMAL = factor(dados_sinasc_2$IDANOMAL, levels = c(1,2), labels = c("Sim", "Não"))
dados_sinasc_2$ESCMAE2010 = factor(dados_sinasc_2$ESCMAE2010, levels = c(0,1,2,3,4,5), labels = c("Sem escolaridade", "Fundamental I (1ª a 4ª série)", "Fundamental II (5ª a 8ª série)", "Médio (antigo 2º grau)", "Superior incompleto", "Superior completo"))
dados_sinasc_2$RACACORMAE = factor(dados_sinasc_2$RACACORMAE, levels = c(1,2,3,4,5), labels = c("Branca", "Preta", "Amarela", "Parda", "Indígena"))
dados_sinasc_2$TPAPRESENT = factor(dados_sinasc_2$TPAPRESENT, levels = c(1,2,3), labels = c("Cefálico", "Pélvica ou podálica", "Transversa"))
dados_sinasc_2$TPROBSON = factor(dados_sinasc_2$TPROBSON, levels = c(1,2,3,4,5,6,7,8,9,10), labels = c("Grupo 1", "Grupo 2", "Grupo 3", "Grupo 4", "Grupo 5", "Grupo 6", "Grupo 7", "Grupo 8", "Grupo 9", "Grupo 10"))
dados_sinasc_2$PARIDADE = factor(dados_sinasc_2$PARIDADE, levels = c(0,1), labels = c("Nulípara", "Multípara"))
dados_sinasc_2$KOTELCHUCK = factor(dados_sinasc_2$KOTELCHUCK, levels = c(1,2,3,4,5), labels = c("Não realizou pré-natal", "Inadequado", "Intermediário", "Adequado", "Mais que adequado"))

#Tarefa 7:
dados_sinasc_2$F_IDADE = ifelse(dados_sinasc_2$IDADEMAE < 15, "<15",
                                ifelse(dados_sinasc_2$IDADEMAE <= 19, "15-19",
                                       ifelse(dados_sinasc_2$IDADEMAE <= 24, "20-24",
                                              ifelse(dados_sinasc_2$IDADEMAE <= 29, "25-29",
                                                     ifelse(dados_sinasc_2$IDADEMAE <= 34, "30-34",
                                                            ifelse(dados_sinasc_2$IDADEMAE <= 39, "35-39",
                                                                   ifelse(dados_sinasc_2$IDADEMAE <= 44, "40-44",
                                                                          ifelse(dados_sinasc_2$IDADEMAE <= 49, "45-49",
                                                                                 "50+"))))))))
dados_sinasc_2$F_IDADE = factor(dados_sinasc_2$F_IDADE,
                                levels = c("<15","15-19","20-24","25-29","30-34","35-39","40-44","45-49","50+"), ordered = TRUE)

dados_sinasc_2$F_PESO = ifelse(dados_sinasc_2$PESO < 2500, "Baixo peso",
                               ifelse(dados_sinasc_2$PESO < 4000, "Peso normal",
                                      "Macrossomia"))
dados_sinasc_2$F_PESO = factor(dados_sinasc_2$F_PESO, levels = c("Baixo peso","Peso normal","Macrossomia"))

dados_sinasc_2$F_APGAR5 = ifelse(dados_sinasc_2$APGAR5 < 7, "Baixo", "Normal")
dados_sinasc_2$F_APGAR5 = factor(dados_sinasc_2$F_APGAR5,levels = c("Baixo","Normal"))

dados_sinasc_2$PERIG = ifelse(is.na(dados_sinasc_2$CODMUNNASC) | is.na(dados_sinasc_2$CODMUNRES), NA,
                              ifelse(dados_sinasc_2$CODMUNNASC == dados_sinasc_2$CODMUNRES, "Não", "Sim"))
dados_sinasc_2$PERIG = factor(dados_sinasc_2$PERIG, levels = c("Não", "Sim"))

dados_sinasc_2$ESTCIV = ifelse(dados_sinasc_2$ESTCIVMAE %in% c("Solteira", "Viúva", "Separada judicialmente/divorciada"), "Sem companheiro",
                               ifelse(dados_sinasc_2$ESTCIVMAE %in% c("Casada", "União estável"), "Com companheiro", NA))
dados_sinasc_2$ESTCIV = factor(dados_sinasc_2$ESTCIV, levels = c("Sem companheiro","Com companheiro"))



#Tarefa 8:

tabela_pig <- read.csv("Tabela_PIG_Brasil.csv", header = TRUE, sep = ";", encoding = "UTF-8")

colnames(tabela_pig)[1] <- "SEMAGESTAC"

tabela_pig$SEXO <- factor(tabela_pig$SEXO, levels = c("Masculino", "Feminino"))

dados_sinasc_2 <- merge(dados_sinasc_2, tabela_pig, by = c("SEMAGESTAC", "SEXO"), all.x = TRUE)


dados_sinasc_2$F_PIG <- ifelse(dados_sinasc_2$GRAVIDEZ != 1, NA, 
                        ifelse(is.na(dados_sinasc_2$PESO) | is.na(dados_sinasc_2$PESO_P10), NA,
                        ifelse(dados_sinasc_2$PESO < dados_sinasc_2$PESO_P10, "PIG",
                        ifelse(dados_sinasc_2$PESO <= dados_sinasc_2$PESO_P90, "AIG", "GIG"))))


dados_sinasc_2$F_PIG <- factor(dados_sinasc_2$F_PIG, levels = c("PIG", "AIG", "GIG"))


#Tarefas 9 e 10:
base <- data.frame(CODMUNRES = sort(unique(dados_sinasc_2$CODMUNRES)))

TN <- as.data.frame(table(factor(dados_sinasc_2$CODMUNRES, levels = base$CODMUNRES)))
names(TN) <- c("CODMUNRES", "TN")
base <- merge(base, TN, by = "CODMUNRES", all.x = TRUE)



tab_sexo <- table(dados_sinasc_2$CODMUNRES, factor(dados_sinasc_2$SEXO, levels = c("Feminino", "Masculino")))
df_sexo <- as.data.frame.matrix(tab_sexo)
names(df_sexo) <- c("TRSEXO_F", "TRSEXO_M")
df_sexo$CODMUNRES <- rownames(df_sexo)
base <- merge(base, df_sexo[, c("CODMUNRES", "TRSEXO_F")], by = "CODMUNRES", all.x = TRUE)


tab_parto <- table(dados_sinasc_2$CODMUNRES, factor(dados_sinasc_2$PARTO, levels = c("Vaginal", "Cesáreo")))
df_parto <- as.data.frame.matrix(tab_parto)
names(df_parto) <- c("TPV", "TPC")
df_parto$CODMUNRES <- rownames(df_parto)
base <- merge(base, df_parto[, c("CODMUNRES", "TPV")], by = "CODMUNRES", all.x = TRUE)


media_idade <- aggregate(IDADEMAE ~ CODMUNRES, dados_sinasc_2, mean, na.rm = TRUE)
names(media_idade)[2] <- "IM_MD"
base <- merge(base, media_idade, by = "CODMUNRES", all.x = TRUE)


linha_estado <- base[1, ]
linha_estado[1, ] <- NA
linha_estado$CODMUNRES <- "15" 
linha_estado$TN <- sum(base$TN, na.rm = TRUE)
linha_estado$TRSEXO_F <- sum(base$TRSEXO_F, na.rm = TRUE)
linha_estado$TPV <- sum(base$TPV, na.rm = TRUE)
linha_estado$IM_MD <- round(mean(dados_sinasc_2$IDADEMAE, na.rm = TRUE), 2)


SINASC_PA <- rbind(linha_estado, base)
SINASC_PA$NIVEL <- c("ESTADO", rep("MUNICIPIO", nrow(base)))
SINASC_PA$ANO <- 2015

write.csv(SINASC_PA, "SINASC_PA.csv", row.names = FALSE)


# Tarefa 11:
write.csv(SINASC_PA, "SINASC_PA.csv", row.names = FALSE)

