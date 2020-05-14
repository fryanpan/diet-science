//
//  HostingController.swift
//  Diet Science WatchKit Extension
//
//  Created by Bryan Chan on 5/5/20.
//  Copyright © 2020 Bryan Chan. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI

class HostingController:
    WKHostingController<ContentView> {

    var sampleStore: EventSampleStore = GoogleSpreadsheetSampleStore()

    override var body: ContentView {
        return ContentView(sampleStore: sampleStore)
    }
}
