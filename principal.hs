type CadastroSUS = [Cidadao]

--Construção do Meu Banco De Dados
dataBankSUS::CadastroSUS
dataBankSUS = -- PS: Todos os dados foram gerados pelo site 4Devs e alterados, e são SOMENTE usados para fins acadêmicos.
    [
    (63867508057, "Thiago Santiago Vieira", 'M', (13,05,1981),"Rua Porto, 491","Curitiba", "PR", "65983086273", "santiagovieira@meuteste.com.br"),
    (77185804325, "Yasmin Zanin Calisto Porto",'F', (20,01,1964), "Rua Ze Antonio, 727","Belo Horizonte", "MG", "35987920626", "zanincalisto@meuteste.com.br"),
    (91010353917, "Sophia Porto Scheff", 'F', (25,02,1968),"Rua San Francisco, 269","Macapa", "AP", "96987481836", "sophiascheff@meuteste.com.br"),
    (25969757764, "Heitor Roberto Ambrozzi Paulista", 'M', (01,07,1982),"Avenida Tenente Pailota, 234","Serra", "ES", "28987152998", "robertoambrozzi@meuteste.com.br"),
    (26184931860, "Joaquim Nilton Santana Vieira", 'M', (02,06,1968),"Rua Paralela, 276","Maraba", "PA", "94993289942", "niltonjoaquim@meuteste.com.br"),
    (81102000772, "Leandro Moncape Paulo", 'M', (06,05,2005),"Avenida Policial Alves, 342","Vitoria", "ES", "27982487210", "leandromoncape@meuteste.com.br"),
    (59701483562, "Natalia Cortes Cardiff", 'F', (16,03,2001),"Rua Castro Alves, 123","Goiania", "GO", "62985796831", "nataliacardiff@meuteste.com"),
    (91257829131, "Hadassa Chelsea Macedo", 'F', (12,03,1987),"Avenida Dr Andre Mendes","Fortaleza", "CE", "85986302489", "hadassachelsea@meuteste.com.br"),
    (79812945849, "Rafael Andre Manchester", 'M', (19,05,1995),"Rua Bombeiro Motta, 341","Salvador", "BA", "71988110952", "rafaelmanchester@meuteste.com.br"),
    (51452783837, "Lucas Leria Lisboa", 'M', (19,11,1978),"Rua Plinio Salgado, 302","Rio de Janeiro", "RJ", "21994296238", "lucaslisboa@meuteste.com.br"),
    (31678947461, "Tereza Augusto Amsterdam", 'F', (23,10,1976),"Alameda Vermelha, 213","Salvador", "BA", "71984722460", "terezaaugusto@meuteste.com.br"),
    (84325650761, "Debora Carmen Abardiel", 'F', (12,12,1967),"Rua Andre Gustao, 654","Serra", "ES", "27982033136", "abardielcamrmen@meuteste.com.br"),
    (83453833141, "Isabela Angeles Takamoto", 'F', (05,08,1950),"Rua Galhaço Gustavo, 526","Valinhos", "SP", "17995866243", "isabelaangeles@meuteste.com.br"),
    (45623530699, "Mario Nakamoto Takamura", 'M', (02,04,1984),"Rua Viera Foroni, 437","Recife", "PE", "71997359940", "takamuramario@meuteste.com"),
    (44383462108, "Anderson Maik Bliach", 'M', (27,03,2000),"Rua Baroni Reis, 559","Joinville", "SC", "32999017422", "bliachmaik@meuteste.com.br"),
    (19945212000, "Raul NewCasttle Hornoff", 'M', (03,01,2001),"Rua Carlos Valinhos, 739","Sao Paulo", "SP", "11997224340", "raulnewcasttle@meuteste.com.br")
    ]

--Tipagem
type CPF = Integer
type Nome = String
type Genero = Char
type Dia = Int
type Mes = Int
type Ano = Int
type Data = (Dia, Mes, Ano)
type DataNasc = Data
type Endereco = String
type Municipio = String
type Estado = String
type Telefone = String
type Email = String
type Cidadao = (CPF, Nome, Genero, DataNasc, Endereco, Municipio, Estado, Telefone, Email)

--         GERENCIAMENTO DE CIDADÃO         --  

--Localize CPF do Cidadao
getCPF :: Cidadao -> CPF
getCPF (cpf, _, _, _, _, _, _, _, _) = cpf

