#Airport Challenge
##Makers Academy Week One Weekend Challenge

#Domain Model

##Classes

###Plane
Responsibility | Collaborators
---------------|----------------
Be Flown       | <strike>Airspace</strike>
Be Landed      | Airport, <strike>Airspace</strike>
Take Off       | Airport, <strike>Airspace</strike>

###Airport
Responsibility | Collaborators
---------------|----------------
Land Plane     | Plane, <strike>Airspace</strike>
Allow Take Off | Plane, <strike>Airspace</strike>
Weather Status | Weather Station
####Note: some elements of Airport (planes array, accept, release, number_planes) are contained in a PlaneContainer module as could be reused by other classes, eg. airspace)


###Weather Station (created as a module required by Airport)
Responsibility | Collaborators
---------------|----------------
Weather Status | Airport

###<strike>Airspace</strike> airspace Class removed from domain model as added to much complexity for what was required 
Responsibility         | Collaborators
-----------------------|----------------
Fly Plane              | Plane
Land Plane             | Plane, Airport
Accept Plane on Launch | Plane, Airport 
