//
//  DogBreed.swift
//  TCADemo2
//
//  Created by Shagun Madhikarmi on 07/01/2025.
//

struct DogBreed: Decodable {
    let id: String
    let name: String
    let description: String
}

extension DogBreed: Hashable {}

extension DogBreed: Identifiable {}
