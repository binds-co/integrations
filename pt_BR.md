A seguir reunimos as principais informações para integrar com a plataforma Binds.co.
A idéia é notificar a plataforma Binds.co quando ocorre o evento em questão, por exemplo uma venda na loja, ou uma entrega. Isso acontece através de um POST simples, por HTTPS, em nossa API REST.

Por exemplo, experimente fazer esta requisição, com seu próprio `collector`, nome e endereço de e-mail:

```
POST https://app.binds.co/api/seeds
Content/Type: application/json; charset=UTF-8
```
```
{
  "collector": "56a351796b80339c09ff1b76",
  "from": {
    "name": "Ezequias Dinella",
    "email": "ezequias@binds.co"
  },
  "metadata": {
    "nome": "Ezequias Dinella",
    "email": "ezequias@binds.co",
    "telefone": "+5511000000000",
    "campoPersonalizado": "XXXXXXXXXXX"
  }
}
```

O retorno esperado para esta requisição é o HTTP status 201 Created, indicando que o evento foi recebido e processado com sucesso. Retornos de código diferente podem ocorrer, com códigos na faixa de 4xx, descrevendo algum eventual problema no formato da requisição.

O campo `collector` é obrigatório, ele é usado para identificar a origem desta integração. O nome e e-mail também são obrigatórios. Também é possível incluir outros campos, em `metadata`, para enriquecer os relatórios.

A informação deve ser enviada no formato JSON com encoding UTF-8. Em resposta, a API sempre retorna dados em UTF-8.

Todas as datas na API são no formato ISO8601, por exemplo:  `2015-05-21T13:05:04.031Z`. O fuso horário é sempre GMT neste formato.

Também recebemos datas em timezones diferentes, por exemplo: `2015-05-21 10:05:04 -03:00` para o timezone de São Paulo, que é de menos três horas, ou duas no horário de verão.
Este formato pode evitar cálculos de fuso horário e horário de verão na sua integração (repare que as datas acima representam o mesmo momento).
