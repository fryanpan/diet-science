import { Table, Column, Model } from 'sequelize-typescript';
import { DataTypes } from 'sequelize';
import { samples } from './data';

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
    return EventSample.findAll({ raw: true })
  }

  static async create(data: any) {
    console.log(`Creating event sample ${JSON.stringify(data)}`);
    return EventSample.create(data)
      .then(result => {
        console.log(result);
        return result;
      })
  }

  static async update(id: number, data: any) {
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

