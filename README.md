# CASVID API

This repository is a ruby on rails web service, which allows users to upload video. each video can belong to a single category.


## Tech Stack

**Server:** Ruby (2.7.2), Rails (6.1.3), Rspec (3.10)

**Database:** Postgresql (11.4)

**Deployment:** Docker (with a sample docker-compose.yml)

**API Gateway:** Restful

## Demo

The online version of the app is available at [https://casvid-api.aqlinux.ir/](https://casvid-api.aqlinux.ir/)

  
## Deployment

To deploy this project please use the `docker-compose.yml` and the `Dockerfile`.
It is recommended to use [corresponding react repo](https://github.com/thg303/ghanavatian_20210705_front) for the front-end implementation


IMPORTANT
---------
THIS REPOSITORY IS NOT SECURE/SAFE ENOUGH FOR REAL WORLD SCENARIOS.

Please before using this repository consider:
  - Using a real web server to host static files
  - Using enough access control mechanism to limit access to data / server resources


## API Documentation
The api documentation is available via postman.
[Documentation](https://documenter.getpostman.com/view/440366/Tzm3mwkX#ac99f851-3802-46fe-b287-f110c0eb8ed2)

All of the GET, POST, PATCH and DELETE actions are freely available for everyone.


## Local deployment
# Database
Please update `config/database.yml` to properly connect to your postgresql server.
run `rails db:setup` to apply migration and add required categories to the database
  
## Acknowledgements

 - [Awesome Readme Templates](https://awesomeopensource.com/project/elangosundar/awesome-README-templates)
 - [Awesome README](https://github.com/matiassingers/awesome-readme)
 - [How to write a Good readme](https://bulldogjob.com/news/449-how-to-write-a-good-readme-for-your-github-project)
  