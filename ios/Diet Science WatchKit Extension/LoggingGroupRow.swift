//
//  File.swift
//  Diet Science
//
//  Created by Bryan Chan on 5/6/20.
//  Copyright © 2020 Bryan Chan. All rights reserved.
//

import SwiftUI

struct LoggingGroupRow: View {
    var loggingGroup: LoggingGroup;
   
    init(_ loggingGroup: LoggingGroup) {
        self.loggingGroup = loggingGroup;
    }
    
    var body: some View {
        HStack {
            Text("\(loggingGroup.name) (\(loggingGroup.eventTypes.count))") .font(.body)
        }
        
    }
}

struct LoggingGroupRow_Previews: PreviewProvider {
    static var previews: some View {
        LoggingGroupRow(Metadata.SensationLoggingGroup)
    }
}
