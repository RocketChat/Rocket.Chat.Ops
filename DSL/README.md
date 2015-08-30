## Rocket.Chat.Ops declarative UI Domain Specific Language  (DSL)

* simple syntax
* tokenizable, highiy 'compressible' for transport
* first version starts with simple 'square' areas and buttons;  evolve to sophisticated/complex compositions later

### Why DSL

* every bot declaratively specifies its own UI
* bot writers are not UI experts - no knowledge of HTML 5, CSS, GTK+, UIKit or Material Design required
* maintainability - all bot logic and related UI declarations together in one source unit


### Benefits of this design

* decoupling - allow Rocket.Chat core UI/UX experts to maintain full control of the system's overall look and feel; no need to update bots upon every new UI platform update
* flexibility - each set of rooms serviced by one type of bot can all have the same Chat.Ops UI  (UI is specific to bot); we can have as many variations of Chat.Ops UI on the same Rocket.Chat server instance as we have (or can scale with) bots
* adaptability - DSL interpreter generates UI at runtime as GUI-platform native components:  HTML 5 + CSS on web clients, UIKit on iOS mobile, GTK+ or Qt on specialized embedded Linux devices, and so on


