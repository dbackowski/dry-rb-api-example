Simple example of rails application for API using some dry-rb gems like:

- dry-validation
- dry-monads
- dry-matcher
- dry-struct


Run in the console:

```
rails s
```

Next you can play with it using curl command, examples:

- with valid params

```
curl -d '{"first_name":"John", "last_name":"Doe"}' -H "Content-Type: application/json" -H "Authorization: Bearer XXX" -X POST http://localhost:3000/tokens.json | jq
```

```
{
  "first_name": "John",
  "last_name": "Doe"
}
```

- with invalid params

```
curl -d '{"last_name":"Doe"}' -H "Content-Type: application/json" -H "Authorization: Bearer XXX" -X POST http://localhost:3000/tokens.json | jq
```

```
{
  "errors": {
    "first_name": [
      "is missing"
    ]
  }
}
```

- with missing authorization header

```
curl -v -d '{"first_name":"John", "last_name":"Doe"}' -H "Content-Type: application/json" -X POST http://localhost:3000/tokens.json | jq
```

```
> POST /tokens.json HTTP/1.1
> Host: localhost:3000
> User-Agent: curl/7.79.1
> Accept: */*
> Content-Type: application/json
> Content-Length: 40
>
} [40 bytes data]
* Mark bundle as not supporting multiuse
< HTTP/1.1 403 Forbidden
< X-Frame-Options: SAMEORIGIN
< X-XSS-Protection: 0
< X-Content-Type-Options: nosniff
< X-Download-Options: noopen
< X-Permitted-Cross-Domain-Policies: none
< Referrer-Policy: strict-origin-when-cross-origin
< Content-Type: application/json
< Cache-Control: no-cache
< X-Request-Id: 5b4f0986-de9c-473d-a1da-a2210a8ad1aa
< X-Runtime: 0.004600
< Server-Timing: start_processing.action_controller;dur=0.070068359375, process_action.action_controller;dur=0.21484375
< Transfer-Encoding: chunked
```
