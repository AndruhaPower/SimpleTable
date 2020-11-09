//
//  MainViewController.swift
//  SimpleTable
//
//  Created by Андрей Жуков on 09.11.2020.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let itemsListCount: Int
    
    private lazy var mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.reuseId)
        return tableView
    }()

    // MARK: - Initialization
    
    init() {
        self.itemsListCount = .random(in: 10...100)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = self.mainTableView
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Таблица"
    }
    
}

// MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? MainTableViewCell else { return }
        let vc = DetailViewController(titleText: cell.titleText,
                                                  subtitleText: cell.descriptionText)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.itemsListCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeueCell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseId, for: indexPath)
        
        guard let cell = dequeueCell as? MainTableViewCell
            , let viewModel = ViewModelType.allCases.randomElement()?.viewModel else { return UITableViewCell() }
        cell.titleText = viewModel.title
        cell.descriptionText = viewModel.description
        
        return cell
    }
    
}
