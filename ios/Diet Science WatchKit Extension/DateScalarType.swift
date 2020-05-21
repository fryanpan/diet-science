//
//  DateScalarType.swift
//  Diet Science WatchKit Extension
//
//  Created by Bryan Chan on 5/20/20.
//  Copyright © 2020 Bryan Chan. All rights reserved.
//
// Used for handling custom scalar type in GraphQL schema for dates
// In the GraphQL API, dates are encoded as milliseconds since epoch
// Here in iOS, use a Date object

import Foundation
import Apollo

public typealias DateScalarType = Date

extension DateScalarType: JSONDecodable, JSONEncodable {
    public init(jsonValue value: JSONValue) throws {
        guard let timeInterval = value as? TimeInterval else {
            throw JSONDecodingError.couldNotConvert(value: value, to: String.self)
        }
        self = Date(timeIntervalSince1970: timeInterval / 1000);
    }
    
    public var jsonValue: JSONValue {
        return Int64(self.timeIntervalSince1970 * 1000);
    }
    
}
