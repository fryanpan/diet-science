# Diet Science Server

Rudimentary server for storing data from the client into a convenient SQL database for prototyping.

At the moment, there's no plan to put substantial logic in here.  Will do analysis either in the client 
or in apps like Jupyter Notebook or Tableau or Google Spreadsheet that are easier to rapidly do analytics in. 

# Deployment

TBD.

At minumum, get database credentials from someone else and fill in './src/config/sequelize-config.js'

# Some development notes

Most of the codebase is in Typescript, except it was more convenient to leave Sequelize migrations in JS.

## Sequelize

### Creating migrations

```
npm run sequelize-cli -- migration:generate --name <name>
```

### Creating models

We depend on the [sequelize-typescript](https://github.com/RobinBuschmann/sequelize-typescript#readme) project for convenient type annotations and types.

See the documentation for how to work with models.


### Running migrations

To run a migration inside the docker environment
```
cd deploy
docker-compose exec server /bin/bash
npm run sequelize-cli -- db:migrate
```
