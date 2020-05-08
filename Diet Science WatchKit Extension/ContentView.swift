//
//  ContentView.swift
//  Diet Science WatchKit Extension
//
//  Created by Bryan Chan on 5/5/20.
//  Copyright © 2020 Bryan Chan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack(spacing: 20) {
            ForEach(Metadata.LoggingGroups, id: \.id) { loggingGroup in
                NavigationLink(destination: LogGroupView(loggingGroup)) {
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
        ContentView()
    }
}
