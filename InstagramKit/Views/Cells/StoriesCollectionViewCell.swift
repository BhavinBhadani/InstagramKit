//
//  StoriesCollectionViewCell.swift
//  InstagramKit
//
//  Created by Appernaut on 05/06/21.
//

import UIKit

class StoriesCollectionViewCell: UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    private var containerContentView: BorderView = {
        let container = BorderView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .white
        container.borderWidth = 2.5
        return container
    }()
    
    private var userImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .lightGray
        imageView.layer.cornerRadius = 30
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private var plusImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        imageView.image = UIImage(named: "ic_plus_blue")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 12.5
        imageView.layer.masksToBounds = true
        return imageView
    }()

    private var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12)
        label.text = "John Doe"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var story: Story? {
        didSet {
            guard let story = story else { return }
            userImageView.image = UIImage(named: story.userImage)
            nameLabel.text = story.userName
            plusImageView.isHidden = !story.isMine
            
            if story.isMine {
                containerContentView.borderWidth = 0
                containerContentView.borderStatus = .noBorder
            } else if !story.isMine && story.isSeen {
                containerContentView.borderWidth = 2
                containerContentView.borderStatus = .normal
            } else {
                containerContentView.borderWidth = 2.5
                containerContentView.borderStatus = .gradient
            }
        }
    }
}

// MARK: - Helpers
extension StoriesCollectionViewCell {
    private func setupView() {
        // set constraint for border view
        addSubview(containerContentView)
        containerContentView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        containerContentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        containerContentView.widthAnchor.constraint(equalToConstant: 72).isActive = true
        containerContentView.heightAnchor.constraint(equalToConstant: 72).isActive = true

        // set constraint for image view
        addSubview(userImageView)
        userImageView.topAnchor.constraint(equalTo: topAnchor, constant: 6).isActive = true
        userImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6).isActive = true
        userImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        // set constraint for plus image view
        addSubview(plusImageView)
        plusImageView.bottomAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 0).isActive = true
        plusImageView.trailingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 3).isActive = true
        plusImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        plusImageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        // set constraint for name label
        addSubview(nameLabel)
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        nameLabel.topAnchor.constraint(equalTo: containerContentView.bottomAnchor, constant: 8).isActive = true
    }
}
