Bloco 27: NodeJS: Camada de Serviço e Arquitetura Rest e Restful

# Boas vindas ao repositório do projeto Store Manager!

O que foi desenvolvido ?

Este trabalho será individual.
Você vai arquitetar e desenvolver a API com um banco de dados MongoDB .
Você desenvolverá endpoints para criar, exibir, atualizar e excluir produtos e vendas.

O que foi avaliado ?

Aderência do código à especificação. Seu programa deve se comportar como especificado na próxima seção;
Back-end seguindo o padrão arquitetural MSC ;
Aderência ao padrão REST.

---

# Habilidades

- Entender o funcionamento da camada de Model;
- Delegar responsabilidades específicas para essa camada;
- Conectar sua aplicação com diferentes `collections` do bancos de dados;
- Estruturar uma aplicação em camadas;
- Delegar responsabilidades específicas para cada parte do seu app;
- Melhorar manutenibilidade e reusabilidade do seu código;
- Entender e aplicar os padrões REST;
- Escrever assinaturas para APIs intuitivas e facilmente entendíveis.


## Requisitos

### 1 - Crie um endpoint para o cadastro de produtos

- O endpoint deve ser acessível através do caminho (`/products`);

- Os produtos enviados devem ser salvos em uma **collection** do MongoDB;

- O endpoint deve receber a seguinte estrutura:

```json
{
  "name": "product_name",
  "quantity": "product_quantity"
}
```

O retorno da API de um produto cadastrado com sucesso deverá ser:

```json
{
  "_id": "5f43a7ca92d58904914656b6",
  "name": "Produto do Batista",
  "quantity": 100
}
```

#### Requisição de Cadastro de Produtos:

O projeto deve rodar na porta `http://localhost:3000`


#### Observações Técnicas:

- `name` deve ser uma _string_ com mais de 5 caracteres e deve ser único;

- `quantity` deve ser um número inteiro maior que 0;

- Cada produto deve ter um id que seja único e gerado no momento em que o recurso for criado. Você pode utilizar o ID gerado pelo MongoDB

- A resposta do endpoint em caso de sucesso deve ser o produto criado.

**O que será verificado:**

- Será validado que não é possível criar um produto com o nome menor que 5 caracteres
  - Se o produto tiver o nome menor que cinco caracteres o resultado retornado deverá ser um status http `422`:

