//
//  ViewController.swift
//  AutoLayoutProgrammatically
//
//  Created by Pat on 2022/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    //avoiding view did load clusters
    let plateImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "restaurant"))
        //enables auto layout for our image view
        imageView.translatesAutoresizingMaskIntoConstraints = false
        //translating
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    //textView
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Count your calories",attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSAttributedString(string: " \n\n\n Find the meals and snacks that add the unwanted or wanted weight to your waist", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
                              
        textView.attributedText = attributedText
//        textView.text = "Count your calories"
//        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textAlignment = .center
        return textView
    }()
    
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
        
        setupLayout()
        setupBottomControls()
    }
}

//MARK: - BottonControls
extension ViewController{
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
//MARK: -  Layout
extension ViewController{
    private func setupLayout(){
        //adding a container at half layout
        let topImageContainerView = UIView()
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        //auto layout so its half the view using multipliers
        
        
        view.addSubview(descriptionTextView)
        view.addSubview(topImageContainerView)
        topImageContainerView.addSubview(plateImageView)
        
        NSLayoutConstraint.activate([
      
            //top image
        plateImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
        plateImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
        plateImageView.widthAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5),
        plateImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
        
        //textView
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor),
        descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
        descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0),
        
        
        //frame
        //use leading and trailing becuase of some arabic languages that read from right to left
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor),
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)

        ])
    }
}
