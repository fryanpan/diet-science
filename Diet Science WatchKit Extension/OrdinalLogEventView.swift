//
//  LogEventView.swift
//  Diet Science WatchKit Extension
//
//  Created by Bryan Chan on 5/6/20.
//  Copyright © 2020 Bryan Chan. All rights reserved.
//

import SwiftUI
import Foundation

struct OrdinalLogEventView: View {
    @Binding var index: Int;
    var label: String;
    var scale: OrdinalScale;
        
    init(index: Binding<Int>, label: String, scale: OrdinalScale) {
        self._index = index;
        self.label = label;
        self.scale = scale;
    }
    
    var body: some View {
        VStack {
            
            Text(self.label)
                .font(.system(size: 20))
            
            Picker(selection: $index, label: Text("")) {
                ForEach(self.scale.range, id: \.self) { item in
                    Text("\(item)").tag(item)
                }
            }.font(.system(size:20))
            .labelsHidden()
            .frame(height: 80, alignment: .top)
            
            Text(try! self.scale.getDescription(index))
                .font(.body)
                .frame(height: 40, alignment: .top)
        }
    }
}

struct LogEventView_Previews: PreviewProvider {
    static var previews: some View {
        OrdinalLogEventView(index: .constant(0), label: "Title", scale: MankowskiScale())
    }
}
