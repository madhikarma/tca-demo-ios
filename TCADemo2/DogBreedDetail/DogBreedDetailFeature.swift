//
//  DogBreedDetailFeature.swift
//  TCADemo2
//
//  Created by Shagun Madhikarmi on 11/01/2025.
//

import ComposableArchitecture

@Reducer
struct DogBreedDetailFeature {
    @ObservableState
    struct State: Equatable {
        let dogBreed: DogBreed
    }

    enum Action {}

    var body: some ReducerOf<Self> {
        Reduce { _, action in
            switch action {}
        }
    }
}
