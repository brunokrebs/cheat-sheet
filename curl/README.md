## cURL Useful Commands

```bash
# simple GET request
curl localhost:8080/api/products/1

# DELETE request
curl -X DELETE localhost:8080/api/products/1

# sending JSON body on POST request
curl -X POST -H "Content-Type: application/json" -d '{
  "title": "Milk",
  "price": 0.95
}' localhost:8080/api/products

# extracting JWT from Auth0
CLIENT_ID="d85mVhuB5EPYitTAZ38pA8rbi716IYCA"
CLIENT_SECRET="AiiFp-g5YGwxFOWwLVMdxialnxAniyuwGXoE5kPiHs8kGJeC2FJ0BCk5tTLlNKkY"

JWT=$(curl -X POST -H 'content-type: application/json' -d '{
    "client_id": "'$CLIENT_ID'",
    "client_secret": "'$CLIENT_SECRET'",
    "audience":"spring5",
    "grant_type":"client_credentials"
}' https://bkrebs.auth0.com/oauth/token | jq .access_token)

# passing the Authorization header in a GET request
curl -H "Authorization: Bearer "$JWT http://localhost:8080/products
```
