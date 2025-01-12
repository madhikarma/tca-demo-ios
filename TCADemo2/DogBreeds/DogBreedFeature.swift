//
//  DogBreedFeature.swift
//  TCADemo2
//
//  Created by Shagun Madhikarmi on 11/01/2025.
//

import ComposableArchitecture
import SwiftUI

@Reducer
struct DogBreedFeature {
    @Reducer
    enum Path {
        case detailItem(DogBreedDetailFeature)
    }

    @ObservableState
    struct State {
        var response: Result<[DogBreed], Error>?
        // TODO: (SM) Dependency injection
        var dogsAPI = DogsAPI()
        var path = StackState<Path.State>()
    }

    enum Action {
        case fetchData
        case fetchResponse(Result<[DogBreed], Error>)
        case path(StackActionOf<Path>)
    }

    @Dependency(\.uuid) var uuid
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .fetchData:
                state.response = nil
                return .run { [state = state] send in
                    let dogBreeds = try await state.dogsAPI.fetchDogBreeds()
                    await send(.fetchResponse(.success(dogBreeds)))
                }
            case let .fetchResponse(.success(data)):
                state.response = .success(data)
                return .none
            case let .fetchResponse(.failure(error)):
                state.response = .failure(error)
                return .none
            case .path:

                // Note. if using a button isntead of NavigationLink then you need to handle it
                //
                // case .path(.element(id: _, action: .list(.detailButtonTapped))):
                // state.path.append(.detailItem(DogBreedDetailFeature.State()))
                //
                return .none
            }
        }
        .forEach(\.path, action: \.path)
    }
}
