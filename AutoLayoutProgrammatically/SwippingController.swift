//
//  SwippingController.swift
//  AutoLayoutProgrammatically
//
//  Created by Pat on 2022/09/23.
//


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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.isPagingEnabled = true
    }

    
}

extension SwipingController{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        
        let page = pages[indexPath.item]
        cell.page = page
//        cell.plateImageView.image = UIImage(named: page.imageName)
//        cell.descriptionTextView.text = page.headerText
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}


