//
//  LoggingGroup.swift
//  Diet Science
//
//  Created by Bryan Chan on 5/6/20.
//  Copyright © 2020 Bryan Chan. All rights reserved.
//

/*
 @class LoggingGroup Represents a group of event types to log together and how to log them
 
*/
class LoggingGroup {
    // Unique string idenfitier
    public var id: String;
    
    // String description for display
    public var name: String;
    
    // Event types to log
    public var eventTypes: [EventType];
    
    init(_ id: String, _ name: String, _ eventTypes: [EventType]) {
        self.id = id;
        self.name = name;
        self.eventTypes = eventTypes;
    }
}
