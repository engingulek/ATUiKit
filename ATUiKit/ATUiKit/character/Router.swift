//
//  Router.swift
//  ATUiKit
//
//  Created by Engin Gülek on 5.05.2025.
//

import UIKit
class Router {
    static func createModule() -> UIViewController {
        let viewController = CharactersViewController()
        let _ = Router()
        let interactor = CharactersInteractor()
        let presenter = CharactersPresenter(view: viewController, interactor: interactor)
        viewController.presenter = presenter
        interactor.presenter = presenter
        return viewController
    }
}


