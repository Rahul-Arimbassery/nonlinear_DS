// Heap Tree -minHeap

minHeapify(var array, int size, int i) {
  int smallest = i;
  int leftChild = 2 * i + 1;
  int rightChild = 2 * i + 2;

  // Check if the left child of the current node is smaller than the root
  if (leftChild < size && array[leftChild] < array[smallest]) {
    smallest = leftChild;
  }

  // Check if the right child of the current node is smaller than the root
  if (rightChild < size && array[rightChild] < array[smallest]) {
    smallest = rightChild;
  }

  // If the smallest element is not the root, swap it with the root
  if (smallest != i) {
    int temp = array[i];
    array[i] = array[smallest];
    array[smallest] = temp;

    // Recursively heapify the affected subtree
    minHeapify(array, size, smallest);
  }
}

void insert(List<int> heap, int value) {
  heap.add(value); // Add the new value to the end of the heap array
  int i = heap.length - 1; // Get the index of the new value
  int parent = (i - 1) ~/ 2; // Get the index of the parent node

  // Perform a "bubble-up" operation to maintain the min-heap property
  while (i > 0 && heap[parent] > heap[i]) {
    int temp = heap[i];
    heap[i] = heap[parent];
    heap[parent] = temp;

    i = parent;
    parent = (i - 1) ~/ 2;
  }
}

void deleteMin(List<int> array) {
  int lastIndex = array.length - 1;
  int min = array[0];

  // Replace the root node with the last node
  array[0] = array[lastIndex];
  array.removeAt(lastIndex);

  // Restore the min-heap property
  minHeapify(array, array.length, 0);

  print('The minimum value $min has been deleted from the heap.');
}

void main(List<String> args) {
  var array = [3, 9, 2, 1, 4, 5];
  int size = array.length;

  for (var i = (size ~/ 2) - 1; i >= 0; i--) {
    minHeapify(array, size, i);
  }
  print('The heap tree in array format is $array');

  // Insert an element to the heap tree
  insert(array, 0);
  print('The heap tree after inserting 0 is $array');

  // Delete the minimum value from the heap
  deleteMin(array);
  print('The heap tree after deleting the root node is $array');

  int newsize = array.length;

  // Print the sorted array (in ascending order)
  for (int i = 0; i < newsize; i++) {
    int temp = array[0];
    array[0] = array[newsize - i - 1];
    array[newsize - i - 1] = temp;
    minHeapify(array, newsize - i - 1, 0);
  }

  print('The heap sorted array is $array');
}
