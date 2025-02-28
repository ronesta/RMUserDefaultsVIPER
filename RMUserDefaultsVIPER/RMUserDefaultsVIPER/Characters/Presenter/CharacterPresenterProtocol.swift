//
//  CharacterPresenterProtocol.swift
//  RMUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 03.02.2025.
//

import Foundation
import UIKit.UIImage

protocol CharacterPresenterProtocol: AnyObject {
    func viewDidLoad()

    func charactersFetched(_ characters: [Character])

    func charactersFetchFailed(with error: Error)

    func fetchImage(for character: Character, completion: @escaping (UIImage?) -> Void)
}
