(define (domain waiting)
    (:requirements :adl )
    
    (:types
        waiter
        location
        customer
        plate broom - item
        brokenPlate
        droppedFood

    )
    
    (:constants 
        ;; You should not need to add any additional constants
        Agent - waiter
        BTA - location
    )
    
    (:predicates
        (Adjacent ?x - location ?y - location)
        (At ?x - object ?y - location)
        (HasFood ?p - plate)
        (Holding ?a - waiter ?i - item)
        (Served ?c - customer)
        (EmptyHanded ?a - waiter)

    )
    
    (:action pickplate
        :parameters (?p - plate ?x - location)
        :precondition (and 
            (At Agent ?x)
            (At ?p ?x)
            (not (exists (?i - item) (Holding Agent ?i)))
            (EmptyHanded Agent)
        )
        :effect (and
            (Holding Agent ?p)
            (not (EmptyHanded Agent))
        )
    )
    
    (:action pickbroom
        :parameters (?b - broom ?x - location)
        :precondition (and
            (At agent ?x)
            (At ?b ?x)
            (not (exists (?i - item) (Holding Agent ?i)))
        )
        :effect (and
            (Holding Agent ?b)
        )
    )
    
    (:action present
        :parameters (?p - plate ?c - customer ?x - location)
        :precondition (and
            (At Agent ?x)
            (At ?c ?x)
            (Holding Agent ?p)
            (HasFood ?p)
            (not (EmptyHanded Agent))
        )
        :effect (and
 
            (Served ?c)
            (not (Holding Agent ?p))
            (EmptyHanded Agent)
        )
    )
    
    (:action fill
        :parameters (?p - plate)
        :precondition (and
            (At Agent BTA)
            (not (HasFood ?p))
            (Holding Agent ?p)
        )
        :effect (and
            (HasFood ?p)
        )
    )
    
    (:action move
        :parameters (?x - location ?y - location)
        :precondition (and
            (At Agent ?x)
            (not (At Agent ?y))
            (or (Adjacent ?x ?y) (Adjacent ?y ?x))
            (not (exists (?bp - brokenPlate) (At ?bp ?y))) ; Agent cannot move if it contains a broken plate
        )
        :effect (and
            (At Agent ?y)
            (not (At Agent ?x))
        )
    )
    
    (:action sweepplate
        :parameters (?bp - brokenPlate ?x - location ?y - location)
        :precondition (and
            (At ?bp ?x) ;If the location x has both, robot sweeps it up in one action
            (At Agent ?y)
            (or (Adjacent ?x ?y) (Adjacent ?y ?x))
            (exists (?b - broom) (Holding Agent ?b))
            (not (exists (?p - plate) (Holding Agent ?p)))
            (EmptyHanded Agent)
        )
        :effect (and
            (not (At ?bp ?x))
            (not (EmptyHanded Agent))
        )
    )
    
    (:action sweepfood
        :parameters (?df - droppedFood ?x - location ?y - location)
        :precondition (and
            (At ?df ?x) ;If the location x has both, robot sweeps it up in one action
            (At Agent ?y)
            (or (Adjacent ?x ?y) (Adjacent ?y ?x))
            (exists (?b - broom) (Holding Agent ?b))
            (not (exists (?p - plate) (Holding Agent ?p)))
            (EmptyHanded Agent)

        )
        :effect (and
            (not (At ?df ?x)) 
            (not (EmptyHanded Agent))
        )
    )
    
    (:action putdown
        :parameters (?i - item ?x - location)
        :precondition (and
            (Holding Agent ?i)
            (At Agent ?x)
            (not (EmptyHanded Agent))
        )
        :effect (and
            (not (Holding Agent ?i))
            (At ?i ?x)
            (EmptyHanded Agent)
        )
    )
    
)