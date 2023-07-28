//
//  ModuleBuilder.swift
//  MVP+SOLID+DI+Tests+Router
//
//  Created by Никитин Артем on 24.07.23.
//

import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
    static func createDetailModule(comment: Comment?) -> UIViewController
//    func createDetailModule(comment: Comment?) -> UIViewController
}

class ModelBuilder: Builder {
    
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
    
//    static func createDetailModule(comment: Comment?) -> UIViewController {
//        let view = DetailViewController()
//        let networkService = NetworkService()
//        let presenter = DetailPresenter(view: view, networkService: networkService, comment: comment)
//        view.presenter = presenter
//        return view
//    }
    static func createDetailModule(comment: Comment?) -> UIViewController {
        let model = NetworkService()
        let view = DetailViewController()
        let presenterrr = DetailPresenter.init(view: view, networkService: model, comment: comment)
        
        view.presenter = presenterrr
        return view
    }
}
