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

  void addToStart(E e) {
    head = Node(value: e, next: head);
    tail = head;
  }

  void addToEnd(E value) {
    if (isEmpty) {
      addToStart(value);
      return;
    }
    tail!.next = Node(value: value);
    tail = tail!.next;
  }

  @override
  String toString() {
    if (isEmpty) return 'List is Empty';
    return head.toString();
  }
}

void main() {
  final list = LinkedList();
  list.addToEnd(10);
  list.addToEnd(20);
  list.addToEnd(30);

  print(list);
}
//Here 40 will become the head node