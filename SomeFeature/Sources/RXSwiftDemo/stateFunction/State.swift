//
//  File.swift
//  
//
//  Created by CuiYingBo on 3/25/21.
//

import Foundation
import RxSwift

typealias UserModel = String

enum LoginError:Error,Equatable {
    case noExit
    case mismatch
}
struct State:Equatable {
    var userName: String
    var password: String
    var loading: Bool
    var data: UserModel
    var loginError: LoginError?
    
    enum Event {
        case onUpdateUserName(String)
        case onUpdatePassword(String)
        case onLoginSuccess(UserModel)
        case onLoginError(LoginError)
    }
    
    static  func reduce(event:Event, state:State) -> State {
        var newState = state
        switch event {
        case .onUpdateUserName(let username):
            newState.userName = username
        case .onUpdatePassword(let password):
            newState.password  = password
        case .onLoginError(let error):
            newState.loginError = error
            newState.loading = false
        case .onLoginSuccess(let userModel):
            newState.data = userModel
            newState.loading = false
        }
        return newState
    }
    func test() -> Void {
        let state = State(userName: "", password: "", loading: true, data: "", loginError: nil)
        print(state)
        var newState = State.reduce(event: .onUpdateUserName("cuiyingbo"), state: state)
        newState = State.reduce(event: .onUpdateUserName("cuiyingbo"), state: newState)
        print(state)
        
    }
}
