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
    var response: Result<[DogBreed], Error>?
  }
  
  enum Action {
    case decrementButtonTapped
    case incrementButtonTapped
    case fetchData
    case fetchResponse(Result<[DogBreed], Error>)
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
          
    // API / Network example taken from https://medium.com/@gangadharganga90/how-to-make-api-calls-in-swiftui-with-tca-framework-80f0980afa47
      case .fetchData:
          state.response = nil
          return .run { [state = state] send in
              let dogBreeds = try await DogsAPI().fetchDogBreeds()
              print(dogBreeds.debugDescription)
              await send(.fetchResponse(.success(dogBreeds)))
          }
      case .fetchResponse(.success(let data)):
          state.response = .success(data)
          return .none
          
      case .fetchResponse(.failure(let error)):
          state.response = .failure(error)
//          state.errorMessage = error.rawValue
          return .none

      }
    }
  }
}
