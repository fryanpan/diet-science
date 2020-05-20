//
//  Network.swift
//  Diet Science WatchKit Extension
//
// Apollo GraphQL Sample code from:
// https://www.apollographql.com/docs/ios/initialization/#basic-client-creation
//

import Foundation
import Apollo


class Network {
  static let shared = Network()
    static private let baseUrl = Bundle.main.object(forInfoDictionaryKey: "API Base URL") as! String
    
    private(set) lazy var apollo = ApolloClient(url: URL(string: Network.baseUrl)!)
}
