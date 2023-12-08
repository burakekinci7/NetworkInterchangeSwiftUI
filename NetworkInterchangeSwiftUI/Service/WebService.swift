//
//  WebService.swift
//  NetworkInterchangeSwiftUI
//
//  Created by Ramazan Burak Ekinci on 7.12.2023.
//

import Foundation
enum NetworkError : Error {
    case invalidUrl
    case invalidServerResponce
}

class WebService : NetworkService{
    var type: String = "webService"
    
    func downloadData (_ resource : String) async throws -> [User]{
        guard let url = URL(string: resource) else { 
            throw NetworkError.invalidUrl
        }
        
        let (data, responce ) = try await URLSession.shared.data(from: url)
        
        guard let httpResponce = responce as? HTTPURLResponse,httpResponce.statusCode == 200 else {
            throw NetworkError.invalidServerResponce
        }
        
        return try JSONDecoder().decode([User].self, from: data)
    }
}
