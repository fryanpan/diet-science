//
//  EventLoggingView.swift
//  Diet Science WatchKit Extension
//
//  Created by Bryan Chan on 5/6/20.
//  Copyright © 2020 Bryan Chan. All rights reserved.
//

import SwiftUI

struct LogGroupView: View {
    var loggingGroup: LoggingGroup;
    
    init(_ loggingGroup: LoggingGroup) {
        self.loggingGroup = loggingGroup;
    }
    
    var body: some View {
        VStack {
            Text("Log \(loggingGroup.name)")
                .font(.body)
            
            ForEach(loggingGroup.eventTypes, id: \.id) { eventType in
                Text(eventType.name)
                    .font(.headline)
                

            }
        }
    }
}

struct EventLoggingView_Previews: PreviewProvider {
    static var previews: some View {
        LogGroupView(Metadata.SensationLoggingGroup)
    }
}
