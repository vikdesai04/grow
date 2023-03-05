//
//  RoutingView.swift
//  grow-ios
//
//  Created by Sahil Ambardekar on 8/13/20.
//  Copyright © 2020 hackthis. All rights reserved.
//

import SwiftUI

final class ViewRouter: ObservableObject {
    @Published var currentPage: String = "none"
}

final class UserDataWrapper: ObservableObject {
    @Published var userData: UserData?
}

struct RoutingView: View {
    @ObservedObject var viewRouter: ViewRouter
    @ObservedObject var userDataWrapper: UserDataWrapper = UserDataWrapper()
    var body: some View {
        VStack {
            if viewRouter.currentPage == "login" {
                Login(viewRouter: viewRouter, userDataWrapper: userDataWrapper)
            } else if viewRouter.currentPage == "home" {
                Home(userData: userDataWrapper.userData!)
            }
        }.onAppear() {
            if UserData.isLoggedIn() {
                UserData.dataForLoggedInUser { (userData) in
                    self.userDataWrapper.userData = userData
                    self.viewRouter.currentPage = "home"
                }
            } else {
                self.viewRouter.currentPage = "login"
            }
        }
    }
}

