//
//  SwippingController.swift
//  AutoLayoutProgrammatically
//
//  Created by Pat on 2022/09/23.
//

//MARK: - Controller
///make sure the view knows the right objects to display

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
        
    let pages = [Page(imageName: "restaurant", headerText: "Count your calories",
                      bodyText: "Find the meals and snacks that add the unwanted or wanted weight to your waist"),
                 Page(imageName: "salad", headerText: "Explore new recipies for old meals",
                      bodyText: "Get your Iron chef on, get your master chef on you can take your boring meals into an experience"),
                 Page(imageName: "fast-food", headerText: "Enjoy your cheat meals",
                      bodyText: "Once in a while you have to let loose in order to maintain control over your normal diet, dont worry about going overboard because you can count those calories too"),
                 Page(imageName: "diet", headerText: "Recover your diet plans",
                      bodyText: "Make a dietery plan that works for you  and that takes you in mind first")]
    
    //buttons at bottom
    //encapsulation principles so other classes dont have access to this
     let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
     let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        let pinkColor = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
        button.setTitleColor(pinkColor, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
     lazy var pageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        let pinkColor = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 0.8)
        pc.pageIndicatorTintColor = pinkColor.withAlphaComponent(0.3)
        pc.currentPageIndicatorTintColor = pinkColor
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBottomControls()
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.isPagingEnabled = true
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.showsHorizontalScrollIndicator = false
        
    }

    
}





