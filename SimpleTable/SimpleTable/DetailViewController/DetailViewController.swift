//
//  DetailViewController.swift
//  SimpleTable
//
//  Created by Андрей Жуков on 09.11.2020.
//

import Foundation
import UIKit

final class DetailViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    
    // MARK: - Initialization

    init(titleText: String?, subtitleText: String?) {
        super.init(nibName: nil, bundle: nil)
        self.titleLabel.text = titleText
        self.subtitleLabel.text = subtitleText
        self.configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    private func configureUI() {
        self.addTitleLabel()
        self.addDetailLabel()
        self.view.backgroundColor = .white
    }
    
    private func addTitleLabel() {
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.textColor = .black
        self.view.addSubview(self.titleLabel)
        NSLayoutConstraint.activate([
            self.titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.titleLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -50.0)
        ])
    }
    
    private func addDetailLabel() {
        self.subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.textColor = .black
        self.view.addSubview(self.subtitleLabel)
        NSLayoutConstraint.activate([
            self.subtitleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.subtitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 25.0)
        ])
    }
}