--Calcule a idade de um Cidadao
getIdade :: Data -> Cidadao -> Int
getIdade (diaHj, mesHj, anoHj) ( _, _, _, ( diaNasc, mesNasc, anoNasc), _, _, _, _, _) = ((diaHj - diaNasc)*1 + (mesHj - mesNasc)*30 + (anoHj - anoNasc)*365) `div` 365

--Localize Municipio do Cidadao
getMunicipio :: Cidadao -> Municipio
getMunicipio (_, _, _, _, _, munData, _, _, _) = munData

--Localize Estado do Cidadao
getEstado :: Cidadao -> Estado
getEstado ( _, _, _, _, _, _, estadoData, _, _) = estadoData

--Confira se meu CPF está no Banco de Dados
checaCPF :: CPF -> CadastroSUS -> Bool
checaCPF seuCPF dataBankSUS =
    [item | item <- dataBankSUS, getCPF item == seuCPF] /= []


--                    FUNÇÕES PRINCIPAIS                    --

--Adicione um novo Cidadao, se ele já tiver cadastrado retorne o erro "Cidadao ja foi cadastrado."
adicionaSUS :: Cidadao -> CadastroSUS -> CadastroSUS
adicionaSUS newCitizen dataBankSUS
     | (checaCPF (getCPF newCitizen) dataBankSUS == True) = error "Cidadao ja foi cadastrado."
     | otherwise                                          = (:) newCitizen dataBankSUS


--Atualiza o Endereço no dataBankSUS através do CPF     
atualizaEndSUS :: CPF -> CadastroSUS -> Endereco -> CadastroSUS
atualizaEndSUS seuCPF dataBankSUS newAddress =
    [fmudarounaoCPF seuCPF pessoaData newAddress| pessoaData <- dataBankSUS]
       where
--fmudarounaoCPF sempre retornará um Cidadao no formato (CPF, Nome, Genero, DataNasc, Endereco, Municipio, Estado, Telefone, Email)
           fmudarounaoCPF  citizenCPF (cpfData, nomeData, genData, nascData, endData, munData, estadoData, telData, emailData) newAddress
             | citizenCPF == cpfData    =  (cpfData, nomeData, genData, nascData, newAddress, munData, estadoData, telData, emailData) 
             | otherwise                =  (cpfData, nomeData, genData, nascData, endData, munData, estadoData, telData, emailData)


--Atualiza o Telefone no dataBankSUS através do CPF     
atualizaTelSUS :: CPF  -> CadastroSUS -> Telefone -> CadastroSUS
atualizaTelSUS seuCPF dataBankSUS newTel =
--fmudarounaoCPF sempre retornará um Cidadao no formato (CPF, Nome, Genero, DataNasc, Endereco, Municipio, Estado, Telefone, Email)
    [fmudarounaoTEL seuCPF pessoaData newTel | pessoaData <- dataBankSUS]
      where
           fmudarounaoTEL  citizenCPF (cpfData, nomeData, genData, nascData, endData, munData, estadoData, telData, emailData) newTel
             | citizenCPF == cpfData    = (cpfData, nomeData, genData, nascData, endData, munData, estadoData, newTel, emailData)
             | otherwise                = (cpfData, nomeData, genData, nascData, endData, munData, estadoData, telData, emailData)


--Remove um Cidadão morto do dataBankSUS
removeSUS :: CPF -> CadastroSUS -> CadastroSUS
removeSUS seuCPF dataBankSUS =
    [pessoaData | pessoaData <- dataBankSUS, fexisteounao seuCPF pessoaData]
      where
          fexisteounao citizenCPF (cpfData, nomeData, genData, nascData, endData, munData, estadoData, telData, emailData)
           | citizenCPF == cpfData        = False --se localizar não passe
           | (checaCPF seuCPF dataBankSUS == True)  = True
           | (checaCPF seuCPF dataBankSUS == False) = error "CPF não encontrado em nosso sistema, tente novamente."



--                    GERENCIAMENTO DE MUNICÍPIOS                    --

--    Novas Tipagens   ---

type IdadeInicial = Int
type IdadeFinal = Int
type FaixaIdade = (IdadeInicial, IdadeFinal)
type Quantidade = Int


