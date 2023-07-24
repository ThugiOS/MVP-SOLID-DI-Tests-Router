//
//  ModuleBuilder.swift
//  MVP+SOLID+DI+Tests+Router
//
//  Created by Никитин Артем on 24.07.23.
//

import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
}

class ModelBuilder: Builder {
    static func createMainModule() -> UIViewController {
        let model = Person.init(firstName: "Artem", lastName: "Nikitin")
        let view = MainViewController()
        
        let presenter = MainPresenter(view: view, person: model)
        
        view.presenter = presenter
        return view
    }
}
