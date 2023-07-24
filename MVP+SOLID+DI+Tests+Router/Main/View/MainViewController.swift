//
//  MainViewController.swift
//  MVP+SOLID+DI+Tests+Router
//
//  Created by Никитин Артем on 24.07.23.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Variables
    var presenter: MainViewPresenterProtocol!
        
    private let greetingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.text = "Title"
        return label
    }()
    
    private let buttonAction: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        button.setTitle("Кнопка", for: .normal)
        button.layer.cornerRadius = 10.0
        return button
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        self.buttonAction.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.view.backgroundColor = .magenta
        
        self.view.addSubview(greetingLabel)
        self.view.addSubview(buttonAction)
        
        greetingLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonAction.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            greetingLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200.0),
            greetingLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            buttonAction.topAnchor.constraint(equalTo: self.greetingLabel.bottomAnchor, constant: 30.0),
            buttonAction.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            buttonAction.widthAnchor.constraint(equalToConstant: 100.0),
        ])
    }
    
    // MARK: - Selectors
    @objc private func buttonTapped() {
        UIView.animate(withDuration: 0.08, animations: {
            self.buttonAction.transform = CGAffineTransform(scaleX: 0.96, y: 0.96)
        }) { (_) in
            UIView.animate(withDuration: 0.08) {
                self.buttonAction.transform = CGAffineTransform.identity
            }
            self.presenter.showGreeting()
        }
    }
}

extension MainViewController: MainViewProtocol {
    func setGreeting(greeting: String) {
        self.greetingLabel.text = greeting
    }
}

