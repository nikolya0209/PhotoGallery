//
//  MainTabBarController.swift
//  PhotoGallery
//
//  Created by MacBookPro on 05.02.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let photosVC = PhotosCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())
    //let navigationVC = UINavigationController(rootViewController: photosVC)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        viewControllers = [
            generateNavigationController(rootViewController: photosVC, title: "Photos", image: #imageLiteral(resourceName: "icons8-image-gallery-32")),
            generateNavigationController(rootViewController: ViewController(), title: "Favourites", image: #imageLiteral(resourceName: "icons8-love-32"))
        ]
    }
    
    private func generateNavigationController(rootViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        let  navigationVC = UINavigationController(rootViewController: rootViewController)
        navigationVC.tabBarItem.title = title
        navigationVC.tabBarItem.image = image
        
        return navigationVC
    }
    
}
