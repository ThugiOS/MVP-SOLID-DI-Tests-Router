////
////  MVP_SOLID_DI_Tests_RouterUITestsLaunchTests.swift
////  MVP+SOLID+DI+Tests+RouterUITests
////
////  Created by Никитин Артем on 24.07.23.
////
//
//import XCTest
//
//final class MVP_SOLID_DI_Tests_RouterUITestsLaunchTests: XCTestCase {
//
//    override class var runsForEachTargetApplicationUIConfiguration: Bool {
//        true
//    }
//
//    override func setUpWithError() throws {
//        continueAfterFailure = false
//    }
//
//    func testLaunch() throws {
//        let app = XCUIApplication()
//        app.launch()
//
//        // Вставьте здесь шаги, которые необходимо выполнить после запуска приложения, но до создания снимка экрана,
//        // например, войти в тестовую учетную запись или перейти куда-нибудь в приложение
//
//        let attachment = XCTAttachment(screenshot: app.screenshot())
//        attachment.name = "Launch Screen"
//        attachment.lifetime = .keepAlways
//        add(attachment)
//    }
//}
