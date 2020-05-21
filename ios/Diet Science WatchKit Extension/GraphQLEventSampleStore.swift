//
//  GraphQLEventSampleStore.swift
//  Diet Science
//
//  Created by Bryan Chan on 5/20/20.
//  Copyright © 2020 Bryan Chan. All rights reserved.
//

import Foundation
import Promises

/**
    @class
 */
class GraphQLEventSampleStore: EventSampleStore {
    static let sourceId = "WatchOS App";
    
    // Saves a sample to a Google Spreadsheet
    // @TODO Make this more useful for someone else and remove my private URL...
    override func saveSamples(_ eventSamples: [EventSample], _ loggingGroup: LoggingGroup) -> Promise<Bool> {
        print("Saving samples to GraphQL endpoint");
        
        let eventSampleData = eventSamples.map { eventSample in
            return EventSampleInput(eventId: eventSample.eventId,
                                        startDate: eventSample.startDate,
                                        endDate: eventSample.endDate,
                                        value: eventSample.value!,
                                        category: loggingGroup.id,
                                        source: GraphQLEventSampleStore.sourceId);
        };
        
        return Promise<Bool> { fulfill, reject in
            Network.shared.apollo.perform(mutation: CreateEventSamplesMutation(events: eventSampleData)) { [weak self] result in
                guard let self = self else {
                  return
                }
                 switch result {
                     case .success(let graphQLResult):
                        if let createResult = graphQLResult.data {
                             // TODO
                            print("Done with result \(createResult)");
                            fulfill(true);
                        }
                        // Does not handle concurrently returned errors, yet
                        
                     case .failure(let error):
                        reject(error);
                 }
            }
        }
    }
}
