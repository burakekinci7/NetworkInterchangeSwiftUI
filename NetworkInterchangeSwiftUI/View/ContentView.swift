//
//  ContentView.swift
//  NetworkInterchangeSwiftUI
//
//  Created by Ramazan Burak Ekinci on 7.12.2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var userListViewModel :UserViewModel
    
    init() {
        self.userListViewModel = UserViewModel(service: WebService())
    }
    
    var body: some View {
        List (userListViewModel.userList,id: \.id) {users in
            VStack {
                Text(users.name)
                    .font(.title3)
                    .foregroundStyle(.blue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(users.userName)
                    .font(.title3)
                    .foregroundStyle(.green)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(users.email)
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }.task {
            await userListViewModel.downloadUsers()
        }
    }
}

#Preview {
    ContentView()
}
