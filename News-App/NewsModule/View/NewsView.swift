//
//  NewsView.swift
//  News-App
//
//  Created by Иван Осипов on 07.03.2023.
//

import UIKit

class NewsView: UIView {

    private let screenSize = UIScreen.main.bounds
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupCollection()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init (coder:) has not be implemented")
    }
    
    private func setup() {
        self.addSubview(collectionView)
        self.backgroundColor = .systemBackground
    }
    
    private func setupCollection() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: screenSize.width - 20, height: 150)
        layout.scrollDirection = .vertical
        collectionView.collectionViewLayout = layout
        collectionView.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: "NewsCollectionViewCell")
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        ])
    }
}
