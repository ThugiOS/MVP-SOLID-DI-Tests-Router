//
//  RouterTest.swift
//  MVP+SOLID+DI+Tests+RouterTests
//
//  Created by Никитин Артем on 31.07.23.
//

import XCTest
@testable import MVP_SOLID_DI_Tests_Router

class MockNavController: UINavigationController {
    var presentedVC: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.presentedVC = viewController
        super.pushViewController(viewController, animated: animated)
    }
}

final class RouterTest: XCTestCase {
    
    var router: RouterProtocol!
    var navigationController = MockNavController()
    var assembly = AssemblyModuleBuilder()

    override func setUpWithError() throws {
        router = Router(navigationController: navigationController, assemblyBuilder: assembly)
    }

    override func tearDownWithError() throws {
        router = nil
    }
    
    func testRouter() {
        router.showDetail(comment: nil)
        let detailViewController = navigationController.presentedVC
        XCTAssertTrue(detailViewController is DetailViewController)
    }
}
