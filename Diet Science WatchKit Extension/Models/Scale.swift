//
//  Scale.swift
//  Diet Science
//
//  Created by Bryan Chan on 5/6/20.
//  Copyright © 2020 Bryan Chan. All rights reserved.
//

class Scale {
}

// A scale with an ordered list of options
// e.g. 0-10
// e.g.
class OrdinalScale: Scale {
    var min, max: Int;
    var descriptions: [String]?;
    
    /**
            
     */
    init(_ min: Int, _ max: Int, _ descriptions: [String]?) {
        self.min = min;
        self.max = max;
        self.descriptions = descriptions;
    }
    
}

// @TODO Consider more continuous quantitative scales as well
// @TODO Add a CategoryScale when needed

/** From pain scales
    https://www.verywellhealth.com/pain-scales-assessment-tools-4020329
*/
class MankowskiScale: OrdinalScale {
    init() {
        super.init(0, 10, [
            "No sensation", // 0
            "Very minor annoyance, occasional minor twinges", // 1
            "Minor annoyance, occasional strong twinges", // 2
            "Annoying enough to be distracting", // 3
            "Distracting, can be ignored with focus", // 4
            "Can't be ignored for more than 30 minutes", // 5
            "Can't be ignored for any length of time", // 6
            "Makes it hard to concentrate, interferes with sleep", // 7
            "Severely limits activity", // 8
            "Unable to speak, near delirium", // 9
            "Unconscious", // 10
        ]);
    }
}

/**
    @class BristolScale An ordinal scale used to rate the types of stool
    https://en.wikipedia.org/wiki/Bristol_stool_scale
    
    @TODO Add support for images?
*/
class BristolScale: OrdinalScale {
    init() {
        super.init(1, 7, [
            "Type 1: Separate hard lumps, like nut",
            "Type 2: Sausage-shaped, but lumpy",
            "Type 3: Like a sausage but with cracks on its surface",
            "Type 4: Like a sausage or snake, smooth and soft (average stool)",
            "Type 5: Soft blobs with clear cut edges",
            "Type 6: Fluffy pieces with ragged edges, a mushy stool (diarrhoea)",
            "Type 7: Watery, no solid pieces, entirely liquid (diarrhoea)",
        ]);
    }
}
