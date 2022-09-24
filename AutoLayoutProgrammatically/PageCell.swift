//
//  PageCell.swift
//  AutoLayoutProgrammatically
//
//  Created by Pat on 2022/09/24.
//

import UIKit

class PageCell: UICollectionViewCell{
    
    var page: Page?{
        //check when our page is being set
        didSet{
            guard let unwrappedPage = page else { return }
            plateImageView.image = UIImage(named: unwrappedPage.imageName)
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText,attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            attributedText.append(NSAttributedString(string: " \n\n\n \(unwrappedPage.bodyText)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }
    
    private let plateImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "restaurant"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    //textView
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Count your calories",attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSAttributedString(string: " \n\n\n Find the meals and snacks that add the unwanted or wanted weight to your waist", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
                              
        textView.attributedText = attributedText
//        textView.text = "Count your calories"
        textView.font = UIFont.boldSystemFont(ofSize: 18)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textAlignment = .center
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init has not been implemented")
    }
}

extension PageCell{
    private func setupLayout(){
        //adding a container at half layout
        let topImageContainerView = UIView()
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        //auto layout so its half the view using multipliers
        
        //because were in a page layout we don't need a view
        addSubview(descriptionTextView)
        addSubview(topImageContainerView)
        topImageContainerView.addSubview(plateImageView)
        
        NSLayoutConstraint.activate([
            //top image
        plateImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
        plateImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
        plateImageView.widthAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5),
        plateImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),
        
        //textView
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor),
        descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
        descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: 0),
        
        
        //frame
        //use leading and trailing becuase of some arabic languages that read from right to left
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor),
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)

        ])
    }
}
