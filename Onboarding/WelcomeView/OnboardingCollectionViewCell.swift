//
//  OnboardingCollectionViewCell.swift
//  Onboarding
//
//  Created by Akhadjon Abdukhalilov on 7/22/20.
//  Copyright © 2020 Akhadjon Abdukhalilov. All rights reserved.
//

import UIKit
import Lottie

class OnboardingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var animationContainer:UIView!
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var descriptionTextView:UITextView!
    
    static let identifier = "OnboardingCollectionViewCell"
    
    var animation = AnimationView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    

    func configureCell(page:Page){

     animation = AnimationView(name: page.animationName)
     animation.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
                    
     animation.animationSpeed = 1
     animation.loopMode = .loop
     animation.play()
     animationContainer.addSubview(self.animation)
     titleLabel.text = page.title
     descriptionTextView.text = page.description
        
    }
    
}
