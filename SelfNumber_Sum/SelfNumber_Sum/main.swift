//
//  main.swift
//  SelfNumber_Sum
//
//  Created by Park GilNam on 2018. 3. 19..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

import Foundation

func d_fn(n:Int) -> Int{
    let str_n = String(n)
    
    var generator = 0
    
    for i in str_n {
        let int_i = Int(String(i))!
        
        generator += int_i
    }
    
    return n + generator
}

var generators = [Int]()

for i in 1...5000 {
    let generator = d_fn(n: i)
    generators.append(generator)
}

let numbers = Set<Int>(1...5000)
let self_numbers = numbers.subtracting(generators)

print(self_numbers.reduce(0, +))

