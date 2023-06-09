//Binary Search Tree - BST
// The properties that separate a binary search tree from a regular binary tree is
// All nodes of left subtree are less than the root node
// All nodes of right subtree are more than the root node
// Both subtrees of each node are also BSTs i.e. they have the above two properties

class Node {
  int? data;
  Node? left;
  Node? right;
  Node(this.data);
}

void inorderTraversal(Node? root) {
  if (root != null) {
    inorderTraversal(root.left);
    print(root.data);
    inorderTraversal(root.right);
  }
}

void preorderTraversal(Node? root) {
  if (root != null) {
    print(root.data);
    preorderTraversal(root.left);
    preorderTraversal(root.right);
  }
}

void postorderTraversal(Node? root) {
  if (root != null) {
    postorderTraversal(root.left);
    postorderTraversal(root.right);
    print(root.data);
  }
}

Node? search(Node? root, int number) {
  if (root == null) {
    return null;
  } else if (number == root.data) {
    return root;
  } else if (number < root.data!) {
    return search(root.left, number);
  } else {
    return search(root.right, number);
  }
}

Node? insert(Node? root, int number) {
  if (root == null) {
    return Node(number);
  } else if (number < root.data!) {
    root.left = insert(root.left, number);
  } else {
    root.right = insert(root.right, number);
  }
  return root;
}

Node? delete(Node? root, int key) {
  if (root == null) {
    return root;
  }
  if (key < root.data!) {
    root.left = delete(root.left, key);
  } else if (key > root.data!) {
    root.right = delete(root.right, key);
  } else {
    if (root.left == null) {
      return root.right;
    } else if (root.right == null) {
      return root.left;
    }
    root.data = minValue(root.right!);
    root.right = delete(root.right, root.data!);
  }
  return root;
}

int minValue(Node root) {
  int minv = root.data!;
  while (root.left != null) {
    minv = root.left!.data!;
    root = root.left!;
  }
  return minv;
}

Node? findClosest(Node? root, int target) {
  int closest = root!.data!;
  while (root != null) {
    if ((root.data! - target).abs() < (closest - target).abs()) {
      closest = root.data!;
    }
    if (root.data! < target) {
      root = root.right;
    } else {
      root = root.left;
    }
  }
  print("Closest element to the given element $target is");
  print(closest);
  return root;
}

bool isBST(Node? root, [int minVal = -2147483648, int maxVal = 2147483647]) {
  if (root == null) {
    return true;
  }

  if (root.data! < minVal || root.data! > maxVal) {
    return false;
  }

  return isBST(root.left, minVal, root.data! - 1) &&
      isBST(root.right, root.data! + 1, maxVal);
}

void main(List<String> args) {
  Node? root = Node(8);
  root.left = Node(30);
  root.right = Node(10);

  root.left!.left = Node(1);
  root.left!.right = Node(6);

  root.left!.right!.left = Node(4);
  root.left!.right!.right = Node(7);

  root.right!.right = Node(14);

// Tree Traversal - Inorder - Preorder - Postorder
  print("Inorder Traversal:");
  inorderTraversal(root);

  print("Preorder Traversal:");
  preorderTraversal(root);

  print("Postorder Traversal:");
  postorderTraversal(root);

  // Check whether given tree is BST
  print('');
  print(isBST(root));
  print('');

  //Searching an element
  int? number = 10;
  Node? result = search(root,
      number); // initialize result as Node type because we are searching node.

  if (result != null) {
    print('Node with search value $number found');
  } else {
    print('Node with search value $number not found');
  }

// Inser a new node in it's exact position
  root = insert(root, 5);
  print(
      "Inorder Traversal after inserting new node:"); // To view wether new node added correctly.
  inorderTraversal(root);

// Delete a new node from its position and arrange the tree after that.
  root = delete(root, 5);
  print(
      "Inorder Traversal after deleting new node:"); // To view wether node deleted correctly.
  inorderTraversal(root);

  // Find the closest node to given value
  root = findClosest(root, 0);
}
