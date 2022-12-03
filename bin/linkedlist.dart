class Node<T> {
  T value;
  Node<T>? next;
  Node({required this.value, this.next});

  @override
  String toString() {
    if (next == null) {
      print('Value: $value'); //value in last node
    }
    return '$value-> ${next.toString()}';
  }
}

void main() {
  final node1 = Node(value: 100);
  final node2 = Node(value: 200);
  final node3 = Node(value: 300);
  node1.next = node2;
  node2.next = node3;
  //node3.next = null;
  print(node1);
}
