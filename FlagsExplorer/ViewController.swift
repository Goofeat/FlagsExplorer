//
//  ViewController.swift
//  FlagsExplorer
//
//  Created by Raiymbek Azharbayev on 17.11.2023.
//

import UIKit
import SnapKit

final class ViewController: UIViewController, MenuTableViewCellDelegate {
    
    func didSelectItem(_ item: GameMode) {
        let quizController = QuizController(gameMode: item)
        
        quizController.modalPresentationStyle = .fullScreen
        quizController.modalTransitionStyle = .crossDissolve
        
        self.present(quizController, animated: true, completion: nil)
    }

    let screenSize = UIScreen.main.bounds.size

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupUI()
    }
    
    @objc func showTable(_ sender: UIButton) {
        let tableController = TableController()
        
        tableController.modalPresentationStyle = .fullScreen
        tableController.modalTransitionStyle = .crossDissolve
        
        self.present(tableController, animated: true, completion: nil)
    }
    
    private lazy var ellipsisTitle: UILabel = {
        let label = UILabel()
        label.text = "Main Menu"
        label.font = Font(size: 32).bold
        label.textColor = .blackColor
        return label
    }()
    
    private lazy var ellipsisView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 300
        view.layer.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1).cgColor
        return view
    }()

    private lazy var menuTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(
            CustomHeaderView.self,
            forHeaderFooterViewReuseIdentifier: CustomHeaderView.reuseIdentifier
        )
        tableView.register(
            MenuTableViewCell.self,
            forCellReuseIdentifier: "MenuTableViewCell"
        )
        tableView.backgroundColor = .white
        tableView.isScrollEnabled = true
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    private lazy var tableButton: UIButton = {
        let button = UIButton()
        button.addTarget(
            self,
            action: #selector(showTable),
            for: .touchUpInside
        )
        button.setImage(
            UIImage(systemName: "tablecells.fill"),
            for: .normal
        )
        button.tintColor = .white
        button.backgroundColor = .buttonEnabledColor
        button.layer.cornerRadius = 15
        return button
    }()

}

// MARK: - TableView data source methods
extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        Mode.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        
        cell.configure(row: AppRepository.shared.gameModes[indexPath.section])
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: CustomHeaderView.reuseIdentifier) as! CustomHeaderView
        headerView.configure(title: Mode.allCases[section].rawValue)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
}

// MARK: TableView delegate methods
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        screenSize.height * 0.15
    }
}

// MARK: - UI setup methods
private extension ViewController {
    
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(menuTableView)
        view.addSubview(ellipsisView)
        ellipsisView.addSubview(tableButton)
        ellipsisView.addSubview(ellipsisTitle)
    }
    
    func setupConstraints() {
        ellipsisView.snp.makeConstraints {
            $0.width.equalToSuperview().multipliedBy(1.6)
            $0.height.equalToSuperview().multipliedBy(0.3)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(-70)
        }
        
        ellipsisTitle.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(70)
        }
        
        tableButton.snp.makeConstraints {
            $0.centerY.equalTo(ellipsisTitle)
            $0.right.equalTo(view.safeAreaLayoutGuide.snp.right).inset(20)
            $0.height.width.equalTo(ellipsisTitle.snp.height)
        }
        
        menuTableView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(ellipsisView.snp.bottom)
            $0.bottom.equalToSuperview()
        }
    }
}

