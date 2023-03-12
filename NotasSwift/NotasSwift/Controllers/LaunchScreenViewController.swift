//
//  LaunchScreenViewController.swift
//  NotasSwift
//
//  Created by Jose on 12/03/23.
//

import UIKit
import Lottie

class LaunchScreenViewController: UIViewController {

    // 1. Create the LottieAnimationView
    private let animationView: AnimationView = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
/*
          // 2. Start LottieAnimationView with animation name (without extension)
          
          animationView = .init(name: "../ic_notas_launchscreem")
          
          animationView.frame = view.bounds
          
          // 3. Set animation content mode
          
          animationView.contentMode = .scaleAspectFit
          
          // 4. Set animation loop mode
          
          animationView.loopMode = .loop
          
          // 5. Adjust animation speed
          
          animationView.animationSpeed = 0.5
          
          
          // 6. Play animation
          
          animationView.play()
 */
        layout()
        setupAnimation()
    }
    
    private func layout(){
        view.addSubview(animationView)
        animationView.backgroundColor = .red
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive =  true
        animationView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        animationView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive =  true
        animationView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10).isActive = true
    }
    
    private func setupAnimation(){
        let amination = Animation.named("ic_notas_launchscreem")
        animationView.animation = amination
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
    }
    
}
