//
//  MyPostView.swift
//  final pj
//
//  Created by 林允儿老公专属Mac on 2023/12/1.
//
import UIKit

class MyPostView: UIView{
    
    var contentWrapper: UIScrollView!
    
    var tableViewMyPost: UITableView!

  
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white

//        setupContentWrapper()
        
        setupTableViewProduct()
        
        initConstraints()
    }
    

//    func setupContentWrapper(){
//        contentWrapper = UIScrollView()
//        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
//        self.addSubview(contentWrapper)
//    }
    
    func setupTableViewProduct(){
        tableViewMyPost = UITableView()
        tableViewMyPost.register(MyPostTableViewCell.self, forCellReuseIdentifier: "myPostId") //修改为firebase里面的product id
        tableViewMyPost.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableViewMyPost)
    }

    

    
    func initConstraints(){
        NSLayoutConstraint.activate([
//            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
//            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
//            contentWrapper.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
//            contentWrapper.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor), 
//            
//            tableViewMyPost.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 30),
//            tableViewMyPost.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
//            tableViewMyPost.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor, constant: -15),
//            tableViewMyPost.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            //tableViewMyPost.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,constant: -8),
            
            tableViewMyPost.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            tableViewMyPost.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            tableViewMyPost.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            tableViewMyPost.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,constant: -8),
            
         

      ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