--Dado um município procure no meu dataBankSUS a quantidade de pessoas cadastradas que afirmaram morar nele
cidadaosPorMunicipio :: CadastroSUS -> Municipio -> Quantidade
cidadaosPorMunicipio dataBankSUS municipio =
        length [pessoaData | pessoaData <- dataBankSUS, getMunicipio pessoaData == municipio]

--Dado um Estado procure no meu dataBankSUS a quantidade de pessoas cadastradas que afirmaram morar nele
cidadaosPorEstado :: CadastroSUS -> Estado -> Quantidade
cidadaosPorEstado dataBankSUS state =
       length [pessoaData | pessoaData <- dataBankSUS, getEstado pessoaData == state]

-- Procure o número de pessoas que estão entre um intervalo de idades em um Município "X"
cidadaosPorMunicipioIdade :: CadastroSUS -> Municipio -> FaixaIdade -> Data -> Quantidade
cidadaosPorMunicipioIdade dataBankSUS municipio (initAge, endAge) dataDeHj= 
    length [pessoaData | pessoaData <- dataBankSUS, (initAge <= getIdade dataDeHj pessoaData), (getIdade dataDeHj pessoaData <= endAge), getMunicipio pessoaData == municipio]
  
--Procure o número de pessoas que estão entre um intervalo de idade em um Estado "Y"
cidadaosPorEstadoIdade :: CadastroSUS -> Estado -> FaixaIdade -> Data -> Quantidade
cidadaosPorEstadoIdade dataBankSUS state (initAge, endAge) dataDeHj =
    length [pessoaData | pessoaData <- dataBankSUS, (initAge <= getIdade dataDeHj pessoaData), (getIdade dataDeHj pessoaData <= endAge), getEstado pessoaData == state]


--            GERAR LISTAS POR FAIXA DE IDADE                    --

--gerar lista por um conjunto de Faixas de Idades e por Municipio
geraListaMunicipioFaixas :: CadastroSUS -> Municipio -> [FaixaIdade] -> Data -> [(FaixaIdade, Quantidade)]
geraListaMunicipioFaixas dataBankSUS municipio listaIntervaloDeIdades dataDeHj = 
    [(ageRanges, amount) | ageRanges <- listaIntervaloDeIdades, amount <- [cidadaosPorEstadoIdade dataBankSUS municipio ageRanges dataDeHj]]

--gerar lista por um conjunto de Faixas de Idades e por Estado
geraListaEstadoFaixas :: CadastroSUS -> Estado -> [FaixaIdade] -> Data -> [(FaixaIdade, Quantidade)]
geraListaEstadoFaixas dataBankSUS state listaIntervaloDeIdades dataDeHj = 
    [(ageRanges, amount) | ageRanges <- listaIntervaloDeIdades, amount <- [cidadaosPorEstadoIdade dataBankSUS state ageRanges dataDeHj]]



--            CADASTRO DE VACINAÇÃO            --

type Vacinados = [Vacinado]

dataBankVacinados :: Vacinados
dataBankVacinados = [ 
                    (63867508057, [("Pfizer", (1, 12, 2020)), ("Pfizer", (03, 01, 2021))] ),
                    (77185804325, [ ("AstraZeneca", (2, 11, 2020)) ]),
                    (91010353917, [("CoronaVac", (17, 11, 2020)), ("CoronaVac", (30, 12, 2020))]),
                    (25969757764, [("AstraZeneca", (1, 03, 2021)), ("AstraZeneca", (30, 05, 2021))]),
                    (26184931860, [("CoronaVac", (19, 10, 2020)), ("CoronaVac", (30, 11, 2020))]),
                    (81102000772, [ ("Pfizer", (23, 11, 2020)) ]),
                    (59701483562, [ ("CoronaVac", (13, 09, 2020)) ]),
                    (91257829131, [ ("CoronaVac", (26, 06, 2020)) ]),
                    (79812945849, [("Pfizer", (27, 07, 2020)), ("Pfizer", (30, 09, 2020))]),
                    (84325650761, [("CoronaVac", (06, 12, 2020)) ])
                    ]

type Vacina = String
type TipoDose = Int
type Dose = (Vacina, Data)
type Doses = [Dose]
type Vacinado = (CPF, Doses)

-- Funções Get --

getCidadao :: CPF -> CadastroSUS -> CadastroSUS 
getCidadao citizenCPF dataBankSUS =
    [pessoaData | pessoaData <- dataBankSUS, citizenCPF == (getCPF pessoaData)]

