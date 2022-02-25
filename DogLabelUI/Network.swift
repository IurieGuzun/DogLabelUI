//
//  Network.swift
//  DogLabelUI
//
//  Created by Iurie Guzun on 2022-02-24.
//

import Foundation
import SwiftUI

class Network: ObservableObject {
    
    @Published var breed = " "
    @Published var dogImage: UIImage?
    
    enum Endpoint: String {
        case randomImageFreomAllDogs = "https://dog.ceo/api/breeds/image/random"
        
        // Computed property
        var url: URL {
            return URL(string: self.rawValue)!
        }
      }

 func mainRequest() {
            let randomImageEndpoint = Network.Endpoint.randomImageFreomAllDogs.url
            let task = URLSession.shared.dataTask(with: randomImageEndpoint) { data, response, error in
            guard let validData = data else {
                print("Error: No vald data for image location")
                return
            }
            print("validData = ",validData)
            
            // Create JSON decoder using its initializer
            let decoder = JSONDecoder()
            
            // Create an instance of the DogImage struct, use type infererence of type DogImage
            // self means we're refering the definition of the DogImage struct
            let imageData = try! decoder.decode(DogImage.self, from: validData)
            
            print("imageData =", imageData)
                DispatchQueue.main.async {
                    self.breed = imageData.message
                    self.requestImageFile(url: URL(string: self.breed)!)
                }
          }

        task.resume()
    }
    
 func requestImageFile(url: URL) {
        let task = URLSession.shared.dataTask(with: url)  { data, responce, error in
            guard let data = data else {
                print("Error: No data for image load")
                return
            }
            let downloadedImage = UIImage(data: data)
            DispatchQueue.main.async {
                self.dogImage = downloadedImage
            }
           
            }
        task.resume()
    }
}
    
