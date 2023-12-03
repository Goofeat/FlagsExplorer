import UIKit

class CustomHeader: UITableViewHeaderFooterView {
    let title: UILabel = {
        let label = UILabel()
        label.font = Font(size: 24).medium
        label.textColor = .blackColor
        label.textAlignment = .left
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.addSubview(title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
