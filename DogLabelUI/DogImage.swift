//
//  DogImage.swift
//  DogLabelUI
//
//  Created by Iurie Guzun on 2022-02-24.
//

import Foundation

// DogImage needs to conform to Codable Protocol
struct DogImage: Codable {
    let status: String
    let message: String
}
