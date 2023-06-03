<!-- # RepositorioTemplate

Esse repositório é para ser utilizado pelos grupos como um template inicial, da home page do Projeto.
As seções do Template NÃO DEVEM SER OMITIDAS, sendo TODAS RELEVANTES.

**!! _Atenção: Renomeie o seu repositório para (Ano.Semestre)*(Grupo)*(Paradigma)\_(NomeDoProjeto)_. !!**

Paradigmas:

-   Funcional
-   Logico
-   SMA

**!! _Não coloque os nomes dos alunos no título do repositório_. !!**

**!! _Exemplo de título correto: 2022.2_G1_Logico_ProjetoRoteirosAereos_. !!**

(Apague esses comentários) -->

# Imdb Recomendation

**Disciplina**: FGA0210 - PARADIGMAS DE PROGRAMAÇÃO - T01 <br>
**Nro do Grupo**: 05<br>
**Paradigma**: Logico<br>

## Alunos

| Matrícula | Aluno                                                                    |
| --------- | ------------------------------------------------------------------------ |
| 150125682 | [Flávio Vieira Leão](https://github.com/flaviovl)                        |
| 170011020 | [Gabrielle Ribeiro Gomes](https://github.com/Gabrielle-Ribeiro)          |
| 170107426 | [Kayro César Silva Machado](https://github.com/kayrocesar)               |
| 170016838 | [Lucas Lopes Xavier](https://github.com/lucaslop)                        |
| 180105604 | [Luis Gustavo Ferreira Marques](https://github.com/luisgfmarques)        |
| 180106805 | [Mateus Cunha Maia](https://github.com/mateusmaiamaia)                   |
| 170122549 | [Paulo Goncalves Lima](https://github.com/PauloGoncalvesLima)            |
| 190117401 | [Thalisson Alves Gonçalves de Jesus](https://github.com/Thalisson-Alves) |
| 180149598 | [Victor Hugo Siqueira Costa](https://github.com/8ifq3)                   |

## Sobre

O projeto tem como objetivo realizar a recomendação de filmes com base nas escolhas do usuário, utilizando o paradigma lógico. Os filmes recomendados estão presentes em formato CSV dos Top 1000 filmes classificados por nota pelo IMDb. Esses dados foram convertidos para uma base em Prolog utilizando um script em Python. As informações, como gênero, duração, ano de lançamento, diretor, atores, classificação e arrecadação, são utilizadas como filtros para que o usuário possa refinar suas preferências. Com base no filtro escolhido, o software irá recomendar filmes que se encaixam na(s) preferência(s) do usuário.

## Screenshots

<div style="display: flex; flex-wrap: wrap;">
  <div style="flex-basis: 50%; padding: 5px;">
    <img src="https://raw.githubusercontent.com/UnBParadigmas2023-1/2023.1_G5_Logico_IMDbRecommendation/main/img/menu1.png" alt="menu1" width="300" height="300">
  </div>
  <div style="flex-basis: 50%; padding: 5px;">
    <img src="https://raw.githubusercontent.com/UnBParadigmas2023-1/2023.1_G5_Logico_IMDbRecommendation/main/img/menu2.png" alt="menu2" width="350" height="300">
  </div>
  <div style="flex-basis: 50%; padding: 5px;">
    <img src="https://raw.githubusercontent.com/UnBParadigmas2023-1/2023.1_G5_Logico_IMDbRecommendation/main/img/menu3.png" alt="menu3" width="350" height="300">
  </div>
  <div style="flex-basis: 50%; padding: 5px;">
    <img src="https://raw.githubusercontent.com/UnBParadigmas2023-1/2023.1_G5_Logico_IMDbRecommendation/main/img/menu4.png" alt="menu4" width="350" height="350">
  </div>
  <div style="flex-basis: 50%; padding: 5px;">
    <img src="https://raw.githubusercontent.com/UnBParadigmas2023-1/2023.1_G5_Logico_IMDbRecommendation/main/img/menu5.png" alt="menu5" width="400" height="300">
  </div>
  <div style="flex-basis: 50%; padding: 5px;">
    <img src="https://raw.githubusercontent.com/UnBParadigmas2023-1/2023.1_G5_Logico_IMDbRecommendation/main/img/menu6.png" alt="menu6" width="350" height="300">
  </div>
</div>


## Instalação

**Linguagens**: Prolog<br>
**Tecnologias**: SWI-Prolog<br>
- Pré-Requisitos:
    SWI Prolog

### Instale o SWI Prolog

#### Digite os comandos abaixo:
  
```
sudo apt-add-repository ppa:swi-prolog/stable
```
```
sudo apt-get update
```

```
 sudo apt-get install swi-prolog
```

 Mais detalhes de instalação pode ser encontrados <a href="https://www.swi-prolog.org/download/stable">aqui</a>.


## Uso

**Execução**: Na raiz do projeto execute:
```
swipl -s src/main.pl
```
Depois:
```
init.
```
Ao executar os comandos citados, uma tela de boas vindas  será exibida e ao clicar em "Iniciar" uma menu irá aparecer com as seguintes opções: <br>
 - Filtro de filme por ano
 - Filtro de filme por Duração
 - Filtro de filme por Gênero
 - Filtro de filme por Classificação
 - Filtro de filme por Diretor
 - Filtro de filme por Ator
 - Filtro de filme por Arrecadação
 - Filtro de filme por Geral

Após escolher um dos filtros basta ajustar algum deles dentro de cada submenu e clicar no botão "Confirmar" e uma lista de recomendação de filmes será gerada. <br>

## Vídeo

<a href="https://www.youtube.com/watch?v=8LzxOdHXghs">Link da apresentação</a>

## Participações

| Nome do Membro                                                           | Contribuição | Significância da Contribuição para o Projeto (Excelente/Boa/Regular/Ruim/Nula) |
| ------------------------------------------------------------------------ | ------------ | ------------------------------------------------------------------------------ |
| [Flávio Vieira Leão](https://github.com/flaviovl)                        | --           | --                                                                             |
| [Gabrielle Ribeiro Gomes](https://github.com/Gabrielle-Ribeiro)          | --           | --                                                                             |
| [Kayro César Silva Machado](https://github.com/kayrocesar)               | Implementei a tela de boas vindas, menu principal, submenu ano e de ator. Também auxiliei na integração dos menus do projeto, além de ficar responsável pela gerência do grupo.          | Excelente                                                                             |
| [Lucas Lopes Xavier](https://github.com/lucaslop)                        | Implementei o submenu de diretores e ajuda no menu          | Boa                                                                            |
| [Luis Gustavo Ferreira Marques](https://github.com/luisgfmarques)        | --           | --                                                                             |
| [Mateus Cunha Maia](https://github.com/mateusmaiamaia)                   | Implementei o submenu de arrecadação e ajudei na correção de outros menus.           | Boa                                                                             |
| [Paulo Goncalves Lima](https://github.com/PauloGoncalvesLima)            | Submenu de classificação, ajuda no menu geral.           | Boa                                                                             |
| [Thalisson Alves Gonçalves de Jesus](https://github.com/Thalisson-Alves) | Implementei o script para popular a base de dados utilizada no prolog e ajudei na integração dos diferentes menus | Boa |
| [Victor Hugo Siqueira Costa](https://github.com/8ifq3)                   | --           | --                                                                             |

## Outros


### (i) Lições Aprendidas:
 Durante o módulo do paradigma lógico com Prolog, nos deparamos uma linguagem pouco conhecida, onde encontramos pouca documentação e poucas informações em fóruns. À medida que desenvolvíamos nosso projeto, surgiram várias dificuldades que não foram difíceis de resolver, pois o prolog não indicava tão claramente onde o erro estava ocorrendo.

#### (ii) Percepções:

Inicialmente, planejamos um tipo de jogo capaz de adivinhar diferentes tipos de comidas e animais. No entanto, ao começarmos a construir a base de dados, ficou claro que seria desafiador diferenciar entre os diversos tipos de comidas, uma vez que muitas delas possuem características semelhantes. O mesmo aconteceu com os animais, especialmente quando se tratava de espécies relacionadas ou com características comuns. Diante dessa situação, decidimos escolher outro tema e o recomendador de filmes surgiu como uma idéia interessante por já ter base de dados em CSV, que posteriormente foi convertida em uma base prolog.

#### (iii) Contribuições e Fragilidades:

Nosso projeto pode algumas fragilidades a serem consideradas. Essas fragilidades incluem possíveis limitações na precisão das recomendações, a escassez de dados proveniente de uma base desatualizada do IMDb, a dificuldade em lidar com preferências complexas dos usuários, eventuais limitações de desempenho durante o processamento, e a pouca de personalização  das recomendações. Também vale ressaltar possiveis fragilidades no que se refere a interface gráfica do prolog, que já é antiga.


#### (iV) Trabalhos Futuros:
Para trabalhos futuros podemos mencionar as melhorias na precisão das recomendações, incorporação de dados adicionais, personalização de filtros mais aprimorada, implementação de recursos mais interativos,possibilidade de analisar tendências e inferir recomendações com base em respostas do usuário para direcionar melhor para o filme que ele procura.


## Fontes

> SWI-Prolog. User guide - XPCE, 2023. Disponível em: https://www.swi-prolog.org/download/xpce/doc/userguide/userguide.pdf. Acesso em: 29 mai. 2023.


> SWI-Prolog. Manual. Disponível em: https://www.swi-prolog.org/pldoc/doc_for?object=manual. Acesso em: 30 mai. 2023.

> Meidanis, J. Apostila de Prolog. Disponível em: https://www.ic.unicamp.br/~meidanis/courses/mc346/2017s2/prolog/apostila-prolog.pdf. Acesso em: 26 mai. 2023.

> Derek Banas. Prolog Tutorial. Disponível em: https://www.youtube.com/watch?v=SykxWpFwMGs&t=480s. Acesso em: 29 mai. 2023.

> Shankhdhar, H. (2021). IMDb Dataset of Top 1000 Movies and TV Shows [conjunto de dados]. Kaggle. Disponível em: https://www.kaggle.com/datasets/harshitshankhdhar/imdb-dataset-of-top-1000-movies-and-tv-shows. Acesso em: 26 mai. 2023.

