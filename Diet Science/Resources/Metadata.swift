//
//  File.swift
//  Diet Science
//
//  Created by Bryan Chan on 5/6/20.
//  Copyright © 2020 Bryan Chan. All rights reserved.
//

struct Metadata {
    static let BrainFogEventType = EventType("brain_fog", "🧠 Fog",
      try! OrdinalScale(0, 3, [
        "Fully present and thoughtful", // 0
        "Mild lack of focus", // 1
        "Lack of focus, can concentrate with effort", // 2
        "Cannot do concentrated tasks", // 3
      ]));

    static let NasalCongestionEventType = EventType("nasal_congestion", "👃 Congestion",
        try! OrdinalScale(0, 5, [
            "No sensation, no obstruction", // 0
            "Barely noticeable obstruction", // 1
            "Noticeable obstruction, often crusty", // 2
            "Annoying obstruction, mild sinus pain", // 3
            "Annoying obstruction, hard to ignore", // 4
            "Pervasively annoying, hard to focus", // 5
        ]))

    static let DryEyesEventType = EventType("dry_eyes", "Irritated 👀",
        try! OrdinalScale(0, 5, [
            "No irritation", // 0
            "Barely noticeable itch and dryness", // 1
            "Noticeable itch and dryness, puffiness", // 2
            "Annoying discomfort, distracting", // 3
            "Annoying discomfort, hard to ignore", // 4
            "Pervasively annoying, hard to focus", // 5
        ]))
    
    static let GasEventType = EventType("gas", "Gas", MankowskiScale())
    
    static let BloatingEventType = EventType("bloating", "Bloating", MankowskiScale())
    
    static let ItchyScalpEventType = EventType("itchy_scalp", "Itchy 🤯", MankowskiScale());
    static let ItchyGroinEventType = EventType("itchy_groin", "Itchy Groin", MankowskiScale());
    static let ItchOtherEventType = EventType("itch_other", "Itch - Other", MankowskiScale());
    
    static let FatigueEventType = EventType("fatigue", "Fatigue", KarolinskaScale())
    
    static let HeadacheEventType = EventType("headache", "Headache", MankowskiScale())

    static let SoreThroatEventType = EventType("sore_throat", "Sore Throat", MankowskiScale())

    static let PainUnderSternumEventType = EventType("pain_under_sternum", "Pain under Sternum", MankowskiScale())

    static let StomachRashEventType = EventType("stomach_rash", "Stomach Rash", MankowskiScale())



    static let UrinationPainStartEventType = EventType("urination_pain_start", "Pee Pain (start)", MankowskiScale());
    static let UrinationPainDuringEventType = EventType("urination_pain_during", "Pee Pain (during)", MankowskiScale());
    static let PoopEventType = EventType("poop", "💩", BristolScale());

    static let SensationLoggingGroup = LoggingGroup("sensations", "Sensations", [
            BrainFogEventType,
            NasalCongestionEventType,
            DryEyesEventType,
            GasEventType,
            BloatingEventType,
            ItchyScalpEventType,
            ItchyGroinEventType,
            ItchOtherEventType,
            FatigueEventType,
            HeadacheEventType,
            SoreThroatEventType,
            PainUnderSternumEventType,
            StomachRashEventType
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
