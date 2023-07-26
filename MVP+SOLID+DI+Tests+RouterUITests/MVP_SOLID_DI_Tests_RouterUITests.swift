////
////  MVP_SOLID_DI_Tests_RouterUITests.swift
////  MVP+SOLID+DI+Tests+RouterUITests
////
////  Created by Никитин Артем on 24.07.23.
////
//
//import XCTest
//
//final class MVP_SOLID_DI_Tests_RouterUITests: XCTestCase {
//
//    override func setUpWithError() throws {
//        // Поместите код установки здесь. Этот метод вызывается перед вызовом каждого тестового метода в классе.
//        
//        // В тестах пользовательского интерфейса обычно лучше сразу останавливаться при возникновении сбоя.
//        continueAfterFailure = false
//
//        // В тестах пользовательского интерфейса важно установить начальное состояние — например, ориентацию интерфейса — необходимое для ваших тестов до их запуска. Метод setUp — хорошее место для этого.
//    }
//
//    override func tearDownWithError() throws {
//        // Поместите сюда код демонтажа. Этот метод вызывается после вызова каждого тестового метода в классе.
//    }
//
//    func testExample() throws {
//        // Тесты пользовательского интерфейса должны запускать приложение, которое они тестируют.
//        let app = XCUIApplication()
//        app.launch()
//
//        // Используйте XCTAsert и связанные с ним функции, чтобы убедиться, что ваши тесты дают правильные результаты.
//    }
//
//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // Это измеряет, сколько времени требуется для запуска вашего приложения.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
//}
