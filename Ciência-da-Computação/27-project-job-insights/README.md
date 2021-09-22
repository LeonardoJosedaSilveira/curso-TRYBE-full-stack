Bloco 33: Introdução à Python

# Boas vindas ao repositório do projeto Job Insights!

O foi desenvolvido ?

implementada análises a partir de um conjunto de dados sobre empregos. Suas implementações serão incorporadas a um aplicativo Web desenvolvido com Flask (um framework web muito popular na comunidade Python).

---

## Habilidades

- Utilizar o terminal interativo do Python.
- Utilizar estruturas condicionais e de repetição.
- Utilizar funções built-in do Python.
- Utilizar tratamento de exceções.
- Realizar a manipulação de arquivos.
- Escrever funções.
- Escrever testes com Pytest.
- Escrever seus próprios módulos e importá-los em outros códigos.

---

#### Requisitos 

##### 1 - Implemente a função `read`
local: `src/jobs.py`

Para começarmos a processar os dados, devemos antes carregá-los em nossa aplicação. Esta função será responsável por abrir o arquivo CSV e retornar os dados no formato de uma lista de dicionários.

- A função deve receber um _path_ (uma string com o caminho para um arquivo).
- A função deve abrir o arquivo e ler seus conteúdos.
- A função deve tratar o arquivo como CSV.
- A função deve retornar uma lista de dicionários, onde as chaves são os cabeçalhos de cada coluna e os valores correspondem a cada linha.

✍️ Teste manual: abra um terminal Python importando estas funções através do comando `python3 -i src/jobs.py` e invoque a função utilizando diferentes _paths_.

**🤖 O que será verificado pelo avaliador:**

- A função abre o arquivo passado como parâmetro
- A função retorna uma lista de dicionários
- A função retorna a quantidade correta de itens na lista
- Nos dicionários retornados pela função, as chaves correspondem aos cabeçalhos do arquivo

##### 2 - Implemente a função `get_unique_job_types`
local: `src/insights.py`

Agora que temos como carregar os dados, podemos começar a extrair informação deles. Primeiro, vamos identificar quais tipos de empregos existem.

- A função deve receber o _path_ do arquivo csv com os dados.
- A função deve invocar a função `jobs.read` com o _path_ recebido para obter os dados.
- A função deve retornar uma lista de valores únicos presentes na coluna `job_type`.

**🤖 O que será verificado pelo avaliador:**

- A função carrega os dados do arquivo recebido como parâmetro
- A função retorna a quantidade correta de valores
- A função retorna os valores corretos
- A função desconsidera valores vazios

##### 3 - Implemente a função `get_unique_industries`
local: `src/insights.py`

Da mesma forma, agora iremos identificar quais indústrias estão representadas nesse conjunto de dados.

- A função deve obter os dados da mesma forma que o requisito 2.
- A função deve retornar uma lista de valores únicos presentes na coluna `industry`.
- A função desconsidera valores vazios

**🤖 O que será verificado pelo avaliador:**

- A função carrega os dados do arquivo recebido como parâmetro
- A função retorna a quantidade correta de valores
- A função retorna os valores corretos

##### 4 - Implemente a função `get_max_salary`
local: `src/insights.py`

Os dados apresentam faixas salariais para cada emprego exibido. Vamos agora encontrar o maior valor de todas as faixas.

- A função deve obter os dados da mesma forma que o requisito 2.
- A função deve ignorar os valores ausentes.
- A função deve retornar *um valor inteiro* com o maior salário presente na coluna `max_salary`.

**🤖 O que será verificado pelo avaliador:**

- A função carrega os dados do arquivo recebido como parâmetro
- A função retorna o valor correto

##### 5 - Implemente a função `get_min_salary`
local: `src/insights.py`

Os dados apresentam faixas salariais para cada emprego exibido. Vamos agora encontrar o maior valor de todas as faixas.

- A função deve obter os dados da mesma forma que o requisito 2.
- A função deve ignorar os valores ausentes.
- A função deve retornar *um valor inteiro* com o menor salário presente na coluna `min_salary`.

**🤖 O que será verificado pelo avaliador:**

- A função carrega os dados do arquivo recebido como parâmetro
- A função retorna o valor correto

##### 6 - Implemente a função `filter_by_job_type`
local: `src/insights.py`

Os empregos estão listados em um aplicativo web. Para permitir que a pessoa usuária possa filtrar os empregos por tipo de emprego, vamos precisar implementar esse filtro.

- A função deve receber uma lista de dicionários `jobs` como primeiro parâmetro.
- A função deve receber uma string `job_type` como segundo parâmetro.
- A função deve retornar uma lista com todos os empregos onde a coluna `job_type` corresponde ao parâmetro `job_type`.

**🤖 O que será verificado pelo avaliador:**

- A função retorna a quantidade correta de valores
- A função retorna os valores corretos
- A função retorna os valores na ordem correta
- A função retorna uma lista vazia para `job_types` ausentes nos `jobs` recebidos

