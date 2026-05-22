
_______________________________________________

#tarefa 2:

library(readr)
agua <- read_delim("agua e esgoto - município - 2015.csv", delim = ";", escape_double = FALSE, trim_ws = TRUE)

View(agua)

# 1. Importa dizendo pro R que o separador de colunas é ";" e de decimal é ","
# O R vai entender os pontos sozinhos como milhar automaticamente!
agua <- read.csv("agua e esgoto - município - 2015.csv", sep = ";", dec = ",", header = TRUE, check.names = FALSE)

# 2. Faz o filtro do Pará normal
sinisa_pa <- agua[substr(agua$CODMUNRES, 1, 2) == "15" & nchar(agua$CODMUNRES) == 6, ]

# 3. Substitui os vazios reais por 0 (sem quebrar os números que já são inteiros)
sinisa_pa$POPR_RA[is.na(sinisa_pa$POPR_RA)] <- 0
sinisa_pa$POPR_RE[is.na(sinisa_pa$POPR_RE)] <- 0

# 4. Convertendo para numérico agora que os caracteres sumiram
sinisa_pa$POPR_RA <- as.numeric(sinisa_pa$POPR_RA)
sinisa_pa$POPR_RE <- as.numeric(sinisa_pa$POPR_RE)

# 5. Substituindo os NAs por zero
sinisa_pa$POPR_RA[is.na(sinisa_pa$POPR_RA)] <- 0
sinisa_pa$POPR_RE[is.na(sinisa_pa$POPR_RE)] <- 0

# 6. Recriar a tabela final juntando com a linha_uf_sinisa
linha_uf_sinisa <- sinisa_pa[1, ]
linha_uf_sinisa$ANO <- 2015
linha_uf_sinisa$NIVEL <- "UF"
linha_uf_sinisa$CODMUNRES <- "15"
linha_uf_sinisa$POPR_RA <- sum(sinisa_pa$POPR_RA)
linha_uf_sinisa$POPR_RE <- sum(sinisa_pa$POPR_RE)

sinisa_pa$NIVEL <- "MUNICIPIO"
sinisa_pa$ANO <- 2015

SINISA_UF <- rbind(linha_uf_sinisa, sinisa_pa)
SINISA_UF <- SINISA_UF[, c("ANO", "NIVEL", "CODMUNRES", "POPR_RA", "POPR_RE")]

# 7. Atualizar a visualização na tela
View(SINISA_UF)

