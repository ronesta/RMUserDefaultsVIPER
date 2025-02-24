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

    func createModule() -> UIViewController {
        let storageManager = StorageManager()
        let networkManager = NetworkManager(storageManager: storageManager)

        let dataSource = CharacterTableViewDataSource(networkManager: networkManager)
        let presenter = CharacterPresenter()
        let router = CharacterRouter()

        let interactor = CharacterInteractor(presenter: presenter,
                                             networkManager: networkManager,
                                             storageManager: storageManager
        )

        let view = CharacterViewController(presenter: presenter,
                                           dataSource: dataSource
        )

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        router.viewController = view

        return view
    }
}
