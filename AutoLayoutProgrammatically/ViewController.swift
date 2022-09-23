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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        setupLayout()
    }
}

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
