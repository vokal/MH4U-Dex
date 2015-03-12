# MH4U-Dex
Joseph Goldberg's apprentice project. 

Open-Source under MIT License: http://opensource.org/licenses/MIT

App is still currently in-development, and undergoing a major refactor.  Current functionality: App reads in monsters and their hitzones/damage resistances, and displays these.  App also is capable of reading in monster drops, and gather locations of items, and listing monster and gather sources for items.  App currently is capable of processing detailed data of these "drops", but currently displays only the very basics.  Navigation to the source monster is possible for monster drops, but navigation to the source area for a gather point is not yet implemented.  (It is next on the list, after this refactor.)

Currently, the app makes no distinction when displaying data, between low, high, and g-rank, but this should not be difficult to implement, as this information IS tracked on the model-side of things.

Other issues:  All data is currently mock data, and thus woefully incomplete. 
              
Very little time has been put into aesthetic design / readability.
              
Will need a refactoring of the model for improved compatibility with the Android database.
              
Core Data migration/error handling is NYI.

Goals of current refactor:
   
Consolidate code that is often repeated into base classes/methods that are inherited from.
    
Store string literals in constants as much as possible, to avoid problems with typos.
    
Convert all user-facing strings to NSLocalizedString if possible.  In the future, consider instead implementing additional databases for other languages, if they already exist.
   
Reorganize folder and file layout of project, to increase organization.
    
Optimize database saving.
