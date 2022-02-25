//
//  Helper.swift
//  DogLabelUI
//
//  Created by Iurie Guzun on 2022-02-24.
//

import Foundation

func extractBreed(str: String) -> String {
    if str == " " {return " "}
    var start = str.index(str.startIndex, offsetBy: 30)
    var end = str.index(str.endIndex, offsetBy: 0)
    var range = start..<end

    let cutedString = str[range]
    print(str)
    print(cutedString)
    
    start = cutedString.index(cutedString.startIndex, offsetBy: 0)
    end = cutedString.firstIndex(of: "/")!
    range = start..<end

    let breedString = cutedString[range].capitalized

    print("breedString = ", breedString)

    return breedString
}
