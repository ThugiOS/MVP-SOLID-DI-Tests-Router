//
//  MainPresenter.swift
//  MVP+SOLID+DI+Tests+Router
//
//  Created by Никитин Артем on 24.07.23.
//

//import Foundation
//
//// OUTPUT (Протокол для Вью)
//protocol MainViewProtocol: AnyObject {
//    func succes()
//    func failure(error: Error)
//}
//
////INPUT (Протокол для Презентера)
//protocol MainViewPresenterProtocol: AnyObject {
//    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
//    func getComments() // запроссс комментов
//    var comments: [Comment]? { get set } // сохраняем комменты если пришли
//}
//
//class MainPresenter: MainViewPresenterProtocol {
//    weak var view: MainViewProtocol?
//    let networkService: NetworkServiceProtocol!
//    var comments: [Comment]?
//
//    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
//        self.view = view
//        self.networkService = networkService
//        getComments() // при вызове инициализатора вызовится наш метод, для инъекции
//    }
//
//    func getComments() {
//        networkService.getComments { [weak self] result in
//            guard let self else { return }
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let comment):
//                    self.comments = comment
//                    self.view?.succes()
//                case .failure(let error):
//                    self.view?.failure(error: error)
//                }
//            }
//        }
//    }
//}
  
import Foundation


// OUTPUT протокол
//ОТПРАВЛЯЕТ ДАННЫЕ во ВЬЮ
protocol MainViewProtocol: AnyObject {
    func succes()
    func failure(error: Error)
}

//INPUT протокол
// ПРИНИМАЕТ ДАННЫЕ от ВЬЮ, МОДЕЛИ и т.д
protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
    func getComments()
    var comments: [Comment]? { get set }

}

class MainPresenter: MainViewPresenterProtocol {
    weak var view: MainViewProtocol?

    let networkService: NetworkServiceProtocol!
    var comments: [Comment]?
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService

        getComments()
    }
    
    func getComments() {
        networkService.getComments { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.succes()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
}
