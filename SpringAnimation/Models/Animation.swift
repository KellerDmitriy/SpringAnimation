//
//  Animation.swift
//  BySpringAnimation
//
//  Created by Келлер Дмитрий on 02.05.2023.
//

struct Animation {
    let preset: String
    let curve: String
    
    let force: Double
    let delay: Double
    let duration: Double
    
    static func getRandomAnimation() -> Animation {
        
        let animationStore = AnimationStore.shared
        
        let randomPreset = animationStore.presets.randomElement() ?? "pop"
        let randomCurve = animationStore.curves.randomElement() ?? "easeIn"
        let randomForce = Double.random(in: 0.3...2)
        let randomDelay = Double.random(in: 0.3...1.3)
        let randomDuration = Double.random(in: 0.5...3)
        
        return Animation(
            preset: randomPreset,
            curve: randomCurve,
            force: randomForce,
            delay: randomDelay,
            duration: randomDuration
        )
    }
}
