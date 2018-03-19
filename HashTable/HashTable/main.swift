//
//  main.swift
//  HashTable
//
//  Created by Park GilNam on 2018. 3. 19..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

import Foundation

struct HashTable<Key:Hashable, Value> {
    private typealias Element = (key:Key, value:Value)
    private typealias Bucket = [Element]
    private var Buckets:[Bucket]
    
    private(set) public var count = 0
    
    public var isEmpty:Bool {
        return count == 0
    }
    
    public init(capacity:Int) {
        assert(capacity > 0)
        Buckets = Array<Bucket>(repeatElement([], count: capacity))
    }
    
    public subscript(key: Key) -> Value? {
        get {
            return value(forKey: key)
        }
        set {
            if let value = newValue {
                updateValue(value, forKey: key)
            } else {
                removeValue(forKey: key)
            }
        }
    }
    
    public func value(forKey key:Key) -> Value? {
        let index = self.index(forKey: key)
        
        for element in Buckets[index] {
            if element.key == key {
                return element.value
            }
        }
        
        return nil
    }
    
    @discardableResult public mutating func updateValue(_ value:Value, forKey key:Key) -> Value? {
        let index = self.index(forKey: key)
        
        for (i, element) in Buckets[index].enumerated() {
            if element.key == key {
                let oldValue = element.value
                Buckets[index][i].value = value
                return oldValue
            }
        }
        
        Buckets[index].append((key: key, value: value))
        count += 1
        return nil
    }
    
    @discardableResult public mutating func removeValue(forKey key:Key) -> Value? {
        let index = self.index(forKey: key)
        
        for (i, element) in Buckets[index].enumerated() {
            if element.key == key {
                Buckets[index].remove(at: i)
                count -= 1
                return element.value
            }
        }
        
        return nil
    }
    
    public mutating func removeAll() {
        Buckets = Array<Bucket>(repeatElement([], count: Buckets.count))
        count = 0
    }
    
    private func index(forKey key:Key) -> Int {
        return abs(key.hashValue) % Buckets.count
    }
}

extension HashTable: CustomStringConvertible {
    public var description: String {
        let pairs = Buckets.flatMap{ b in b.map { e in "\(e.key) = \(e.value)" }}
        return pairs.joined(separator: ", ")
    }
    
    public var debugDescription: String {
        var str = ""
        
        for (i, Bucket) in Buckets.enumerated() {
            let pairs = Bucket.map { e in "\(e.key) = \(e.value)" }
            str += "bucket \(i): " + pairs.joined(separator: ", ") + "\n"
        }
        
        return str
    }
}

var hashTable = HashTable<String, String>(capacity: 5)
hashTable["firstName"] = "Steve"
hashTable["lastName"] = "Jim"
hashTable["address"] = "Korea"
hashTable["phoneNumber"] = "010-1111-2222"

print(hashTable.description)
print(hashTable.debugDescription)
