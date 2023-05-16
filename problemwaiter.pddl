(define (problem problemwaiter) ;; Replace XX with task number
    (:domain domain1)
    (:objects
        P - plate
        C - customer
        BTA - location
        PUA - location
        AUA - location
        PMA - location
        AMA - location
        PLA - location
        ALA - location
    )
    
    (:init
        (At Agent BTA)
        (At P BTA)
        (not (HasFood P))
        (At C PMA)
        (not (Served C))
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
        (Served C)
    ))
)