# CASVID API

This repository is a ruby on rails web service, which allows users to upload video. each video can belong to a single category.


## Tech Stack

**Server:** Ruby (2.7.2), Rails (6.1.3), Rspec (3.10)

**Database:** Postgresql ()

**Deployment:** Docker (with a sample docker-compose.yml)

**API Gateway:** Restful, *GraphQL**

*Graphql** implementation is not completed yet [only simple Queries are implemented]. it lives on `add-graphql` branch.
## Demo

The online version of the app is available at [https://mblog.aqlinux.ir/](https://mblog.aqlinux.ir/)



  
## Deployment

To deploy this project please use the `docker-compose.yml` and the `Dockerfile`.
Also remember to copy `.env.example` to `.env` and update it's content. you would probably
need to update 3 lines:
```
GITHUB_APP_ID=<github-app-id>
GITHUB_APP_SECRET=<github-app-secret>
...
SITE_URL=http://localhost
```

Since the app is using Github OAuth API to authenticate web users, you would need to
create an **OAuth App** credentials at [your github profile](https://github.com/settings/developers).

The most important field is **Authorization callback URL** which should be set according 
to the application url as follow:

`<http(s):your-domain-or-simply-localhost>/auth/callback`

for example, since the demo application is hosted on *https://mblog.aqlinux.ir* this field
was filled with `https://mblog.aqlinux.ir/auth/callback`

With that changes you would only need to set some passwords for the mysql service in the
`docker-compose.yml` and everything should be ok to deploy.


## API Documentation
The api documentation is available via postman.
[Documentation](https://documenter.getpostman.com/view/440366/TzXxjxa3)

All of the POST, PATCH and DELETE actions need jwt token in the header. To make 
it easy to test I added [take-auth-token](https://documenter.getpostman.com/view/440366/TzXxjxa3#b15fc802-4cb9-479b-b85d-037388b73a4e) api 
which allows the caller to create a random user and receive JWT token along with the user id.

  
## Acknowledgements

 - [Awesome Readme Templates](https://awesomeopensource.com/project/elangosundar/awesome-README-templates)
 - [Awesome README](https://github.com/matiassingers/awesome-readme)
 - [How to write a Good readme](https://bulldogjob.com/news/449-how-to-write-a-good-readme-for-your-github-project)
  

# Database
update `config/database.yml` to properly connect to your postgresql server.

run `rails db:setup` to apply migration and add required categories to the database