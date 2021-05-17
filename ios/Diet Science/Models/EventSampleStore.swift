//
//  SampleStore.swift
//  Diet Science
//
//  Created by Bryan Chan on 5/8/20.
//  Copyright © 2020 Bryan Chan. All rights reserved.
//

import Foundation
import Promises

/**
 @class EventSampleStore An abstract class describing a way to write (and eventually perhaps read) event samples
 */
class EventSampleStore: ObservableObject {
    func saveSamples(_ eventSamples: [EventSample], _ loggingGroup: LoggingGroup) -> Promise<Bool> {
        // Implement this please!
        return Promise(true);
    }
}

/** Promise-based extension to URLSession https://theswiftdev.com/promises-in-swift-for-beginners/ */
extension URLSession {

    enum HTTPError: LocalizedError {
        case invalidResponse
        case invalidStatusCode
        case noData
    }

    func dataTask(request: URLRequest) -> Promise<Data> {
        return Promise<Data> { fulfill, reject in
            self.dataTask(with: request) { data, response, error in
                print("Encountered an error! \(String(describing: error))");
                if let error = error {
                    reject(error)
                    return
                }
                guard let response = response as? HTTPURLResponse else {
                    reject(HTTPError.invalidResponse)
                    return
                }
                print("Status Code \(response.statusCode)");
                guard response.statusCode >= 200 && response.statusCode < 300 else {
                    reject(HTTPError.invalidStatusCode)
                    return
                }
                guard let data = data else {
                    reject(HTTPError.noData)
                    return
                }
                fulfill(data)
            }.resume()
        }
    }
}

/**
    @class
 */
class GoogleSpreadsheetSampleStore: EventSampleStore {
    static let sourceId = "WatchOS App: GSS";
    private var baseUrl = Bundle.main.object(forInfoDictionaryKey: "Spreadsheet URL") as! String
    
//    private var baseUrl = "https://postb.in/1589077042215-1724203887861?"
    
    // Map to the legacy values for now
    // @TODO fix this stuff
    private var KEY_MAP = [
        "bloating" : "Bloating",
        "sore_throat": "Sore throat",
        "pain_under_sternum": "Pain under sternum",
        "itchy_groin": "Itchy groin",
        "itchy_scalp": "Itchy scalp",
        "brain_fog": "Brain fog",
        "itch_other": "Itch - other",
        "fatigue": "Fatigue",
        "dry_eyes": "Dry / irritated eyes",
        "gas": "Gas",
        "nasal_congestion": "Nasal congestion",
        "headache": "Headache",
        "rash": "Rash",
        "ear_congestion": "Ear Congestion",
        
        "urination_pain_start": "Urination Pain at Start",
        "urination_pain_during": "Urination Pain During",
        "poop": "Poop Type",
        
        "knee_pain_right": "Knee Pain Right",
        "plantar_fascia_pain_left": "Plantar Fascia Pain Left",
        "plantar_fascia_pain_right": "Plantar Fascia Pain Right",
    ]
        
    // Sample code from https://stackoverflow.com/questions/27723912/swift-get-request-with-parameters
    
    // Saves a sample to a Google Spreadsheet
    // @TODO Make this more useful for someone else and remove my private URL...
    override func saveSamples(_ eventSamples: [EventSample], _ loggingGroup: LoggingGroup) -> Promise<Bool> {
        print("Saving to Google Spreadsheet");
        
        var components = URLComponents(string: baseUrl)!
        
        var queryItems: [URLQueryItem] = [];
        for eventSample in eventSamples {
            let key = KEY_MAP[eventSample.eventId]!;
            queryItems.append(URLQueryItem(name: key, value: String(eventSample.value!)));
        }
        queryItems.append(URLQueryItem(name: "category", value: loggingGroup.id));
        queryItems.append(URLQueryItem(name: "source", value: GoogleSpreadsheetSampleStore.sourceId));

        components.queryItems = queryItems;
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        print("Calling URL: \(components.url!)");
        
        var request = URLRequest(url: components.url!);
        request.httpMethod = "POST";

        return URLSession.shared.dataTask(request: request)
            .then { data in
                print("Success with data \(data)")
            }
            .catch(on: .main) { error in
                print("HTTP request failed \(error.localizedDescription)")
            }.then {
                return true;
            }
    }
}

class MultiSampleStore: EventSampleStore {
    private var sampleStores: [EventSampleStore];
    
    init(_ sampleStores: [EventSampleStore]) {
        self.sampleStores = sampleStores
    }
    
    override func saveSamples(_ eventSamples: [EventSample], _ loggingGroup: LoggingGroup) -> Promise<Bool> {
        return all(self.sampleStores.map { store in
                return store.saveSamples(eventSamples, loggingGroup);
            })
            .then { results in
                print("Results \(results)");
                
                return Promise(true);
            }
    }
}

