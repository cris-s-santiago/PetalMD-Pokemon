![](images/photo01.jpg)

# Petal MD <img src="images/PetalMD_logo.png" align="right" alt="Rocket Elevators logo" width="" height="100">

---

## Technical Test

---

Project by:

```ssh
- Cristiane Santiago
```

---

## About:

π― Create a project that will expose a Restful API to a potential customer.

From a list of PokΓ©mon, the API allows you to perform CRUD actions (Create, Read, Update, Delete), it is also possible to return a page list.


π  Technology and technique used:

- Ruby on rails 5
- TDD (Test Driven Development)

π The list of pokemon received in a CSV file has been imported into the Sqlite3 database for better future maintenance, such as a move to another database.

π  For testing TDD:
```ssh
    Test command: bundle exec rspec
```

π  For testing API:
```ssh
   -  Database configuration:
   rake db:migrate
   rake db:seed

   -  Run application:
   rails s
```

---


## Preview:
### Postman:
![](images/test_postman.gif)

---


## Additional:

π Deployment of the Restful API on the Heroku cloud, with Postgres as a database on the AWS cloud.

```ssh
    https://test-pokemon-list.herokuapp.com
```

π Workspace created at Postman for testing.

```ssh
    https://app.getpostman.com/join-team?invite_code=1b3c3ed65a7224a0c2b02f8829473e99&ws=50e05228-48d8-44c5-bbec-723dad2e5076
```