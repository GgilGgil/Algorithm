//
//  main.swift
//  MaxHeapSort
//
//  Created by Park GilNam on 2018. 3. 14..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

import Foundation

//func heapify(arr:[Int]) {
//
//    var array = arr
//
//    var p = array.count / 2 - 1
//
//    while p >= 0 {
//        array = shiftDown(arr: array, p: p)
//        p -= 1
//    }
//
//    print(array)
//}
//
//func shiftDown(arr:[Int], p:Int) -> [Int] {
//
//    var array = arr
//
//    let left = 2 * p + 1
//    let right = 2 * p + 2
//    var largest = p
//
//    let size = arr.count
//
//    if left <= size - 1 && array[left] > array[p] {
//        largest = left
//    }
//
//    if right <= size - 1 && array[right] > array[largest] {
//        largest = right
//    }
//
//    if largest != p {
//        array.swapAt(p, largest)
//        array = shiftDown(arr: array, p: largest)
//    }
//
//    return array
//}

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

    let size = array.count
    
    let left = 2 * p + 1
    let right = 2 * p + 2
    
    var large = p
    
    if left <= size - 1 && array[left] > array[large] {
        large = left
    }
    
    if right <= size - 1 && array[right] > array[large] {
        large = right
    }
    
    if large != p {
        let temp = array[large]
        array[large] = array[p]
        array[p] = temp
        
        array = shiftDown(arr: array, p: large)
    }
    
    return array
}

let array = [5, 13, 2, 25, 7, 17, 100, 20, 1, 8, 4]

print(array)
heapify(arr: array)





















