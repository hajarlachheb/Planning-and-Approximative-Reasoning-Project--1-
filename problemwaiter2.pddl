(define (problem problemwaiter2) ;; Replace XX with task number
    (:domain domain1)
    (:objects
        P1 - plate
        P2 - plate
        C1 - customer
        C2 - customer
        PUA - location
        AUA - location
        PMA - location
        AMA - location
        PLA - location
        ALA - location
    )
    
    (:init
        (At Agent AMA)
        (At P1 PMA)
        (not (HasFood P1))
        (At P2 PLA)
        (not (HasFood P2))
        (At C1 PUA)
        (not (Served C1))
        (At C2 ALA)
        (not (Served C2))
        (EmptyHanded Agent)
        (Adjacent BTA AUA)
        (Adjacent AUA BTA)
        (Adjacent AUA PUA)
        (Adjacent PUA AUA)
        (Adjacent PUA PMA)
        (Adjacent PMA PUA)
        (Adjacent PMA AMA)
        (Adjacent AMA PMA)
        (Adjacent AMA ALA)
        (Adjacent ALA AMA)
        (Adjacent ALA PLA)
        (Adjacent PLA ALA)
        (Adjacent PLA PMA)
        (Adjacent PMA PLA)

    )
    
    (:goal (and 
        (Served C1)
        (Served C2)
        (At Agent BTA)
    ))
)