//
//  CircleImage.swift
//  Diet Science
//
//  Created by Bryan Chan on 5/6/20.
//  Copyright © 2020 Bryan Chan. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var imageName: String;
    var size: CGFloat;
    var bundle: Bundle?;
    
    /// Creates a labeled image usable as content for controls.
    ///
    /// - Parameters:
    ///     - name: the name of the image resource to lookup, as well as
    ///       the localization key with which to label the image.
    ///
    ///     - bundle: the bundle to search for the image resource and
    ///       localization content. If `nil`, uses the main `Bundle`.
    ///       Defaults to `nil`.
    public init(_ name: String, _ size: CGFloat = 100, bundle: Bundle? = nil) {
        imageName = name;
        self.size = size;
        self.bundle = bundle;
    }
    
    var body: some View {
        VStack {
            Image(imageName, bundle: bundle)
                .frame(width: self.size, height: self.size)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                .shadow(color: .gray, radius: 2, x: 2, y: 2)
        }
        
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage("Umbrella")
    }
}
