//
//  MainPresenterTest.swift
//  MVP+SOLID+DI+Tests+RouterTests
//
//  Created by Никитин Артем on 26.07.23.
//

import XCTest
// Делаем этот импорт чтобы оба наши таргета видели друг-друга
@testable import MVP_SOLID_DI_Tests_Router




class MockView: MainViewProtocol {
    func succes() {
        
    }
    
    func failure(error: Error) {
        
    }
}

class MockNetworkService: NetworkServiceProtocol {
    var comments: [Comment]!
    
    init() {}
    
//    convenience сетим комментс из вне
    convenience init(comments: [Comment]?) {
        self.init()
        self.comments = comments
    }
    
    func getComments(completion: @escaping (Result<[Comment], Error>) -> ()) {
        if let comments {
            completion(.success(comments))
        } else {
            let error = NSError.init(domain: "", code: 0, userInfo: nil)
            completion(.failure(error))
        }
    }
}

final class MainPresenterTest: XCTestCase {
    
    var view: MockView!
    var networkService: NetworkServiceProtocol!
    var presenter: MainPresenter!
    var router: RouterProtocol!
    var comments = [Comment]()

    override func setUpWithError() throws {
        let nav = UINavigationController()
        let assembly = AssemblyModuleBuilder()
        
        router = Router(navigationController: nav, assemblyBuilder: assembly)
    }

    override func tearDownWithError() throws {
        // Когда заканчивается Тест, делаем все nil
        view = nil
        networkService = nil
        presenter = nil
    }
    
    // Test 1: Пришел ли коммент
    func testGetSuccesComents() {
        let comment = Comment(postId: 1, id: 2, name: "Foo", email: "Baz", body: "Bar")
        comments.append(comment)
        
        view = MockView() // Mock
        networkService = MockNetworkService(comments: comments) // Mock
        presenter = MainPresenter(view: view, networkService: networkService, router: router) // Real
        
        var catcComments: [Comment]?
        
        networkService.getComments { resalt in
            switch resalt {
            case .success(let comments):
                catcComments = comments
            case .failure(let error):
                print(error)
            }
        }
        
        XCTAssertNotEqual(catcComments?.count, 0 ) // колличество никогда не должно быть равно нулю
        XCTAssertEqual(catcComments?.count, comments.count )
    }
    
    // Test 1: Нет ли ошибки
    func testGetFailureComents() {
        let comment = Comment(postId: 1, id: 2, name: "Foo", email: "Baz", body: "Bar")
        comments.append(comment)
        
        view = MockView() // Mock
        networkService = MockNetworkService() // Mock
        presenter = MainPresenter(view: view, networkService: networkService, router: router) // Real
        
        var catchError: Error?
        
        networkService.getComments { resalt in
            switch resalt {
            case .success(let comments):
                print(comments)
                break
            case .failure(let error):
                catchError = error
            }
        }
        
        XCTAssertNotNil(catchError)
    }

}





//class MockView: MainViewProtocol {
//    /* Сделали Мок вью, т.к. мы тестируем бизнес-логику
//     Благодаря использованию Протоколов мы воспользуемся MainViewProtocol для работы с Вью
//     */
//    var titleTest: String?
//    func setGreeting(greeting: String) {
//        self.titleTest = greeting
//    }
//}
//
//final class MainPresenterTest: XCTestCase {
//
//    var view: MockView!
//    var model: Comment!
//    var presenter: MainPresenter!
//
//    override func setUpWithError() throws {
//        // Поместите код установки здесь. Этот метод вызывается перед вызовом каждого тестового метода в классе.
//        view = MockView()
//        model = Comment(firstName: "Baz", lastName: "Bar")
//        presenter = MainPresenter(view: view, person: model)
//    }
//
//    override func tearDownWithError() throws {
//        // Когда заканчивается Тест, делаем все nil
//        view = nil
//        model = nil
//        presenter = nil
//    }
////      ТЕСТ 1. Модуль создался и не nil
//    func testModuleIsNotNil() {
//        XCTAssertNotNil(view, "view is not nil")
//        XCTAssertNotNil(model, "model is not nil")
//        XCTAssertNotNil(presenter, "presenter is not nil")
//    }
////      ТЕСТ 2. Проверка Вью
//    func testView() {
//        presenter.showGreeting()
//        XCTAssertEqual(view.titleTest, "Hi! Baz Bar")
//    }
////      ТЕСТ 3. Проверка модели
//    func testPersonModel() {
//        XCTAssertEqual(model.firstName, "Baz")
//        XCTAssertEqual(model.lastName, "Bar")
//    }
//}
