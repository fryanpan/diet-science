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
    
    @State var eventData: [Int: EventSample] = [:];
    
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
        self.selectIndex(0);
    }
    
    var tap: some Gesture {
        TapGesture(count: 1)
            .onEnded { _ in
                if(self.index < self.eventTypes.count) {
                    self.next()
                }
            }
    }
    
    /** Saves data from the current index */
    private func saveData() {
        // Append a new event sample to the data array
        let eventType = self.eventTypes[self.index]
        self.eventData[self.index] = EventSample(eventType.id, Date(), Date(), Double(self.dataValue))
    }

    func next() {
        self.saveData()
        self.selectIndex(self.index + 1)
    }

    func previous() {
        self.saveData()
        self.selectIndex(self.index - 1)
    }

    func skip() {
        self.selectIndex(self.index + 1)
    }
    
    private func selectIndex(_ index: Int) {
        self.index = index;
        
        if(self.index < self.eventTypes.count) {
            if self.eventData[self.index] != nil {
                // Use existing value, if it's been set
                self.dataValue = Int(self.eventData[self.index]!.value!);
            } else {
                // Otherwise use default
                let nextScale = (self.eventTypes[self.index].scale as! OrdinalScale);
                self.dataValue = nextScale.defaultValue;
            }
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
        sampleStore.saveSamples(Array(self.eventData.values), self.loggingGroup)
            .then { _ in
                self.buttonLabel = "Done Saving!!";
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.rootSelection = nil;
                }
            }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            if index < eventTypes.count {
                OrdinalLogEventView(value: $dataValue, label: eventTypes[index].name, scale: eventTypes[index].scale as! OrdinalScale)
                    .gesture(self.tap)
                
                HStack(spacing: 0) {
                    if index > 0 {
                        Button(action: self.previous ) {
                            Image(systemName: "chevron.left.circle.fill")
                        }.frame(width: 55)
                    }
                    Spacer()

                    if eventTypes[index].optional {
                        Button(action: self.skip) {
                            Image(systemName: "x.circle.fill")
                        }.frame(width: 50)
                    }
                    Spacer()

                    Button(action: self.next) {
                        Image(systemName: "chevron.right.circle.fill")
                    }.frame(width: 55)
                }
            } else {
                VStack {
                    Spacer()
                    Button(action: self.done) {
                        Text(buttonLabel)
                    }.accentColor(.secondary)
                    
                    Spacer()
                    HStack {
                        Button(action: self.previous) {
                            Image(systemName: "chevron.left.circle.fill")
                        }.frame(width: 55)
                        
                        Spacer()
                    }
                }
            }
        }
    }
}

struct EventLoggingView_Previews: PreviewProvider {
    static var previews: some View {
        LogGroupView(Metadata.BathroomLoggingGroup, sampleStore: EventSampleStore(), rootSelection: .constant(nil))
    }
}
