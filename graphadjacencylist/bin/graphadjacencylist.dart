// Graph using Adjacency List Representation
class Graph {
  late List<List<int>> adjacencyList;
  int vertexCount;

  Graph(this.vertexCount) {
    adjacencyList = List.generate(vertexCount, (_) => []);
  }

  void addEdge(int source, int destination) {
    adjacencyList[source].add(destination);
    adjacencyList[destination].add(source);
  }

  void removeEdge(int source, int destination) {
    adjacencyList[source].remove(destination);
    adjacencyList[destination].remove(source);
  }

  void printGraph() {
    for (int i = 0; i < vertexCount; i++) {
      String row = "$i: ";
      for (int j = 0; j < adjacencyList[i].length; j++) {
        row += "${adjacencyList[i][j]} ";
      }
      print(row);
    }
  }
}

void main() {
  Graph graph = Graph(5);
  graph.addEdge(0, 1);
  graph.addEdge(0, 4);
  graph.addEdge(1, 2);
  graph.addEdge(1, 3);
  graph.addEdge(1, 4);
  graph.addEdge(2, 3);
  graph.addEdge(3, 4);

  graph.printGraph();

  graph.removeEdge(1, 4);
  print(' ');
  graph.printGraph();
}
