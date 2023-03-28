// Convert Sorted Array to Binary Search Tree  = Question 1
// https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/

// class TreeNode {
//   int? val;
//   TreeNode? left;
//   TreeNode? right;

//   TreeNode(this.val);
// }

// TreeNode? sortedArrayToBST(List<int> nums) {
//   if (nums.isEmpty) {
//     return null;
//   }
//   int mid = nums.length ~/ 2;
//   TreeNode root = TreeNode(nums[mid]);
//   root.left = sortedArrayToBST(nums.sublist(0, mid));
//   root.right = sortedArrayToBST(nums.sublist(mid + 1));
//   return root;
// }

// void main() {
//   List<int> nums = [1, 2, 3, 4, 5, 6, 7];
//   TreeNode? root = sortedArrayToBST(nums);
//   if (root != null) {
//     print(root.val); // Output: 4
//   } else {
//     print("The root is null.");
//   }
// }

// n this challenge, you are required to implement inorder traversal of a tree.  Question 2
// https://www.hackerrank.com/challenges/tree-inorder-traversal/problem?isFullScreen=true

// class TreeNode {
//   int? val;
//   TreeNode? left;
//   TreeNode? right;

//   TreeNode(this.val);
// }

// TreeNode? sortedArrayToBST(List<int> nums) {
//   if (nums.isEmpty) {
//     return null;
//   }
//   int mid = nums.length ~/ 2;
//   TreeNode root = TreeNode(nums[mid]);
//   root.left = sortedArrayToBST(nums.sublist(0, mid));
//   root.right = sortedArrayToBST(nums.sublist(mid + 1));
//   return root;
// }

// void printInorder(TreeNode? node) {
//   if (node != null) {
//     printInorder(node.left);
//     print(node.val);
//     printInorder(node.right);
//   }
// }


// void main() {
//   List<int> nums = [1, 2, 3, 4, 5, 6, 7];
//   TreeNode? root = sortedArrayToBST(nums);
//   if (root != null) {
//     printInorder(root); // Output: 1 2 3 4 5 6 7
//   } else {
//     print("The root is null.");
//   }
// }

//https://leetcode.com/problems/kth-largest-element-in-a-stream/ - question 3
class KthLargest {
  final int k;
  final List<int> elements;

  KthLargest(this.k, List<int> nums)
      : elements = List.from(nums)..sort((a, b) => b.compareTo(a));

  int add(int val) {
    int i = 0;
    while (i < elements.length && val < elements[i]) {
      i++;
    }
    elements.insert(i, val);
    if (elements.length > k) {
      elements.removeLast();
    }
    return elements.last;
  }
}

void main() {
  final kthLargest = KthLargest(3, [4, 5, 8, 2]);
  print(kthLargest.add(3)); // Output: 4
  print(kthLargest.add(9)); // Output: 5
  print(kthLargest.add(1)); // Output: 5
  print(kthLargest.add(7)); // Output: 7
}


