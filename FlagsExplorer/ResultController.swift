//
//  ViewController.swift
//  FlagsExplorer
//
//  Created by Raiymbek Azharbayev on 17.11.2023.
//

import UIKit
import SnapKit

class ResultController: UIViewController {
    
    var gameMode: GameMode
    var score: Int
    
    init(gameMode: GameMode, score: Int) {
        self.gameMode = gameMode
        self.score = score
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .backgroundColor

        setupUI()
    }
    
    @objc func tryAgain(_ sender: UIButton) {
        let quizController = QuizController(gameMode: gameMode)
        
        quizController.modalPresentationStyle = .fullScreen
        quizController.modalTransitionStyle = .crossDissolve
        
        self.present(quizController, animated: true, completion: nil)
    }
    
    @objc func goToHome(_ sender: UIButton) {
        let viewController = ViewController()
        
        viewController.modalPresentationStyle = .fullScreen
        viewController.modalTransitionStyle = .crossDissolve
        
        self.present(viewController, animated: true, completion: nil)
    }
    
    private lazy var ellipsisTitle: UILabel = {
        let label = UILabel()
        label.text = "Results"
        label.font = Font(size: 32).bold
        label.textColor = .blackColor
        return label
    }()
    
    private lazy var ellipsisSubtitle: UILabel = {
        let label = UILabel()
        label.text = "\(gameMode.mode.rawValue) | \(gameMode.level.rawValue)"
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
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "Your score:"
        label.font = Font(size: 32).bold
        label.textColor = .blackColor
        return label
    }()
    
    private lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.text = String(score)
        label.font = Font(size: 64).bold
        label.textColor = .buttonEnabledColor
        return label
    }()
    
    private lazy var tryAgainButton: UIButton = {
        let button = UIButton()
        button.addTarget(
            self,
            action: #selector(tryAgain),
            for: .touchUpInside
        )
        button.setTitle("Try again", for: .normal)
        button.titleLabel!.font = Font(size: 24).semibold
        button.backgroundColor = .buttonEnabledColor
        button.layer.cornerRadius = 20
        return button
    }()
    
    private lazy var goToHomeButton: UIButton = {
        let button = UIButton()
        button.addTarget(
            self,
            action: #selector(goToHome),
            for: .touchUpInside
        )
        button.setTitle("Back to menu", for: .normal)
        button.titleLabel!.font = Font(size: 24).semibold
        button.backgroundColor = .blackColor
        button.layer.cornerRadius = 20
        return button
    }()
    
}

// MARK: - UI setup methods
private extension ResultController {
    
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(ellipsisView)
        ellipsisView.addSubview(ellipsisTitle)
        ellipsisView.addSubview(ellipsisSubtitle)
        view.addSubview(textLabel)
        view.addSubview(scoreLabel)
        view.addSubview(tryAgainButton)
        view.addSubview(goToHomeButton)
    }
    
    func setupConstraints() {
        tryAgainButton.snp.makeConstraints {
            $0.height.equalToSuperview().multipliedBy(0.08)
            $0.bottom.equalTo(goToHomeButton.snp.top).inset(-20)
            $0.leading.trailing.equalToSuperview().inset(50)
        }
        
        goToHomeButton.snp.makeConstraints {
            $0.height.equalToSuperview().multipliedBy(0.08)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(50)
        }
        
        scoreLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        textLabel.snp.makeConstraints {
            $0.bottom.equalTo(scoreLabel.snp.top)
            $0.centerX.equalToSuperview()
        }
        
        ellipsisView.snp.makeConstraints {
            $0.width.equalToSuperview().multipliedBy(1.6)
            $0.height.equalToSuperview().multipliedBy(0.3)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(-70)
        }
        
        ellipsisTitle.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(70)
        }
        
        ellipsisSubtitle.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(ellipsisTitle.snp.bottom)
        }
    }
}

