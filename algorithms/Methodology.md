## Binary search



It can be used to solve various problems.

* Find element in a sorted array.
* Find first occurrence of an event in a discrete/continuous search space.
  * We return low or high which represents the minimum (first event occurrence).
  * The return condition is `low >= high`.
  * For continuous problems, the return condition is `low >= high + epsilon`.


## Dynamic Programming

Some things to have in mind:
1. You want your grid to have increasing/decreasing values along dimensions according to the semantics of the problem.
2. Your recursion should go in the reverse direction of the direction of your pointers. If i increases in the loop, i should decrease in the recursion.
3. Penalize the forbidden cases.
4. Initialize first. Then solve the problem.

## Max/Min heap
TODO: complete this




## Segment trees
TODO: complete this



## Priority Queues
TODO: complete this
