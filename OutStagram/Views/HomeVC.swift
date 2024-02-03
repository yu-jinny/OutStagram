//
//  HomeVC.swift
//  OutStagram
//
//  Created by t2023-m0028 on 1/29/24.
//

import UIKit
import SnapKit

class HomeVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // 상태 바 버튼
    let statusBarButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Menu"), for: .normal)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    // 사용자 이름 라벨
    let userIDLabel: UILabel = {
        let label = UILabel()
        label.text = "panda_land"
        label.textColor = .black
        label.font = UIFont(name: "OpenSans-Bold", size: 18)
        label.textAlignment = .center
        return label
    }()
    
    // 사용자 프로필 이미지
    let userPicImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "PandaPic")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 44
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // 사용자 팔로우 정보를 담은 수평 스택 뷰
    let userFollowInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 28
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    // 사용자 정보(사용자 이름, 사용자 소개)를 담은 수직 스택 뷰
    let userInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()

    
    // 사용자 이름 라벨
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Panda The Dog"
        label.font = UIFont(name: "OpenSans-Bold", size: 14)
        return label
    }()
    
    // 사용자 소개 라벨
    let bioLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello, I'm a Panda the Dog!\nI am a trilingual speaking Dog"
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 2
        return label
    }()
    
    // 미드바(팔로우, 메세지, 더보기 버튼) 스택뷰
    let middleBarStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()
    
    let middleFMStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        return stackView
    }()

    // 팔로우 버튼
    let followButton: UIButton = {
        let button = UIButton()
        button.setTitle("Follow", for: .normal)
        button.titleLabel?.font = UIFont(name: "OpenSans-Bold", size: 14)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        return button
    }()
    
    // 사용자 소개 라벨
    let messageButton: UIButton = {
        let button = UIButton()
        button.setTitle("Message", for: .normal)
        button.titleLabel?.font = UIFont(name: "OpenSans-Bold", size: 14)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 4
        return button
    }()
    
    // 더보기 라벨
    let moreButton: UIButton = {
        let button = UIButton()
        button.setTitle("V", for: .normal)
        button.titleLabel?.font = UIFont(name: "OpenSans-Bold", size: 18)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 4
        button.snp.makeConstraints { make in
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        return button
    }()
    
    // navGallery 추가
    let navGallery: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        return stackView
    }()
    
    // 버튼 추가
        let photoPostButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(named: "Grid"), for: .normal)
            button.contentMode = .scaleAspectFit
            return button
        }()

        let videoPostButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(named: "Video"), for: .normal)
            button.contentMode = .scaleAspectFit
            return button
        }()

        let tagPostButton: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(named: "Tag"), for: .normal)
            button.contentMode = .scaleAspectFit
            return button
        }()
    
    // CollectionView
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 2
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // UI 설정
        setupUI()
        // CollectionView 데이터 소스 및 델리게이트 설정
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PhotoCollectionVC.self, forCellWithReuseIdentifier: "PhotoCell")
    }
    
    func setupUI() {
        // 전체 배경색 설정
        view.backgroundColor = .white
        
        // 상태 바 버튼 추가
        view.addSubview(statusBarButton)
        statusBarButton.snp.makeConstraints { make in
            make.width.equalTo(21)
            make.height.equalTo(17.5)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(58)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-15)
        }
        
        // 사용자 아이디 라벨 추가
        view.addSubview(userIDLabel)
        userIDLabel.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(25)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(54)
            make.centerX.equalToSuperview()
        }
        
        // 사용자 프로필 이미지 추가
        view.addSubview(userPicImageView)
        userPicImageView.snp.makeConstraints { make in
            make.width.equalTo(88)
            make.height.equalTo(88)
            make.top.equalTo(userIDLabel.snp.bottom).offset(14)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(14)
        }
        
        // 사용자 팔로우 정보 스택 뷰 추가
        view.addSubview(userFollowInfoStackView)
        userFollowInfoStackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(116)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(130)
            make.right.equalTo(view.safeAreaLayoutGuide).offset(-28) // 오른쪽 여백 추가
        }
        
        
        // 사용자 팔로우 정보 스택 뷰에 포스트, 팔로우, 팔로워 추가
        let postInfoStackView = UIStackView()
        postInfoStackView.axis = .vertical
        postInfoStackView.spacing = 4
        postInfoStackView.alignment = .center

        let followingInfoStackView = UIStackView()
        followingInfoStackView.axis = .vertical
        followingInfoStackView.spacing = 4
        followingInfoStackView.alignment = .center


        let followerInfoStackView = UIStackView()
        followerInfoStackView.axis = .vertical
        followerInfoStackView.spacing = 4
        followerInfoStackView.alignment = .center

        let postCountLabel = UILabel()
        postCountLabel.text = "0"
        postCountLabel.font = UIFont(name: "OpenSans-Bold", size: 16.5)
        postInfoStackView.addArrangedSubview(postCountLabel)

        let postLabel = UILabel()
        postLabel.text = "Post"
        postLabel.font = UIFont.systemFont(ofSize: 14)
        postInfoStackView.addArrangedSubview(postLabel)

        let followingCountLabel = UILabel()
        followingCountLabel.text = "0"
        followingCountLabel.font = UIFont(name: "OpenSans-Bold", size: 16.5)
        followingInfoStackView.addArrangedSubview(followingCountLabel)

        let followingLabel = UILabel()
        followingLabel.text = "Following"
        followingLabel.font = UIFont.systemFont(ofSize: 14)
        followingInfoStackView.addArrangedSubview(followingLabel)

        let followerCountLabel = UILabel()
        followerCountLabel.text = "0"
        followerCountLabel.font = UIFont(name: "OpenSans-Bold", size: 16.5)
        followerInfoStackView.addArrangedSubview(followerCountLabel)

        let followerLabel = UILabel()
        followerLabel.text = "Follower"
        followerLabel.font = UIFont.systemFont(ofSize: 14)
        followerInfoStackView.addArrangedSubview(followerLabel)
        
        userFollowInfoStackView.addArrangedSubview(postInfoStackView)
        userFollowInfoStackView.addArrangedSubview(followingInfoStackView)
        userFollowInfoStackView.addArrangedSubview(followerInfoStackView)
        
        updateFollowInfo()
        
        // 새로 추가한 라벨들의 초기 설정
            func updateFollowInfo() {
                // 포스트 숫자 업데이트 (collectionView의 아이템 갯수에 따라)
                let postCount = collectionView.numberOfItems(inSection: 0)
                postCountLabel.text = "\(postCount)"
            }
        
        // 사용자 정보 뷰 추가
        view.addSubview(userInfoStackView)
            userInfoStackView.snp.makeConstraints { make in
                make.width.equalTo(345)
                make.height.equalTo(59)
                make.top.equalTo(view.safeAreaLayoutGuide).offset(195)
                make.left.equalTo(view.safeAreaLayoutGuide).offset(15)
            }

            // userInfoStackView에 userNameLabel 추가
            userInfoStackView.addArrangedSubview(userNameLabel)

            // userInfoStackView에 bioLabel 추가
            userInfoStackView.addArrangedSubview(bioLabel)
        
        // 중간 바 부분 스택 뷰 추가
               view.addSubview(middleFMStackView)
        middleFMStackView.snp.makeConstraints { make in
                   make.top.equalTo(userInfoStackView.snp.bottom).offset(15)
                   make.left.equalTo(view.safeAreaLayoutGuide).offset(15)
                   make.right.equalTo(view.safeAreaLayoutGuide).offset(-53)
               }
        middleFMStackView.addArrangedSubview(followButton)
        middleFMStackView.addArrangedSubview(messageButton)
        
        // 중간 바 부분 스택 뷰 추가
               view.addSubview(middleBarStackView)
        middleBarStackView.snp.makeConstraints { make in
                   make.top.equalTo(userInfoStackView.snp.bottom).offset(15)
                   make.left.equalTo(view.safeAreaLayoutGuide).offset(15)
                   make.right.equalTo(view.safeAreaLayoutGuide).offset(-15)
               }
        
        for button in [messageButton, moreButton] {
            button.layer.borderWidth = 1 // 버튼 테두리 두께를 1로 설정
            button.layer.borderColor = UIColor.lightGray.cgColor // 버튼 테두리 색상을 회색으로 설정
        }
               
               // 중간 바 부분에 팔로우, 메세지, 더보기 버튼 추가
               middleBarStackView.addArrangedSubview(middleFMStackView)
               middleBarStackView.addArrangedSubview(moreButton)
        
        // navGallery 추가
              view.addSubview(navGallery)
              navGallery.snp.makeConstraints { make in
                  make.width.equalTo(view.frame.width)
                  make.height.equalTo(44)
                  make.top.equalTo(view.safeAreaLayoutGuide).offset(305)
                  make.centerX.equalToSuperview()
                  // 테두리 설정
                  navGallery.layer.borderWidth = 1
                  navGallery.layer.borderColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1.0).cgColor

              }

              // 버튼 추가
              navGallery.addSubview(photoPostButton)
              navGallery.addSubview(videoPostButton)
              navGallery.addSubview(tagPostButton)

              // photoPostButton 제약 조건
              photoPostButton.snp.makeConstraints { make in
                  make.width.equalTo(view.frame.width / 3)
                  make.height.equalTo(44)
                  make.centerY.equalToSuperview()
                  make.leading.equalToSuperview()
              }

              // videoPostButton 제약 조건
              videoPostButton.snp.makeConstraints { make in
                  make.width.equalTo(view.frame.width / 3)
                  make.height.equalTo(44)
                  make.centerY.equalToSuperview()
                  make.centerX.equalToSuperview()
              }
              videoPostButton.tintColor = .black
              // tagPostButton 제약 조건
              tagPostButton.snp.makeConstraints { make in
                  make.width.equalTo(view.frame.width / 3)
                  make.height.equalTo(44)
                  make.centerY.equalToSuperview()
                  make.trailing.equalToSuperview()
              }
              tagPostButton.tintColor = .black

                       
                // CollectionView 추가
                view.addSubview(collectionView)
                collectionView.snp.makeConstraints { make in
                    make.top.equalTo(navGallery.snp.bottom).offset(2)
                    make.left.right.bottom.equalTo(view.safeAreaLayoutGuide)
                }
            }

    // MARK: - UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 22 // 이미지 파일이 22개 있음
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCollectionVC else {
            return UICollectionViewCell()
        }
        
        // 이미지 파일 이름 설정
        let imageName = "Panda\(indexPath.item + 1)"
        
        // Assets.xcassets에 추가한 이미지 사용
        let image = UIImage(named: imageName)
        
        // 셀에 이미지 설정
        cell.configure(with: image)
        
        return cell
    }

            // MARK: - UICollectionViewDelegateFlowLayout
            
            func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                // 셀의 크기 설정
                let cellSize = (collectionView.frame.width - 6) / 3
                return CGSize(width: cellSize, height: cellSize)
            }
        }

        // 예시로 사용할 CollectionViewCell 클래스
        class MyCollectionViewCell: UICollectionViewCell {
            // 셀 내부의 뷰 및 UI 구성을 여기에 추가할 수 있습니다.
        }
