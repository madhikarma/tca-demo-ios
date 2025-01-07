//
//  CatsAPI.swift
//  TCADemo2
//
//  Created by Shagun Madhikarmi on 07/01/2025.
//

import Foundation

struct DogsAPI {
    
    func fetchDogBreeds() async throws -> [DogBreed] {
        // TODO: (SM) dependency injection for mocking        
        let url = URL(string: "https://api.thecatapi.com/v1/breeds")!
        var request = URLRequest(url: url)
        request.addValue("TODO",
                         forHTTPHeaderField: "x-api-key")
        let (data, _) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode([DogBreed].self, from: data)
    }
}
