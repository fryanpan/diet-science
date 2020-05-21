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
  ///   - category
  ///   - source
  public init(eventId: String, startDate: DateScalarType, endDate: DateScalarType, value: Double, category: Swift.Optional<String?> = nil, source: Swift.Optional<String?> = nil) {
    graphQLMap = ["eventId": eventId, "startDate": startDate, "endDate": endDate, "value": value, "category": category, "source": source]
  }

  public var eventId: String {
    get {
      return graphQLMap["eventId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "eventId")
    }
  }

  public var startDate: DateScalarType {
    get {
      return graphQLMap["startDate"] as! DateScalarType
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "startDate")
    }
  }

  public var endDate: DateScalarType {
    get {
      return graphQLMap["endDate"] as! DateScalarType
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "endDate")
    }
  }

  public var value: Double {
    get {
      return graphQLMap["value"] as! Double
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "value")
    }
  }

  public var category: Swift.Optional<String?> {
    get {
      return graphQLMap["category"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "category")
    }
  }

  public var source: Swift.Optional<String?> {
    get {
      return graphQLMap["source"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "source")
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
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
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

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
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
        GraphQLField("eventId", type: .nonNull(.scalar(String.self))),
        GraphQLField("startDate", type: .nonNull(.scalar(DateScalarType.self))),
        GraphQLField("endDate", type: .nonNull(.scalar(DateScalarType.self))),
        GraphQLField("value", type: .nonNull(.scalar(Double.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(eventId: String, startDate: DateScalarType, endDate: DateScalarType, value: Double) {
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

      public var eventId: String {
        get {
          return resultMap["eventId"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "eventId")
        }
      }

      public var startDate: DateScalarType {
        get {
          return resultMap["startDate"]! as! DateScalarType
        }
        set {
          resultMap.updateValue(newValue, forKey: "startDate")
        }
      }

      public var endDate: DateScalarType {
        get {
          return resultMap["endDate"]! as! DateScalarType
        }
        set {
          resultMap.updateValue(newValue, forKey: "endDate")
        }
      }

      public var value: Double {
        get {
          return resultMap["value"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "value")
        }
      }
    }
  }
}
