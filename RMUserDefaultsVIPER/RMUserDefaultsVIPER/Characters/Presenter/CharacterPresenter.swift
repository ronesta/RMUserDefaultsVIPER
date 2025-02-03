//
//  CharacterPresenter.swift
//  RMUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 03.02.2025.
//

import Foundation

final class CharacterPresenter: CharacterPresenterProtocol {
    weak var view: CharacterViewProtocol?
    var interactor: CharacterInteractorProtocol?
    var router: CharacterRouterProtocol?

    func viewDidLoad() {
        interactor?.getCharacters()
    }

    func charactersFetched(_ characters: [Character]) {
        view?.displayCharacters(characters)
    }

    func charactersFetchFailed(with error: Error) {
        view?.displayError("Failed to load characters: \(error.localizedDescription)")
    }
}
