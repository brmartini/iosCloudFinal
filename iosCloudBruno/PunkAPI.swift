//
//  PunkAPI.swift
//  iosCloudBruno
//
//  Created by user129281 on 7/20/17.
//  Copyright © 2017 BRMART. All rights reserved.
//

import Foundation
import UIKit
class PunkAPI{
    static let basePath = "https://api.punkapi.com/v2/beers"
    
    // Cria conexão com configurações personalizadas
    static let config: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        
        config.allowsCellularAccess = false
        config.httpAdditionalHeaders = [
            "Content-type": "application/json"
        ]
        config.timeoutIntervalForRequest = 30.0
        config.httpMaximumConnectionsPerHost = 1
        
        return config
    }()
    
    static let session = URLSession(configuration: config)
    
    // GET
    static func getBeers(onComplete: @escaping ([Punk]?) -> Void) {
        
        guard let url = URL(string: basePath) else {
            onComplete(nil)
            return
        }
        
        session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                onComplete(nil)
            } else {
                guard let response = response as? HTTPURLResponse else {
                    onComplete(nil)
                    return
                }
                
                if response.statusCode == 200 {
                    guard let data = data else {
                        onComplete(nil)
                        return
                    }
                    
                    let json = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions()) as! [[String: Any]]
                    
                    var beers: [Punk] = []
                    
                    for item in json {
                        guard let name = item["name"] as! String? else { return }
                        guard let image_url = item["image_url"] as! String? else { return }
                        guard let tagline = item["tagline"] as! String? else { return }
                        guard let abv = item["abv"] as! Double? else { return }
                        var ibu: String
                        if item["ibu"] is NSNull {
                            ibu = "N/A"
                        } else {
                            ibu = String((item["ibu"] as! Int?)!)
                        }
                        guard let description = item["description"] as! String? else { return }
                        
                        let beer = Punk(name, image_url, tagline, abv, ibu, description)
                        beers.append(beer)
                    }
                    onComplete(beers)
                    return
                } else {
                    onComplete(nil)
                    return
                }
            }
            }.resume()
    }
    
    static func getBeerPicture(beerImageUrl: String, onComplete: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: beerImageUrl) else {
            onComplete(nil)
            return
        }
        
        session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if error != nil {
                onComplete(nil)
            } else {
                guard let response = response as? HTTPURLResponse else {
                    onComplete(nil)
                    return
                }
                
                if response.statusCode == 200 {
                    guard let data = data else {
                        onComplete(nil)
                        return
                    }
                    
                    onComplete(UIImage(data: data))
                    return
                } else {
                    onComplete(nil)
                    return
                }
            }
            }.resume()
    }
}
