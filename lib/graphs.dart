import 'dart:io';

class Graph {
  List<List<int>> graph = [];
  int? vertices;

  Graph({this.vertices}) {
    for (int i = 0; i < vertices!; i++) {
      graph.add([]);
    }
  }

  void addEdge(int src, int dest) {
    graph[src].add(dest);
  }

  List<List<int>> transpose() {
    List<List<int>> transpose = [];
    for (int i = 0; i < vertices!; i++) {
      transpose.add([]);
    }
    for (int i = 0; i < vertices!; i++) {
      for (int j = 0; j < graph[i].length; j++) {
        transpose[graph[i][j]].add(i);
      }
    }
    return transpose;
  }

  void printing(List<List<int>> transpose) {
    for (int i = 0; i < vertices!; i++) {
      stdout.write('$i --> ');
      for (int j = 0; j < transpose[i].length; j++) {
        stdout.write('${transpose[i][j]}');
      }
      print('\n');
    }
  }

  @override
  String toString() {
    String finalString = '';
    for (int i = 0; i < vertices!; i++) {
      finalString += '$i --> ';
      for (int j = 0; j < graph[i].length; j++) {
        finalString += '${graph[i][j]} ';
      }
      finalString += '\n';
    }

    return finalString;
  }
}
