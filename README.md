# Watch.it Api

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![License: MIT][license-shield]][license-url]

> This a Ruby on Rails REST api that serves the front-end application and/or other automatic tools for verifying the APIs to create user, get JWT token keys to create, view, edit and delete a watchlists. It has its specific API endpoints to access the functionalities either through a front-end application or other tools such as postman. 

# Getting Started
- Make sure you have installed [Rails](https://www.tutorialspoint.com/ruby-on-rails/rails-installation.htm)
- Go to your terminal and type `git clone https://github.com/Berabjesus/watch-it-api`
- Change directory to the clone folder with `cd watch-it-api`
- Run `Bundle install` to install dependancies
- Type `rails db:create && rails db:migrate` on the terminal. 
- Start the application with `rails s`

# RESTful URLs
> Before you start with any API call you should be aware the any GET or POST request needs a JWT token key in the header.
> You can only get the token when you successfully signup or login with the application. Have a look at the section below for an example on postman.

- The main url should always consist of `https://watch-it-api-v1.herokuapp.com/api/v1/` 
- The `https://watch-it-api-v1.herokuapp.com` is the main domain.
- The `api` is a namespace denoting that you are calling the api.
- The `v1` is the current version of the api.
- The API is generally RESTFUL and returns results in JSON format. 
- Sample resonse from the API looks like the one below.
  ``` 
  {
    "status": "ok",
    "message": "User created",
    "username": "Someone",
    "token": "ereleHBpcmVzSW4iOjE2MTgwODk5NjEsImFsZyI6IkhTMjU2In0.eyJ1c2VyX2lkIjoxfQ.RSRqJiESzGh_TG6Yrs5jAYq7hpWb8K1n_797nznPVpw"
  }
  ```
### Bad URL example
- `https://watch-it-api-v1.herokuapp.com/user/:username` 

### Good URL example
- `https://watch-it-api-v1.herokuapp.com/api/v1/user/:username` 

# HTTP Verbs
- HTTP verbs, or methods, should be used in compliance with their definitions under the [HTTP/1.1](http://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html) standard. **Listed below are the verbs used in this application**
  
| HTTP METHOD | POST            | GET       | PUT         | DELETE |
| ----------- | --------------- | --------- | ----------- | ------ |
| CRUD Operation     | CREATE          | READ      | UPDATE      | DELETE |

### Sample GET request
```
  fetch('https://watch-it-api-v1.herokuapp.com/api/v1/watchlists/', {
    method: 'GET',
    mode: 'cors',
    headers: {
      'Content-Type': 'application/json',
      Authorization: `bearer ${token}`,
    },
  })

```
- The token from the login process is used to authenticate the user and is sent with an `Authorization` key in the header as a bearer authentication. **This is very important for the request to succeed and it is the case for all the requests**

# Endpoints
- As mentioned above the endpoint should be preceded by the `/api/v1/`

|  Endpoint     |   VERB  | Description |
| -----------   | --------| ----------- | 
|   /login      | Post    |   Check for a user and sends a token if successful     |
|   /signup     | Post    |   Creates a user and send a token     |
|/watchlists    | Post    |   Creates a watchlist for the logged in user     |
|/watchlists    | GET     |   Gets all the watchlists of a user     |
|/watchlists/:id| PUT     |   Updates a specific watchlist of a user    |
|/watchlists/:id| DELETE  |   Delete a specific watchlist of a user    |

# Login Tutorial on Postman

- 1. Select the post asction and enter the login url as specified above. 
  ![image](https://user-images.githubusercontent.com/64360974/114250910-ee357100-99a7-11eb-9ea5-38a2d3e7b0d4.png)
- 2. Set the header section as seen in the picture below
  ![image](https://user-images.githubusercontent.com/64360974/114250971-1fae3c80-99a8-11eb-91b8-99f265dc95d0.png)
- 3. Specify the username and password in the body.
  ![image](https://user-images.githubusercontent.com/64360974/114251018-47050980-99a8-11eb-870a-bc49fbcf3e74.png)
- 4. If everythings goes right you should see the response below.
  ![image](https://user-images.githubusercontent.com/64360974/114251053-66039b80-99a8-11eb-8378-ee40bbaf847e.png)

# Response and Error Types.

| Status Message | code            | Meaning       |
| ----------- | --------------- | --------- |
| Data fetched     | 202          | Accepted      |
| login success     | 202          | Accepted      |
| Content created     | 201          | Created      |
| User created     | 201          | Created      |
| Error     | 422          | unprocessable entity      |
| Error     | 401          | unauthorized      |
| Error     | 400          | bad request      |
| Error     | 404          | not found      |
| Error     | 50*         | Server errors     |

# Run tests
- Run `rails db:migrate RAILS_ENV=test`

- Run  ```rspec ``` to run the tests.


# Author

👤 **Bereket Beshane**

- Github: [@berabjesus](https://github.com/Berabjesus)
- Twitter: [@bereket_ababu_b](https://twitter.com/bereket_ababu_b)
- Linkedin: [linkedin](https://www.linkedin.com/in/bereketbeshane)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Berabjesus/watch-it-api/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse
- Heroku

## 📝 License- 

MIT

[contributors-shield]: https://img.shields.io/https://github.com/Berabjesus/watch-it-api
[contributors-url]: https://github.com/Berabjesus/watch-it-api/contributors
[forks-shield]: https://img.shields.io/github/forks/Berabjesus/watch-it-api
[forks-url]:https://github.com/Berabjesus/watch-it-api/network/members
[stars-shield]: https://img.shields.io/github/stars/Berabjesus/watch-it-api
[stars-url]: https://github.com/Berabjesus/watch-it-api/stargazers
[issues-shield]: https://img.shields.io/github/issues/Berabjesus/watch-it-api
[issues-url]: https://github.com/Berabjesus/watch-it-api/issues
[license-shield]: https://img.shields.io/badge/License-MIT-yellow.svg
[license-url]: https://github.com/Berabjesus/watch-it-api/development/LICENSE