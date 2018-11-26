# About


Personal notes for the course of Artificial Intelligence of NTUA.

## Graph traversing

Problem statement: given a graph topology and a start point s (:source) reach a destination point g (:goal) given a heuristic function h.

### Heuristic functions
  1. Admissible. It never overestimates the cost between the node and the target node.




### Convex functions

If you draw a straight line between any two points of the function, the line will be above the function.

Properties:

1. Local minima is the global minima
2. No flat regions

### Algorithms

1. complete: finds the solution, not (always) the optimal though.


#### Hill climbing

Puts only the most promising node to the open set.

Stopping criteria: **metrics' value increased / target reached**

Properties:
1. may converge to local minimum
2. for convex problems, it will find the global minimum

#### Best First
Puts every child (that's not in the closed set) to the open set.
The open set is always sorted.
Properties:

1. complete

#### A*

A* calculates for each node the function f(n) = h(n) + g(n) where g(n) is the extra (real-cost) we need to pay to visit the child node.

Properties:
1. if the h(n) function is admissible, it will always find the optimal solution.
