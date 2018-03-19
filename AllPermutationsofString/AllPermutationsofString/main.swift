//
//  main.swift
//  AllPermutationsofString
//
//  Created by Park GilNam on 2018. 3. 18..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

//문자열의 모든 순열 찾기

import Foundation

func permutations(word:String) -> [String]{
    if word.count <= 1 {
        return [word]
    }
    
    let permus = permutations(word: String(word[word.index(word.startIndex, offsetBy: 1)...]))
    let char = String(word[word.index(word.startIndex, offsetBy: 0)...word.index(word.startIndex, offsetBy: 0)])
    
    var result = [String]()
    
    for permu in permus {
        let count:Int = permu.count
        for i in 0..<count {
            result.append(String(permu[i]) + char + String(permu[i]))
        }

    }
    return result
}

print(permutations(word: "LES"))
