//
//  CharacterInteractor.swift
//  RMUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 03.02.2025.
//

import Foundation

final class CharacterInteractor: CharacterInteractorProtocol {
    private let presenter: CharacterPresenterProtocol
    private let networkManager: NetworkManagerProtocol
    private let storageManager: StorageManagerProtocol

    init(presenter: CharacterPresenterProtocol,
         networkManager: NetworkManagerProtocol,
         storageManager: StorageManagerProtocol
    ) {
        self.presenter = presenter
        self.networkManager = networkManager
        self.storageManager = storageManager
    }

    func getCharacters() {
        if let savedCharacters = storageManager.loadCharacters() {
            presenter.charactersFetched(savedCharacters)
            return
        }

        networkManager.getCharacters { [weak self] result in
            switch result {
            case .success(let characters):
                self?.storageManager.saveCharacters(characters)
                self?.presenter.charactersFetched(characters)
            case .failure(let error):
                self?.presenter.charactersFetchFailed(with: error)
            }
        }
    }
}
