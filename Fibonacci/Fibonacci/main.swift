//
//  main.swift
//  Fibonacci
//
//  Created by 박길남 on 02/11/2018.
//  Copyright © 2018 swieeft. All rights reserved.
//

import Foundation

class matrix {
    var data:[[Double]] = Array(repeating: Array(repeating: 0, count: 2), count: 2)
    
    init() {
        self.data[0][0] = 1
        self.data[0][1] = 1
        self.data[1][0] = 1
        self.data[1][1] = 0
    }
}

func multi(A:matrix, B:matrix) -> matrix {
    let result = matrix()
    
    result.data[0][0] = (A.data[0][0] * B.data[0][0]) + (A.data[0][1] * B.data[1][0])
    result.data[0][1] = (A.data[0][0] * B.data[1][0]) + (A.data[0][1] * B.data[1][1])
    result.data[1][0] = (A.data[1][0] * B.data[0][0]) + (A.data[1][1] * B.data[1][0])
    result.data[1][1] = (A.data[1][0] * B.data[1][0]) + (A.data[1][1] * B.data[1][1])
    
    return result
}

func calcu(A:matrix, n:Int) -> matrix {
    var a = A
    
    if n > 1 {
        a = calcu(A: a, n: n/2)
        a = multi(A: a, B: a)
        
        if n % 2 == 1 {
            let B:matrix = matrix()
            a = multi(A: a, B: B)
        }
    }
    
    return a
}

func fibonacci(n:Int) -> Double {
    if n == 0 {
        return 0
    }
    
    var A:matrix = matrix()
    A = calcu(A:A, n:n)
    
    return A.data[0][1]
}


print(fibonacci(n: 100))