(As contrabarras `\` estão escapando as aspas de dentro da string)

- Será validado que não é possível criar um produto com o mesmo nome de outro já existente

  -  Se o produto tiver o mesmo nome o resultado retornado deverá ser status http `422`:


- Será validado que não é possível criar um produto com quantidade menor que zero

    - Se o produto tiver uma quantidade menor que zero o resultado retornado deverá ser status http `422`:

(As contrabarras `\` estão escapando as aspas de dentro da string)

- Será validado que não é possível criar um produto com quantidade igual a zero

  - Se o produto tiver uma quantidade igual a zero o resultado retornado deverá ser status http `422`:

(As contrabarras `\` estão escapando as aspas de dentro da string)

- Será validado que não é possível criar um produto com uma string no campo quantidade

  - Se o produto tiver uma quantidade com o valor em string o resultado retornado deverá ser status http `422`:

(As contrabarras `\` estão escapando as aspas de dentro da string)

- Será validado que é possível criar um produto com sucesso

  - Se o produto for cadastrado com sucesso o resultado retornado deverá ser status http `201`:


### 2 - Crie um endpoint para listar os produtos

- O endpoint deve ser acessível através do caminho (`/products`) ou (`/products/:id`);

- Através do caminho `/products`, todos os produtos devem ser retornados;

- Através do caminho `/products/:id`, apenas o produto com o `id` presente na URL deve ser retornado;

**O que será verificado:**

- Será validado que todos produtos estão sendo retornados

  - Se a lista retornar com sucesso, o resultado retornado deverá ser status http `200`:


- Será validado que é possível listar um determinado produto

  - Se a lista retornar com sucesso, o resultado retornado deverá ser status http `200`:


- Será validado que não é possível listar um produto que não existe

  - Se a lista retornar com falha, o resultado retornado deverá ser status http `422`:


### 3 - Crie um endpoint para atualizar um produto

- O endpoint deve ser acessível através do caminho (`/products/:id`);

- O corpo da requisição deve seguir a mesma estrutura do método responsável por adicionar um produto;

- Apenas o produto com o `id` presente na URL deve ser atualizado;

**O que será verificado:**

- Será validado que não é possível atualizar um produto com o nome menor que 5 caracteres

  - Se o produto tiver o nome menor que cinco caracteres, o resultado retornado deverá ser status `422`:

(As contrabarras `\` estão escapando as aspas de dentro da string)

- Será validado que não é possível atualizar um produto com quantidade menor que zero

  - Se o produto tiver o quantidade menor que zero, o resultado retornado deverá ser status http `422`:

(As contrabarras `\` estão escapando as aspas de dentro da string)

- Será validado que não é possível atualizar um produto com quantidade igual a zero

  - Se o produto tiver o quantidade igual a zero, o resultado mostrado deverá ser status http `422`:

(As contrabarras `\` estão escapando as aspas de dentro da string)

- Será validado que não é possível atualizar um produto com uma string no campo quantidade

  - Se o produto tiver o quantidade como string, o resultado retornado deverá ser status http `422`:

(As contrabarras `\` estão escapando as aspas de dentro da string)

- Será validado que é possível atualizar um produto com sucesso]**

  - Se o produto atualizado com sucesso, o resultado mostrretornadoado deverá ser status http `200`:


### 4 - Crie um endpoint para deletar um produto

- O endpoint deve ser acessível através do caminho (`/products/:id`);

- Apenas o produto com o `id` presente na URL deve ser deletado;

**O que será verificado:**

- Será validado que é possível deletar um produto com sucesso

  - Se o produto deletado com sucesso, o resultado retornado deverá ser status http `200`:


- Será validado que não é possível deletar um produto que não existe

  - Se o produto não for deletado com sucesso, o resultado retornado deverá ser esse e com status http `422`:


### 5 - Crie um endpoint para cadastrar vendas

- O endpoint deve ser acessível através do caminho (`/sales`);

- As vendas enviadas devem ser salvas em uma `collection` do MongoDB;

- Deve ser possível cadastrar a venda de vários produtos através da uma mesma requisição;

- O endpoint deve receber a seguinte estrutura:

```json
[
  {
  "productId": "product_id",
  "quantity": "product_quantity",
  },
  ...
]
```

O retorno de uma venda cadastrada com sucesso deverá ser:

```json
{
  "_id": "5f43ba333200020b101fe4a0",
  "itensSold": [
    {
      "productId": "5f43ba273200020b101fe49f",
      "quantity": 2
    }
  ]
}
```

#### Observações Técnicas:

- O `productId` devem ser igual ao `id` de um produto anteriormente cadastrado;

- `quantity` deve ser um número inteiro maior que 0;

- Cada venda deve ter um id que seja único e gerado no momento em que o recurso for criado;

- A resposta do endpoint em caso de sucesso deve ser a(s) venda(s) criada(s).

**O que será verificado:**

- Será validado que não é possível cadastrar vendas com quantidade menor que zero

  - Se a venda tiver uma quantidade menor que zero, o resultado retornado deverá ser status http `422`:


- Será validado que não é possível cadastrar vendas com quantidade igual a zero

  - Se a venda tiver uma quantidade igual a zero, o resultado retornado deverá ser status http `422`:


- Será validado que não é possível cadastrar vendas com uma string no campo quantidade

  - Se a venda tiver uma quantidade com valor, o resultado retornado deverá ser status http `422`:


- Será validado que é possível criar uma venda com sucesso

  - Se a venda foi feita com sucesso, o resultado retornado deverá ser status http `200`:


- Será validado que é possível criar várias vendas com sucesso

  - Se as vendas foi feita com sucesso, o resultado retornado deverá ser status http `200`:


### 6 - Crie um endpoint para listar as vendas

- O endpoint deve ser acessível através do caminho (`/sales`) ou (`/sales/:id`);

- Através do caminho `/sales`, todas as vendas devem ser retornadas;

- Através do caminho `/sales/:id`, apenas a venda com o `id` presente na URL deve ser retornada;

**O que será verificado:**

- Será validado que todas as vendas estão sendo retornadas

  - Se todas vendas estão sendo listadas, o resultado retornado deverá ser status http `200`:


- Será validado que é possível listar uma determinada venda

 - Se a venda esta sendo listada, o resultado retornado deverá ser status http `200`:


- Será validado que não é possível listar uma venda inexistente

  - Se a venda não esta sendo listada, o resultado retornado deverá ser status http `404`:


### 7 - Crie um endpoint para atualizar uma venda

- O endpoint deve ser acessível através do caminho (`/sales/:id`);

- O corpo da requisição deve receber a seguinte estrutura:

```json
[
  {
    "productId": "5f3ff849d94d4a17da707008",
    "quantity": 3
  }
]
```

- `quantity` deve ser um número inteiro maior que 0;

- Apenas a venda com o `id` presente na URL deve ser atualizada;

**O que será verificado:**

- Será validado que não é possível atualizar vendas com quantidade menor que zero

  - Se a venda tiver uma quantidade menor que zero, o resultado retornado deverá ser status http `422`:


- Será validado que não é possível atualizar vendas com quantidade igual a zero

  - Se a venda tiver uma quantidade igual a zero, o resultado retornado deverá ser status http `422`:


- Será validado que não é possível atualizar vendas com uma string no campo quantidade

  - Se a venda tiver uma quantidade do tipo string, o resultado retornado deverá ser status http `422`:


- Será validado que é possível atualizar uma vendas com sucesso

  - Se a venda for atualizada com sucesso, o resultado retornado deverá ser status http `200`:


### 8 - Crie um endpoint para deletar uma venda

- O endpoint deve ser acessível através do caminho (`/sales/:id`);

- Apenas a venda com o `id` presente na URL deve ser deletado;

**O que será verificado:**

- Será validado que é possível deletar uma venda com sucesso

  - Se a venda foi deletada sucesso, o resultado retornado deverá ser status http `200` e será verificado depois que a venda não existe e deverar retornar http `404`:


- Será validado que não é possível deletar uma venda que não existe

  - Se a venda não foi deletada sucesso, o resultado retornado deverá ser status http `422`:


### 9 - Atualize a quantidade de produtos

- Ao realizar uma venda, atualizá-la ou deletá-la, você deve também atualizar a quantidade do produto em questão presente na `collection` responsável pelos produtos;

- Por exemplo: suponha que haja um produto chamado _Bola de Futebol_ e a sua propriedade `quantity` tenha o valor _10_. Caso seja feita uma venda com _8_ unidades desse produto, a quantidade do produto deve ser atualizada para _2_ , pois 10 - 8 = 2;

**O que será verificado:**

- Será validado que é possível a quantidade do produto atualize ao fazer uma compra

  - Ao fazer uma determinada venda, a quantidade do produto deverá ser atualizada.

- Será validado que é possível a quantidade do produto atualize ao deletar uma compra

  - Ao fazer deletar uma determinada venda, a quantidade do produto deverá ser atualizada para a quantidade que tinha antes de ter feito essa venda.

### 10 - Valide a quantidade de produtos

- Um produto nunca deve ter a quantidade em estoque menor que 0;

- Quando uma venda for realizada, garanta que a quantidade sendo vendida está disponível no estoque

**O que será verificado:**

- Será validado que o estoque do produto nunca fique com a quantidade menor que zero

  - Um produto não poderá ficar com a quantidade menor que zero, o resultado retornado deverá ser status http `404`:

