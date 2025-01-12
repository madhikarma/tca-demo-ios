//
//  DogBreedDetailView.swift
//  TCADemo2
//
//  Created by Shagun Madhikarmi on 11/01/2025.
//

import ComposableArchitecture
import SwiftUI

struct DogBreedDetailView: View {
    let store: StoreOf<DogBreedDetailFeature>

    var body: some View {
        Form {}
            .navigationTitle(Text(store.dogBreed.name))
    }
}

#Preview {
    NavigationStack {
        DogBreedDetailView(
            store: Store(
                initialState: DogBreedDetailFeature.State(
                    dogBreed: DogBreed(id: UUID().uuidString, name: "American Bobtail", description: "American Bobtails are loving and incredibly intelligent cats possessing a distinctive wild appearance. They are extremely interactive cats that bond with their human family with great devotion.")
                )
            ) {
                DogBreedDetailFeature()
            }
        )
    }
}
