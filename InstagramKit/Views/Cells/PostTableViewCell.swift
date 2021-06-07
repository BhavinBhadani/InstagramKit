//
//  PostTableViewCell.swift
//  InstagramKit
//
//  Created by Appernaut on 05/06/21.
//

import UIKit

protocol PostTableViewCellDelegate : class {
    func didPressLikeButton(on cell: UITableViewCell, _ post: Post)
    func didPressBookmarkButton(on cell: UITableViewCell, _ post: Post)
}

class PostTableViewCell: UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }

    var delegate: PostTableViewCellDelegate?
    
    // Post Top View
    private var userImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .lightGray
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private var nameStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 1
        return stack
    }()

    private var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.text = "John Doe"
        return label
    }()
    
    private var sponsoredLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 12)
        label.text = "Sponsored"
        return label
    }()

    private var moreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "ic_dots_horizontal"), for: .normal)
        return button
    }()
    
    // Post Media View
    private var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .lightGray
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private var postImageViewHeightConstraint: NSLayoutConstraint!
    
    // Learn More View
    private var actionsStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 8
        return stack
    }()

    private var learnMoreContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()

    private var learnMoreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Learn more", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        button.contentHorizontalAlignment = .left
        return button
    }()
    
    private var learnMoreButtonImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "ic_chevron_right"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .center
        imageView.tintColor = .systemBlue
        return imageView
    }()

    private var learnMoreDividerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    // Post Bottom Actions View
    private var postActionsStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 10
        return stack
    }()

    private var likeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "ic_like"), for: .normal)
        button.setImage(UIImage(named: "ic_like_red_selected"), for: .selected)
        return button
    }()

    private var commentButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "ic_comment"), for: .normal)
        return button
    }()
    
    private var shareButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "ic_share"), for: .normal)
        return button
    }()
    
    private var spacerView: UIView = {
        let spacerView = UIView()
        spacerView.translatesAutoresizingMaskIntoConstraints = false
        return spacerView
    }()

    private var bookmarkButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "ic_bookmark"), for: .normal)
        button.setImage(UIImage(named: "ic_bookmark_selected"), for: .selected)
        return button
    }()

    // Post Bottom Detail View
    private var postDetailsStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 10
        return stack
    }()

    private var likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.text = "0 Likes"
        return label
    }()
    
    private var captionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
        return label
    }()
    
    private var postDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.numberOfLines = 1
        label.text = "20s ago"
        return label
    }()
    
    // White heart image
    private var whiteHeartImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "ic_heart_white"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var whiteHeartImageViewHeightConstraint: NSLayoutConstraint!
    
    lazy var likeAnimator = LikeAnimator(container: self.contentView, layoutConstraint: whiteHeartImageViewHeightConstraint)
    
    lazy var postImageDoubleTapRecognizer: UITapGestureRecognizer = {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(didDoubleTapToLike))
        tapRecognizer.numberOfTapsRequired = 2
        return tapRecognizer
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        self.selectionStyle = .none
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var post: Post? {
        didSet {
            guard let post = post else { return }
            userImageView.image = UIImage(named: post.avatar)
            nameLabel.text = post.userName
            
            // set sponsored label
            sponsoredLabel.isHidden = !post.isSponsored && (post.location == nil)
            learnMoreContentView.isHidden = !post.isSponsored

            if let location = post.location, !post.isSponsored {
                sponsoredLabel.text = location
            }
            else if post.isSponsored {
                sponsoredLabel.text = "Sponsored"
            }
            
            // set post image
            setPostImage(with: UIImage(named: post.postImage))
            
            // set caption label
            let content = NSMutableAttributedString(string: post.userName, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .semibold)])
            content.append(NSMutableAttributedString(string: " \(post.caption)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]))
            captionLabel.attributedText = content
            
            // set likes label
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let likes = numberFormatter.string(from: NSNumber(value:post.likes)) ?? "\(post.likes)"
            likesLabel.text = "\(likes) likes"
            
            postDateLabel.text = post.date
            postDateLabel.isHidden = post.isSponsored
            likeButton.isSelected = post.isLiked
            bookmarkButton.isSelected = post.isBookmarked
        }
    }
}

