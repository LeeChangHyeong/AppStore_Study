//
//  TodayCollectionViewCell.swift
//  AppStore_Study
//
//  Created by 이창형 on 2022/07/05.
//

import SnapKit
import UIKit

final class TodayCollectionViewCell: UICollectionViewCell {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24.0, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14.0, weight: .bold)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        // 이미지 뷰보다 이미지가 크면 이미지가 이미지뷰 벗어나서 표시되는거 방지
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 12.0
        imageView.backgroundColor = .gray
        
        return imageView
    }()
    
    // MARK: 셀 안에 뜨는 것
    func setup() {
        setUpSubViews()
        
        // MARK: 그림자 생성
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 10
        
        subTitleLabel.text = "서브타이틀"
        descriptionLabel.text = "설명설명"
        titleLabel.text = "앱의 이름"
    }
}

// 레이아웃
private extension TodayCollectionViewCell {
    func setUpSubViews() {
        // 컴포넌트들 다 addSubView
        [imageView, titleLabel, subTitleLabel, descriptionLabel]
            .forEach{addSubview($0)}
        
        subTitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(24.0)
            $0.trailing.equalToSuperview().inset(24.0)
            $0.top.equalToSuperview().inset(24.0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(subTitleLabel)
            $0.trailing.equalTo(subTitleLabel)
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(4.0)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(24.0)
            $0.trailing.equalToSuperview().inset(24.0)
            $0.bottom.equalToSuperview().inset(24.0)
        }
        
        // 이미지뷰를 상단뷰에 딱 맞춤
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
