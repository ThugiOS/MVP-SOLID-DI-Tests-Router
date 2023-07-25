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
    
    private let buttonActionReverse: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        button.setTitle("Акпонк", for: .normal)
        button.layer.cornerRadius = 10.0
        return button
    }()
    
    private let textName: UITextField = {
       let tf = UITextField()
        tf.placeholder = " Name"
        tf.backgroundColor = .lightGray
        tf.textColor = .white
        tf.layer.cornerRadius = 10.0
        
        return tf
    }()
    
    private let buttonSave: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        button.setTitle("Save", for: .normal)
        button.layer.cornerRadius = 10.0
        return button
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        self.buttonAction.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        self.buttonActionReverse.addTarget(self, action: #selector(buttonTappedRev), for: .touchUpInside)
        self.buttonSave.addTarget(self, action: #selector(buttonSaveTapped), for: .touchUpInside)
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.view.backgroundColor = .magenta
        
        self.view.addSubview(greetingLabel)
        self.view.addSubview(buttonAction)
        self.view.addSubview(buttonActionReverse)
        self.view.addSubview(textName)
        self.view.addSubview(buttonSave)
        
        greetingLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonAction.translatesAutoresizingMaskIntoConstraints = false
        buttonActionReverse.translatesAutoresizingMaskIntoConstraints = false
        textName.translatesAutoresizingMaskIntoConstraints = false
        buttonSave.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            greetingLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 300.0),
            greetingLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            buttonAction.topAnchor.constraint(equalTo: self.greetingLabel.bottomAnchor, constant: 30.0),
            buttonAction.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            buttonAction.widthAnchor.constraint(equalToConstant: 100.0),
            
            buttonActionReverse.topAnchor.constraint(equalTo: self.buttonAction.bottomAnchor, constant: 10.0),
            buttonActionReverse.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            buttonActionReverse.widthAnchor.constraint(equalToConstant: 100.0),
            
            textName.topAnchor.constraint(equalTo: self.buttonActionReverse.bottomAnchor, constant: 50.0),
            textName.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            textName.widthAnchor.constraint(equalToConstant: 200.0),
            textName.heightAnchor.constraint(equalToConstant: 35.0),
            
            buttonSave.topAnchor.constraint(equalTo: self.textName.bottomAnchor, constant: 10.0),
            buttonSave.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            buttonSave.widthAnchor.constraint(equalToConstant: 100.0),
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
    
    @objc private func buttonTappedRev() {
        UIView.animate(withDuration: 0.08, animations: {
            self.buttonActionReverse.transform = CGAffineTransform(scaleX: 0.96, y: 0.96)
        }) { (_) in
            UIView.animate(withDuration: 0.08) {
                self.buttonActionReverse.transform = CGAffineTransform.identity
            }
            self.presenter.showReverseGreeteng()
        }
    }
    
    @objc private func buttonSaveTapped() {
        UIView.animate(withDuration: 0.08, animations: {
            self.buttonSave.transform = CGAffineTransform(scaleX: 0.96, y: 0.96)
        }) { (_) in
            UIView.animate(withDuration: 0.08) {
                self.buttonSave.transform = CGAffineTransform.identity
            }
            let name = self.textName.text
            self.presenter.showNewName(newValue: name!)
        }
    }

}




extension MainViewController: MainViewProtocol {
    func setNewName(newValue: String) {
        self.greetingLabel.text = newValue
    }
    
    
    func setGreetingReverse(greetingReverse: String) {
        self.greetingLabel.text = greetingReverse
    }
    
    func setGreeting(greeting: String) {
        self.greetingLabel.text = greeting
    }
}

