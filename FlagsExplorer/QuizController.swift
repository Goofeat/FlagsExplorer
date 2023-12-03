//
//  ViewController.swift
//  FlagsExplorer
//
//  Created by Raiymbek Azharbayev on 17.11.2023.
//

import UIKit
import SnapKit

class QuizController: UIViewController {
    
    var gameMode: GameMode
    
    init(gameMode: GameMode) {
        self.gameMode = gameMode
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .backgroundColor
        
        optionsCollectionView.dataSource = self
        optionsCollectionView.delegate = self
        
        setupUI()
        
        startGame()
    }
    
    @objc func goToHome(_ sender: UIButton) {
        AppRepository.save(gameMode: gameMode)
        
        let viewController = ViewController()
        
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .crossDissolve
        
        self.present(viewController, animated: true, completion: nil)
    }
    
    var countries: [Country] = []
    var answer: Country = AppRepository.shared.countries.first!
    var options: [Country] = []
    
    func startGame() {
        countries = gameMode.countriesToGuess
        
        switch gameMode.mode {
            case .Countries:
                guessLabel.font = Font(size: 150).bold
            case .Flags:
                guessLabel.font = Font(size: 40).bold
            case .Capitals:
                guessLabel.font = Font(size: 40).bold
        }
        
        if gameMode.healthPoint != 0 {
            setCountries(score: gameMode.progressScore)
        }
    }
    
    func setCountries(score: Int) {
        answer = countries[score]
        
        switch gameMode.mode {
            case .Countries:
                guessLabel.text = answer.flag
            case .Flags:
                guessLabel.text = answer.name
            case .Capitals:
                guessLabel.text = answer.capital
        }
        
        let secondOption = countries.filter {
            $0.code != answer.code
        }.randomElement()!
        
        let thirdOption = countries.filter {
            $0.code != answer.code &&
            $0.code != secondOption.code
        }.randomElement()!
        
        let fourthOption = countries.filter {
            $0.name != answer.name &&
            $0.code != secondOption.code &&
            $0.code != thirdOption.code
        }.randomElement()!
        
        options = [answer, secondOption, thirdOption, fourthOption].shuffled()
    }
    
    private let optionsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .backgroundColor
        collectionView.register(
            OptionCollectionViewCell.self,
            forCellWithReuseIdentifier: "OptionCollectionViewCell"
        )
        return collectionView
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
        label.text = gameMode.mode.rawValue
        label.font = Font(size: 32).bold
        label.textColor = .blackColor
        return label
    }()
    
    private lazy var ellipsisSubtitle: UILabel = {
        let label = UILabel()
        label.text = "Score: \(gameMode.progressScore)"
        label.font = Font(size: 24).regular
        label.textColor = .darkGrayColor
        return label
    }()
    
    private lazy var ellipsisView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 300
        view.layer.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1).cgColor
        return view
    }()
    
    private var healthView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var firstHeart: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(
            systemName: "heart.fill",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 24)
        )
        imageView.tintColor = .buttonEnabledColor
        return imageView
    }()
    
    private lazy var secondHeart: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(
            systemName: gameMode.healthPoint < 2 ? "heart" : "heart.fill",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 24)
        )
        imageView.tintColor = .buttonEnabledColor
        return imageView
    }()
    
    private lazy var thirdHeart: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(
            systemName: gameMode.healthPoint < 3 ? "heart" : "heart.fill",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 24)
        )
        imageView.tintColor = .buttonEnabledColor
        return imageView
    }()
    
    private var guessLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        label.numberOfLines = 3
        return label
    }()
}

// MARK: - Collection view data source methods
extension QuizController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OptionCollectionViewCell", for: indexPath) as! OptionCollectionViewCell
        
        switch gameMode.mode {
            case .Flags:
                cell.textLabel.font = Font(size: 70).semibold
                cell.textLabel.text = options[indexPath.item].flag
            case .Countries:
                cell.textLabel.text = options[indexPath.item].name
            case .Capitals:
                cell.textLabel.text = options[indexPath.item].name
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let isCorrect = options[indexPath.item].code == answer.code
        
        collectionView.cellForItem(at: indexPath)!.backgroundColor = isCorrect ? .buttonEnabledColor : .buttonDisabledColor
        
        if isCorrect {
            gameMode.progressScore += 1
            
            optionsCollectionView.visibleCells.forEach { $0.backgroundColor = .buttonEnabledColor }
            
            optionsCollectionView.reloadData()
            
            setCountries(score: gameMode.progressScore)
        } else {
            gameMode.healthPoint -= 1
            healthView.shake()
            
            switch gameMode.healthPoint {
                case 0:
                    let tmp = gameMode.progressScore
                    
                    gameMode.bestScore = max(gameMode.bestScore, gameMode.progressScore)
                    gameMode.healthPoint = 3
                    gameMode.progressScore = 0
                    
                    let resultController = ResultController(gameMode: gameMode, score: tmp)
                    
                    resultController.modalPresentationStyle = .fullScreen
                    resultController.modalTransitionStyle = .crossDissolve
                    
                    self.present(resultController, animated: true, completion: nil)
                case 1:
                    secondHeart.image = UIImage(
                        systemName: "heart",
                        withConfiguration: UIImage.SymbolConfiguration(pointSize: 24)
                    )
                default:
                    thirdHeart.image = UIImage(
                        systemName: "heart",
                        withConfiguration: UIImage.SymbolConfiguration(pointSize: 24)
                    )
            }
        }
        
        ellipsisSubtitle.text = "Score: \(gameMode.progressScore)"
        AppRepository.save(gameMode: gameMode)
    }
}

// MARK: - Collection view delegate flow layout methods
extension QuizController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 20) / 2
        let height = collectionView.frame.height / 2.2
        return CGSize(width: width, height: height)
    }
}

// MARK: - UI setup methods
private extension QuizController {
    
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(ellipsisView)
        ellipsisView.addSubview(backButton)
        ellipsisView.addSubview(ellipsisTitle)
        ellipsisView.addSubview(ellipsisSubtitle)
        ellipsisView.addSubview(healthView)
        healthView.addSubview(firstHeart)
        healthView.addSubview(secondHeart)
        healthView.addSubview(thirdHeart)
        view.addSubview(guessLabel)
        view.addSubview(optionsCollectionView)
    }
    
    func setupConstraints() {
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
        
        ellipsisSubtitle.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(ellipsisTitle.snp.bottom).inset(-10)
        }
        
        healthView.snp.makeConstraints {
            $0.centerY.equalTo(ellipsisTitle)
            $0.left.equalTo(ellipsisTitle.snp.right)
            $0.right.equalTo(view.safeAreaLayoutGuide.snp.right)
        }
        
        firstHeart.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalTo(secondHeart.snp.left)
        }
        
        secondHeart.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        thirdHeart.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(secondHeart.snp.right)
        }
        
        guessLabel.snp.makeConstraints {
            $0.top.equalTo(ellipsisView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.45)
        }
        
        optionsCollectionView.snp.makeConstraints {
            $0.top.equalTo(guessLabel.snp.bottom)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
}
