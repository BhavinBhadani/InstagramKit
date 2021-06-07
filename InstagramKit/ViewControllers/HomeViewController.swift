//
//  HomeViewController.swift
//  InstagramKit
//
//  Created by Appernaut on 05/06/21.
//

import UIKit

class HomeViewController: UIViewController {
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(StoriesTableViewCell.self, forCellReuseIdentifier: StoriesTableViewCell.identifier)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .white
        return tableView
    }()
    
    var posts: [Post] = DemoData.posts
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupNavigationBar()
    }
}

// MARK: Helpers
extension HomeViewController {
    private func setupTableView() {
        // add table view
        view.addSubview(tableView)
        
        // set table view constraints
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupNavigationBar() {
        // set left bar button item for instagram logo
        let instagramLogoImageView = UIImageView(image: UIImage(named: "ic_instagram_logo"))
        instagramLogoImageView.contentMode = .scaleAspectFit
        instagramLogoImageView.widthAnchor.constraint(equalToConstant: 108).isActive = true
        instagramLogoImageView.heightAnchor.constraint(equalToConstant: 44).isActive = true

        let logoBarButtonItem = UIBarButtonItem(customView: instagramLogoImageView)
        navigationItem.leftBarButtonItem = logoBarButtonItem
        
        // set right bar button items for messages and create post
        let messagesBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_messages"), style: .plain, target: self, action: nil)
        let createPostBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_plus_outline"), style: .plain, target: self, action: nil)
        navigationItem.rightBarButtonItems = [messagesBarButtonItem, createPostBarButtonItem]
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: StoriesTableViewCell.identifier,
                                                           for: indexPath) as? StoriesTableViewCell else {
                fatalError("UITableViewCell must be downcasted to StoriesTableViewCell")
            }
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier,
                                                       for: indexPath) as? PostTableViewCell else {
            fatalError("UITableViewCell must be downcasted to PostTableViewCell")
        }
        cell.post = posts[indexPath.row-1]
        cell.delegate = self
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 { return 116 }
        return UITableView.automaticDimension
    }
}

extension HomeViewController: PostTableViewCellDelegate {
    func didPressLikeButton(on cell: UITableViewCell, _ post: Post) {
        posts = posts.map { pst in
            var temp = pst
            if post.id == pst.id {
                temp.isLiked.toggle()
                if temp.isLiked {
                    temp.likes += 1
                } else {
                    temp.likes -= 1
                }
            }
            return temp
        }
        
        if let indexPath = tableView.indexPath(for: cell) {
            tableView.reloadRows(at: [indexPath], with: .none)
        }
    }
    
    func didPressBookmarkButton(on cell: UITableViewCell, _ post: Post) {
        posts = posts.map { pst in
            var temp = pst
            if post.id == pst.id {
                temp.isBookmarked.toggle()
            }
            return temp
        }
        
        if let indexPath = tableView.indexPath(for: cell) {
            tableView.reloadRows(at: [indexPath], with: .none)
        }
    }
}
