//
//  MainPresenter.swift
//  MVP+SOLID+DI+Tests+Router
//
//  Created by Никитин Артем on 24.07.23.
//

import Foundation

// OUTPUT (Протокол для Вью)
protocol MainViewProtocol: AnyObject {
    func setGreeting(greeting: String)
}

//INPUT (Протокол для Презентера)
protocol MainViewPresenterProtocol: AnyObject {
/*    Завязываемся на абстракции а не на конкретном классе (D)
    В этом случае мы завязываемся на протокол MainViewProtocol а не
    конкретную вью.
 
    Инициализатор мы делаем еще и для инъекции зависимостей
    А инъекции будем делать в Builder
 */
    init(view: MainViewProtocol, person: Person)
    
    func showGreeting()
}

class MainPresenter: MainViewPresenterProtocol {
    let view: MainViewProtocol
    var person: Person
    
    required init(view: MainViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }
    
    func showGreeting() {
        let greeting = "Hi! " + self.person.firstName + " " + self.person.lastName
        self.view.setGreeting(greeting: greeting)
    }
}
  
