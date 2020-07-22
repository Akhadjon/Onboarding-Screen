//
//  ViewController.swift
//  Onboarding
//
//  Created by Akhadjon Abdukhalilov on 7/22/20.
//  Copyright © 2020 Akhadjon Abdukhalilov. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    @IBOutlet weak var collectionView :UICollectionView!
    @IBOutlet weak var pageControl:UIPageControl!
    @IBOutlet weak var getStartedButton:UIButton!
    
    let pages:[Page] = [
        Page(animationName: "teaching", title: "Learn to code", description: "Find awesome tutorials on how to code and improve your coding practices"),
        Page(animationName: "archer", title: "Code With Friends", description: "Practice with friends and solve problems together to earn points"),
        Page(animationName: "welcome", title: "Always there to Help", description: "Having Trouble? Get guidance from our experienced Mentors")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getStartedButton.layer.cornerRadius = 10
        self.collectionView.backgroundColor = .white
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.register(UINib(nibName: OnboardingCollectionViewCell.identifier, bundle: Bundle.main), forCellWithReuseIdentifier: "OnboardingCollectionViewCell")
        self.pageControl.numberOfPages = pages.count
        
    }
    
    
    //MARK:- Outlet functions for viewController
    @IBAction func pageChanged(_ sender:Any){
        let pc = sender as! UIPageControl
        collectionView.scrollToItem(at: IndexPath(item: pc.currentPage, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    @IBAction func getStartedButtonTapped(_ sender:Any){
        Core.shared.setIsNotNewUser()
        self.dismiss(animated:true,completion:nil)
    }
    
    //MARK:- CollectionView data Source & CollectionView Flow delegates
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
       cell.configureCell(page: pages[indexPath.item])
       return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
    }
    // to update the UIPageControl
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x)/Int(scrollView.frame.width)
    }


}

