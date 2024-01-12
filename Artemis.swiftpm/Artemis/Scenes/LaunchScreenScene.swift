//
//  File.swift
//  
//
//  Created by Bianca Nathally Bezerra de Lima on 09/01/24.
//

import SpriteKit

class LaunchScreenScene: SKScene {
    var performNavigation: (() -> ())?
    static func buildScene(performNavigation: (() -> ())?) -> LaunchScreenScene {
        let scene = LaunchScreenScene(fileNamed: "LaunchScreen")!
        scene.performNavigation = performNavigation
        return scene
    }
    
    var logo: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        logo = (childNode(withName: "artemisLogo") as! SKSpriteNode)
        setupLogoAnimation()
        
        self.backgroundColor = UIColor(red: 0x1D / 255.0, green: 0x15 / 255.0, blue: 0x47 / 255.0, alpha: 1.0)
    }
    
    func setupLogoAnimation() {
        logo.alpha = 0.0
        
        let fadeIn = SKAction.fadeIn(withDuration: 1.2)
        
        logo.run(SKAction.sequence([fadeIn])) {
            self.performNavigation?()
        }
    }
}

