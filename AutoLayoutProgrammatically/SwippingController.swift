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
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        let pinkColor = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
        button.setTitleColor(pinkColor, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let pageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
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
extension SwipingController{
    fileprivate func setupBottomControls(){
//        view.addSubview(previousButton)
        
        let yellowView = UIView()
        yellowView.backgroundColor = .yellow
        let greenView = UIView()
        greenView.backgroundColor = .green
        let blueView = UIView()
        blueView.backgroundColor = .blue
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton,pageControl,nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillProportionally
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
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


