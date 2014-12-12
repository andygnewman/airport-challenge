#Airport Challenge
##Makers Academy Week One Weekend Challenge

#Domain Model

##Classes

###Plane
Responsibility | Collaborators
---------------|----------------
Be Flown       | Holding Stack
Be Landed      | Airport, Airspace
Take Off       | Airport, Airspace

###Airspace
Responsibility          | Collaborators
------------------------|----------------
Fly Plane               | Plane
Land Plane              | Plane, Airport
Accept Plane on Take Off| Plane, Airport 

###Airport
Responsibility | Collaborators
---------------|----------------
Land Plane     | Plane, Airspace
Allow Take Off | Plane, Airspace
Weather Status | Weather Station

###Weather Station
Responsibility | Collaborators
---------------|----------------
Weather Status | Airport

