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
            image: UIImage(systemName: "h.square")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(systemName: "h.square.fill")
        )
        tabMainPage.tabBarItem = tabMainBarItem
        tabMainPage.title = "Home"
        
        //MARK: setting up green tab bar...
        let tabCreateProduct = UINavigationController(rootViewController: CreateProductViewController())
        let tabGreenBarItem = UITabBarItem(
            title: "+",
            image: UIImage(systemName: "n.square")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(systemName: "n.square.fill")
        )
        tabCreateProduct.tabBarItem = tabGreenBarItem
        tabCreateProduct.title = "Post your product"
        
        //MARK: setting up blue tab bar...
        let tabMyProfile = UINavigationController(rootViewController: MyProfileViewController())
        let tabMyProfileBarItem = UITabBarItem(
            title: "Me",
            image: UIImage(systemName: "m.square")?.withRenderingMode(.alwaysOriginal),
            selectedImage: UIImage(systemName: "m.square.fill")
        )
        tabMyProfile.tabBarItem = tabMyProfileBarItem
        tabMyProfile.title = "Me"

        //MARK: setting up this view controller as the Tab Bar Controller...
        self.viewControllers = [tabMainPage, tabCreateProduct, tabMyProfile]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