getDosesDeVacinado :: Vacinado -> Doses
getDosesDeVacinado ( _, dosesDoVacinado) = dosesDoVacinado

getCPFDeVacinado :: Vacinado -> CPF
getCPFDeVacinado (cpfVacinado,  _)  = cpfVacinado

getAnoDaDose :: Vacinado -> Int
getAnoDaDose ( _,     [(_, ( _, _, anoData))]     ) = anoData

getMesDaDose :: Vacinado -> Int
getMesDaDose ( _,     [(_, ( _, mesData, _))]     ) = mesData

getDiaDaDose :: Vacinado -> Int
getDiaDaDose ( _,     [(_, ( diaData, _, _))]     ) = diaData

getAnoDaData :: Data -> Int
getAnoDaData ( _, _, anoData)      = anoData

getMesDaData :: Data -> Int
getMesDaData ( _, mesData, _)      = mesData

getDiaDaData :: Data -> Int
getDiaDaData ( diaData, _, _)      = diaData

-- FUNÇÕES AUXILIARES PARA A PARTE DE CADASTRO DE VACINAÇÃO --

-- True == Minha primeira dose foi aplicada // False == Minha primeira dose não foi aplicada
firstDoseApplied :: CPF -> Vacinados -> Bool
firstDoseApplied citizenCPF dataBankVacinados = 
    length [pessoaData | pessoaData <- dataBankVacinados, citizenCPF == (getCPFDeVacinado pessoaData)] /= 0

-- True = Cidadão está no intervalo de Idade // False = Cidadão não está no intervalo de Idade
checaIntervaloDeIdades :: CPF -> CadastroSUS -> FaixaIdade -> Data -> Bool
checaIntervaloDeIdades citizenCPF dataBankSUS (ageInt, ageEnd) dataDeHj =  
    (length [pessoaData | pessoaData <- dataBankSUS,  citizenCPF == (getCPF pessoaData), ageInt < getIdade dataDeHj pessoaData &&  getIdade dataDeHj pessoaData < ageEnd]) == (length (getCidadao citizenCPF dataBankSUS))-- É o CPF que eu procuro?. A idade dele está entre as idades de parâmetro que foi me dado na função?

-- Checa se o Municipio fornecido, foi o mesmo que o cidadão cadastrou no dataBankSUS    -- Aux de "aplicaPrimDose"
checaMunicipioDoCidadao :: CPF -> CadastroSUS -> Municipio -> Bool   --TRUE = O municipio confere com o Banco de Dados // FALSE = O municipio não confere
checaMunicipioDoCidadao citizenCPF dataBankSUS municipio =
     (length [pessoaData | pessoaData <- dataBankSUS,  citizenCPF == (getCPF pessoaData), municipio == (getMunicipio pessoaData)]) == (length (getCidadao citizenCPF dataBankSUS))

-- Retorna uma lista das Doses que o Cidadão já tomou
dosesJaTomadasPorCidadao :: CPF -> Vacinados -> Doses
dosesJaTomadasPorCidadao citizenCPF dataBankVacinados = --Sempre vai retornar uma lista, de lista única [[vacinasJaAplicadas]]
         head [vacinasJaAplicadas | (cpfData, vacinasJaAplicadas) <- dataBankVacinados, citizenCPF == cpfData]

-- Conta as Doses já tomadas pelo Cidadão 
contadorDeVacinasJaTomadasPorCidadao :: CPF -> Vacinados -> Int
contadorDeVacinasJaTomadasPorCidadao  citizenCPF dataBankVacinados =   length (dosesJaTomadasPorCidadao citizenCPF dataBankVacinados)

