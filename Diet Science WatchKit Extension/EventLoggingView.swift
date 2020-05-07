//
//  EventLoggingView.swift
//  Diet Science WatchKit Extension
//
//  Created by Bryan Chan on 5/6/20.
//  Copyright © 2020 Bryan Chan. All rights reserved.
//

import SwiftUI

struct EventLoggingView: View {
    var loggingGroup: LoggingGroup;
    
    init(_ loggingGroup: LoggingGroup) {
        self.loggingGroup = loggingGroup;
    }
    
    var body: some View {
        VStack {
            Text(loggingGroup.name)
                .font(.system(size: 20))
            
            ForEach(loggingGroup.eventTypes, id: \.id) { eventType in
                Text(eventType.name)
            }
        }
    }
}

struct EventLoggingView_Previews: PreviewProvider {
    static var previews: some View {
        EventLoggingView(Metadata.SensationLoggingGroup)
    }
}
