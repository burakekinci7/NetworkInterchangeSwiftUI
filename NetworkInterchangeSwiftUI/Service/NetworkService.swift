//
//  NetworkService.swift
//  NetworkInterchangeSwiftUI
//
//  Created by Ramazan Burak Ekinci on 8.12.2023.
//

import Foundation

/// abstract class - used to LocalService and WebService
protocol NetworkService {
    func downloadData (_ resource : String) async throws -> [User]
    var type : String { get }
}
