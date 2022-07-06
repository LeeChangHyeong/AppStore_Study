//
//  AppViewController.swift
//  AppStore_Study
//
//  Created by 이창형 on 2022/07/06.
//

import SnapKit
import UIKit

final class AppViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        // 간격만 동일
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
        let featureSectionView = UIView()
        let rankingFeatureSectionView = UIView()
        let exchangeCodeButtonView = UIView()
        
        featureSectionView.backgroundColor = .red
        rankingFeatureSectionView.backgroundColor = .blue
        exchangeCodeButtonView.backgroundColor = .yellow
        
        return stackView
    }()
    
    override func viewDidLoad() {
        setupNavigationController()
    }
}


// MARK: 따로 구분해서 메소드를 만들어 줌
private extension AppViewController {
    func setupNavigationController() {
        navigationItem.title = "앱"
        // 무슨일이 있어도 라지 타이틀만 보임
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupLayout() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            // 스크롤 뷰에 고정되야 세로 스크롤만 됌
            // height 설정하면 가로 스크롤
            $0.width.equalToSuperview()
        }
        
        contentView.addSubview(stackView)
        contentView.snp.makeConstraints {
            // 본인의 서브뷰로 지정될거기 때문에 height 설정 금지
            $0.edges.equalToSuperview()
        }
        
    }
}



