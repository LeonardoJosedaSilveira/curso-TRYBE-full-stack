# Boas vindas ao repositório do projeto Lista de Tarefas!

O que foi desenvolvido ?

Você irá desenvolver uma aplicação de lista de tarefas.

O que foi avaliado ?

Aderência do código à especificação. Seu programa deve se comportar como especificado na próxima seção.
Organização do seu código. Quebre seu código em funções. Prefira funções pequenas, simples e bem definidas a funções grandes e complexas.
Sua capacidade de estruturar corretamente uma página HTML . Utilize as tags corretas nos contextos apropriados. Feche sempre suas tags e aninhe-as corretamente.
A estruturação do seu CSS . Evite repetição. Combine e agrupe classes CSS bem definidas.

---

## Requisitos 

### 1 - Sua lista deve possuir o título "Minha Lista de Tarefas" em uma tag `<header>`. Esse título não varia de acordo com o conteúdo da lista. _Não confunda esse título com o título da página, que deve aparecer dentro da tag `head`_.
##### As seguintes verificações serão feitas:

- Será verificado se sua página possui uma tag `header` com o conteúdo `Minha Lista de Tarefas`

### 2 - Abaixo do título deve haver um pequeno e discreto parágrafo com `id="funcionamento"` e com o texto "Clique duas vezes em um item para marcá-lo como completo" explicando o funcionamento da lista para o usuário.
##### As seguintes verificações serão feitas:

- Será verificado que existe na sua página um elemento com o id `funcionamento` com o conteúdo `Clique duas vezes em um item para marcá-lo como completo`

### 3 - Deve haver um `input` com o `id="texto-tarefa"` onde o usuário poderá digitar o nome do item que deseja adicionar à lista.
##### As seguintes verificações serão feitas:

- Será verificada a existência de um elemento do tipo `input` com o id `texto-tarefa`.

### 4 - Deve haver uma lista ordenada de tarefas com o `id="lista-tarefas"`.
##### As seguintes verificações serão feitas:

- Será verificada a existência de um elemento `ol` com o id `lista-tarefas`.

### 5 - Deve haver um botão com `id="criar-tarefa"` e ao clicar nesse botão, um novo item deverá ser criado ao final da lista e o texto do input deve ser limpo.
##### As seguintes verificações serão feitas:

- Será verificada a existência de um elemento do tipo `button` com o id `criar-tarefa`
- No campo de input será digitado o texto de uma tarefa qualquer e, em seguida, clicar-se-á no botão de criar tarefa. Será verificado que, após o clique, o texto digitado aparece na lista e desaparece do input.
- A adição de elementos na lista será feita algumas vezes, e será checado se todos os itens criados permanecem na lista na medida em que novos são adicionados.

### 6 - Os itens da lista de tarefas devem ser ordenados por ordem de criação.
##### As seguintes verificações serão feitas:

- Três itens serão criados na lista e será checado se eles estão ordenados por ordem de criação - ou seja, primeiro o primeiro item criado, depois o segundo, e assim por diante.

### 7 - Ao clicar em um item da lista, altere a cor de fundo do item para cinza rgb(128,128,128).
##### As seguintes verificações serão feitas:

- Será verificado que, ao se carregar a página, os itens da lista **não tem** o estilo CSS `background-color: rgb(128, 128, 128)`
- Será verificado que, ao se clicar em um item da lista, ele passa a ter o estilo CSS `background-color: rgb(128, 128, 128)`

### 8 - Não deve ser possível selecionar mais de um elemento da lista ao mesmo tempo.
##### As seguintes verificações serão feitas:

- Será verificado que, quando um elemento da lista é selecionado, o elemento selecionado previamente deixa de sê-lo. Isso é verificado através da presença ou não do estilo `background-color: rgb(128, 128, 128)` no elemento.

### 9 - Ao clicar duas vezes em um item, ele deverá ser riscado, indicando que foi completo. Deve ser possível desfazer essa ação clicando novamente duas vezes no item.

  Pontos importantes sobre este requisito:

  * Crie uma classe CSS com o nome "completed" e defina a propriedade "text-decoration" com o valor "line-through".

  * Utilize a classe CSS "completed" para adicionar o efeito de letra tachada (riscada) às tarefas finalizadas.

##### As seguintes verificações serão feitas:

- Será verificado que, antes da ação ser disparada, o elemento adicionado à lista não tem nem a classe `completed` nem o estilo `line-through solid rgb(0, 0, 0)`.
- Será verificado que a ação pedida é disparada mediante duplo clique no elemento da lista e que os elementos da lista completos tem em si a classe `completed` e a propriedade `text-decoration` com o valor `line-through solid rgb(0, 0, 0)`
- Será verificado que, com um segundo duplo clique, um elemento completo deixa de sê-lo

### 10 - Deve haver um botão com `id="apaga-tudo"` que quando clicado deve apagar todos os items da lista.
##### As seguintes verificações serão feitas:

- Será verificado que existe um elemento `button` com o id `apaga-tudo`
- Será verificado que, dado que uma lista possui tarefas, um clique no botão a deixa vazia

### 11 - Deve haver um botão com `id="remover-finalizados"` que quando clicado remove **somente** os elementos finalizados da sua lista.
##### As seguintes verificações serão feitas:

- Será verificado que existe um elemento `button` com o id `remover-finalizados`
- Será verificado que, ao clicar no botão, todos os elementos marcados como feitos são removidos da lista