-- Checa se a Data da Segunda Dose é maior que a da Primeira Dose 
checadorSeDataSegDoseMaiorQuePrimDose :: CPF -> Data -> Vacinados -> Bool
checadorSeDataSegDoseMaiorQuePrimDose citizenCPF dataVacinacao dataBankVacinados = --Os Filtros dessa função 1- Passe para a nova lista apenas o CPF que eu quero, 2- Passe para lista apenas datas maiores da minha ultima vacina
        (length [vacinado | vacinado <- dataBankVacinados, citizenCPF == getCPFDeVacinado vacinado, fComparadorDeData dataVacinacao vacinado]) /= 0
          where --Compara se a nova data de vacinacao é maior que do que a data de vacina da primeira dose
              fComparadorDeData (diaDaNovaVacina, mesDaNovaVacina, anoDaNovaVacina) ( cpfData, [(vacinaData, (diaData, mesData, anoData))] )
                | anoData < anoDaNovaVacina                                                                        = True
                | anoData == anoDaNovaVacina && mesData < mesDaNovaVacina                                          = True
                | anoData == anoDaNovaVacina && mesData == mesDaNovaVacina && diaData < diaDaNovaVacina            = True
                | otherwise                                                                                        = False

-- Adiciona uma dose ao vacinado
adicionaOutraDoseAoVacinado :: CPF -> Data -> Vacinados -> Vacinados
adicionaOutraDoseAoVacinado citizenCPF dataVacinacao dataBankVacinados = -- A primeira compreensão retorna uma lista com apenas o cidadao que está sendo vacinado, adicionando a dose que ele tomou a sua lista tipo [Doses]   //   A segunda compreensão retorna o dataBankVacinados sem o cidadão que está sendo vacinado
    concat [  [fAdicionarVacina (cpfData,[(vacinaData,dataVacinacaoData)]) citizenCPF | (cpfData,[(vacinaData,dataVacinacaoData)]) <- dataBankVacinados], [vacinado | vacinado <- dataBankVacinados, not (citizenCPF == getCPFDeVacinado vacinado)] ]
             where
               fAdicionarVacina (cpfData,[(vacinaData,dataVacinacaoData)]) citizenCPF
                 | (cpfData == citizenCPF)                                  =  (citizenCPF,(:) (vacinaData, dataVacinacao) [ (vacinaData,dataVacinacaoData)])     

-- TRUE == CPF CONSTA NO BANCO DE VACINADOS // FALSE == CPF NÃO CONSTA NO BANCO DE VACINADOS
checaCPFBancoDeVacinas :: CPF -> Vacinados -> Bool
checaCPFBancoDeVacinas citizenCPF dataBankVacinados =  
    length [vaccinated | vaccinated <- dataBankVacinados, citizenCPF == getCPFDeVacinado vaccinated] /= 0

-- Atualiza o nome de alguma vacina ministrada errada
fAtualizaVacina :: CPF -> TipoDose -> Vacina -> Vacinados -> Vacinados
fAtualizaVacina citizenCPF tipodose vacinaAlterada dataBankVacinados =
    concat [ [falterarVacina tipodose vacinaAlterada vacinadoAlterado | vacinadoAlterado <- dataBankVacinados, citizenCPF == getCPFDeVacinado vacinadoAlterado], [vacinado | vacinado <- dataBankVacinados, not (citizenCPF == getCPFDeVacinado vacinado)]  ]
      where
         falterarVacina tipodose vacinaAlterada vacinadoAlterado
          | length (getDosesDeVacinado vacinadoAlterado) == 2   = falterarvacinacom2Doses tipodose vacinaAlterada vacinadoAlterado --Se o número de doses ministradas for igual a 2 usar a função falterarvacinacom2Doses
          | length (getDosesDeVacinado vacinadoAlterado) == 1   = falterarvacinacom1Dose  vacinaAlterada vacinadoAlterado --Se o número de doses ministradas for igual a 2 usar a função falterarvacinacom1Dose

-- Modifica o nome da vacina para Cidadão que tomou apenas 1 Dose 
falterarvacinacom1Dose :: Vacina -> Vacinado -> Vacinado --Apenas para Vacinado que tomou apenas 1 dose até o momento
falterarvacinacom1Dose vacinaAlterada (cpfData,[(vacinaData,dataVacinacaoData)]) =
    (cpfData,[(vacinaAlterada,dataVacinacaoData)]) --Altere a vacina da dose única

-- Modifica o nome da vacina para Cidadão que já tomou 2 Doses
falterarvacinacom2Doses :: TipoDose -> Vacina -> Vacinado -> Vacinado --Apenas para Vacinado que já tomou 2 doses 
falterarvacinacom2Doses tipodose vacinaAlterada (cpfData, [(vacina1,dataVacinacao1), (vacinaData2,dataVacinacao2)] )
   | tipodose == 1    = (cpfData, [(vacinaAlterada, dataVacinacao1), (vacinaData2,dataVacinacao2)]) -- altera a vacina da primeira dose
   | tipodose == 2    = (cpfData, [(vacina1,dataVacinacao1), (vacinaAlterada,dataVacinacao2)])      -- altera a vacina da segunda dose



