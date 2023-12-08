//
//  UserViewModel.swift
//  NetworkInterchangeSwiftUI
//
//  Created by Ramazan Burak Ekinci on 7.12.2023.
//

import Foundation

class UserViewModel :ObservableObject {
    //Published -> like live brodcast
    @Published var userList = [ViewModel]()
    
    let service : NetworkService
    
    init(service: NetworkService) {
        self.service = service
    }
    func downloadUsers () async  {
        //determinate which class you come from
        var res = ""
        if service.type == "webService" {
            res =  Constants.Urls.getUser
        }else {
            res = Constants.Path.baseUrl
        }
        
        //connct serivce and view
        do{
            let users = try await service.downloadData(res)
            
            DispatchQueue.main.async {
                self.userList = users.map(ViewModel.init)
            }
        }catch{
            print(error)
        }
    }
}

struct ViewModel {
    let user : User
    
    var id : Int {
        user.id
    }
    
    var name : String {
        user.name
    }
    
    var userName : String {
        user.username
    }
    
    var email : String {
        user.email
    }
}
