//
//  main.swift
//  MergeSort
//
//  Created by Park GilNam on 2018. 3. 14..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

/*
 병합 정렬은 배열을 두 부분으로 나누는 정렬 알고리즘으로 중간 바로 아래에 있습니다.
 [3,4,5,1,0,8,1]배열은 네 번째 요소 뒤에 분할되어 두 개의 하위 목록을 만듭니다.
 이 과정은 소수의 단일 요소 (정확히이 상황에서 7 개)가 서로 다른 '정렬 된'하위 목록이있을 때까지 반복됩니다.
 하나씩 요소가 비교되고 정렬 된 배열로 병합됩니다.
 
 최적 케이스 복잡성 : O (n log (n)) 최악의 경우의 복잡성 : O (n log (n))
 */

import Foundation

//func sort(_ arr:[Int]) -> [Int] {
//    var array = arr
//
//    if array.count <= 1 {
//        return array
//    }
//
//    let mid:Int = array.count / 2
//
//    let left = [Int](array[0..<mid])
//    let right = [Int](array[mid..<array.count])
//
//    var L = sort(left)
//    var R = sort(right)
//
//    var i = 0
//    var j = 0
//
//    var result:[Int] = []
//
//    while i < left.count && j < right.count {
//        if L[i] < R[j] {
//            result.append(L[i])
//            i += 1
//        } else {
//            result.append(R[j])
//            j += 1
//        }
//    }
//
//    result += L[i..<left.count]
//    result += R[j..<right.count]
//
//    return result
//}

func sort(_ arr:[Int]) -> [Int] {
    var array = arr

    if array.count <= 1 {
        return array
    }
    
    let mid = array.count / 2
    
    let left = [Int](array[0..<mid])
    let right = [Int](array[mid..<array.count])
    
    let L = sort(left)
    let R = sort(right)
    
    var i = 0, j = 0
    var result:[Int] = []
    
    while i < left.count && j < right.count {
        if L[i] < R[j] {
            result.append(L[i])
            i += 1
        } else if L[i] > R[j] {
            result.append(R[j])
            j += 1
        }
    }
    
    result += L[i..<left.count]
    result += R[j..<right.count]
    
    return result
}

let array = [6, 7, 2, 5, 1, 4, 3, 8, 10, 9]

print(sort(array))





















