//
//  DogBreedFeature.swift
//  TCADemo2
//
//  Created by Shagun Madhikarmi on 11/01/2025.
//

import ComposableArchitecture

@Reducer
struct DogBreedFeature {
    @ObservableState
    struct State {
        var count = 0
        var response: Result<[DogBreed], Error>?
        // TODO: (SM) Dependency injection
        var dogsAPI = DogsAPI()

        enum LoadingState {
            case notLoaded
            case loading
            case loaded([DogBreed])
            case failed(Error)
        }
    }

    enum Action {
        case viewLoaded
        case fetchData
        case fetchResponse(Result<[DogBreed], Error>)
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .viewLoaded:
                return .none
            case .fetchData:
                // API / Network example taken from https://medium.com/@gangadharganga90/how-to-make-api-calls-in-swiftui-with-tca-framework-80f0980afa47
                state.response = nil
                return .run { [state = state] send in
                    let dogBreeds = try await state.dogsAPI.fetchDogBreeds()
                    print(dogBreeds.debugDescription)
                    await send(.fetchResponse(.success(dogBreeds)))
                }
            case let .fetchResponse(.success(data)):
                state.response = .success(data)
                return .none
            case let .fetchResponse(.failure(error)):
                state.response = .failure(error)
                //          state.errorMessage = error.rawValue
                return .none
            }
        }
    }
}
