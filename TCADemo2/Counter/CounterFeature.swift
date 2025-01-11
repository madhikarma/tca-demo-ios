//
//  Untitled.swift
//  TCADemo2
//
//  Created by Shagun Madhikarmi on 03/01/2025.
//

import ComposableArchitecture

@Reducer
struct CounterFeature {
    @ObservableState
    struct State {
        var count = 0
    }

    enum Action {
        case decrementButtonTapped
        case incrementButtonTapped
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .decrementButtonTapped:
                state.count -= 1

                return .none

            case .incrementButtonTapped:
                state.count += 1
                return .none
            }
        }
    }
}
