//
//  MyPostViewController.swift
//  final pj
//
//  Created by 林允儿老公专属Mac on 2023/12/1.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
import Foundation


class MyPostViewController: UIViewController {
    
    let notificationCenter = NotificationCenter.default
    
//    let database = Firestore.firestore()
//    
//    var selectedSchool = schoolList[0]
//    
//    var handleAuth: AuthStateDidChangeListenerHandle?
//    
//    var currentUser:FirebaseAuth.User?

    let MyPostScreen = MyPostView()
    
    override func loadView() {
        view = MyPostScreen
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Post"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        
        hideKeyboardOnTapOutside()
        
        
//        //Cell实现
//        MyPostScreen.tableViewMyPost.delegate = self
//        MyPostScreen.tableViewMyPost.dataSource = self
//        MyPostScreen.tableViewMyPost.separatorStyle = .none
        
//        MyPostScreen.tableViewMyPost.isEditing = true //右滑cell删除键
    }
    
    
    //右滑cell删除功能
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // 在这里执行删除操作，比如删除数据源中的数据
//            // 然后刷新 tableView
//            tableView.reloadData()
//        }
//    }

    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }
    
    func hideKeyboardOnTapOutside(){
        //MARK: recognizing the taps on the app screen, not the keyboard...
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        view.addGestureRecognizer(tapRecognizer)
    }
    
}


