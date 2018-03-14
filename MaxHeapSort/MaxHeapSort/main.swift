//
//  main.swift
//  MaxHeapSort
//
//  Created by Park GilNam on 2018. 3. 14..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

import Foundation

func heapify(arr:[Int]) {
    
    var array = arr
    
    var p = array.count / 2 - 1
    
    while p >= 0 {
        array = shiftDown(arr: array, p: p)
        p -= 1
    }
    
    print(array)
}

func shiftDown(arr:[Int], p:Int) -> [Int] {
    
    var array = arr
    
    let left = 2 * p + 1
    let right = 2 * p + 2
    var largest = p
    
    let size = arr.count
    
    if left <= size - 1 && array[left] > array[p] {
        largest = left
    }
    
    if right <= size - 1 && array[right] > array[largest] {
        largest = right
    }
    
    if largest != p {
        array.swapAt(p, largest)
        array = shiftDown(arr: array, p: largest)
    }
    
    return array
}

let array = [6, 2, 4, 9, 7, 5, 8]

print(array)
heapify(arr: array)

