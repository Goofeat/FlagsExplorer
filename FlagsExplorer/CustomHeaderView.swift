import UIKit

class CustomHeaderView: UITableViewHeaderFooterView {
    static let reuseIdentifier = "CustomHeaderView"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Font(size: 24).medium
        label.textColor = .blackColor
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
    func configure(title: String) {
        titleLabel.text = title
    }
}
