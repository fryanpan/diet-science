//
//  Scale.swift
//  Diet Science
//
//  Created by Bryan Chan on 5/6/20.
//  Copyright © 2020 Bryan Chan. All rights reserved.
//

class Scale {
    
}

enum OrdinalScaleError: Error {
    case invalidDescriptionsLength(_ expectedCount: Int, _ actualCount: Int) // invalid description length
    case rangeError // invalid index when looking up a description
    case missingDescriptionsError
}

// A scale with an ordered list of options
// e.g. 0-10
// e.g.
class OrdinalScale: Scale {
    var min, max, defaultValue: Int;
    private var descriptions: [String]?;
    
    /**
            
     */
    init(_ min: Int, _ max: Int, _ descriptions: [String]?, _ defaultValue: Int? = nil) throws {
        self.min = min;
        self.max = max;
        self.defaultValue = defaultValue ?? min;
        self.descriptions = descriptions;
        
        let expectedCount = max - min + 1;
        if(descriptions != nil && descriptions!.count != expectedCount) {
            throw OrdinalScaleError.invalidDescriptionsLength(expectedCount, descriptions!.count)
        }
    }
    
    var range: Range<Int> {
        get {
            return Range(uncheckedBounds: (lower: min, upper: max + 1))
        }
    }
    
    var hasDescriptions: Bool {
        get {
            return descriptions != nil;
        }
    }
    
    func getDescription(_ index: Int) throws -> String {
        if(descriptions == nil) {
            throw OrdinalScaleError.missingDescriptionsError;
        }
        
        if(index > descriptions!.count - 1) {
            throw OrdinalScaleError.rangeError;
        }
        
        return descriptions![index];
    }
    
}

// @TODO Consider more continuous quantitative scales as well
// @TODO Add a CategoryScale when needed

/** From pain scales
    https://www.verywellhealth.com/pain-scales-assessment-tools-4020329
*/
class MankowskiScale: OrdinalScale {
    init() {
        try! super.init(0, 10, [
            "No sensation", // 0
            "Very minor annoyance, some minor twinges", // 1
            "Minor annoyance, some strong twinges", // 2
            "Annoying enough to be distracting", // 3
            "Distracting, can be ignored with focus", // 4
            "Can't be ignored for more than 30 minutes", // 5
            "Can't be ignored for any length of time", // 6
            "Makes concentrating hard, interferes with sleep", // 7
            "Severely limits activity", // 8
            "Unable to speak, near delirium", // 9
            "Unconscious", // 10
        ]);
    }
}

/** Sleepiness scale
 https://www.interdynamics.com/fatigue-risk-management-solutions/karolinska-sleepiness-scale/
*/
class KarolinskaScale: OrdinalScale {
    init() {
        try! super.init(1, 9, [
            "Extremely alert", // 1
            "Very alert", // 2
            "Alert", // 3 (normal level)
            "Rather alert", // 4
            "Neither alert nor sleepy", // 5
            "Some signs of sleepiness", // 6
            "Sleepy, easy to stay awake", // 7
            "Sleepy, effort to stay awake", // 8
            "Extremely sleepy, fighting sleep", // 9
        ], 3);
    }
}

/**
    @class BristolScale An ordinal scale used to rate the types of stool
    https://en.wikipedia.org/wiki/Bristol_stool_scale
    
    @TODO Add support for images?
*/
class BristolScale: OrdinalScale {
    init() {
        try! super.init(1, 7, [
            "Separate hard lumps, like nut", // 1
            "Sausage-shaped, lumpy",
            "Sausage-like, with cracks on surface",
            "Sausage or snake, smooth and soft", // 4
            "Soft blobs with clear cut edges",
            "Fluffy pcs, ragged edges, diarrhoea",
            "Entirely liquid diarrhoea", // 7
        ]);
    }
}
