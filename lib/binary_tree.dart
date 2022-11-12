class BinaryNode<T> {
  BinaryNode(this.value, {this.leftChild, this.rightChild});

  T value;
  BinaryNode<T>? leftChild;
  BinaryNode<T>? rightChild;

  @override
  String toString() {
    // if (leftChild == null && rightChild == null) return 'null';
    // if (leftChild != null) leftChild.toString();
    // if (rightChild != null) rightChild.toString();
    return _diagram(this);
  }

  String _diagram(
    BinaryNode<T>? node, [
    String top = '',
    String root = '',
    String bottom = '',
  ]) {
    if (node == null) {
      return '$root null\n';
    }
    if (node.leftChild == null && node.rightChild == null) {
      return '$root ${node.value}\n';
    }
    final a = _diagram(
      node.rightChild,
      '$top ',
      '$top┌──',
      '$top│ ',
    );
    final b = '$root${node.value}\n';
    final c = _diagram(
      node.leftChild,
      '$bottom│ ',
      '$bottom└──',
      '$bottom ',
    );
    return '$a$b$c';
  }
}

int maxDepth(BinaryNode? root) {
  if (root == null) {
    return 0;
  }

  int lDepth = maxDepth(root.leftChild);
  int rDepth = maxDepth(root.rightChild);

  if (lDepth > rDepth) return lDepth + 1;
  return rDepth + 1;
}

int nodeDepth(BinaryNode? root, int val) {
  if (root == null) {
    return -1;
  }
  int dist = -1;
  if ((root.value == val) ||
      (dist = nodeDepth(root.leftChild, val)) >= 0 ||
      (dist = nodeDepth(root.rightChild, val)) >= 0) return dist + 1;

  return dist;
}