##### 7 - Implemente a função `filter_by_industry`
local: `src/insights.py`

Do mesmo modo, o aplicativo precisa permitir uma filtragem por indústria. Vamos precisar implementar esse filtro também.

- A função deve receber uma lista de dicionários `jobs` como primeiro parâmetro.
- A função deve receber uma string `industry` como segundo parâmetro.
- A função deve retornar uma lista de dicionários com todos os empregos onde a coluna `industry` corresponde ao parâmetro `industry`.

**🤖 O que será verificado pelo avaliador:**

- A função retorna a quantidade correta de valores
- A função retorna os valores corretos
- A função retorna os valores na ordem correta
- A função retorna uma lista vazia para `job_types` ausentes nos `jobs` recebidos

##### 8 - Implemente a função `matches_salary_range`
local: `src/insights.py`

O aplicativo vai precisar filtrar os empregos por salário também. Como uma função auxiliar, implemente `matches_salary_range` para conferir que o salário procurado está dentro da faixa salarial daquele emprego. Vamos aproveitar também para conferir se a faixa salarial faz sentido -- isto é, se o valor mínimo é menor que o valor máximo.

- A função deve receber um dicionário `job` como primeiro parâmetro, com as chaves `min_salary` e `max_salary`.
- A função deve receber um inteiro `salary` como segundo parâmetro.
- A função deve lançar um erro `ValueError` nos seguintes casos:
  - alguma das chaves `min_salary` ou `max_salary` estão *ausentes* no dicionário;
  - alguma das chaves `min_salary` ou `max_salary` tem valores não-numéricos;
  - o valor de `min_salary` é maior que o valor de `max_salary`;
  - o parâmetro `salary` tem valores não-numéricos;
- A função deve retornar `True` se o salário procurado estiver dentro da faixa salarial ou `False` se não estiver.

**🤖 O que será verificado pelo avaliador:**

- A função retorna o booleano correto
- A função lança um `ValueError` se o valor de `min_salary` for maior que o valor de `max_salary`
- A função lança um `ValueError` se as chaves `min_salary` ou `max_salary` tiverem valores não numéricos
- A função lança um `ValueError` se o parâmetro `salary` tiver valor não numérico
- A função lança um `ValueError` se as chaves `min_salary` ou `max_salary` estiverem ausentes no dicionário

##### 9 - Implemente a função `filter_by_salary_range`
local: `src/insights.py`

Agora vamos implementar o filtro propriamente dito. Para esta filtragem, podemos usar a função auxiliar implementada no requisito anterior -- tomando o cuidado de descartar os empregos que apresentarem faixas salariais inválidas.

- A função deve receber uma lista de dicionários `jobs` como primeiro parâmetro.
- A função deve receber um inteiro `salary` como segundo parâmetro.
- A função deve ignorar os empregos com valores inválidos para `min_salary` ou `max_salary`.
- A função deve retornar uma lista com todos os empregos onde o salário `salary` estiver entre os valores da coluna `min_salary` e `max_salary`.

**🤖 O que será verificado pelo avaliador:**

- A função retorna a quantidade correta de valores
- A função retorna os valores corretos
- A função retorna os valores na ordem correta
- Empregos onde as chaves `min_salary` ou `max_salary` tiverem valores não numéricos devem ser ignorados
- Empregos onde o valor de `min_salary` for maior que o valor de `max_salary` devem ser ignorados

##### 10 - Implemente um teste para a função `sort_by`
local: `tests/sorting/test_sorting.py`

Por fim, espera-se que a pessoa usuária possa escolher um critério de ordenação para exibir os empregos. Já temos uma implementação para essa ordenação em `src/sorting.py`, mas queremos ter certeza de que ela funciona e, principalmente, que não deixará de funcionar conforme vamos implementando novos recursos. Precisamos então escrever um *teste*!

Esse teste deve se chamar `test_sorting_by_criteria` e garantir que a função funciona segundo esta especificação:

- A função `sort_by` recebe dois parâmetros:
  - `jobs` uma lista de dicionários com os detalhes de cada emprego;
  - `criteria` uma string com uma chave para ser usada como critério de ordenação.
- O parâmetro `criteria` deve ter um destes valores: `min_salary`, `max_salary`, `date_posted`
- A ordenação para `min_salary` deve ser crescente, mas para `max_salary` ou `date_posted` devem ser decrescentes.
- Os empregos que não apresentarem um valor válido no campo escolhido para ordenação devem aparecer no final da lista.

> 📌 O **teste da Trybe** espera que o **seu teste** falhe em alguns casos. Nesse caso, o teste terá a saída `XFAIL` (ao invés de `PASS` ou `FAIL`), e isso significa que o requisito foi atendido ✔️

**🤖 O que será verificado pelo avaliador:**

- O teste rejeita implementações que aceitam critérios não especificados.
- O teste rejeita implementações que não ordenam corretamente.
- O teste rejeita implementações que não ordenam em ordem crescente quando o critério é `min_salary`.
- O teste aprova implementações corretas.
