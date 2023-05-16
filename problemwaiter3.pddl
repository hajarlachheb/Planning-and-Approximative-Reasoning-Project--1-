(define (problem problemwaiter3)
    (:domain domain2)
    (:objects
        C - customer
        P - plate
        BP1 - brokenPlate
        BP2 - brokenPlate
        DF - droppedFood
        B - broom
        PUA - location
        AUA - location
        PMA - location
        AMA - location
        PLA - location
        ALA - location
    )
    
    (:init
        (Adjacent BTA AUA)
        (Adjacent AUA PUA)
        (Adjacent PUA PMA)
        (Adjacent PMA PLA)
        (Adjacent PLA ALA)
        (Adjacent ALA AMA)
        (Adjacent AMA AUA)
        (At Agent BTA)
        (At C PMA)
        (not (Served C))
        (At P BTA)
        (not (HasFood P))
        (At B PUA)
        (At BP1 AMA)
        (At BP2 PMA)
        (At DF AUA)

    )
    
    (:goal (and 
        (Served C)
        (At Agent BTA)
        (forall (?x - location) (not (exists (?BP - brokenPlate) (at ?BP ?x))))
        (forall (?x - location) (not (exists (?DF - droppedFood) (at ?DF ?x))))
    ))
)