-- FUNÇÕES PRINCIPAIS PARA O BANCO DE VACINAS

--Vacinados = [(CPF, Doses), (CPF, [(Vacina, Data)]), (Int, [String, (Dia, Mes, Ano)])]

-- Aplica a Primeira Dose
aplicaPrimDose :: CPF -> CadastroSUS -> FaixaIdade -> Municipio -> Vacina -> Data -> Data -> Vacinados -> Vacinados
aplicaPrimDose citizenCPF dataBankSUS faixadeidade municipio vacina dataVacinacao dataDeHj dataBankVacinados
 | (firstDoseApplied citizenCPF dataBankVacinados == True)               = error "Primeira dose já aplicada"  --Se minha primeira dose foi aplicada, retorne "Primeira dose já aplicada"
 | (checaCPF citizenCPF dataBankSUS == False)                                     = error "CPF não encontrado no Banco de Dados SUS" --Se o CPF não foi encontrado no Banco De Dados SUS retorne "CPF não encontrado no Banco de Dados SUS"
 | (checaIntervaloDeIdades citizenCPF dataBankSUS faixadeidade dataDeHj == False) = error "Fora da idade de vacinação corrente" --Se a idade do CPF que usei não está na minha faixa de idades, retorne "Fora da idade de vacinação corrente"
 | (checaMunicipioDoCidadao citizenCPF dataBankSUS municipio == False)            = error "Municipio não compatível com o CadastroSUS. Por favor atualizar município." --Se o municipio cadastrado no dataBankSUS não for igual o informado pelo cidadão retorne "Municipio não compatível com o CadastroSUS. Por favor atualizar município."
 | vacina == "Jansen"                                                             = (:) (citizenCPF, [(vacina, dataVacinacao), (vacina, dataVacinacao)])  dataBankVacinados --Adiciona ao meu dataBankVacinados cidadão que tomaram "Jansen", como Jansen é dose única adicionamos duas tuplas à lista Type "Doses"
 | otherwise                                                                      = (:) (citizenCPF, [(vacina, dataVacinacao)]) dataBankVacinados --Adiciona ao meu dataBankVacinados cidadão que está tudo OK e tomou vacina diferente da "Jansen"

-- Aplica a Segunda Dose
aplicaSegDose :: CPF -> Data -> Vacinados -> Vacinados
aplicaSegDose citizenCPF dataVacinacao dataBankVacinados
 | (firstDoseApplied citizenCPF dataBankVacinados == False)                                      = error "Cidadão não tomou a primeira dose!" -- Confere se a primeira dose já foi aplicada
 | (contadorDeVacinasJaTomadasPorCidadao citizenCPF dataBankVacinados == 2)                      = error "Cidadão já tomou a segunda dose." -- Confere se o cidadão já tomou a segunda dose
 | (checadorSeDataSegDoseMaiorQuePrimDose citizenCPF dataVacinacao dataBankVacinados == False)   = error "Data Inválida, por favor corrigir." -- Confere se a data da Segunda Dose é maior que a da Primeira 
 | otherwise                                                                                     = adicionaOutraDoseAoVacinado citizenCPF dataVacinacao dataBankVacinados -- Adiciona a outra dose ao vacinado

-- Atualiza o nome de uma Vacina que foi adicionada errada ao Banco de Dados
atualizaVacina:: CPF -> TipoDose -> Vacina -> Vacinados -> Vacinados
atualizaVacina citizenCPF tipodose vacina dataBankVacinados
 | (checaCPFBancoDeVacinas citizenCPF dataBankVacinados == False)                                = error "CPF não consta no Banco de Vacinados." -- Checa se o CPF consta no Banco de Vacinas
 | (contadorDeVacinasJaTomadasPorCidadao citizenCPF dataBankVacinados) < tipodose                = error "Essa dose ainda não foi ministrada para o cidadão." -- Confere se está tentando alterar uma dose que o Cidadão ainda não tomou
 | otherwise                                                                                     = fAtualizaVacina citizenCPF tipodose vacina dataBankVacinados -- Atualiza a Vacina tendo em vista os parâmetros passados na função

