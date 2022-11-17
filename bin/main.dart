import 'dart:ffi';
import 'dart:io';

import 'package:algorithms/binary_tree.dart';
import 'package:algorithms/graphs.dart';
import 'package:algorithms/linked_list.dart';

void main(List<String> arguments) {
  final list = LinkedList();
  list.insertEnd(23);
  list.insertEnd(2);
  list.insertEnd(3);
  list.insertEnd(1);
  list.insertEnd(9);
  list.insertEnd(12);
  list.insertEnd(20);
  list.insertEnd(18);

  print(list);
  list.insertSort();
  print(list);
  // list.reverse();
  // print(list);
  // Node? nth = list.nthElementFromEnd(2);
  // Node? newlist = list.removeDuplicates();
  // Node? mid = list.midddleOfList();
  // print(mid?.val);

  // insertions(list, list2);

  //print(nums.sublist(0, 9));

  BinaryNode<int>? root = BinaryNode(0);

  Graph graph = Graph(vertices: 5);

  graph.addEdge(0, 1);
  graph.addEdge(0, 2);
  graph.addEdge(0, 3);
  graph.addEdge(1, 4);
  graph.addEdge(1, 4);
  graph.addEdge(1, 2);
  graph.addEdge(2, 4);
  graph.addEdge(3, 1);
  graph.addEdge(4, 0);

  // print(graph);
  //List<List<int>> transpose = graph.transpose();
  //graph.printing(transpose);
  String s = "asdokflj";
  // if(s[0].compareTo(s[i]) != 0)
  // Map<int, int> map = {};
  insertToTree(root, 69);
  insertToTree(root, 7);
  insertToTree(root, 10);
  insertToTree(root, 25);
  insertToTree(root, 27);
  insertToTree(root, 24);
  print(root);
  levelOrder(root);
  print(arr);
  print(maxDepth(root));

  // print(root);
  // print(j > -1);
  //print(mergeTwo(list.head, list2.head));
  // list.insertAfter(9, 67);
  // print(list);
}

void insertions(LinkedList list, LinkedList list2) {
  list.insertHead(10);
  list.insertHead(9);
  list.insertHead(5);
  list.insertHead(3);

  list2.insertHead(7);
  list2.insertHead(4);
  list2.insertHead(2);
}

Node? mergeTwo(Node? l1, Node? l2) {
  Node? newList;

  if (l1 == null) return l2;
  if (l2 == null) return l1;

  if (l1.val <= l2.val) {
    newList = l1;
    l1 = l1.next;
  } else {
    newList = l2;
    l2 = l2.next;
  }

  Node? temp = newList;

  while (l1 != null) {
    if (l2 == null || l1.val <= l2.val) {
      temp?.next = l1;
      temp = temp?.next;
      l1 = l1.next;
    } else {
      temp?.next = l2;
      temp = temp?.next;
      l2 = l2.next;
    }
  }
  if (l2 != null) temp?.next = l2;
  return newList;
}

///create binary tree
BinaryNode<int> createBinaryTree() {
  final zero = BinaryNode(0);
  final one = BinaryNode(1);
  final five = BinaryNode(5);
  final seven = BinaryNode(7);
  final eight = BinaryNode(8);
  final nine = BinaryNode(9);

  seven.leftChild = one;
  one.leftChild = zero;
  one.rightChild = five;
  seven.rightChild = nine;
  nine.leftChild = eight;

  return seven;
}

void printTree(BinaryNode<int>? root) {
  if (root == null) {
    return;
  }
  printTree(root.leftChild);
  print(root.value);
  printTree(root.rightChild);
}

void insertToTree(BinaryNode<int>? root, int value) {
  if (root == null) {
    var newelem = BinaryNode(value, leftChild: root, rightChild: root);
    root = newelem;
  } else {
    if (value < root.value) {
      if (root.leftChild == null) {
        root.leftChild = BinaryNode(value);
      } else {
        insertToTree(root.leftChild, value);
      }
    } else {
      if (root.rightChild == null) {
        root.rightChild = BinaryNode(value);
      } else {
        insertToTree(root.rightChild, value);
      }
    }
  }
}

void levelOrder(BinaryNode<int>? root) {
  int h = maxDepth(root);
  for (int i = 1; i <= h; i++) {
    printCurrentLevel(root, i);
    print('');
  }
}

List<int> arr = [];
void printCurrentLevel(BinaryNode<int>? root, int level) {
  if (root == null) {
    return;
  }
  if (level == 1) {
    stdout.write("${root.value}  ");
    arr.add(root.value);
  } else if (level > 1) {
    printCurrentLevel(root.leftChild, level - 1);
    printCurrentLevel(root.rightChild, level - 1);
  }
}
