//
//  main.swift
//  Multiples_of_3_and_5
//
//  Created by Park GilNam on 2018. 3. 28..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

import Foundation

func multiples(n:Int) -> Int {
    
    var result = 0
    
    for i in 1..<n {
        if (i % 3) == 0 || (i % 5) == 0 {
            result += i
        }
    }
    
    return result
}

print(multiples(n: 1000))
