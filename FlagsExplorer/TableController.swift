//
//  TableController.swift
//  FlagsExplorer
//
//  Created by Raiymbek Azharbayev on 20.12.2023.
//

import UIKit

class TableController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        setupUI()
    }
    
    private lazy var countryName: UILabel = {
        let label = UILabel()
        label.text = "Country"
        label.font = Font(size: 20).semibold
        label.textColor = .blackColor
        label.textAlignment = .left
        return label
    }()
    
    private lazy var capitalName: UILabel = {
        let label = UILabel()
        label.text = "Capital"
        label.font = Font(size: 20).semibold
        label.textColor = .blackColor
        label.textAlignment = .left
        return label
    }()
    
    private lazy var countryFlag: UILabel = {
        let label = UILabel()
        label.text = "Flag"
        label.font = Font(size: 20).semibold
        label.textColor = .blackColor
        label.textAlignment = .left
        return label
    }()
    
    @objc func goToHome(_ sender: UIButton) {
        let viewController = ViewController()
        
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .crossDissolve
        
        self.present(viewController, animated: true, completion: nil)
    }
    
    private lazy var countriesTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(
            CountryTableViewCell.self,
            forCellReuseIdentifier: "CountryTableViewCell"
        )
        tableView.backgroundColor = .white
        tableView.isScrollEnabled = true
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.addTarget(
            self,
            action: #selector(goToHome),
            for: .touchUpInside
        )
        button.setImage(
            UIImage(systemName: "arrowshape.left.fill"),
            for: .normal
        )
        button.tintColor = .white
        button.backgroundColor = .buttonEnabledColor
        button.layer.cornerRadius = 15
        return button
    }()
    
    private lazy var ellipsisTitle: UILabel = {
        let label = UILabel()
        label.text = "Table"
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
    
    private lazy var tmpView = UIView()
}

// MARK: - TableView data source methods
extension TableController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AppRepository.shared.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath) as! CountryTableViewCell
        
        cell.configure(country: AppRepository.shared.countries[indexPath.row])
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
}

// MARK: TableView delegate methods
extension TableController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        (view.window?.windowScene?.screen.bounds.height ?? 0) * 0.05
    }
}

// MARK: - UI setup methods
private extension TableController {
    
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(countriesTableView)
        view.addSubview(tmpView)
        tmpView.addSubview(countryName)
        tmpView.addSubview(capitalName)
        tmpView.addSubview(countryFlag)
        view.addSubview(ellipsisView)
        ellipsisView.addSubview(backButton)
        ellipsisView.addSubview(ellipsisTitle)
    }
    
    func setupConstraints() {
        tmpView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(ellipsisView.snp.bottom).inset(-20)
        }
        
        countryName.snp.makeConstraints {
            $0.left.centerY.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.4)
        }
        
        capitalName.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(countryName.snp.right)
            $0.width.equalToSuperview().multipliedBy(0.4)
        }
        
        countryFlag.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(capitalName.snp.right)
            $0.width.equalToSuperview().multipliedBy(0.2)
        }
        
        ellipsisView.snp.makeConstraints {
            $0.width.equalToSuperview().multipliedBy(1.6)
            $0.height.equalToSuperview().multipliedBy(0.3)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(-70)
        }
        
        backButton.snp.makeConstraints {
            $0.centerY.equalTo(ellipsisTitle)
            $0.left.equalTo(view.safeAreaLayoutGuide.snp.left).inset(20)
            $0.height.width.equalTo(ellipsisTitle.snp.height)
        }
        
        ellipsisTitle.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(70)
        }
        
        countriesTableView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(tmpView.snp.bottom).inset(-20)
            $0.bottom.equalToSuperview()
        }
    }
}

