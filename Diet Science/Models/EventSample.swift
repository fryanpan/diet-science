//
//  EventSample.swift
//  Diet Science
//
//  Created by Bryan Chan on 5/7/20.
//  Copyright © 2020 Bryan Chan. All rights reserved.
//

import Foundation

/**
    @class         EventSample
    @abstract      An class representing a logged sample for a particular event
*/
class EventSample: ObservableObject {
    // Refers to the EventType that this is a sample for
    @Published var eventId: String;
    
    // The start date
    @Published var startDate: Date;
    
    // The end date (may be the same as start date if this is a point in time rather than a period)
    @Published var endDate: Date;
    
    // The value of the sample
    @Published var value: Double?;
    
    init(_ eventId: String, _ startDate: Date, _ endDate: Date, _ value: Double? = nil) {
        self.eventId = eventId;
        self.startDate = startDate;
        self.endDate = endDate;
        self.value = value;
    }
}
