//
//  EventType.swift
//  Diet Science
//
//  Created by Bryan Chan on 5/6/20.
//  Copyright © 2020 Bryan Chan. All rights reserved.
//

/**
    @class         EventType
    @abstract      An class representing a type of event to be logged
*/
struct EventType {
    var id: String;
    var name: String;
    var scale: Scale;
    
    // Whether the event represents a point event in time (possibly with a duration)
    // Or if it represents a sampled value of a continuous function over time
    var pointSampled: Bool;
    
    init(_ id: String, _ name: String, _ scale: Scale, pointSampled: Bool = false) {
        self.id = id;
        self.name = name;
        self.scale = scale;
        self.pointSampled = pointSampled;
    }
}


