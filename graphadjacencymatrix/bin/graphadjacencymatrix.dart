// Graph using Adjacency Matrix Representation

class Graph {
  late List<List<int>> adjacencyMatrix;
  int vertexCount;

  Graph(this.vertexCount) {
    adjacencyMatrix =
        List.generate(vertexCount, (i) => List.generate(vertexCount, (j) => 0));
  }

  void addEdge(int source, int destination) {
    adjacencyMatrix[source][destination] = 1;
    adjacencyMatrix[destination][source] = 1;
  }

  void removeEdge(int source, int destination) {
    adjacencyMatrix[source][destination] = 0;
    adjacencyMatrix[destination][source] = 0;
  }

  void printGraph() {
    for (int i = 0; i < vertexCount; i++) {
      String row = "";
      for (int j = 0; j < vertexCount; j++) {
        row += "${adjacencyMatrix[i][j]} ";
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
