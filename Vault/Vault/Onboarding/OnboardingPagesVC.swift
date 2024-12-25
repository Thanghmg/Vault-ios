//
//  OnboardingPagesVC.swift
//  Vault
//
//  Created by Thang Hoang on 19/12/24.
//

import UIKit
import SnapKit

class OnboardingPagesVC: UIViewController {

  // MARK: - Variables
  private let illustration: String

  private let introText: String
    
  // MARK: - UI Components
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 120
//        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        return stackView
    }()
    
    
    private lazy var pageImg: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: illustration)
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var pageIntro: UILabel = {
        let introTxt = UILabel()
        introTxt.text = introText
        introTxt.font = .systemFont(ofSize: 24, weight: .bold)
        introTxt.textColor = .white
        introTxt.numberOfLines = 0
        introTxt.textAlignment = .center
        return introTxt
    }()

  // MARK: - Initialize
    init(pageImg: String, pageIntro: String) {
        self.illustration = pageImg
        self.introText = pageIntro
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.layout()
        self.setupUI()
    }
}

    // MARK: - Setup UI
extension OnboardingPagesVC {
    
    private func layout() {
        view.backgroundColor = .clear
    }
    
    private func setupUI() {
        stackView.addArrangedSubview(pageImg)
        stackView.addArrangedSubview(pageIntro)
        view.addSubview(stackView)
        
        
        pageImg.snp.makeConstraints { make in
            make.width.lessThanOrEqualToSuperview().offset(-16)
            make.height.equalTo(pageImg.snp.width).multipliedBy(0.5)
        }
        
        // Stack View Constraints
        stackView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
        }
    }
}
