//
//  CharacterRouter.swift
//  RMUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 03.02.2025.
//

import Foundation
import UIKit

final class CharacterRouter: CharacterRouterProtocol {
    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        let view = CharacterViewController()
        let presenter = CharacterPresenter()
        let interactor = CharacterInteractor()
        let router = CharacterRouter()
        let storageManager = StorageManager()
        let networkManager = NetworkManager(storageManager: storageManager)

        view.presenter = presenter
        view.nerworkManager = networkManager
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter

        interactor.storageManager = storageManager
        interactor.networkManager = networkManager
        router.viewController = view

        return view
    }
}
