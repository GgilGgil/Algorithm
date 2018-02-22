//
//  main.swift
//  compareTheTriplets
//
//  Created by Park GilNam on 2018. 2. 22..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

import Foundation

let alice = readLine()!.components(separatedBy: " ").map{ Int($0)! }
let bob = readLine()!.components(separatedBy: " ").map{ Int($0)! }

let alicePoint = zip(alice, bob).filter(>).count
let bobPoint = zip(bob, alice).filter(>).count

print("\(alicePoint) \(bobPoint)")
