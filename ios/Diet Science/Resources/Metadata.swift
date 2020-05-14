//
//  File.swift
//  Diet Science
//
//  Created by Bryan Chan on 5/6/20.
//  Copyright © 2020 Bryan Chan. All rights reserved.
//

struct Metadata {
    static let BrainFogEventType = EventType("brain_fog", "Brain Fog 🧠",
      try! OrdinalScale(0, 3, [
        "Fully present and thoughtful", // 0
        "Mild lack of focus", // 1
        "Lack of focus, can concentrate with effort", // 2
        "Cannot do concentrated tasks", // 3
      ]));

    static let NasalCongestionEventType = EventType("nasal_congestion", "Nasal Congestion",
        try! OrdinalScale(0, 5, [
            "No sensation, no obstruction", // 0
            "Barely noticeable obstruction", // 1
            "Noticeable obstruction, often crusty", // 2
            "Annoying obstruction, mild sinus pain", // 3
            "Annoying obstruction, hard to ignore", // 4
            "Pervasively annoying, hard to focus", // 5
        ]))

    static let DryEyesEventType = EventType("dry_eyes", "Irritated Eyes 👀",
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
    
    static let ItchyScalpEventType = EventType("itchy_scalp", "Itchy Scalp", MankowskiScale());
    static let ItchyGroinEventType = EventType("itchy_groin", "Itchy Groin", MankowskiScale());
    static let ItchOtherEventType = EventType("itch_other", "Itch - Other", MankowskiScale());
    
    static let FatigueEventType = EventType("fatigue", "Fatigue", KarolinskaScale())
    
    static let HeadacheEventType = EventType("headache", "Headache 🤕", MankowskiScale())

    static let SoreThroatEventType = EventType("sore_throat", "Sore Throat", MankowskiScale())

    static let PainUnderSternumEventType = EventType("pain_under_sternum", "Pain under Sternum", MankowskiScale())

    static let RashEventType = EventType("rash", "Rash", try! OrdinalScale(0, 5, [
            "No rash", // 0
            "Small rash (dime-sized)", // 1
            "Large rash (a few quarters)", // 2
            "Very large rash (orange-sized)", // 3
            "Giant rash (dinner plate)", // 4
            "Pervasive (everywhere)", // 5
        ]))


    /** Continuously changing sensations over time */
    static let SensationLoggingGroup = LoggingGroup("sensation", "Sensations", [
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
            RashEventType
        ]);
    
    static let UrinationPainStartEventType = EventType("urination_pain_start", "Pee Pain Start", MankowskiScale());
    static let UrinationPainDuringEventType = EventType("urination_pain_during", "Pee Pain During", MankowskiScale());
    static let PoopEventType = EventType("poop", "💩", BristolScale(), optional: true);

    /** Point-in-time bathroom events */
    static let BathroomLoggingGroup = LoggingGroup("bathroom", "Bathroom", [
            UrinationPainStartEventType,
            UrinationPainDuringEventType,
            PoopEventType
        ]);
    
    
    static let RightKneePainEventType = EventType("knee_pain_right", "Knee Pain (Right)", MankowskiScale());
    static let LeftPlantarFasciaPainEventType = EventType("plantar_fascia_pain_left", "PF Pain Left", MankowskiScale());
    static let RightPlantarFasciaPainEventType = EventType("plantar_fascia_pain_right", "PF Pain Right", MankowskiScale());

    /** Continuously changing leg pain related sensations over time */
    static let LegPainLoggingGroup = LoggingGroup("leg_pain", "Leg Pain", [
            RightKneePainEventType,
            LeftPlantarFasciaPainEventType,
            RightPlantarFasciaPainEventType
        ]);

    
    static let LoggingGroups = [
        SensationLoggingGroup,
        BathroomLoggingGroup,
//        LegPainLoggingGroup
    ]
}
