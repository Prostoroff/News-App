//
//  NewsCollectionViewCell.swift
//  News-App
//
//  Created by Иван Осипов on 07.03.2023.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    let newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "image")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let view: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5)
        return view
    }()
    
    let newsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init (coder:) has not be implemeted")
    }
    
    private func setup() {
        self.addSubview(newsImageView)
        self.addSubview(view)
        self.addSubview(newsLabel)
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            newsImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            newsImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            newsImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            newsImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            
            view.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            
            newsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            newsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            newsLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
}
