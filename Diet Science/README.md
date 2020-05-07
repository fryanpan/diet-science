#  Rough Sketch of Interfaces

```

Imagined interface for programmatic access


   // events are created by the system or by the user and have unique string identifiers
   let EVENTS = [
       EventType('brain_fog', 'Brain Fog', CustomEventScale(0 = ..., 1 = ..., 2 = ..., etc.)),
       EventType('nasal_congestion', 'Nasal Congestion', CustomEventScale(0 = ..., 1 = ..., ...)),
       EventType('dry_eyes', 'Dry / Irritated Eyes', MankowskiScale),
       EventType('itchy_scalp', 'Itchy Scalp', MankowskiScale),
       EventType('itchy_scalp', 'Itchy Scalp', MankowskiScale),
       EventType('itchy_scalp', 'Itchy Scalp', MankowskiScale),
       EventType('itchy_scalp', 'Itchy Scalp', MankowskiScale),
   ]

   // you can lookup an event by unique string identifier
   EventType.lookupByIdentifier(id: String) -> EventType

   e.g. EventType.lookupByIdentifier('itchy_scalp') returns the Itchy Scalp EventType

   // You can construct categories to log together
   // This is intended as data to control how the user interface works
   let sensationLoggingGroup = LoggingGroup(name: "Sensations", icon: ..., eventTypes: ["brain_fog", "nasal_congestion", "dry_eyes", ...])
   let bathroomLoggingGroup = LoggingGroup(name: "Bathroom", icon: ..., eventTypes: ["urination_pain_start", "urination_pain_during", "urination_length", "poop"])

   // And then setup UX from a list of logging categories to display
   let myLoggingCategories = [
       sensationLoggingGroup,
       bathroomLoggingGroup
   ]

```
