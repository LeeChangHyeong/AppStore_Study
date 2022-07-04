//
//  TodayViewController.swift
//  AppStore_Study
//
//  Created by 이창형 on 2022/07/05.
//

import SnapKit
import UIKit

// 얘를 계승할 서브클래스는 없기 때문에 final class
final class TodayViewController: UIViewController {
    private lazy var collectionView: UICollectionView = {
        // 레이아웃 초기화
        let layout = UICollectionViewFlowLayout()
        // 컬랙션뷰는 레이아웃이 무조건 필요하다
        // 스냅킷을 사용하여 나중에 프레임 지정해주니까 zero로 만듬
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        // collectionView를 꾸며주기 위해
        // delegate -> 테이블에 한 행을 누를때 어떤 액션을 취할 것인지
        // dataSource -> 테이블을 어떻게 구성할 것인지, 내용은 뭐가 될지
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = .systemBackground
        // MARK: 셀을 넣음
        collectionView.register(TodayCollectionViewCell.self, forCellWithReuseIdentifier: "todayCell")
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension TodayViewController: UICollectionViewDataSource {
    // 셀을 리턴
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // as? 는 TodayCollectionViewCell 캐스팅
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "todayCell", for: indexPath) as? TodayCollectionViewCell
        cell?.setup()

        return cell ?? UICollectionViewCell()
    }

    // 셀을 몇개 쓸건지, 기본으로 셀 하나는 디폴트
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
}

// 컬렉션뷰의 셀 사이즈가 리턴되는 값을 기준으로 설정됌
extension TodayViewController: UICollectionViewDelegateFlowLayout {
    // 셀의 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 컬렉션뷰 자체의 전체 width - 32
        // 왼쪽 오른쪽 16씩 뺌
        let width = collectionView.frame.width - 32

        return CGSize(width: width, height: width)
    }
}

