//
//  OptionsCollectionViewCell.swift
//  FlagsExplorer
//
//  Created by Raiymbek Azharbayev on 03.12.2023.
//

import UIKit

class OptionsCollectionViewCell: UICollectionViewCell {
    
    private lazy var option: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: AppRepository.shared.font.semibold, size: 22)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with country: Country) {
        option.text = country.name
    }
    
}

// MARK: - Setup UI
private extension OptionsCollectionViewCell {
    
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        contentView.addSubview(option)
    }
    
    func setupConstraints() {
        option.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
