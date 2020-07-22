//
//  ViewController.swift
//  Onboarding
//
//  Created by Akhadjon Abdukhalilov on 7/22/20.
//  Copyright © 2020 Akhadjon Abdukhalilov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
       
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if !Core.shared.isNewUser(){
        let vc = self.storyboard?.instantiateViewController(identifier: "welcome") as! WelcomeViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc,animated:  true)
        }
    }
    

}

class Core{
    static let shared = Core()
    
    func isNewUser()->Bool{
        return UserDefaults.standard.bool(forKey: "isNewUser")
    }
    
    func setIsNotNewUser(){
        UserDefaults.standard.set(true, forKey: "isNewUser")
    
    }
}
