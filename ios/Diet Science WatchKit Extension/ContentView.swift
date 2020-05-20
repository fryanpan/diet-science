//
//  ContentView.swift
//  Diet Science WatchKit Extension
//
//  Created by Bryan Chan on 5/5/20.
//  Copyright © 2020 Bryan Chan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var sampleStore: EventSampleStore;

    @State var selection: String? = nil;
    
    init(sampleStore: EventSampleStore) {
        self.sampleStore = sampleStore;
        
        Network.shared.apollo.fetch(query: EventSampleListQuery()) { result in
          switch result {
          case .success(let graphQLResult):
            print("Success! Result: \(graphQLResult)")
            print("Event Samples: \(graphQLResult.data?.eventSamples)")
          case .failure(let error):
            print("Failure! Error: \(error)")
          }
        }
    }
        
    var body: some View {
        
        VStack(spacing: 5) {
            ForEach(Metadata.LoggingGroups, id: \.id) { loggingGroup in
                NavigationLink(destination: LogGroupView(loggingGroup,
                                                         sampleStore: self.sampleStore, rootSelection: self.$selection),
                               tag: loggingGroup.id,
                               selection: self.$selection) {
                        LoggingGroupRow(loggingGroup)
                    }
                    .navigationBarTitle("Log a Thing!")
                    .accentColor(.yellow)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(sampleStore: EventSampleStore())
    }
}
