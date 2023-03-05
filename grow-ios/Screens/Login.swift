//
//  Login.swift
//  grow-ios
//
//  Created by Sahil Ambardekar on 8/10/20.
//  Copyright © 2020 hackthis. All rights reserved.
//

import SwiftUI

struct Background<Content: View>: View {
    private var content: Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        Color.white
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .overlay(content)
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


struct Login: View {
    @State var name: String = ""
    @State var plantCode: String = ""
    @ObservedObject var viewRouter: ViewRouter
    @ObservedObject var userDataWrapper: UserDataWrapper
    var body: some View {
        Background {
            VStack(alignment: .leading) {
                LoginHeader().padding(.top, 50)
                LoginField(title: "who are you?", placeholder: "name", text: self.$name).padding(.top, 50)
                LoginField(title: "what is your plant's code?", placeholder: "plant code", text: self.$plantCode).padding(.top, 20)
                Button(action: {
                    let name = (UIApplication.shared.delegate as! AppDelegate).nameTextField.text ?? ""
                    let plantCode = (UIApplication.shared.delegate as! AppDelegate).plantCodeTextField.text ?? ""
                    if (plantCode != "" && name != "") {
                        UserData.login(name: name, plantCode: plantCode) { userData in
                            if let userData = userData {
                                DispatchQueue.main.async {
                                    self.userDataWrapper.userData = userData
                                    self.viewRouter.currentPage = "home"
                                }
                            } else {
                                // handle invalid plant code (or network failure)
                            }
                        }
                    } else {
                        // handle fields not filled out
                    }
                }){
                    ZStack {
                        RoundedRectangle(cornerRadius: 7).stroke(Color.green1, lineWidth: 2).frame(width: 100, height: 45).foregroundColor(Color.clear)
                        Text("enter").font(.custom("Cabin-Regular", size: 20))
                            .fontWeight(.regular).foregroundColor(Color.green1)
                    }
                }.padding(.top, 45)
                Spacer()
                HStack {
                    Image("weow 3")
                        .resizable()
                        .frame(width: 240, height: 168, alignment: .leading)
                        .padding(.bottom, 50)
                    Spacer()
                }.padding(.leading, -30).padding(.top, 25)
            }.padding(.top, 40.0)
                .padding(.leading, 30)
            
        }.onTapGesture {
            self.endEditing()
        }
        
    }
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
}
