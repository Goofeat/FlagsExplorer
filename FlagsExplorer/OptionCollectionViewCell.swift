//
//  OptionCollectionViewCell.swift
//  FlagsExplorer
//
//  Created by Raiymbek Azharbayev on 20.12.2023.
//

import UIKit

class OptionCollectionViewCell: UICollectionViewCell {
    let textLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .whiteColor
        label.font = Font(size: 18).semibold
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 20
        self.backgroundColor = .buttonEnabledColor
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI setup methods
private extension OptionCollectionViewCell {
    
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(textLabel)
    }
    
    func setupConstraints() {
        textLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

