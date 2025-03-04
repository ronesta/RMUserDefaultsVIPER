//
//  NetworkManagerProtocol.swift
//  RMUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 03.02.2025.
//

import Foundation
import UIKit.UIImage

protocol NetworkManagerProtocol {
    func getCharacters(completion: @escaping (Result<[Character], Error>) -> Void)

    func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void)
}