--      INFORMAÇÕES PARA OS GESTORES

getCidadao2 :: CPF -> CadastroSUS -> Cidadao
getCidadao2 citizenCPF dataBankSUS =
    head [(cpf, nome, gen, nasc, end, mun, estado, tel, email) | (cpf, nome, gen, nasc, end, mun, estado, tel, email) <- dataBankSUS, citizenCPF ==  cpf]

--Pegue município a partir de CPF
getMunicipio2 :: CPF -> CadastroSUS -> Municipio
getMunicipio2 citizenCPF dataBankSUS = getMunicipio (getCidadao2 citizenCPF dataBankSUS)

--Pegue estado a partir de CPF
getEstado2 :: CPF -> CadastroSUS -> Estado
getEstado2 citizenCPF dataBankSUS = getEstado (getCidadao2 citizenCPF dataBankSUS)

-- Calcula Quantidade De Doses por município 
quantidadeDoseMun :: Vacinados -> TipoDose -> Municipio -> CadastroSUS -> Quantidade
quantidadeDoseMun dataBankVacinados tipodose municipio dataBankSUS =
    length [citizen | citizen <- dataBankVacinados,  (contadorDeVacinasJaTomadasPorCidadao  (fst citizen) dataBankVacinados) >= tipodose, getMunicipio2 (fst citizen) dataBankSUS == municipio]

-- Calcula Quantidade por Dose e Por Estado 
quantidadeDoseEst :: Vacinados -> TipoDose -> Estado -> CadastroSUS -> Quantidade
quantidadeDoseEst dataBankVacinados tipodose estado dataBankSUS =
    length [citizen | citizen <- dataBankVacinados,  (contadorDeVacinasJaTomadasPorCidadao  (fst citizen) dataBankVacinados) >= tipodose, getEstado2 (fst citizen) dataBankSUS == estado]

-- Calcula Quantidade por Dose e Por Município
quantidadeMunIdDose :: Vacinados -> Municipio -> FaixaIdade -> TipoDose -> Data -> CadastroSUS -> Quantidade
quantidadeMunIdDose dataBankVacinados municipio (ageInit, ageEnd) tipodose dataDeHj dataBankSUS =
    length [citizen | citizen <- dataBankVacinados,  (contadorDeVacinasJaTomadasPorCidadao  (fst citizen) dataBankVacinados) >= tipodose, getMunicipio2 (fst citizen) dataBankSUS == municipio, checaIntervaloDeIdades (fst citizen) dataBankSUS (ageInit, ageEnd) dataDeHj]

-- Calcula a Quantidade por Dose e Por Estado
quantidadeEstIdDose :: Vacinados -> Estado -> FaixaIdade -> TipoDose -> Data -> CadastroSUS -> Quantidade
quantidadeEstIdDose dataBankVacinados estado (ageInit, ageEnd) tipodose dataDeHj dataBankSUS =
    length [citizen | citizen <- dataBankVacinados,  (contadorDeVacinasJaTomadasPorCidadao  (fst citizen) dataBankVacinados) >= tipodose, getEstado2 (fst citizen) dataBankSUS == estado, checaIntervaloDeIdades (fst citizen) dataBankSUS (ageInit, ageEnd) dataDeHj]

-- Calcula a Quantidade por tipo de vacina, tipo da dose e por município 
quantidadeMunVacDose :: Vacinados -> Municipio -> Vacina -> TipoDose -> CadastroSUS -> Quantidade
quantidadeMunVacDose dataBankVacinados municipio vacina tipodose dataBankSUS =
    length [citizen | citizen <- dataBankVacinados,  (contadorDeVacinasJaTomadasPorCidadao  (fst citizen) dataBankVacinados) >= tipodose, getMunicipio2 (fst citizen) dataBankSUS == municipio, fSeEhVacinaQueProcuro citizen vacina dataBankVacinados]
      where
          fSeEhVacinaQueProcuro citizen vacina dataBankVacinados
             | contadorDeVacinasJaTomadasPorCidadao  (fst citizen) dataBankVacinados == 2    = fChecadorDeDuasDoses vacina citizen
             | contadorDeVacinasJaTomadasPorCidadao  (fst citizen) dataBankVacinados == 1    = fChecadorDeUmaDose vacina citizen

