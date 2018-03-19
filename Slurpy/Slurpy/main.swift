//
//  main.swift
//  Slurpy
//
//  Created by Park GilNam on 2018. 3. 19..
//  Copyright © 2018년 ParkGilNam. All rights reserved.
//

/*
 스럼프(Slump)는 다음 속성을 갖는 문자열이다.
 1. 첫 번째 문자가 'D' 또는 'E'이다.
 2. 첫 번째 문자 뒤에는 하나 이상의 'F'가 나온다.
 3. 하나 이상의 'F' 뒤에는 또 다른 스럼프나 'G'가 온다. 스럼프는 'F' 끝에 오는 스럼프나 'G'로끝난다.
    예를 들어, DFFEFFFG는 첫 번째 문자가 'D'로 시작하고 두 개의 'F'가 나오며, 또 다른스럼프 'EFFFG'로 끝난다.
 4. 위의 경우가 아니면 스럼프가 아니다.
 
 스림프(Slimp)는 다음 속성을 갖는 문자열이다.
 1. 첫 번째 문자는 'A'이다.
 2. 두 개의 문자로만 된 스림프면, 두 번째 문자는 'H'이다.
 3. 두 개의 문자로 된 스림프가 아니면 다음 형식 중의 하나가 된다.
 4. 'A' + 'B' + 스림프 + 'C'.
 5. 'A' + 스럼프 + 'C'.
 6. 위의 경우가 아니면 스림프가 아니다.
 
 스러피(Slurpy)는 스림프(Slimp) 뒤에 스럼프(Slump)로 구성되는 문자열이다.
 */

import Foundation

func isValidSlurpy(_ string: String) -> String{
    
    if string.count < 2 {
        return "NO"
    }
    
    var offset = 0
    
    offset = isValidSlimp(string, offset)
    
    if offset == -1 {
        return "NO"
    } else {

        if offset == 0 {
            return "YES"
        }
        
        offset = isValidSlump(string, offset)
        
        if offset == string.count - 1 {
            return "YES"
        } else  {
            return "NO"
        }
    }
}

func isValidSlimp(_ string:String, _ offset:Int) -> Int {
    
    var tempOffset = offset
    var index = string.index(string.startIndex, offsetBy: tempOffset)
    
    if string[index] == "A" {
        tempOffset += 1
        index = string.index(string.startIndex, offsetBy: tempOffset)
        
        if string[index] == "H" {
            tempOffset += 1
            return tempOffset
            
        } else if string[index] == "B" {
            tempOffset += 1
            tempOffset = isValidSlimp(string, tempOffset)
            
            if tempOffset == -1 {
                return -1
            } else {
                index = string.index(string.startIndex, offsetBy: tempOffset)
                if string[index] == "C" {
                    return 0
                } else {
                    return -1
                }
            }
        } else {
            tempOffset = isValidSlump(string, tempOffset)
            
            if tempOffset == -1 {
                return -1
            } else {
                tempOffset += 1
            }
            
            index = string.index(string.startIndex, offsetBy: tempOffset)
            
            if string[index] == "C" {
                return 0
            } else {
                return -1
            }
        }
    } else {
        return -1
    }
}

func isValidSlump(_ string:String, _ offset:Int) -> Int {
    var tmpOffset = offset
    var index = string.index(string.startIndex, offsetBy: tmpOffset)
    
    if string[index] == "D" || string[index] == "E" {
        tmpOffset += 1
        index = string.index(string.startIndex, offsetBy: tmpOffset)
    
        if string[index] == "F" {
            while true {
                tmpOffset += 1
                index = string.index(string.startIndex, offsetBy: tmpOffset)
            
                if string[index] != "F" {
                    if string[index] == "G" {
                        return tmpOffset
                    } else {
                        tmpOffset = isValidSlump(string, tmpOffset)
                        
                        if tmpOffset == -1 {
                            return -1
                        } else {
                            return tmpOffset
                        }
                    }
                }
            }
        } else {
            return -1
        }
    } else {
        return -1
    }
}

let count = readLine().map{ Int($0)! }!

var strings:[String] = [String]()

for _ in 0..<count {
    let string = readLine()!
    strings.append(string)
}

print("==============")
print("SLURPYS OUTPUT")
for string in strings.enumerated() {
    print(isValidSlurpy(string.element))
}
print("END OF OUTPUT")
print("==============")