// MARK: - Helpers
extension PostTableViewCell {
    private func setupView() {
        // set constraint for image view
        contentView.addSubview(userImageView)
        userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        userImageView.widthAnchor.constraint(equalToConstant: 32).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        // set constraint for stack view
        contentView.addSubview(nameStackView)
        nameStackView.addArrangedSubview(nameLabel)
        nameStackView.addArrangedSubview(sponsoredLabel)
        nameStackView.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 10).isActive = true
        nameStackView.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor, constant: 0).isActive = true
        
        // set constraint for more button
        contentView.addSubview(moreButton)
        moreButton.leadingAnchor.constraint(equalTo: nameStackView.trailingAnchor, constant: 10).isActive = true
        moreButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        moreButton.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor, constant: 0).isActive = true
        moreButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        moreButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        // set constraint for image view
        contentView.addSubview(postImageView)
        postImageView.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 8).isActive = true
        postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        postImageViewHeightConstraint = postImageView.heightAnchor.constraint(equalToConstant: 400)
        postImageViewHeightConstraint.priority = UILayoutPriority(rawValue: 999)
        postImageViewHeightConstraint.isActive = true
        postImageView.addGestureRecognizer(postImageDoubleTapRecognizer)
        
        // Learn more view
        learnMoreContentView.addSubview(learnMoreButtonImageView)
        learnMoreContentView.addSubview(learnMoreDividerView)
        learnMoreContentView.addSubview(learnMoreButton)
        
        learnMoreButton.topAnchor.constraint(equalTo: learnMoreContentView.topAnchor).isActive = true
        learnMoreButton.leadingAnchor.constraint(equalTo: learnMoreContentView.leadingAnchor).isActive = true
        learnMoreButton.trailingAnchor.constraint(equalTo: learnMoreContentView.trailingAnchor).isActive = true
        learnMoreButton.heightAnchor.constraint(equalToConstant: 30).isActive = true

        learnMoreButtonImageView.trailingAnchor.constraint(equalTo: learnMoreContentView.trailingAnchor, constant: -16).isActive = true
        learnMoreButtonImageView.centerYAnchor.constraint(equalTo: learnMoreButton.centerYAnchor).isActive = true
        learnMoreButtonImageView.widthAnchor.constraint(equalToConstant: 10).isActive = true
        learnMoreButtonImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true

        learnMoreDividerView.topAnchor.constraint(equalTo: learnMoreButton.bottomAnchor, constant: 8).isActive = true
        learnMoreDividerView.leadingAnchor.constraint(equalTo: learnMoreContentView.leadingAnchor).isActive = true
        learnMoreDividerView.trailingAnchor.constraint(equalTo: learnMoreContentView.trailingAnchor).isActive = true
        learnMoreDividerView.bottomAnchor.constraint(equalTo: learnMoreContentView.bottomAnchor, constant: 0).isActive = true
        learnMoreDividerView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true

        // set constraint for action buttons stack view
        postActionsStackView.addArrangedSubview(likeButton)
        postActionsStackView.addArrangedSubview(commentButton)
        postActionsStackView.addArrangedSubview(shareButton)
        postActionsStackView.addArrangedSubview(spacerView)
        postActionsStackView.addArrangedSubview(bookmarkButton)

        spacerView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        contentView.addSubview(actionsStackView)
        actionsStackView.addArrangedSubview(learnMoreContentView)
        actionsStackView.addArrangedSubview(postActionsStackView)
        actionsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        actionsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        actionsStackView.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 8).isActive = true

        // set constraint for post bottom detail view
        contentView.addSubview(postDetailsStackView)
        postDetailsStackView.addArrangedSubview(likesLabel)
        postDetailsStackView.addArrangedSubview(captionLabel)
        postDetailsStackView.addArrangedSubview(postDateLabel)

        postDetailsStackView.topAnchor.constraint(equalTo: actionsStackView.bottomAnchor, constant: 10).isActive = true
        postDetailsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        postDetailsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        postDetailsStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        
        // set constraint for white heart image view
        contentView.addSubview(whiteHeartImageView)
        whiteHeartImageView.centerYAnchor.constraint(equalTo: postImageView.centerYAnchor).isActive = true
        whiteHeartImageView.centerXAnchor.constraint(equalTo: postImageView.centerXAnchor).isActive = true
        whiteHeartImageViewHeightConstraint = whiteHeartImageView.widthAnchor.constraint(equalToConstant: 0)
        whiteHeartImageViewHeightConstraint.isActive = true
        whiteHeartImageView.heightAnchor.constraint(equalTo: whiteHeartImageView.widthAnchor, multiplier: 10).isActive = true

        // set button actions
        likeButton.addTarget(self, action: #selector(likeWasPressed), for: .touchUpInside)
        bookmarkButton.addTarget(self, action: #selector(bookmarkWasPressed), for: .touchUpInside)
    }
    
    private func setPostImage(with image: UIImage?) {
        postImageView.image = image

        let imageWidth = image?.size.width ?? 0.0
        let imageHeight = image?.size.height ?? 0.0
        let ratio = CGFloat(imageHeight) / CGFloat(imageWidth)
        let estimatedHeight = ratio * UIScreen.main.bounds.width

        postImageViewHeightConstraint.constant = estimatedHeight
        layoutIfNeeded()
    }
    
    @objc func likeWasPressed() {
        delegate?.didPressLikeButton(on: self, post!)
    }
    
    @objc func bookmarkWasPressed() {
        delegate?.didPressBookmarkButton(on: self, post!)
    }
    
    @objc func didDoubleTapToLike() {
        likeAnimator.animate { [weak self] in
            if self?.post!.isLiked == false {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                    self?.likeWasPressed()
                }
            }
        }
    }
}
