//
//  TCADemo2App.swift
//  TCADemo2
//
//  Created by Shagun Madhikarmi on 03/01/2025.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCADemo2App: App {
    let store = Store(initialState: CounterFeature.State()) {
        CounterFeature()
     }
    
    var body: some Scene {
        WindowGroup {
          CounterView(
            store: Store(initialState: CounterFeature.State()) {
              CounterFeature()
            }
          )
        }
    }
}
