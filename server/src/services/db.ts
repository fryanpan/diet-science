import path from 'path';
import { Sequelize } from 'sequelize-typescript';
const env = process.env.NODE_ENV || 'local';
const Config = require('../config/sequelize-config')[env]

console.log(`Environment: ${JSON.stringify(process.env, null, 2)}`);

const fileExtension = env == 'local' ? '.ts' : '.js';
const modelPath = path.join(__dirname, '..', '**', 'model' + fileExtension);
console.log(`Looking for models ${modelPath}`);

// Option 1: Passing parameters separately
const sequelize = new Sequelize({
        /** Database connection configuration */
        database: Config.database, 
        username: Config.username, 
        password: Config.password, 
        host: Config.host,
        port: Config.port,
        dialect: 'postgres',

        /** Load all the models */
        models: [modelPath]
    });


export = {
    sequelize: sequelize,
    Sequelize: Sequelize
}

console.log("YAY!");
sequelize
  .authenticate()
  .then(() => {
    console.log('SEQUELIZE: Connection has been established successfully.');
    console.log(sequelize.models);
  })
  .catch(err => {
    console.error('SEQUELIZE: Unable to connect to the database:', err);
  });