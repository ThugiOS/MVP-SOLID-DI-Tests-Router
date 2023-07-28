//
//  DetailViewController.swift
//  MVP+SOLID+DI+Tests+Router
//
//  Created by Никитин Артем on 28.07.23.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    
    var presenter: DetailViewPresenterProtocol!
    
    private var commentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 10
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.text = "Title"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.setComment()
    }
    
    private func setupUI() {
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(commentLabel)
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            commentLabel.topAnchor.constraint(equalTo: self.view.topAnchor),
            commentLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            commentLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20.0),
            commentLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20.0),
        ])
    }
}

extension DetailViewController: DetailViewProtocol {
    func setComment(comment: Comment?) {
        commentLabel.text = comment?.body
    }
}