-- Calcula a Quantidade por tipo de vacina, tipo da dose e por Estado 
quantidadeEstVacDose :: Vacinados -> Estado -> Vacina -> TipoDose -> CadastroSUS -> Quantidade
quantidadeEstVacDose dataBankVacinados estado vacina tipodose dataBankSUS =
    length [citizen | citizen <- dataBankVacinados,  (contadorDeVacinasJaTomadasPorCidadao  (fst citizen) dataBankVacinados) >= tipodose, getEstado2 (fst citizen) dataBankSUS == estado, fSeEhVacinaQueProcuro citizen vacina dataBankVacinados]
      where
          fSeEhVacinaQueProcuro citizen vacina dataBankVacinados
             | contadorDeVacinasJaTomadasPorCidadao  (fst citizen) dataBankVacinados == 2    = fChecadorDeDuasDoses vacina citizen
             | contadorDeVacinasJaTomadasPorCidadao  (fst citizen) dataBankVacinados == 1    = fChecadorDeUmaDose vacina citizen

-- Checa se é a Vacina que eu procuro ou não em um vacinado com 2 doses * Função Auxiliar
fChecadorDeDuasDoses :: Vacina -> Vacinado -> Bool
fChecadorDeDuasDoses vacina (cpfData, [(vacina1,dataVacinacao1), (vacinaData2,dataVacinacao2)])
    | vacina1 == vacina                         = True
    | otherwise                                 = False

-- Checa se é a Vacina que eu procuro ou não em um vacinado com 1 dose * Função Auxiliar
fChecadorDeUmaDose :: Vacina -> Vacinado -> Bool
fChecadorDeUmaDose vacina (cpfData, [(vacina1,dataVacinacao1)])
   | vacina == vacina1                          = True
   | otherwise                                  = False

-- Quantidade de pessoas com a segunda dose atrasada em um municipio
quantidadeMunAtrasados :: Vacinados -> CadastroSUS -> Municipio -> Data -> Quantidade
quantidadeMunAtrasados dataBankVacinados dataBankSUS municipio dataDeHj =
    length [citizen | citizen <- dataBankVacinados, municipio == getMunicipio2 (fst citizen) dataBankSUS,  fseletor citizen dataDeHj]
      where
         fseletor citizen dataDeHj
           | length (getDosesDeVacinado citizen) == 2  = False --Se a pessoa já tomou as 2 doses, ela não tá com a dose atrasada
           | length (getDosesDeVacinado citizen) == 1  = fChecaAtrasados citizen dataDeHj

-- Quantidade de pessoas com a segunda dose atrasada em um Estado
quantidadeEstAtrasados :: Vacinados -> CadastroSUS -> Estado -> Data -> Quantidade
quantidadeEstAtrasados dataBankVacinados dataBankSUS state dataDeHj =
    length [citizen | citizen <- dataBankVacinados, state == getEstado2 (fst citizen) dataBankSUS,  fseletor citizen dataDeHj]
      where
          fseletor citizen dataDeHj
           | length (getDosesDeVacinado citizen) == 2  = False --Se a pessoa já tomou as 2 doses, ela não tá com a dose atrasada
           | length (getDosesDeVacinado citizen) == 1  = fChecaAtrasados citizen dataDeHj

-- Função checa Atrasado de acordo com cada intervalo de tempo necessário para sua vacina
fChecaAtrasados :: Vacinado -> Data -> Bool
fChecaAtrasados (cpfData, [(vacina1,dataVacinacao1)]) (diaHj, mesHj, anoHj)
     | vacina1 == "CoronaVac" && (anoHj * 365 + mesHj * 30 + diaHj* 1) - ((getAnoDaData dataVacinacao1) * 365 + (getMesDaData dataVacinacao1) * 30 + (getDiaDaData dataVacinacao1) * 1) > 21                            = True -- retorna TRUE se a diferença do tempo é maior que 21 dias
     | vacina1 == "Pfizer" || vacina1 == "AstraZeneca" &&  (anoHj * 365 + mesHj * 30 + diaHj* 1) - ((getDiaDaData dataVacinacao1) * 365 + (getDiaDaData dataVacinacao1) * 30 + (getDiaDaData dataVacinacao1) * 1) > 90  = True -- retorna TRUE se a diferença do tempo é maior que 90 dias
     | otherwise                                                                                                                                                                                            = False