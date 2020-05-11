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
    @State var dataValue: Int = 0;
    
    @State var eventData: [EventSample] = [];
    
    @State var buttonLabel: String = "Save!";
    @State var startedSaving: Bool = false;
    
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
                    // Append a new event sample to the data array
                    let eventType = self.eventTypes[self.index];
                    self.eventData.append(EventSample(eventType.id, Date(), Date(), Double(self.dataValue)));
                    
                    // Select the next event type to log
                    self.selectIndex(self.index + 1)
                }
            }
    }
    
    private func selectIndex(_ index: Int) {
        self.index = index;
        if(self.index < self.eventTypes.count) {
            let nextScale = (self.eventTypes[self.index].scale as! OrdinalScale);
            self.dataValue = nextScale.defaultValue;
        }
    }
    
    func done() {
        if(self.startedSaving) {
            print("Already saving...");
            return;
        }
        self.startedSaving = true;
        
        print("About to save \(self.eventData)")
        self.buttonLabel = "Working...";
        sampleStore.saveSamples(self.eventData, self.loggingGroup)
            .then { _ in
                print("All Done \(self.eventData)");
                self.buttonLabel = "Done Saving!!";
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.rootSelection = nil;
                }
            }
    }
    
    var body: some View {
        VStack {
            if index < eventTypes.count {
                OrdinalLogEventView(value: $dataValue, label: eventTypes[index].name, scale: eventTypes[index].scale as! OrdinalScale)
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
