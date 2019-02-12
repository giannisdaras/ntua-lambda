from collections import defaultdict
from math import inf


class MinHeap:
    ''' A min heap '''

    def __init__(self):
        self.heap = defaultdict(int)
        self.stop = 0

    def left(self, index):
        return self.heap[2*index + 1]

    def right(self, index):
        return self.heap[2*index + 2]

    def empty(self):
        return (self.stop == 0)

    def parent(self, index):
        return ((index - 1) // 2)

    def swap(self, i1, i2):
        _ = i2
        self.heap[i2] = i1
        self.heap[i1] = _

    def combine(self, index):
        next = index
        left = self.left(index)
        right = self.right(index)
        if (left < self.stop and self.heap[left] < self.heap[index]):
            next = left
        if (right < self.stop and self.heap[right] < self.heap[index]):
            next = right
        if (next != index):
            self.swap(next, index)
            self.combine(next)

    def extract_max(self):
        if (self.stop != 0):
            self.swap(0, self.stop - 1)
            self.stop -= 1
            self.combine(0)
            return self.heap[self.stop]

    def insert(self, value):
        self.heap[self.stop] = value
        self.stop += 1
        indx = self.stop - 1
        p = self.parent(indx)
        while (indx > 0 and self.heap[p] > self.heap[indx]):
            self.swap(p, indx)
            indx = p
            p = self.parent(indx)


class Graph:
    ''' a simple graph class '''
    def __init__(self):
        self.adj = defaultdict(list)
        self.vertexes = set()
        ''' this is only used for weighted graphs '''
        self.weights = defaultdict(int)
        self.edges = []

    def dfs(self, s, visited=None):
        ''' a dfs method '''
        if visited is None:
            visited = defaultdict(int)
        parent = defaultdict(lambda: -1)
        discovered = []

        def dfs_util(self, s, p):
            ''' s node, p previous node, aka parent '''
            discovered.append(s)
            visited[s] = 1
            parent[s] = p
            for v in self.adj[s]:
                if not visited[v]:
                    dfs_util(self, v, s)

        dfs_util(self, s, s)
        return discovered

    def bfs(self, s):
        ''' a bfs method '''
        discovered = []
        visited = defaultdict(int)
        parent = defaultdict(lambda: -1)
        q = [s]
        while q:
            hd = q[0]
            q = q[1:]
            for v in self.adj[hd]:
                if not visited[v]:
                    visited[v] = 1
                    parent[v] = hd
                    q.append(v)
            discovered.append(hd)
        return discovered

    def transpose(self):
        ''' return a new transposed Graph '''
        g = Graph()
        for key in self.adj.keys():
            for v in self.adj[key]:
                g.adj[v].append(key)
        return g

    def strongly_connected_components(self, s):
        ''' Implementation of Kosaraju's algorithm '''
        components = []
        vertexes = list(self.vertexes)
        visited = defaultdict(int)
        g = self.transpose()
        while (vertexes):
            head = vertexes[0]
            tmp = defaultdict(int)
            for key in visited.keys():
                tmp[key] = visited[key]
            forward = self.dfs(head, visited=visited)[::-1]
            backward = g.dfs(forward[0], visited=tmp)
            component = list(set(forward).intersection(set(backward)))
            components.append(component)
            for v in component:
                visited[v] = 1
                if v in vertexes:
                    vertexes.remove(v)
        return components

    def kruskal(self):
        parents = defaultdict(int)
        ranks = defaultdict(lambda: 1)
        vertexes = list(self.vertexes)
        edges = []
        for vertex in vertexes:
            parents[vertex] = vertex

        def find(vertex):
            if (parents[vertex] == vertex):
                return vertex
            else:
                parents[vertex] = find(parents[vertex])
                return parents[vertex]

        def union(v1, v2):
            p1 = find(v1)
            p2 = find(v2)
            if (ranks[p1] < ranks[p2]):
                parents[p1] = p2
            elif (ranks[p1] > ranks[p2]):
                parents[p2] = p1
            else:
                parents[p2] = p1
                ranks[p1] += 1

        self.edges = sorted(self.edges, key=lambda x: x[2])
        for edge in self.edges:
            u, v, weight = edge
            if (find(u) != find(v)):
                edges.append([u, v, weight])
                union(u, v)
        return edges

    def floyd_warshall(self):
        DP = defaultdict(lambda: inf)
        for [v1, v2] in self.weights.keys():
            DP[[v1, v2]] = self.weights[[v1, v2]]
        for k in self.vertexes:
            for i in self.vertexes:
                for j in self.vertexes:
                    DP[[i, j]] = min(DP[[i, j]], DP[[i, k]] + DP[[k, j]])
        return DP


class DirectedGraph(Graph):
    ''' a directed graph '''
    def add_edge(self, v1, v2):
        self.adj[v1].append(v2)
        self.vertexes.update([v1, v2])

    def add_weighted_edge(self, v1, v2, weight):
        self.adj[v1].append(v2)
        self.weights[(v1, v2)] = weight
        self.vertexes.update([v1, v2])
        self.edges.append([v1, v2, weight])


class UndirectedGraph(Graph):
    ''' an undirected graph '''
    def add_edge(self, v1, v2):
        self.adj[v1].append(v2)
        self.adj[v2].append(v1)
        self.vertexes.update([v1, v2])

    def add_weighted_edge(self, v1, v2, weight):
        self.adj[v1].append(v2)
        self.adj[v2].append(v1)
        self.weights[(v1, v2)] = weight
        self.weights[(v2, v1)] = weight
        self.vertexes.update([v1, v2])
        self.edges.append([v1, v2, weight])
        self.edges.append([v2, v1, weight])


if __name__ == '__main__':
    g = UndirectedGraph()
    g.add_weighted_edge(0, 1, 10)
    g.add_weighted_edge(1, 2, 20)
    g.add_weighted_edge(2, 3, 9)
    g.add_weighted_edge(0, 3, 7)
    print(g.kruskal())
