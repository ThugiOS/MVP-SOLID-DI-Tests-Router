//
//  AssemblyModuleBuilder.swift
//  MVP+SOLID+DI+Tests+Router
//
//  Created by Никитин Артем on 24.07.23.
//

import UIKit

protocol AssemblyBuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController
    func createDetailModule(comment: Comment?, router: RouterProtocol) -> UIViewController
}

class AssemblyModuleBuilder: AssemblyBuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        return view

    }
    
    func createDetailModule(comment: Comment?, router: RouterProtocol) -> UIViewController {
        let model = NetworkService()
        let view = DetailViewController()
        let presenter = DetailPresenter.init(view: view, networkService: model, router: router, comment: comment)
        
        view.presenter = presenter
        return view
    }
}
