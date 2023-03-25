// Heap Tree -maxHeap

maxHeapify(var array, int size, int i) {
  int largest = i;
  int leftChild = 2 * i + 1;
  int rightChild = 2 * i + 2;

  // Check if the left child of the current node is larger than the root
  if (leftChild < size && array[leftChild] > array[largest]) {
    largest = leftChild;
  }

  // Check if the right child of the current node is larger than the root
  if (rightChild < size && array[rightChild] > array[largest]) {
    largest = rightChild;
  }

  // If the largest element is not the root, swap it with the root
  if (largest != i) {
    int temp = array[i];
    array[i] = array[largest];
    array[largest] = temp;

    // Recursively heapify the affected subtree
    maxHeapify(array, size, largest);
  }
}

void insert(List<int> heap, int value) {
  heap.add(value); // Add the new value to the end of the heap array
  int i = heap.length - 1; // Get the index of the new value
  int parent = (i - 1) ~/ 2; // Get the index of the parent node

  // Perform a "bubble-up" operation to maintain the max-heap property
  while (i > 0 && heap[parent] < heap[i]) {
    int temp = heap[i];
    heap[i] = heap[parent];
    heap[parent] = temp;

    i = parent;
    parent = (i - 1) ~/ 2;
  }
}

void deleteMax(List<int> array) {
  int lastIndex = array.length - 1;
  int max = array[0];

  // Replace the root node with the last node
  array[0] = array[lastIndex];
  array.removeAt(lastIndex);

  // Restore the max-heap property
  maxHeapify(array, array.length, 0);

  print('The maximum value $max has been deleted from the heap.');
}

void main(List<String> args) {
  var array = [3, 9, 2, 1, 4, 5];
  int size = array.length;

  for (var i = (size ~/ 2) - 1; i >= 0; i--) {
    maxHeapify(array, size, i);
  }
  print('The heap tree in array format is $array');

//Insert an elemnt to the heap tree
  insert(array, 6);
  print('The heap tree after inserting 6 is $array');

  // Delete the maximum value from the heap
  deleteMax(array);
  print('The heap tree after deleting the root node is $array');

  int newsize = array.length;

  // Print the sorted array (in descending order)
  for (int i = newsize - 1; i >= 0; i--) {
    int temp = array[0];
    array[0] = array[i];
    array[i] = temp;
    maxHeapify(array, i, 0);
  }

  print('The heap sorted array is $array');
}
