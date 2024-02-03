//
//  PhotoCollectionVC.swift
//  OutStagram
//
//  Created by t2023-m0028 on 1/27/24.
//

import UIKit

class PhotoCollectionVC: UICollectionViewCell {
  
    // 이미지를 표시할 UIImageView
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            return imageView
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupUI()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupUI()
        }
        
        private func setupUI() {
            // UIImageView를 셀에 추가
            contentView.addSubview(imageView)
            imageView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
        
        // 이미지를 설정하는 메서드
        func configure(with image: UIImage?) {
            imageView.image = image
        }
    }
