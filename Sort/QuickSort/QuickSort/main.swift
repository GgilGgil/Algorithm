//
//  main.swift
//  QuickSort
//
//  Created by Park GilNam on 2018. 3. 14..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

/*
 퀵 정렬은 분할 정복(divide and conquer) 방법을 통해 리스트를 정렬한다.
 리스트 가운데서 하나의 원소를 고른다. 이렇게 고른 원소를 피벗이라고 한다.
 피벗 앞에는 피벗보다 값이 작은 모든 원소들이 오고, 피벗 뒤에는 피벗보다 값이 큰 모든 원소들이 오도록 피벗을 기준으로 리스트를 둘로 나눈다.
 이렇게 리스트를 둘로 나누는 것을 분할이라고 한다. 분할을 마친 뒤에 피벗은 더 이상 움직이지 않는다.
 분할된 두 개의 작은 리스트에 대해 재귀(Recursion)적으로 이 과정을 반복한다. 재귀는 리스트의 크기가 0이나 1이 될 때까지 반복된다.
 재귀 호출이 한번 진행될 때마다 최소한 하나의 원소는 최종적으로 위치가 정해지므로, 이 알고리즘은 반드시 끝난다는 것을 보장할 수 있다.
 
 최악의 경우에는 O(n2)번의 비교를 수행하고, 평균적으로 O(n log n)번의 비교를 수행
 */

import Foundation

//func sort(_ arr:[Int]) -> [Int] {
//    var array = arr
//
//    if array.count <= 1 {
//        return array
//    }
//
//    let pivot = array[array.count / 2]
//
//    var less:[Int] = []
//    var more:[Int] = []
//
//    var equal:Int = 0
//
//    for data in array {
//        if data < pivot {
//            less.append(data)
//        } else if data > pivot {
//            more.append(data)
//        } else {
//            equal = data
//        }
//    }
//
//    var result:[Int] = []
//    result += sort(less)
//    result.append(equal)
//    result += sort(more)
//
//    return result
//}

func sort(_ arr:[Int]) -> [Int] {
    var array = arr

    if array.count <= 1 {
        return array
    }
    
    let pivot = array[array.count / 2]
    
    var less:[Int] = []
    var more:[Int] = []
    
    var eq:[Int] = []
    
    for data in array {
        if data < pivot {
            less.append(data)
        } else if data > pivot {
            more.append(data)
        } else {
            eq.append(data)
        }
    }
    
    var result:[Int] = []
    result += sort(less)
    result += eq
    result += sort(more)
    
    return result
}

let array = [6, 7, 2, 5, 1, 4, 3, 8, 10 , 9]

print("before:\(array)")
print("after:\(sort(array))")








































