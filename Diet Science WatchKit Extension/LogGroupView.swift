//
//  EventLoggingView.swift
//  Diet Science WatchKit Extension
//
//  Created by Bryan Chan on 5/6/20.
//  Copyright © 2020 Bryan Chan. All rights reserved.
//

import SwiftUI

struct LogGroupView: View {
    @Binding var rootSelection: String?;
    
    @State var translation: CGFloat = 0;
    @State var index: Int = 0;
    @State var dataIndex: Int = 0;
    
    @State var eventData: [EventSample] = [];
    
    @State var buttonLabel: String = "Save!";
    
    var loggingGroup: LoggingGroup;
    var eventTypes: [EventType];
    var sampleStore: EventSampleStore;
    
    init(_ loggingGroup: LoggingGroup, sampleStore: EventSampleStore, rootSelection: Binding<String?>) {
        self._rootSelection = rootSelection;
        self.loggingGroup = loggingGroup;
        self.eventTypes = loggingGroup.eventTypes;
        self.sampleStore = sampleStore;
    }
    
    var tap: some Gesture {
        TapGesture(count: 1)
            .onEnded { _ in
                if(self.index < self.eventTypes.count) {
                    // @TODO clean this up...responsibility is all messed up
                    
                    let eventType = self.eventTypes[self.index];
                    
                    // Append a new event sample to the data array
                    let scale = (eventType.scale as! OrdinalScale)
                    let min = scale.min;
                    self.eventData.append(EventSample(eventType.id, Date(), Date(), Double(self.dataIndex + min)));
                    
                    self.index += 1;
                    self.dataIndex = scale.defaultValue - scale.min;
                }
            }
    }
    
    func done() {
        print("About to save \(self.eventData)")
        sampleStore.saveSamples(self.eventData)
            .then { _ in
                print("All Done \(self.eventData)");
                
                self.buttonLabel = "Done Saving!!";
                self.rootSelection = nil;
            }
    }
    
    var body: some View {
        VStack {
            if index < eventTypes.count {
                OrdinalLogEventView(index: $dataIndex, label: eventTypes[index].name, scale: eventTypes[index].scale as! OrdinalScale)
                    .gesture(self.tap)
            } else {
                Button(action: self.done) {
                    Text(buttonLabel)
                }.accentColor(.secondary)
            }
        }
    }
}

struct EventLoggingView_Previews: PreviewProvider {
    static var previews: some View {
        LogGroupView(Metadata.SensationLoggingGroup, sampleStore: EventSampleStore(), rootSelection: .constant(nil))
    }
}
