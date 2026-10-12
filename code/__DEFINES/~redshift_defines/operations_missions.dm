/// The mission is still loading and we shouldn't allow players to get to it yet
#define MISSION_STATUS_LOADING 0
/// The mission is currently running and should check whenever ticked about objective completion
#define MISSION_STATUS_RUNNING 1
/// The mission is completed and now we give time for the crew to get back home afterward
#define MISSION_STATUS_FINISHED 2
/// The mission area is currently being cleaned up and we should prevent players from going back to it
#define MISSION_STATUS_CLEANING 3

/// The objective is incomplete
#define OBJECTIVE_INCOMPLETE 1
/// The objective has been completed successfully and counts towards completing the mission
#define OBJECTIVE_COMPLETE 2
/// The objective has been failed and still counts toward mission completion
#define OBJECTIVE_FAILURE 3

/// Looks for the objective one landmark
#define OBJECTIVE_ONE_MARKER "objective_one"
/// Looks for the objective two landmark
#define OBJECTIVE_TWO_MARKER "objective_two"
/// Looks for the objective three landmark
#define OBJECTIVE_THREE_MARKER "objective_three"
