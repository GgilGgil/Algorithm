//
//  main.swift
//  LinkedList
//
//  Created by Park GilNam on 2018. 3. 14..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

import Foundation

class node<T:Equatable> {
    var value:T? = nil
    var next:node? = nil
}

class linkedList<T:Equatable> {
    var head = node<T>()
    
    func insert(value:T) {
        if head.value == nil {
            head.value = value
        } else {
            var lastNode = head
            
            while lastNode.next != nil {
                lastNode = lastNode.next!
            }
            
            let newNode = node<T>()
            newNode.value = value
            lastNode.next = newNode
        }
    }
    
    func remove(value:T) {
        if head.value == nil {
            return
        }
        
        if head.value == value {
            head = head.next!
            return
        }
        
        var currentNode = head
        var previousNode = node<T>()
        
        while currentNode.value != value && currentNode.next != nil {
            previousNode = currentNode
            currentNode = currentNode.next!
        }
        
        if currentNode.value == value {
            if currentNode.next != nil {
                previousNode.next = currentNode.next
            } else {
                previousNode.next = nil
            }
        }
    }
    
    func printAllKeys() {
        var currentNode:node! = head
        
        print("---------------")
        
        while currentNode != nil && currentNode.value != nil {
            print("The item is \(currentNode.value!)")
            currentNode = currentNode.next
        }
    }
}

var myList = linkedList<Int>()
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
