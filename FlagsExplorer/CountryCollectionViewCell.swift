//
//  CountryCollectionViewCell.swift
//  FlagsExplorer
//
//  Created by Raiymbek Azharbayev on 20.12.2023.
//

import UIKit

class CountryCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.clipsToBounds = true
        
        self.backgroundColor = .white
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red: 0.62, green: 0.62, blue: 0.62, alpha: 1).cgColor
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with gameMode: GameMode) {
        redRectangle.backgroundColor = gameMode.ID % 2 == 0 ? .easyLevelColor : .hardLevelColor
        
        levelTitle.text = "\(gameMode.level.rawValue)"
        progressTitle.text = "Progress: \(gameMode.progressScore)"
        bestScoreTitle.text = "Best score: \(gameMode.bestScore)"
    }
}

// MARK: - Setup UI
private extension CountryCollectionViewCell {
    
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        contentView.addSubview(redRectangle)
        redRectangle.addSubview(levelTitle)
        contentView.addSubview(progressTitle)
        contentView.addSubview(bestScoreTitle)
    }
    
    func setupConstraints() {
        redRectangle.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.4)
        }
        
        levelTitle.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        progressTitle.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.top.equalTo(redRectangle.snp.bottom).inset(-10)
        }
        
        bestScoreTitle.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.top.equalTo(progressTitle.snp.bottom).inset(-5)
        }
    }
}
