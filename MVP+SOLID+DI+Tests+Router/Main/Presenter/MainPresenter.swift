//
//  MainPresenter.swift
//  MVP+SOLID+DI+Tests+Router
//
//  Created by Никитин Артем on 24.07.23.
//

import Foundation

// OUTPUT
protocol MainViewProtocol: AnyObject {
    func setGreeting(greeting: String)
}

//INPUT
protocol MainViewPresenterProtocol: AnyObject {
    // Соблюдаем D(не завязываемся на конкретном классе), Соблюдаем I(разбиваем интерфейс) и для инъекции.
    init(view: MainViewProtocol, person: Person)
    func showGreeting()
}

class MainPresenter: MainViewPresenterProtocol {
    
    // view абстрактная потому что мы соблюдаем SOLI(D)
    let view: MainViewProtocol
    let person: Person
    
    required init(view: MainViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }
    
    func showGreeting() {
        let greeting = self.person.firstName + " " + self.person.lastName
        self.view.setGreeting(greeting: greeting)
    }
}
