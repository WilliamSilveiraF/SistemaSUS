<a href="https://www.haskell.org/" target="_blank"> <img src="https://upload.wikimedia.org/wikipedia/commons/1/1c/Haskell-Logo.svg" alt="haskell" width="40" height="40"/> </a>
# SistemaSUS
Esse foi um projeto desenvolvido na minha curta passagem pela Universidade Federal de Sergipe na matéria de Programação Funcional, onde tive a oportunidade de aprender conceitos básicos sobre os paradigmas funcionais e programação em Haskell.

# Análise do Projeto
O projeto se dividiu em quartro partes: controle de cidadãos no dataBankSUS, geração de Insight's para gestores a partir do meu dataBankSUS, controle de vacinados no dataBankVacinados e geração de Insight's para gestores públicos a partir dos dois dataBank's

# Controle De Cidadãos
Nesse tópico objetivo é resolver o problema de gerenciamento de cidadãos no meu dataBankSUS para isso foram feitas as funções abaixo:

##

**1) adicionaSUS : : Cidadao -> CadastroSUS -> CadastroSUS**
- O objetivo da função é adicionar um novo cidadão ao dataBankSUS, ela leva como parâmetro o cidadão para ser adicionado e um dataBankSUS e retorna um dataBankSUS já com o novo cidadão adicionado.
![alt text](https://github.com/WilliamSilveiraF/SistemaSUS/blob/main/Fotos/AdicionaSUS.png)
##

**2) atualizaEndSUS : : CPF -> CadastroSUS -> Endereco -> CadastroSUS**
- O objetivo da função é atualizar o endereço de um cidadão no meu dataBankSUS a partir do CPF.
![alt text](https://github.com/WilliamSilveiraF/SistemaSUS/blob/main/Fotos/atualizaEndSUS.png)

##

**3) atualizaTelSUS : : CPF  -> CadastroSUS -> Telefone -> CadastroSUS**
- O objetivo da função é atualizar o Telefone de um cidadão no meu dataBankSUS a partir do CPF.
![alt text](https://github.com/WilliamSilveiraF/SistemaSUS/blob/main/Fotos/atualizaTelSUS.png)

##

**4) removeSUS : : CPF -> CadastroSUS -> CadastroSUS**
- O objetivo da função é remover um cidadão que faz parte do dataBankSUS mas veio a falecer por exemplo.
![alt text](https://github.com/WilliamSilveiraF/SistemaSUS/blob/main/Fotos/removeSUS.png)


# Geração de Insight's para gestores públicos através do dataBankSUS
A finalidade deste tópico é resolver o problema da falta de dados para gestores públicos a partir do meu dataBankSUS

##

**1) cidadaosPorMunicipio : : CadastroSUS -> Municipio -> Quantidade**
- O objetivo da função é retornar a quantidade de pessoas cadastradas no meu dataBankSUS residentes num município específico.
![alt text](https://github.com/WilliamSilveiraF/SistemaSUS/blob/main/Fotos/cidadaosPorMunicipio.png)

##

**2) cidadaosPorEstado : : CadastroSUS -> Estado -> Quantidade**
- O objetivo da função é retornar a quantidade de pessoas cadastradas no meu dataBankSUS residentes num estado específico.
![alt text](https://github.com/WilliamSilveiraF/SistemaSUS/blob/main/Fotos/cidadaosPorEstado.png)

##

**3) cidadaosPorMunicipioIdade : : CadastroSUS -> Municipio -> FaixaIdade -> Data -> Quantidade**
- O objetivo da função é retornar a quantidade de pessoas cadastradas no meu dataBankSUS que estão entre um Intervalo de Idades (ex: Entre 40 e 75 anos) e residem num município específico.
![alt text](https://github.com/WilliamSilveiraF/SistemaSUS/blob/main/Fotos/cidadadaosPorMunicipioIdade.png)

##

**4) cidadaosPorEstadoIdade : : CadastroSUS -> Estado -> FaixaIdade -> Data -> Quantidade**
- O objetivo da função é retornar a quantidade de pessoas cadastradas no meu dataBankSUS que estão entre um Intervalo de Idades (ex: Entre 40 e 75 anos) e residem num estado específico.
![alt text](https://github.com/WilliamSilveiraF/SistemaSUS/blob/main/Fotos/cidadaosPorEstadoIdade.png)

##

**5) geraListaMunicipioFaixas : : CadastroSUS -> Municipio -> [FaixaIdade] -> Data -> [(FaixaIdade, Quantidade)]**
- O Objetivo da função é gerar uma lista de residentes de um município com tuplas desse formato "((20,30), 12)", onde "(20,30)" representam o intervalo de idade (idadeMin, idadeMax) e "12" representa a quantidade de pessoas nesse intervalo.
![alt text](https://github.com/WilliamSilveiraF/SistemaSUS/blob/main/Fotos/geraListaMunicipioFaixas.png)


##

**6) geraListaEstadoFaixas : : CadastroSUS -> Estado -> [FaixaIdade] -> Data -> [(FaixaIdade, Quantidade)]**
- O Objetivo da função é gerar uma lista de residentes de um estado com tuplas desse formato "((20,30), 12)", onde "(20,30)" representam o intervalo de idade (idadeMin, idadeMax) e "12" representa a quantidade de pessoas nesse intervalo.
![alt text](https://github.com/WilliamSilveiraF/SistemaSUS/blob/main/Fotos/geraListaEstadoFaixas.png)

##

# Controle De Vacinados

##

**1) aplicaPrimDose : : CPF -> CadastroSUS -> FaixaIdade -> Municipio -> Vacina -> Data -> Data -> Vacinados -> Vacinados**
- Essa função tem o objetivo de adicionar a primeira dose a um Cidadão. 
- Primeiro ela checa se a primeira dose já foi aplicada.
![alt text](https://github.com/WilliamSilveiraF/SistemaSUS/blob/main/Fotos/aplicaPrimDose1.png)
 
- Depois checa se o Cidadão já contém cadastro no dataBankSUS através do seu CPF.
![alt text](https://github.com/WilliamSilveiraF/SistemaSUS/blob/main/Fotos/aplicaPrimDose2.png)

- Logo em seguida confere se o Cidadão está no intervalo certo que é permitido para se vacinar.
![alt text](https://github.com/WilliamSilveiraF/SistemaSUS/blob/main/Fotos/aplicaPrimDose3.png)

- E após isso checa se o município informado confere com o que o Cidadão informou no dataBankSUS.
![alt text](https://github.com/WilliamSilveiraF/SistemaSUS/blob/main/Fotos/aplicaPrimDose4.png)

- Se algo estiver errado até esse momento algum error será disparado indicando alguma ação a ser feita, senão a função confere se a dose que ele tomou foi "Jansen" caso verdadeiro adiciona ao dataBankVacinados uma nova pessoa com 2 doses iguais de "Jansen".
![alt text](https://github.com/WilliamSilveiraF/SistemaSUS/blob/main/Fotos/aplicaPrimDose5.png)

- De outro modo, se a primeira dose dela foi de outra vacina, o cidadão será adicionado ao dataBankVacinados com apenas uma dose tomada. 
![alt text](https://github.com/WilliamSilveiraF/SistemaSUS/blob/main/Fotos/aplicaPrimDose6.png)

##

**2) aplicaSegDose : : CPF -> Data -> Vacinados -> Vacinados**
- Essa função tem o objetivo de adicionar a segunda dose à uma pessoa que já tomou a primeira dose. 
- Primeiro ela confere se a primeira dose já foi aplicada.
![alt text](https://github.com/WilliamSilveiraF/SistemaSUS/blob/main/Fotos/aplicaSegDose1.png)

- Depois confere se a pessoa já tomou a segunda dose alguma vez.
![alt text](https://github.com/WilliamSilveiraF/SistemaSUS/blob/main/Fotos/aplicaSegDose2.png)

- Logo em seguida confere se a data da Primera Dose é maior do que a data de Segunda Dose.
![alt text](https://github.com/WilliamSilveiraF/SistemaSUS/blob/main/Fotos/aplicaSegDose3.png)

- Se algumas dessas funções auxiliares forem verdadeiras, a função retornará Error indicando alguma ação. Do contrário, a função irá adicionar uma nova dose ao vacinado.
![alt text](https://github.com/WilliamSilveiraF/SistemaSUS/blob/main/Fotos/aplicaSegDose4.png)

##

**3) atualizaVacina : : CPF -> TipoDose -> Vacina -> Vacinados -> Vacinados**
- Alguma vacina pode ter sido adicionada errada e será necessário altera-la no dataBankVacinados, logo essa função tem como objetivo alterar uma vacina no dataBankVacinados. 
- Assim primeiro ela checa se o CPF da pessoa consta no Banco de Vacinados.
![alt text](https://github.com/WilliamSilveiraF/SistemaSUS/blob/main/Fotos/atualizaVacina1.png)

- Em seguida ela confere se o número de vacinas que esse CPF já tomou é menor que a Tipo Dose de Vacina que ele quer alterar, pois é impossível alterar o que não existe. 
![alt text](https://github.com/WilliamSilveiraF/SistemaSUS/blob/main/Fotos/atualizaVacina2.png)

- Além disso, se tudo certo então ele atualiza a Vacina.
![alt text](https://github.com/WilliamSilveiraF/SistemaSUS/blob/main/Fotos/atualizaVacina3.png)

##

# Geração de Insight's para gestores públicos através do dataBankVacinados & dataBankSUS
1) quantidadeDoseMun :: Vacinados -> TipoDose -> Municipio -> CadastroSUS -> Quantidade
- Retorna a quantidade de vacinados em um município com um determinado TipoDose. Por exemplo, quantidade de pessoas que moram em Florianópolis de acordo com o dataBankSUS que já tomaram a primeira dose.
2) quantidadeDoseEst :: Vacinados -> TipoDose -> Estado -> CadastroSUS -> Quantidade
- Retorna a quantidade de vacinados em um estado com um determinado TipoDose. Por exemplo, quantidade de pessoas que moram em Santa Catarina de acordo com o dataBankSUS que já tomaram a primeira dose.
3) quantidadeMunIdDose :: Vacinados -> Municipio -> FaixaIdade -> TipoDose -> Data -> CadastroSUS -> Quantidade
- Retorna a quantidade de vacinados numa certa faixa de idade com um determinado TipoDose residentes num município. Por exemplo, quantidade de pessoas que moram em Curitiba e possuem idade entrem 45 e 55 anos de acordo com o dataBankSUS que já tomaram a Segunda Dose.
4) quantidadeEstIdDose :: Vacinados -> Estado -> FaixaIdade -> TipoDose -> Data -> CadastroSUS -> Quantidade
- Retorna a quantidade de vacinados numa certa faixa de idade com um determinado TipoDose residentes num Estado. Por exemplo, quantidade de pessoas que moram no Paraná e possuem idade entrem 20 e 35 anos de acordo com o dataBankSUS que já tomaram a Primeira Dose.
5) quantidadeMunVacDose :: Vacinados -> Municipio -> Vacina -> TipoDose -> CadastroSUS -> Quantidade
- Retorna a quantidade de vacinados que tomaram um certo tipo de vacina residentes num município. Por exemplo, quantidade de pessoas que moram em Joinville que tomaram a vacina "Pfizer".
6) quantidadeEstVacDose :: Vacinados -> Estado -> Vacina -> TipoDose -> CadastroSUS -> Quantidade
- Retorna a quantidade de vacinados que tomaram um certo tipo de vacina residentes num estado. Por exemplo, quantidade de pessoas que moram no Rio Grande do Sul que tomaram a vacina "AstraZeneca".
7) quantidadeMunAtrasados :: Vacinados -> CadastroSUS -> Municipio -> Data -> Quantidade
- Retorna a quantidade de vacinados atrasados na segunda dose em um município. Por exemplo, quantidade de pessoas que moram em Araranguá e estão atrasadas na segunda dose. Além disso, a função filtra o tipo de vacina que a pessoa tomou, se ela tomou CoronaVac o intervalo considerado no cálculo é 21 dias, caso não é considerado 90 dias de intervalo.
8) quantidadeEstAtrasados :: Vacinados -> CadastroSUS -> Estado -> Data -> Quantidade
- Retorna a quantidade de vacinados atrasados na segunda dose em um Estado. Por exemplo, quantidade de pessoas que moram em São Paulo e estão atrasadas na segunda dose. Além disso, a função filtra o tipo de vacina que a pessoa tomou, se ela tomou CoronaVac o intervalo considerado no cálculo é 21 dias, caso não é considerado 90 dias de intervalo.
