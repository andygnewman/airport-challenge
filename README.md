#Airport Challenge
##Makers Academy Week One Weekend Challenge

#Domain Model

##Classes

###Plane
Responsibility | Collaborators
---------------|----------------
Be Flown       | Holding Stack
Be Landed      | Airport, Holding Stack

###Holding Stack
Responsibility | Collaborators
---------------|----------------
Fly Plane      | Plane
Land Plane     | Plane, Airport

###Airport
Responsibility | Collaborators
---------------|----------------
Land Plane     | Plane, Holding Stack
Weather Status | Weather Station

###Weather Station
Responsibility | Collaborators
---------------|----------------
Weather Status | Airport

