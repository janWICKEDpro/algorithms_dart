/*
 *
 * 
 * 
 * 
 * 
*/

class Node {
  int val;
  Node? next;
  Node({this.val = 0, this.next});

  @override
  String toString() {
    if (next == null) return '$val';
    return '$val -> ${next.toString()}';
  }
}

class LinkedList {
  Node? head;

  void insertHead(int data) {
    var element = Node(val: data, next: head);
    head = element;
  }

  void insertEnd(int data) {
    if (head == null) {
      insertHead(data);
      return;
    }
    Node? newElement = Node(val: data, next: null);
    Node? temp = head;
    while (temp!.next != null) {
      temp = temp.next;
    }
    temp.next = newElement;
  }

  void insertAfter(int target, int data) {
    Node? temp = head;
    while (temp != null) {
      if (temp.val == target) {
        Node? newNode = Node(val: data, next: temp.next);
        temp.next = newNode;
        break;
      }
      temp = temp.next;
    }
  }

  Node? midddleOfList() {
    Node? fast = head, slow = head, prev;
    int count = 0;
    if (head == null || head?.next == null) {
      return head;
    }
    while (fast != null) {
      if (fast.next != null) {
        count++;
        fast = fast.next?.next;
        prev = slow;
        slow = slow?.next;
        print(fast?.val);
      }
    }
    if (count % 2 == 0) return slow;
    return prev;
  }

  Node? removeDuplicates() {
    Node? temp = head;
    Node? newList;
    newList = Node(val: head!.val);
    Node? sc = newList;

    while (temp?.next != null) {
      if (temp?.val != temp?.next?.val) {
        sc?.next = temp?.next;
        sc = sc?.next;
        temp = temp?.next;
      } else {
        temp = temp?.next;
        sc?.next = null;
      }
    }
    return newList;
  }

  Node? nthElementFromEnd(int n) {
    Node? fast = head, slow = head;
    for (int i = 0; i < n; i++) {
      fast = fast?.next;
    }
    while (fast != null) {
      fast = fast.next;
      slow = slow?.next;
    }
    return slow;
  }

  void reverse() {
    Node? curr = head, prev, next;

    while (curr != null) {
      next = curr.next;
      curr.next = prev;
      prev = curr;
      curr = next;
    }
    head = prev;
  }

  bool isCycle() {
    Node? fast = head, slow = head;
    while (fast != null && fast.next != null) {
      fast = fast.next?.next;
      slow = slow?.next;
      if (fast.hashCode == slow.hashCode) return true;
    }
    return false;
  }

  void swap(int target) {
    Node? prev, curr = head

    while (curr?.val != target) {
      prev_prev = prev;
      prev = curr;
      curr = curr?.next;
    }
    if (prev == head) {
      // prev?.next = curr?.next;
      // curr?.next = prev;
      head = curr;
    }
    prev_prev?.next = curr;
    prev?.next = curr?.next;
    curr?.next = prev;
  }

  void bubbleSort() {
    Node? curr = head, index;
    int swap = 0;
    while (curr != null) {
      index = curr.next;
      while (index != null) {
        if (index.val < curr.val) {
          swap = index.val;
          index.val = curr.val;
          curr.val = swap;
        }
        index = index.next;
      }
      curr = curr.next;
    }
  }

  void insertSort() {
    Node? sorted;
    Node? temp = sorted;

    while (head != null) {
      if (sorted == null || sorted.val > head!.val) {
        Node? newNode = Node(val: head!.val);
        newNode.next = sorted;
        sorted = newNode;
      } else {
        while (temp?.next != null && temp!.next!.val < head!.val) {
          temp = temp.next;
        }
        Node? newGuy = Node(val: head!.val, next: temp?.next);
        temp?.next = newGuy;
      }
      head = head?.next;
      temp = sorted;
    }

    head = sorted;
  }

  @override
  String toString() {
    if (head == null) return 'Empty List';
    return head.toString();
  }
}
