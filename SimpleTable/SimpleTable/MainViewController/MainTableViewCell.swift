//
//  MainTableViewCell.swift
//  SimpleTable
//
//  Created by Андрей Жуков on 09.11.2020.
//

import Foundation
import UIKit

final class MainTableViewCell: UITableViewCell {
    
    static let reuseId = "MainTableViewCellReuseIdentifier"
   
    // MARK: - Internal properties
        
    var titleText: String? {
        didSet {
            self.titleLabel.text = self.titleText
        }
    }
    
    var descriptionText: String? {
        didSet {
            self.descriptionLabel.text = self.descriptionText
        }
    }
    
    // MARK: - Private prorepties
    
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    private struct Constants {
        static let labelsFont = UIFont(name: "HelveticaNeue-Medium", size: 14.0)
        static let offset: CGFloat = 10.0
        static let requiredHeight: CGFloat = offset * 2 + (labelsFont?.lineHeight ?? 0)
    }
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Overriden
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.titleLabel.text = nil
        self.descriptionLabel.text = nil
    }
      
    // MARK: - Layout
    
    private func configureUI() {
        self.addTitleLabel()
        self.addDescriptionLabel()
        self.contentView.heightAnchor.constraint(equalToConstant: Constants.requiredHeight).isActive = true
    }
    
    private func addTitleLabel() {
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.font = Constants.labelsFont
        self.titleLabel.textColor = .red
        self.contentView.addSubview(self.titleLabel)
        NSLayoutConstraint.activate([
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.offset),
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            self.titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func addDescriptionLabel() {
        self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.descriptionLabel.font = Constants.labelsFont
        self.descriptionLabel.textColor = .blue
        self.contentView.addSubview(self.descriptionLabel)
        NSLayoutConstraint.activate([
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.titleLabel.trailingAnchor, constant: Constants.offset),
            self.descriptionLabel.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -Constants.offset),
            self.descriptionLabel.topAnchor.constraint(equalTo: self.topAnchor),
            self.descriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
