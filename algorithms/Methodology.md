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



## Graph algorithms



*Terminology*:

* Tree: directed acyclic graph in which every node has only one parent.

* DAG: directed acyclic graph

* Forest: a subgraph of the graph in which some nodes are missing


There are a few concepts to discuss here.



### Topological sorting



A topological sorting of a graph is "sorting" of the graph vertices based on their dependencies. It tells us which vertex to process first. 



A topological sort of a graph is possible if the graph is DAG, meaning directed with no cycles. Every tree is a DAG. DAGs are trees that allow multiple parents.



Topological sort is a tracing algorithm. You have a set of unvisited nodes, you pick one, you run dfs and you maintain a stack to track the order.



A lot of applications take advantage of topological sorting, such as make, apt-get, IDEs, etc.



The complexity of topological sorting is the complexity of DFS traversal: O(V+E).

 

### Tracing 



Tracing algorithms are algorithms that allow you to find out paths based on a `prev` structure that nodes maintain. If you want to print the paths from source to the destination, a good way to do that is to run the tracing algorithm from destination to source (in order to take advantage of the `prev` structure) and print backwards (maybe use a stack for that?).



Tracing algorithms are simply DFS traversals. Thus, the complexity is O(V+E)





### Shortest path problem

The shortest path problem has the optimal substructure property. Let's denote d(s,u) the best path from s to u and d(s,u,v) the best path from s to v coming from u. Then:
$$
d(s, u, v) = d(s, u) + length(u, v)
$$
A longest path problem doesn't have this property, making it NP hard for general graphs.



We may have different variations of this problem:

* From one source to one destination
* From one source to multiple destinations
* From multiple sources to one destination
* From multiple sources to multiple destinations



There is no point of wanting to compute "the shortest path in graph" because you will only need to find the edge with the smallest cost.



### Longest path problem

The longest path problem is NP-hard for general graphs, but linear for DAGs.

The basic idea is the *topological sorting*.



There are multiple variations of the problem:

* Longest path in a graph

  This is the most common problem, which is also known as the critical path problem. The name "critical path" derives from modeling a project as a graph with milestones and dependencies as edges with weights the time needed to finish this task and wanting to find what delays you the most.

* From one source to one destination

* From one source to multiple destinations

* From multiple sources to one destination

* From multiple sources to multiple destinations



### Strongly connected components



The strongly connected components can be obtained with Kosaraju's algorithm.

The idea is to do DFS. Then, transpose graph and do DFS again from every vertex (not yet visited) but respecting the reverse order of discoverance of nodes in the DFS traversal.



### Minimum spanning tree

*Terminology*:

* Cut: a minimal set of edges so that if you remove one from graph, it becomes disconnected.
* 



### Cycle detection



* Run DFS. If you see an already visited node there is a cycle. To print the cycle, just trace back the node using the prev and then add the "naughty" edge. O(V+E)
* Union-find algorithm #TODO



