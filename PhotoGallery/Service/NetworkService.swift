//
//  NetworkService.swift
//  PhotoGallery
//
//  Created by MacBookPro on 06.02.2022.
//

import Foundation

class NetworkService {
    
    func request(searchTerm: String, completion: (Data?, Error?) -> Void) {
        let parametrs = self.prepareParametrs(searchTearm: searchTerm)
        let url = self.url(params: parametrs)
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = prepareHeaders()
        request.httpMethod = "get"
    }
    
    private func prepareHeaders() -> [String: String]? {
        var headers = [String: String]()
        headers["Authorization"] = "Client-ID bM-wxjCBp2bjkyZqNVQyjUpeujLUS22-NNNS0n7Pil0"
        
        return headers
    }
    
    private func prepareParametrs(searchTearm: String?) -> [String: String] {
        var parametrs = [String: String]()
        parametrs["query"] = searchTearm
        parametrs["page"] = String(1)
        parametrs["per_page"] = String(30)
        return parametrs
    }
    
    private func url(params: [String: String]) -> URL {
        var components = URLComponents()
        
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/search/photos"
        components.queryItems = params.map{ URLQueryItem(name: $0, value: $1) }
        
        return components.url!
    }
    
    private func creatDataTask(from request: URLRequest, completion: (Data?, Error?) -> Void) -> URLSessionDataTask {
        
    }
}
