# Hello birthday app

Web application that saves username and birthdate, and returns hello birthday message 


# Testing

On a local machine,
```
docker-compose up -d
curl -X PUT http://localhost:8080/hello/jane -H "Content-Type: application/json" -d '{"dateOfBirth":"2016-01-01"}'
curl -X GET http://localhost:8080/hello/jane
```
