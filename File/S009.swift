//  Created by XuWeida on 2017/03/13.
//  Copyright © 2017年 Xuweda. All rights reserved.
//後50分
class ReadMessage {
    private var arrayLength: Int = 0
    private var convertTypeCount: Int = 0
    private var initialArray: [Int] = []
    private var convertArray: [[Int]] = []
    init(_ stringLineArray: [String]) {
        arrayLength = Int(stringLineArray[0])!
        convertTypeCount = Int(stringLineArray[2])!
        initialArray = readArray(nowArrayString: stringLineArray[1])
        for i in 0..<convertTypeCount {
            convertArray += [readArray(nowArrayString: stringLineArray[i+3])]
        }
    }
    func getInstanceMessage() {
        print("arrayLength : \(arrayLength)")
        print("convertTypeCount: \(convertTypeCount)")
        print("initialArray:", initialArray)
        print("convertArray:", convertArray)
    }
    func getArrayLength() -> Int {
        return arrayLength
    }
    func getConvertTypeCount() -> Int {
        return convertTypeCount
    }
    func getInitialArray() -> [Int] {
        return initialArray
    }
    func getconvertArrayInArray() -> [[Int]] {
        return convertArray
    }
    private func readArray(nowArrayString: String) -> [Int] {
    //数列を読み取る
        var returnArray: [Int] = []
        for char in nowArrayString.characters {
            if let num = Int(String(char)) {
                returnArray += [num]
            }
        }
        return returnArray
    }
}

class ComparisonAndConvertToNew {
    private var nowArray: [Int] = []
    private var convertArray: [Int] = []
    private var newArray: [Int] = []
    private var arrayLength = 0
    init(_ nowArray: [Int], _ convertArray: [Int], _ length: Int) {
        self.nowArray = nowArray
        self.convertArray = convertArray
        arrayLength = length
    }
    func getNewArray() -> [Int] {
        var returnArray: [Int] = []
        for _ in 0..<arrayLength {
            returnArray += [0]
        }
       // return  returnArray
        var nowCount = 0
        for arrayNum in convertArray {
            returnArray[arrayNum-1] = nowArray[nowCount]
            nowCount += 1
            //return  returnArray
        }
        return  returnArray
    }
}




var stringLineArray: [String] = []
while let string = readLine() {
    stringLineArray += [string]
}
//print(stringLineArray)
let getLineInformation = ReadMessage(stringLineArray)
getLineInformation.getInstanceMessage()
let initialArray = getLineInformation.getInitialArray()
let convertArrayInArray = getLineInformation.getconvertArrayInArray()
let length = getLineInformation.getArrayLength()
print(initialArray,convertArrayInArray[0])
let initConvertedByPOne = ComparisonAndConvertToNew(initialArray, convertArrayInArray[0], length)
let afterPOne = initConvertedByPOne.getNewArray()
print(afterPOne)