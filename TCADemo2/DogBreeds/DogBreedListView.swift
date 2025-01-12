//
//  DogBreedListView.swift
//  TCADemo2
//
//  Created by Shagun Madhikarmi on 11/01/2025.
//

import ComposableArchitecture
import SwiftUI

struct DogBreedListView: View {
    @Bindable var store: StoreOf<DogBreedFeature>

    var body: some View {
        switch store.state.response {
        case let .success(breeds):

            // TODO: (SM) Fix compiler error:
            // 'Conflicting arguments to generic parameter 'Action' ('DogBreedFeature.Path.Action' vs. 'DogBreedFeature.Action')'"

            NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
                List {
                    ForEach(breeds, id: \.self) { breed in
                        NavigationLink(
                            state: DogBreedFeature.Path.State.detailItem(DogBreedDetailFeature.State(dogBreed: breed))
                        ) {
                            Text(breed.name)
                        }
                    }
                }
            } destination: { store in
                DogBreedListView(store: store)
            }
        case let .failure(error):
            Text("Error: \(error)")
        case .none:
            Text("Unknown Error")
        }

        // TODO: (SM) move to init and / or onAppear (if not loaded - loading, error enum? etc)
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
