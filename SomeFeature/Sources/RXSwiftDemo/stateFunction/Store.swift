//
//  File.swift
//  
//
//  Created by CuiYingBo on 3/25/21.
//

import Foundation


class Store: Any {
    typealias Observer = (State?,State) -> Void
    private(set) var state: State
    private var _observers: [UUID: Observer]
    
    init(initailState: State) {
        self.state = initailState
        self._observers = [:]
    }
    
    func dispatch(event: State.Event)  {
        let oldState = self.state
        self.state = State.reduce(event: event, state:self.state )
        _publish(oldState: oldState, newState: self.state)
    }
    
    func subscribe(observer: @escaping Observer) -> UUID {
        let subscriptionID = UUID()
        _observers[subscriptionID] = observer
        observer(nil, self.state) // 订阅时，将当前状态回放给该观察者
        return subscriptionID
    }
    
    
    func unSubscribe(_ subscriptionID: UUID) -> Void {
        _observers.removeValue(forKey: subscriptionID)
    }
    private func _publish(oldState: State? , newState: State){
        _observers.values.forEach { observer in
            observer(oldState,newState)
        }
    }
    
    static func test(){
        let state = State(userName: "cuiyingbo", password: "123", loading: false, data: "", loginError: nil)
        let store = Store(initailState: state)
        let subscriptionID = store.subscribe { (oldState, newState) in
            print("oldState:\(String(describing: oldState))")
            print("newState:\(newState)")
        }
        
        store.dispatch(event: .onUpdatePassword("qwerty"))
        
        store.unSubscribe(subscriptionID)
    }
}
