//
//  main.swift
//  Queue
//
//  Created by Park GilNam on 2018. 3. 14..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

import Foundation

struct queue<Int> {
    var list:[Int] = [Int]()
    
    mutating func enqueue(_ element:Int) {
        list.append(element)
    }
    
    mutating func dequeue() -> Int? {
        if list.isEmpty == false {
            return list.removeFirst()
        } else {
            return nil
        }
    }
    
    func peek() -> Int? {
        if list.isEmpty == false {
            return list[0]
        } else {
            return nil
        }
    }
    
    func isEmpty() -> Bool {
        return list.isEmpty
    }
}

var collection = queue<Int>()

collection.enqueue(10)
collection.enqueue(11)
collection.enqueue(12)
collection.enqueue(13)
collection.enqueue(14)
collection.enqueue(15)

print(collection)

print(collection.dequeue())

print(collection)

print(collection.peek())

print(collection.isEmpty())


