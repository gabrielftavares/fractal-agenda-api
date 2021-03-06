# Fractal - Agenda API

Com essa API é possível criar uma conta na aplicação e realizar o `CRUD` padrão para gerenciar seus contatos.

### [Diagrama do Banco de Dados](https://dbdiagram.io/d/628418a17f945876b639bc23)

## Criar uma nova conta

### Request

`POST /api/v1/registrations`

    curl -d '{ "user": { "name": "John Doe", "email": "testman@gmail.com", "password": "Htx7H9" } }' \
          http://localhost:3000/api/v1/registrations

### Response

    Status: 201 Created
    Content-Type: application/json

    {
      "email": "john_doe@gmail.com",
      "name": "John Doe",
      "authentication_token": "RLs2J_s-xmu9AmZ9H5UY"
    }

## Listar seus Contatos
### Request

`GET /api/v1/contacts`

    curl -d '{ "user": { "email": "testman@gmail.com", "password": "Htx7H9" } }' \
          http://localhost:3000/api/v1/contacts

### Response

    Status: 200 OK
    Content-Type: application/json

    {
      "contacts": [
      {
        "id": 1,
        "name": "John Doe",
        "email": "john_doe@gmail.com",
        "city": "Natal",
        "state": "Rio Grande do Norte",
        "country": "Brasil",
        "phone_number": "84 99988 7766",
        "relation": "professional"
      }
     ]
    }

## Criar um novo Contato

### Request

`POST /api/v1/contacts`

    curl -i -X POST                                                                                           \
     -H 'Content-Type: application/json'                                                                      \
     -H 'X-User-Email: testeman@gmail.com'                                                                    \
     -H 'X-User-Token: a6hYpzsfNJdYC6zEMxs3'                                                                  \
     -d '{ "contact": { "name": "Steve Jobs", "relation": "personal", "phone_number": "(555) 555-1234" } }'   \
     http://localhost:3000/api/v1/contacts

### Response

    Status: 201 Created
    Content-Type: application/json

    {
      "contact": {
        "id": 1,
        "name": "Steve Jebs",
        "email": "null",
        "city": null,
        "state": null,
        "country": null,
        "phone_number": "(555) 555-1234",
        "relation": "personal",
        "created_at": "2022-05-17T21:29:20.475Z",
        "updated_at": "2022-05-17T21:29:20.475Z",
        "user_id": 1
      }
    }

## Atualizar um Contato

### Request

`PATCH /api/v1/contacts/:id`

    curl -i -X PATCH                                                        \
       -H 'Content-Type: application/json'                                  \
       -H 'X-User-Email: testman@gmail.com'                                 \
       -H 'X-User-Token: a6hYpzsfNJdYC6zEMxs3'                              \
       -d '{ "contact": { "name": "Steve Jobs", "city": "New York" }'       \
       http://localhost:3000/api/v1/contacts/1

### Response

    Status: 200 Ok
    Content-Type: application/json

    {
      "contact": {
        "id": 1,
        "name": "Steve Jobs",
        "email": "null",
        "city": "New York",
        "state": null,
        "country": null,
        "phone_number": "(555) 555-1234",
        "relation": "personal",
        "created_at": "2022-05-17T21:29:20.475Z",
        "updated_at": "2022-05-17T21:29:20.475Z",
        "user_id": 1
      }
    }

## Deletar um Contato

### Request

`DELETE /api/v1/contacts/:id`

    curl -i -X DELETE                               \
     -H 'X-User-Email: testman@gmail.com'             \
     -H 'X-User-Token: a6hYpzsfNJdYC6zEMxs3'        \
     http://localhost:3000/api/v1/contacts/1

### Response

    Status: 200 Ok
    Connection: close
    Content-Type: application/json
