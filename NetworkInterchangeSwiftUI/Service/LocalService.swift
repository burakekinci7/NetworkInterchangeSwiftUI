//
//  LocalService.swift
//  NetworkInterchangeSwiftUI
//
//  Created by Ramazan Burak Ekinci on 8.12.2023.
//

import Foundation

class LocalService : NetworkService{
    // Api/users.json file
    var type: String = "localService"
    
    func downloadData (_ resource : String) async throws -> [User]{
        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else { fatalError("Fatal") }
        
        let data = try Data(contentsOf: URL(filePath: path))
        
        return try JSONDecoder().decode([User].self, from: data)
    }
}
