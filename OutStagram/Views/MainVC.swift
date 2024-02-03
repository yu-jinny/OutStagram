//  MainVC.swift
//  OutStagram
//
//  Created by t2023-m0028 on 1/27/24.

import UIKit
import SnapKit

class MainVC: UIViewController {
    
    // Outstagram 타이틀을 나타내는 레이블
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Outstargram"
        label.font = UIFont(name: "MarkerFelt-Thin", size: 35)
        label.textAlignment = .center
        label.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 10)
        return label
    }()
    
    // Outstagram 로고 이미지를 나타내는 이미지 뷰
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "outStagramLogo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // "시작하기"를 나타내는 버튼
    // Lazy var로 선언하여 필요할 때만 초기화
    lazy var startButton: UIButton = {
        let button = UIButton()
        button.setTitle("시작하기", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemYellow
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UI 설정
        setupUI()
    }
    
    // UI 구성 메서드
    func setupUI() {
        view.backgroundColor = .white
        
        // Logo ImageView 추가 및 제약 조건 설정
        view.addSubview(logoImageView)
        logoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalTo(view.safeAreaLayoutGuide).offset(-140) // 아래에 표시되도록 조절
            make.width.equalTo(150)
            make.height.equalTo(150)
        }
        
        // 상단 UILabel 추가 및 제약 조건 설정
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoImageView.snp.bottom).offset(40) // 아래에 표시되도록 조절
        }
        
        // 하단 UIButton 추가 및 제약 조건 설정
        view.addSubview(startButton)
        startButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-100)
            make.width.equalTo(120)
            make.height.equalTo(40)
        }
    }

    // "시작하기" 버튼이 눌렸을 때 실행되는 메서드
    @objc func startButtonTapped() {
        print("Start button tapped")
        
        // HomeTabBarController로 감싸서 열기
        let homeTabBarController = TabBarController()
        self.present(homeTabBarController, animated: true, completion: nil)
    }
}
