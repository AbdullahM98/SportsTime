//
//  ViewController.swift
//  SportsTime
//
//  Created by Abdullah Essam on 22/04/2024.
//

import UIKit
import Lottie

class SplashViewController : UIViewController {
    var animationView: LottieAnimationView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationView = .init(name: "sportLottie.json")
        animationView!.frame = view.bounds
        animationView!.contentMode = .scaleAspectFit
        //animationView!.loopMode = .loop
        view.addSubview(animationView!)
        animationView!.play()

        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4){
            self.performSegue(withIdentifier: "goToHome", sender: nil)
        }
    }
}

