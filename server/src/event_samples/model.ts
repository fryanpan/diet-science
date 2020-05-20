import { Table, Column, Model } from 'sequelize-typescript';
import { DataTypes } from 'sequelize';
import { samples } from './data';
import { EventSampleInput } from './typeDef';

// Note use of definite assignment assertion for each property
// As suggested by this page:
// https://www.ryadel.com/en/ts2564-ts-property-has-no-initializer-typescript-error-fix-visual-studio-2017-vs2017/

@Table
export default class EventSample extends Model<EventSample> {
 
  @Column
  eventId!: string;
 
  @Column
  startDate!: Date;

  @Column
  endDate!: Date;

  @Column({ type: DataTypes.DOUBLE })
  value!: number;
}

export class EventSampleDAO {
  static async all() {
    console.log("Fetching all events");
    return EventSample.findAll({ raw: true })
  }

  static async create(data: [EventSampleInput]) {
    console.log(`Creating event sample ${JSON.stringify(data)}`);
    return EventSample.bulkCreate(data);
  }

  static async update(id: number, data: EventSampleInput) {
    console.log(`Updating event sample ${JSON.stringify(data)} for id: ${id}`);

    return EventSample.findByPk(id)
      .then(async eventSample => {
        if(eventSample) {
          return await eventSample.update(data);
        } {
            return null;
        }
      })
  }

}

