# Diet Science App

### Deployment Configurations

Based on this: https://medium.com/slalom-build/ios-managing-multiple-environments-with-a-single-target-94cf823a6447

There are two environment setup.  

For debug, use the "dev" environment
For release, use the "prod" environment and a different icon and bundle identifier

### P1 - Make logging more convenient and performant

After logging a year of data, current web app + spreadsheet + analysis pipeline are starting to keel over.
Need to revisit

- Convenient Apple Watch sensation logging on the go (2ish days)
    - SHOULD take < 30 seconds to log 12 sensations, after some practice
    - SHOULD handle offline data collection gracefully
    - SHOULD flexibly handle additional sensations over time
      (focus on starting to work on pelvic floor symptoms, in addition to histamine symptoms)
    - SHOULD notify to remind to log

### P2 - Make better food logger and analysis pipeline

- Convenient Apple Watch food logging on the go
    - SHOULD be orders of magnitude faster (5x) at logging than LifeSum or MyFitnessPal
      (potential gains in precision / recall, streamlining UX targeting expert user)
    - SHOULD integrate much more cleanly with analysis
      (current spreadsheet is a mess)
      
- Update analysis pipeline (3-5 days)
      - SHOULD handle another year of data, in more detail
      - SHOULD represent time more granularly to allow for better analysis
      - SHOULD represent foods and ingredients more cleanly as well
      

##  Rough Sketch of Event Logging Interfaces

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
