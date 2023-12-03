//
//  CountryTableViewCell.swift
//  FlagsExplorer
//
//  Created by Raiymbek Azharbayev on 20.12.2023.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    
    let screenSize = UIScreen.main.bounds.size
    
    private lazy var countryName: UILabel = {
        let label = UILabel()
        label.text = "Country"
        label.font = Font(size: 20).regular
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .blackColor
        label.textAlignment = .left
        return label
    }()
    
    private lazy var capitalName: UILabel = {
        let label = UILabel()
        label.text = "Capital"
        label.font = Font(size: 20).regular
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .blackColor
        label.textAlignment = .left
        return label
    }()
    
    private lazy var countryFlag: UILabel = {
        let label = UILabel()
        label.text = "Country"
        label.font = Font(size: 36).regular
        label.textColor = .blackColor
        label.textAlignment = .center
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(country: Country) {
        countryName.text = country.name
        capitalName.text = country.capital
        countryFlag.text = country.flag
    }
}

// MARK: - UI setup methods
private extension CountryTableViewCell {
    
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(countryName)
        addSubview(capitalName)
        addSubview(countryFlag)
    }
    
    func setupConstraints() {
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
    }
}
