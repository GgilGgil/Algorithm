//
//  main.swift
//  BinarySearchTree
//
//  Created by Park GilNam on 2018. 3. 14..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

import Foundation

class node<T:Equatable> {
    var value:Int? = nil
    var left:node? = nil
    var right:node? = nil
}

class binarySearchTree<T:Equatable> {
    var head = node<T>()
    
    func add(value:Int) {
        if head.value == nil {
            head.value = value
        } else {
            addNode(currentNode: head, value: value)
        }
    }
    
    func addNode(currentNode:node<T>, value:Int) {
        if currentNode.value! >= value {
            if currentNode.left != nil {
                addNode(currentNode: currentNode.left!, value: value)
            } else {
                let newNode = node<T>()
                newNode.value = value
                currentNode.left = newNode
            }
        } else {
            if currentNode.right != nil {
                addNode(currentNode: currentNode.right!, value: value)
            } else {
                let newNode = node<T>()
                newNode.value = value
                currentNode.right = newNode
            }
        }
    }
    
    func search(value:Int) -> Bool {
        if head.value == nil {
            return false
        } else {
            return searchNode(currentNode: head, value: value)
        }
    }
    
    func searchNode(currentNode:node<T>, value:Int) -> Bool {
        if currentNode.value == value {
            return true
        } else {
            if currentNode.value! >= value {
                if currentNode.left != nil {
                    return searchNode(currentNode: currentNode.left!, value: value)
                } else {
                    return false
                }
            } else {
                if currentNode.right != nil {
                    return searchNode(currentNode: currentNode.right!, value: value)
                } else {
                    return false
                }
            }
        }
    }
    
    func remove(value:Int) {
        if head.value == nil {
            print ("there is no \(value) in BST")
            return
        }
        
        if head.value == value {
            if head.left == nil && head.right == nil {
                head = node<T>()
            } else if head.left == nil && head.right != nil {
                head = head.right!
            } else if head.left != nil && head.right == nil {
                head = head.left!
            } else {
                head.value = mostLeftValueFromRightNode(currentNode: head.right)?.value
                removeNode(parent: head, currentNode: head.right, value: head.value!)
            }
        } else {
            if head.value! > value {
                _remove(parent: head, currentNode: head.left, value: value)
            } else {
                _remove(parent: head, currentNode: head.right, value: value)
            }
        }
    }
    
    func _remove(parent:node<T>, currentNode:node<T>?, value:Int) {
        if currentNode == nil {
            print ("There is no \(value) ")
            return
        }
        
        if currentNode?.value == value {
            if currentNode?.left == nil && currentNode?.right == nil {
                if parent.left?.value == currentNode?.value {
                    parent.left = nil
                } else {
                    parent.right = nil
                }
            } else if currentNode?.left == nil && currentNode?.right != nil {
                if parent.left?.value == currentNode?.value {
                    parent.left = currentNode?.right
                } else {
                    parent.right = currentNode?.right
                }
            } else if currentNode?.left != nil && currentNode?.right == nil {
                if parent.left?.value == currentNode?.value {
                    parent.left = currentNode?.left
                } else {
                    parent.right = currentNode?.left
                }
            } else {                currentNode?.value = mostLeftValueFromRightNode(currentNode: currentNode?.right)?.value
                removeNode(parent: currentNode, currentNode: currentNode?.right, value: (currentNode?.value)!)
            }
        } else {
            if (currentNode?.value)! > value {
                _remove(parent: currentNode!, currentNode: currentNode?.left, value: value)
            } else {
                _remove(parent: currentNode!, currentNode: currentNode?.right, value: value)
            }
        }
    }
    
    func mostLeftValueFromRightNode(currentNode:node<T>?) -> node<T>? {
        if currentNode?.left == nil {
            return currentNode
        } else {
            return mostLeftValueFromRightNode(currentNode: currentNode?.left)
        }
    }
    
    func removeNode(parent:node<T>?, currentNode:node<T>?, value:Int) {
        if currentNode?.value == value {
            if parent?.left?.value == currentNode?.value {
                parent?.left = nil
            } else {
                parent?.right = nil
            }
        } else {
            if (currentNode?.value)! > value {
                removeNode(parent: currentNode, currentNode: currentNode?.left, value: value)
            } else {
                removeNode(parent: currentNode, currentNode: currentNode?.right, value: value)
            }
        }
    }
}

var bst = binarySearchTree<Int>()
bst.add(value: 27)
bst.add(value: 14)
bst.add(value: 35)
bst.add(value: 10)
bst.add(value: 19)
bst.add(value: 31)
bst.add(value: 42)

print(bst.search(value: 27))
print(bst.search(value: 15))
print(bst.search(value: 31))

bst.remove(value: 31)

print(bst.search(value: 31))
