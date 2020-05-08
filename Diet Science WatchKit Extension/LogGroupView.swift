//
//  EventLoggingView.swift
//  Diet Science WatchKit Extension
//
//  Created by Bryan Chan on 5/6/20.
//  Copyright © 2020 Bryan Chan. All rights reserved.
//

import SwiftUI

struct LogGroupView: View {
    @State var translation: CGFloat = 0;
    @State var index: Int = 0;
    @State var dataIndex: Int = 0;
    
    @State var eventData: [String: Int] = [:];
    
    var loggingGroup: LoggingGroup;
    var eventTypes: [EventType];
    
    init(_ loggingGroup: LoggingGroup) {
        self.loggingGroup = loggingGroup;
        self.eventTypes = loggingGroup.eventTypes;
    }
    
    var tap: some Gesture {
        TapGesture(count: 1)
            .onEnded { _ in
                if(self.index < self.eventTypes.count) {
                    // @TODO clean this up...responsibility is all messed up
                    
                    let eventType = self.eventTypes[self.index];
                    
                    self.eventData[eventType.id] = self.dataIndex + (eventType.scale as! OrdinalScale).min;
                    
                    self.index += 1;
                    self.dataIndex = 0;
                }
            }
    }
    
    func done() {
        print("All Done \(self.eventData)")
    }
    
    var body: some View {
        VStack {
            if index < eventTypes.count {
                OrdinalLogEventView(index: $dataIndex, label: eventTypes[index].name, scale: eventTypes[index].scale as! OrdinalScale)
                    .gesture(self.tap)
            } else {
                Button(action: self.done) {
                    Text("Save!")
                }.accentColor(.secondary)
            }
        }
    }
}

struct EventLoggingView_Previews: PreviewProvider {
    static var previews: some View {
        LogGroupView(Metadata.SensationLoggingGroup)
    }
}
