//
//  main.swift
//  LinkedList
//
//  Created by Park GilNam on 2018. 3. 14..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

import Foundation

//class node<T:Equatable> {
//    var value:T? = nil
//    var next:node? = nil
//}
//
//class linkedList<T:Equatable> {
//    var head = node<T>()
//
//    func insert(value:T) {
//        if head.value == nil {
//            head.value = value
//        } else {
//            var lastNode = head
//
//            while lastNode.next != nil {
//                lastNode = lastNode.next!
//            }
//
//            let newNode = node<T>()
//            newNode.value = value
//            lastNode.next = newNode
//        }
//    }
//
//    func remove(value:T) {
//        if head.value == nil {
//            return
//        }
//
//        if head.value == value {
//            if head.next == nil {
//                head.value = nil
//            } else {
//                head = head.next!
//            }
//
//            return
//        }
//
//        var currentNode = head
//        var previousNode = node<T>()
//
//        while currentNode.value != value && currentNode.next != nil {
//            previousNode = currentNode
//            currentNode = currentNode.next!
//        }
//
//        if currentNode.value == value {
//            if currentNode.next != nil {
//                previousNode.next = currentNode.next
//            } else {
//                previousNode.next = nil
//            }
//        }
//    }
//
//    func printAllKeys() {
//        var currentNode:node! = head
//
//        print("---------------")
//
//        while currentNode != nil && currentNode.value != nil {
//            print("The item is \(currentNode.value!)")
//            currentNode = currentNode.next
//        }
//    }
//}

class Node<T:Equatable> {
    var value:T?
    var next:Node?
}

class LinkedList<T:Equatable> {
    var head:Node = Node<T>()
    
    func insert(value:T) {
        if head.value == nil {
            head.value = value
            return
        }
        
        var current = head
        
        while current.next != nil {
            current = current.next!
        }
        
        let new = Node<T>()
        new.value = value
        
        current.next = new
    }
    
    func remove(value:T) {
        if head.value == nil {
            return
        }
        
        if head.value == value {
            if head.next != nil {
                head = head.next!
            } else {
                head.value = nil
            }
        }
        
        var current = head
        var prev = Node<T>()
        
        while current.value != value && current.next != nil {
            prev = current
            current = current.next!
        }
        
        if current.value == value {
            if current.next != nil {
                prev.next = current.next
            } else {
                prev.next = nil
            }
        }
    }
    
    func printAllKeys() {
        var current = head
        
        print("=========")
        
        while current.next != nil {
            if let value = current.value {
                print(value)
            }
            
            current = current.next!
        }
        
        if let value = current.value {
            print(value)
        }
    }
    
    func isValue(value:T) -> Bool {
        var current = head
        
        while current.next != nil {
            if current.value == value {
                return true
            }
            
            current = current.next!
        }
        
        if current.value == value {
            return true
        }
        
        return false
    }
}

var myList = LinkedList<Int>()
myList.insert(value: 10)
myList.insert(value: 20)
myList.insert(value: 30)
myList.insert(value: 40)
myList.insert(value: 50)
myList.printAllKeys()
myList.remove(value: 40)
myList.printAllKeys()
myList.insert(value: 100)
myList.printAllKeys()
print(myList.isValue(value: 20))
print(myList.isValue(value: 100))


















