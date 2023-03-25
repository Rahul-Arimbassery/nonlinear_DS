// Binary Tree - Creation - Inorder - Preorder - Postorder Traversals...
class Node {
  int? data;
  Node? left;
  Node? right;
  Node(this.data);
}

inorderTraversal(Node? root) {
  //  LEFT ROOT RIGHT  //
  if (root == null) return;
  inorderTraversal(root.left);
  print(root.data);
  inorderTraversal(root.right);
}

preorderTraversal(Node? root) {
  //   ROOT LEFT RIGHT  //
  if (root == null) return;
  print(root.data);
  inorderTraversal(root.left);
  inorderTraversal(root.right);
}

postTraversal(Node? root) {
  //    LEFT RIGHT  ROOT  //
  if (root == null) return;
  inorderTraversal(root.left);
  inorderTraversal(root.right);
  print(root.data);
}

void main(List<String> args) {
  Node root = Node(1);

  root.left = Node(2);
  root.right = Node(3);

  root.left!.left = Node(4);
  root.left!.right = Node(5);

  root.right!.left = Node(6);
  root.right!.right = Node(7);

  print('        ${root.data}');
  print(' ');
  print('   ${root.left?.data}         ${root.right?.data}');
  print(' ');
  print(
      '${root.left?.left?.data}    ${root.left?.right?.data}     ${root.right?.left?.data}    ${root.right?.right?.data}');

  print(' ');
  print('Output of Inorder traversal is');
  inorderTraversal(root);

  print(' ');
  print('Output of Preorder traversal is');
  preorderTraversal(root);

  print(' ');
  print('Output of Postorder traversal is');
  postTraversal(root);
}
