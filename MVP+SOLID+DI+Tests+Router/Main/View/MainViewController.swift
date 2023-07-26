//
//  MainViewController.swift
//  MVP+SOLID+DI+Tests+Router
//
//  Created by Никитин Артем on 24.07.23.
//

import UIKit

class MainViewController: UIViewController {
    
    var presenter: MainViewPresenterProtocol!
        
    private let greetingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 26, weight: .regular)
        label.text = "∆¬…≥≤µ˜∫√ç≈Ω^"
        return label
    }()
    private let buttonAction: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        button.setTitle("Кнопка", for: .normal)
        button.layer.cornerRadius = 10.0
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        self.buttonAction.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    private func setupUI() {
        self.view.backgroundColor = .magenta
        
        self.view.addSubview(greetingLabel)
        self.view.addSubview(buttonAction)

        greetingLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonAction.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            greetingLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 300.0),
            greetingLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            buttonAction.topAnchor.constraint(equalTo: self.greetingLabel.bottomAnchor, constant: 30.0),
            buttonAction.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            buttonAction.widthAnchor.constraint(equalToConstant: 100.0),
        ])
    }
    
    @objc private func buttonTapped() {
        self.presenter.showGreeting()
    }
}


// Cвязали наш VC с Презенторем через протокол
extension MainViewController: MainViewProtocol {
    func setGreeting(greeting: String) {
        self.greetingLabel.text = greeting
    }
}

