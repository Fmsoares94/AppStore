//
//  Service.swift
//  appStoreJSONApis
//
//  Created by Felipe Moura Soares on 23/04/19.
//  Copyright © 2019 Felipe Moura Soares. All rights reserved.
//

import Foundation


class Service {
    
    static let shared = Service()
    
    func fetchApps(searchTerm: String, callback: @escaping ([Result], Error?) -> ()){
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        guard let url = URL(string: urlString) else {return}
    
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            
            guard let data = data else{return}
            if let err = err {
                print("Failed to fetch apps", err)
                return
            }
            
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                
                callback(searchResult.results, nil)
                
            } catch let jsonError {
                print("Failed to decode JSON", jsonError)
            }
            
            
            }.resume()
    }
}
