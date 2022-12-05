//next will store address of next node therefore it must be of type node
class Node<T> {
  T value;
  Node<T>? next;
  Node({required this.value, this.next});

  @override
  String toString() {
    return '$value-> ${next.toString()}';
  }
}

class LinkedList<E> {
  Node<E>? head;
  Node<E>? tail;
  //return true if head is null which mean list is empty
  bool get isEmpty => head == null;

  void insertAtStart(E e) {
    //New node with value e, addressing to head
    head = Node(value: e, next: head);
    tail ??= head;
  }

  void insertAtEnd(E value) {
    if (isEmpty) {
      insertAtStart(value);
      return;
    }
    tail!.next = Node(value: value);
    tail = tail!.next;
  }

  //It find a node after which we want to insert new node
  //it starts from head node to the node whose index is
  //being passed

  Node<E>? nodeAfter(int index) {
    var currentNode = head;
    var currentIndex = 0;

    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex += 1;
    }
    return currentNode;
  }

  Node<E> insertAfter(Node<E> node, E value) {
    if (tail == node) {
      insertAtEnd(value);
      return tail!;
    }
    node.next = Node(value: value, next: node.next);
    return node.next!;
  }

  @override
  String toString() {
    if (isEmpty) return 'List is Empty';
    return head.toString();
  }
}

void main() {
  final list = LinkedList<int>();
  list.insertAtStart(3);
  list.insertAtStart(2);
  list.insertAtStart(1);
  print('Before: $list');

  var middleNode = list.nodeAfter(2)!; //this will insert 42 after node index 1
  list.insertAfter(middleNode, 42);
  print('After: $list');
}
