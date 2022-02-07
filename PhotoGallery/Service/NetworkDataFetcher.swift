//
//  NetworkDataFetcher.swift
//  PhotoGallery
//
//  Created by MacBookPro on 07.02.2022.
//

import Foundation

class NetworkDataFetcher {
    
    var networService = NetworkService()
    
    func getImages(searchTerm: String, completion: @escaping (SearchResults?) -> ()) {
        networService.request(searchTerm: searchTerm) { data, error in
            if let error = error {
                print("Error received requesting data\(error.localizedDescription)")
                completion(nil)
            }
            let decode = self.decodeJSON(type: SearchResults.self, from: data)
            completion(decode)
            
        }
    }
    
    func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        
        guard let data = from else { return nil }
        
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON", jsonError)
            return nil
        }
    }
}
