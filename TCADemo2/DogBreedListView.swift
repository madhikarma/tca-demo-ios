//
//  DogBreedListView.swift
//  TCADemo2
//
//  Created by Shagun Madhikarmi on 11/01/2025.
//

import ComposableArchitecture
import SwiftUI

struct DogBreedListView: View {
    let store: StoreOf<DogBreedFeature>
  
    var body: some View {
        switch store.state.response {
        case .success(let breeds):
            List {
                ForEach(breeds, id: \.self) { breed in
                    Text(breed.name)
                        .onTapGesture {
                            // TODO: (SM) wrap in navigation to detail screen
                            print(breed.name)
                        }
                }
            }
            .navigationTitle("Dog Breeds")
            
        case .failure(let error):
            Text("Error: \(error)")
        case .none:
            Text("Unknown Error")
        }
            
      Button("Fetch data") {
          store.send(.fetchData)
      }
      .font(.largeTitle)
      .padding()
      .background(Color.black.opacity(0.1))
      .cornerRadius(10)
    }
}

#Preview {
    DogBreedListView(
    store: Store(initialState: DogBreedFeature.State()) {
        DogBreedFeature()
    }
  )
}
