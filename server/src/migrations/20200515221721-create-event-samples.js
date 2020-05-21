'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.createTable('EventSamples', {
      // default id field, autoincrementing
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },

      eventId: Sequelize.STRING,
      startDate: Sequelize.DATE,
      endDate: Sequelize.DATE,
      value: Sequelize.DOUBLE,
      category: Sequelize.STRING,
      source: Sequelize.STRING,

      // default createdAt, updatedAt fields
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
          allowNull: false,
          type: Sequelize.DATE
      }
    })
  },

  down: (queryInterface, Sequelize) => {
    return queryInterface.dropTable('EventSamples');
  }
};
