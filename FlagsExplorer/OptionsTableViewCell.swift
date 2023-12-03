//
//  MainTableViewCell.swift
//  FlagsExplorer
//
//  Created by Raiymbek Azharbayev on 17.11.2023.
//

import UIKit

final class OptionsTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: AppRepository.shared.font.regular, size: 22)
        label.textColor = .black
        return label
    }()
    
    private lazy var capitalLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: AppRepository.shared.font.regular, size: 22)
        label.textColor = .black
        return label
    }()
    
    func configure(_ country: Country) {
        nameLabel.text = country.name
        capitalLabel.text = country.capital
    }
    
}

// MARK: - UI setup methods
private extension OptionsTableViewCell {
    
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(nameLabel)
        addSubview(capitalLabel)
    }
    
    func setupConstraints() {
        nameLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        capitalLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(nameLabel.snp.bottom)
        }
    }
}

