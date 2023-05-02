//
//  ViewController.swift
//  SpringAnimation
//
//  Created by Келлер Дмитрий on 02.05.2023.
//

import SpringAnimation
import UIKit

final class AnimationViewController: UIViewController {
    
    @IBOutlet weak var runButton: SpringButton!
    @IBOutlet weak var animationLabel: UILabel!
    @IBOutlet weak var springAnimationView: SpringView!
    
    private var animation = Animation.getRandomAnimation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateAnimationLabel()
    }
    
    @IBAction func runSpringAnimation(_ sender: SpringButton) {
        showNextAnimation ()
        updateAnimationLabel()
        updateRunButtonTitle()
    }

    private func showNextAnimation () {
        springAnimationView.animation = animation.preset
        springAnimationView.curve = animation.curve
        springAnimationView.force = animation.force
        springAnimationView.duration = animation.duration
        springAnimationView.delay = animation.delay
        
        springAnimationView.animate()
    }
    
    private func updateAnimationLabel() {
        animationLabel.text = string(from: animation)
    }

    private func updateRunButtonTitle() {
        let nextAnimation = Animation.getRandomAnimation()
        runButton.setTitle("Run \(nextAnimation.preset)", for: .normal)
        animation = nextAnimation
    }
    
    private func string(from animation: Animation) -> String {
        let roundedDuration = String(format: "%.3f", animation.duration)
        let roundedForce = String(format: "%.3f", animation.force)
        let roundedDelay = String(format: "%.3f", animation.delay)
        return """
               preset: \(animation.preset)
               curve: \(animation.curve)
               duration: \(roundedDuration)
               force: \(roundedForce)
               delay: \(roundedDelay)
               """
    }
}






