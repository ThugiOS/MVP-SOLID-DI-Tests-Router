//
//  DetailPresenter.swift
//  MVP+SOLID+DI+Tests+Router
//
//  Created by Никитин Артем on 28.07.23.
//

import Foundation
 
protocol DetailViewProtocol: AnyObject {
    func setComment(comment: Comment?)
}

protocol DetailViewPresenterProtocol: AnyObject {
    init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, comment: Comment?)
    
    func setComment()
    func tapBack()
}

class DetailPresenter: DetailViewPresenterProtocol {
    
    weak var view: DetailViewProtocol?
    let networkService: NetworkServiceProtocol!
    var comment: Comment?
    var router: RouterProtocol?
    
    required init(view: DetailViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol, comment: Comment?) {
        self.view = view
        self.networkService = networkService
        self.comment = comment
        self.router = router
    }
    
    func setComment() {
        self.view?.setComment(comment: comment)
    }
    func tapBack() {
        router?.popToRoot()
    }
}
