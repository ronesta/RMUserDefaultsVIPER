//
//  CharacterDataSourceProtocol.swift
//  RMUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 03.02.2025.
//

import Foundation
import UIKit

protocol CharacterDataSourceProtocol: UITableViewDataSource {
    var characters: [Character] { get set }
    var networkManager: NetworkManagerProtocol? { get set }
}
