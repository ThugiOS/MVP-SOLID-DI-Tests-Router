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
    /* Сделали Мок вью, т.к. мы тестируем бизнес-логику
     Благодаря использованию Протоколов мы воспользуемся MainViewProtocol для работы с Вью
     */
    var titleTest: String?
    func setGreeting(greeting: String) {
        self.titleTest = greeting
    }
}

final class MainPresenterTest: XCTestCase {
    
    var view: MockView!
    var model: Comment!
    var presenter: MainPresenter!

    override func setUpWithError() throws {
        // Поместите код установки здесь. Этот метод вызывается перед вызовом каждого тестового метода в классе.
        view = MockView()
        model = Comment(firstName: "Baz", lastName: "Bar")
        presenter = MainPresenter(view: view, person: model)
    }

    override func tearDownWithError() throws {
        // Когда заканчивается Тест, делаем все nil
        view = nil
        model = nil
        presenter = nil
    }
//      ТЕСТ 1. Модуль создался и не nil
    func testModuleIsNotNil() {
        XCTAssertNotNil(view, "view is not nil")
        XCTAssertNotNil(model, "model is not nil")
        XCTAssertNotNil(presenter, "presenter is not nil")
    }
//      ТЕСТ 2. Проверка Вью
    func testView() {
        presenter.showGreeting()
        XCTAssertEqual(view.titleTest, "Hi! Baz Bar")
    }
//      ТЕСТ 3. Проверка модели
    func testPersonModel() {
        XCTAssertEqual(model.firstName, "Baz")
        XCTAssertEqual(model.lastName, "Bar")
    }
}
