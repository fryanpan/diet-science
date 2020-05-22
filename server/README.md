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


### Importing data

How to import data from the Google Spreadsheet version into Postgres database 
data store:

1) Use command line `psql` utility to login to the database
2) Download data from the [Postgres Export Sheet](https://docs.google.com/spreadsheets/d/1zdB9eLXgudW5o_bJNpxPhrsTtEPeFJGiTns_FfgTjlk/edit#gid=132112818)
2) Rename the file to `export.csv`
3) Delete the "timestamp" and human readable "type" columns.  Reformat timestamps to "yyyy-mm-dd hh:mm:ss"
4) Run this import command in psql
```
\copy "public"."EventSamples"("startDate", "endDate", "eventId", "value", "category", "source","createdAt","updatedAt") FROM './export.csv' DELIMITER ',' CSV HEADER;
```
