// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct EventSampleInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - eventId
  ///   - startDate
  ///   - endDate
  ///   - value
  public init(eventId: Swift.Optional<String?> = nil, startDate: Swift.Optional<DateScalarType?> = nil, endDate: Swift.Optional<DateScalarType?> = nil, value: Swift.Optional<Double?> = nil) {
    graphQLMap = ["eventId": eventId, "startDate": startDate, "endDate": endDate, "value": value]
  }

  public var eventId: Swift.Optional<String?> {
    get {
      return graphQLMap["eventId"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eventId")
    }
  }

  public var startDate: Swift.Optional<DateScalarType?> {
    get {
      return graphQLMap["startDate"] as? Swift.Optional<DateScalarType?> ?? Swift.Optional<DateScalarType?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "startDate")
    }
  }

  public var endDate: Swift.Optional<DateScalarType?> {
    get {
      return graphQLMap["endDate"] as? Swift.Optional<DateScalarType?> ?? Swift.Optional<DateScalarType?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "endDate")
    }
  }

  public var value: Swift.Optional<Double?> {
    get {
      return graphQLMap["value"] as? Swift.Optional<Double?> ?? Swift.Optional<Double?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "value")
    }
  }
}

public final class CreateEventSamplesMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateEventSamples($events: [EventSampleInput]) {
      createEventSamples(input: $events) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "CreateEventSamples"

  public var events: [EventSampleInput?]?

  public init(events: [EventSampleInput?]? = nil) {
    self.events = events
  }

  public var variables: GraphQLMap? {
    return ["events": events]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("createEventSamples", arguments: ["input": GraphQLVariable("events")], type: .nonNull(.list(.object(CreateEventSample.selections)))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createEventSamples: [CreateEventSample?]) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createEventSamples": createEventSamples.map { (value: CreateEventSample?) -> ResultMap? in value.flatMap { (value: CreateEventSample) -> ResultMap in value.resultMap } }])
    }

    public var createEventSamples: [CreateEventSample?] {
      get {
        return (resultMap["createEventSamples"] as! [ResultMap?]).map { (value: ResultMap?) -> CreateEventSample? in value.flatMap { (value: ResultMap) -> CreateEventSample in CreateEventSample(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.map { (value: CreateEventSample?) -> ResultMap? in value.flatMap { (value: CreateEventSample) -> ResultMap in value.resultMap } }, forKey: "createEventSamples")
      }
    }

    public struct CreateEventSample: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["EventSample"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .scalar(GraphQLID.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil) {
        self.init(unsafeResultMap: ["__typename": "EventSample", "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID? {
        get {
          return resultMap["id"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}

public final class EventSampleListQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query EventSampleList {
      eventSamples {
        __typename
        eventId
        startDate
        endDate
        value
      }
    }
    """

  public let operationName: String = "EventSampleList"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("eventSamples", type: .list(.object(EventSample.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(eventSamples: [EventSample?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "eventSamples": eventSamples.flatMap { (value: [EventSample?]) -> [ResultMap?] in value.map { (value: EventSample?) -> ResultMap? in value.flatMap { (value: EventSample) -> ResultMap in value.resultMap } } }])
    }

    public var eventSamples: [EventSample?]? {
      get {
        return (resultMap["eventSamples"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [EventSample?] in value.map { (value: ResultMap?) -> EventSample? in value.flatMap { (value: ResultMap) -> EventSample in EventSample(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [EventSample?]) -> [ResultMap?] in value.map { (value: EventSample?) -> ResultMap? in value.flatMap { (value: EventSample) -> ResultMap in value.resultMap } } }, forKey: "eventSamples")
      }
    }

    public struct EventSample: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["EventSample"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("eventId", type: .scalar(String.self)),
        GraphQLField("startDate", type: .scalar(DateScalarType.self)),
        GraphQLField("endDate", type: .scalar(DateScalarType.self)),
        GraphQLField("value", type: .scalar(Double.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(eventId: String? = nil, startDate: DateScalarType? = nil, endDate: DateScalarType? = nil, value: Double? = nil) {
        self.init(unsafeResultMap: ["__typename": "EventSample", "eventId": eventId, "startDate": startDate, "endDate": endDate, "value": value])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var eventId: String? {
        get {
          return resultMap["eventId"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "eventId")
        }
      }

      public var startDate: DateScalarType? {
        get {
          return resultMap["startDate"] as? DateScalarType
        }
        set {
          resultMap.updateValue(newValue, forKey: "startDate")
        }
      }

      public var endDate: DateScalarType? {
        get {
          return resultMap["endDate"] as? DateScalarType
        }
        set {
          resultMap.updateValue(newValue, forKey: "endDate")
        }
      }

      public var value: Double? {
        get {
          return resultMap["value"] as? Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "value")
        }
      }
    }
  }
}
