    //
    //  MainTableViewCell.swift
    //  FlagsExplorer
    //
    //  Created by Raiymbek Azharbayev on 17.11.2023.
    //

import UIKit
import SnapKit

final class MenuTableViewCell: UITableViewCell {
    
    weak var delegate: MenuTableViewCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        modesCollectionView.dataSource = self
        modesCollectionView.delegate = self
        modesCollectionView.clipsToBounds = true
        
        contentView.isUserInteractionEnabled = false
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var dataRow: [GameMode] = []
    
    private lazy var modesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        collectionView.register(ModeCollectionViewCell.self, forCellWithReuseIdentifier: "ModeCollectionViewCell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = true
        collectionView.alwaysBounceHorizontal = true
        return collectionView
    }()
    
    func configure(row: [GameMode]) {
        self.dataRow = row
        self.modesCollectionView.reloadData()
    }
}

// MARK: - Collection view data source methods
extension MenuTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataRow.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ModeCollectionViewCell", for: indexPath) as! ModeCollectionViewCell
        
        cell.configure(with: dataRow[indexPath.item])
        
        return cell
    }
}

extension MenuTableViewCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.didSelectItem(dataRow[indexPath.item])
    }
}

// MARK: - Collection view delegate flow layout methods
extension MenuTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 1.4, height: collectionView.frame.height)
    }
}

// MARK: - UI setup methods
private extension MenuTableViewCell {
    
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(modesCollectionView)
        bringSubviewToFront(modesCollectionView)
    }
    
    func setupConstraints() {
        modesCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

protocol MenuTableViewCellDelegate: AnyObject {
    func didSelectItem(_ item: GameMode)
}
