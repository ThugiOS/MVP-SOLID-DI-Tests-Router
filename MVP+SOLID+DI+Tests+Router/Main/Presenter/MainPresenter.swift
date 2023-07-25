//
//  MainPresenter.swift
//  MVP+SOLID+DI+Tests+Router
//
//  Created by Никитин Артем on 24.07.23.
//

import Foundation

// OUTPUT (отправили во вью)
protocol MainViewProtocol: AnyObject {
    func setGreeting(greeting: String)
    func setGreetingReverse(greetingReverse: String)
    func setNewName(newValue: String)
}

//INPUT (приняли из вью)
protocol MainViewPresenterProtocol: AnyObject {

    init(view: MainViewProtocol, person: Person)      // Соблюдаем D(не завязываемся на конкретном классе), Соблюдаем I(разбиваем интерфейс) и для инъекции.
    
    func showGreeting()
    func showReverseGreeteng()
    
    func showNewName(newValue: String)
}

class MainPresenter: MainViewPresenterProtocol {
    

    let view: MainViewProtocol     // view абстрактная потому что мы соблюдаем SOLI(D)
    var person: Person
    
    required init(view: MainViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }
    
    func showGreeting() {
        let greeting = self.person.firstName + " " + self.person.lastName
        self.view.setGreeting(greeting: greeting)
    }
    
    func showReverseGreeteng() {
        let reverseGreeting = self.person.lastName + " " + self.person.firstName
        self.view.setGreetingReverse(greetingReverse: reverseGreeting)
    }
    
    func showNewName(newValue: String) {
        self.person.firstName = newValue
        let newName = self.person.lastName + " " + self.person.firstName
        self.view.setNewName(newValue: newName)
    }

}
  
