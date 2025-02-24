//
//  StorageManager.swift
//  RMUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 02.02.2025.
//

import Foundation
import UIKit

final class StorageManager: StorageManagerProtocol {
    private let charactersKey = "charactersKey"

    func saveCharacters(_ characters: [Character]) {
        do {
            let data = try JSONEncoder().encode(characters)
            UserDefaults.standard.set(data, forKey: charactersKey)
        } catch {
            print("Failed to encode characters: \(error)")
        }
    }

    func saveImage(_ image: Data, key: String) {
        UserDefaults.standard.set(image, forKey: key)
    }

    func loadCharacters() -> [Character]? {
        guard let data = UserDefaults.standard.data(forKey: charactersKey),
              let characters = try? JSONDecoder().decode([Character].self, from: data) else {
            return nil
        }

        return characters
    }

    func loadImage(key: String) -> Data? {
        return UserDefaults.standard.data(forKey: key)
    }

    func clearCharacters() {
        UserDefaults.standard.removeObject(forKey: charactersKey)
    }

    func clearImage(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
