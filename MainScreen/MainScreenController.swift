//
//  MainScreenController.swift
//  final pj
//
//  Created by 林允儿老公专属Mac on 2023/11/29.
//

import UIKit

class MainScreenController: UITabBarController, UITabBarControllerDelegate {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //MARK: setting up red tab bar...
        let tabMainPage = UINavigationController(rootViewController: MainViewController())
        let tabMainBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "r.square")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(systemName: "r.square.fill")
        )
        tabMainPage.tabBarItem = tabMainBarItem
        tabMainPage.title = "Red"
        
        //MARK: setting up green tab bar...
//        let tabCreateProduct = UINavigationController(rootViewController: CreateProductViewController())
//        let tabGreenBarItem = UITabBarItem(
//            title: "Green",
//            image: UIImage(systemName: "g.square")?.withRenderingMode(.alwaysOriginal),
//            selectedImage: UIImage(systemName: "g.square.fill")
//        )
//        tabCreateProduct.tabBarItem = tabGreenBarItem
//        tabCreateProduct.title = "Green"
        
        //MARK: setting up blue tab bar...
        let tabMyProfile = UINavigationController(rootViewController: MyProfileViewController())
        let tabMyProfileBarItem = UITabBarItem(
            title: "Me",
            image: UIImage(systemName: "b.square")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(systemName: "b.square.fill")
        )
        tabMyProfile.tabBarItem = tabMyProfileBarItem
        tabMyProfile.title = "Blue"

        //MARK: setting up this view controller as the Tab Bar Controller...
        //self.viewControllers = [tabMainPage, tabCreateProduct, tabMyProfile]
        self.viewControllers = [tabMainPage, tabMyProfile]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
