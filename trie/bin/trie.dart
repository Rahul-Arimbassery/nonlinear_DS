// Trie data structure
class Trie {
  Map<String, dynamic> root = {};

  void insert(String word) {
    Map<String, dynamic> node = root;
    for (var i = 0; i < word.length; i++) {
      String c = word[i];
      if (!node.containsKey(c)) {
        node[c] = <String, dynamic>{};
      }
      node = node[c];
    }
    node['isendofword'] = true;
    
  }

  bool search(String word) {
    Map<String, dynamic> node = root;
    for (var i = 0; i < word.length; i++) {
      String c = word[i];
      if (!node.containsKey(c)) {
        return false;
      }
      node = node[c];
    }
    return node.containsKey('isendofword');
  }



bool delete(String word) {
    Map<String, dynamic> node = root;
    List<Map<String, dynamic>> stack = [];
    for (var i = 0; i < word.length; i++) {
      String c = word[i];
      if (!node.containsKey(c)) {
        return false;
      }
      stack.add(node);
      node = node[c];
    }
    if (!node.containsKey('isendofword')) {
      return false;
    }
    node.remove('isendofword');
    if (node.isNotEmpty) {
      return true;
    }
    for (var i = stack.length - 1; i >= 0; i--) {
      Map<String, dynamic> curr = stack[i];
      String c = word[i];
      if (curr[c].isNotEmpty) {
        break;
      }
      curr.remove(c);
    }
    return true;
  }
}

void main(List<String> args) {
  Trie trie = new Trie();

  //Inserting strings by checking whether it is already there
  trie.insert("cat");
  trie.insert("car");
  trie.insert("house");
  print(trie.root);

  //check a word is there or not
  print(trie.search("cat")); // true
  print(trie.search("car")); // true
  print(trie.search("dog")); // false

//Delete a word from trie
  trie.delete("cat");
  print(trie.search("cat")); // false
  print(trie.search("car")); // true
}
