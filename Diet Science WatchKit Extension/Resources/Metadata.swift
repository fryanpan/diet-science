//
//  File.swift
//  Diet Science
//
//  Created by Bryan Chan on 5/6/20.
//  Copyright © 2020 Bryan Chan. All rights reserved.
//

struct Metadata {
    static let BrainFogEventType = EventType("brain_fog", "Brain Fog",
      OrdinalScale(0, 4, [
        "Fully present and thoughtful", // 0
        "Mild lack of focus", // 1
        "Lack of focus, can do concentrated tasks with effort", // 2
        "Cannot do concentrated tasks", // 3
      ]));

    static let NasalCongestionEventType = EventType("nasal_congestion", "Nasal Congestion",
        OrdinalScale(0, 5, [
            "No sensation, no obstruction", // 0
            "Barely noticeable obstruction", // 1
            "Noticeable obstruction, often crusty", // 2
            "Annoying obstruction, mild sinus pain", // 3
            "Annoying obstruction, strong sinus pain, hard to ignore", // 4
            "Pervasively annoying, hard to focus", // 5
        ]))

    static let DryEyesEventType = EventType("dry_eyes", "Dry or Irritated Eyes",
        OrdinalScale(0, 5, [
            "No irritation", // 0
            "Barely noticeable itch and dryness", // 1
            "Noticeable itch and dryness, puffiness", // 2
            "Annoying discomfort, distracting", // 3
            "Annoying discomfort, hard to ignore", // 4
            "Pervasively annoying, hard to focus", // 5
        ]))

    static let UrinationPainStartEventType = EventType("urination_pain_start", "Urination Pain (at start)", MankowskiScale());
    static let UrinationPainDuringEventType = EventType("urination_pain_during", "Urination Pain (during))", MankowskiScale());
    static let PoopEventType = EventType("poop", "Poop", BristolScale());

    static let SensationLoggingGroup = LoggingGroup("sensations", "Sensations", [
            BrainFogEventType,
            NasalCongestionEventType,
            DryEyesEventType,
        ]);

    static let BathroomLoggingGroup = LoggingGroup("toilet", "Used a Toilet", [
            UrinationPainStartEventType,
            UrinationPainDuringEventType,
            PoopEventType
        ]);
    
    
    static let LoggingGroups = [
        SensationLoggingGroup,
        BathroomLoggingGroup
    ]
}
