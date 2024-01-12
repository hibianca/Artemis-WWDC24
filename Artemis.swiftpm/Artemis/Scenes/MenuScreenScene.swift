//
//  File.swift
//
//
//  Created by Bianca Nathally Bezerra de Lima on 09/01/24.
//

import Foundation
import SpriteKit
import AVFoundation

class MenuScreenScene: SKScene {
    var performNavigation: (() -> ())?
    static func buildScene(performNavigation: (() -> ())?) -> MenuScreenScene {
        let scene = MenuScreenScene(fileNamed: "MenuScreen")!
        scene.performNavigation = performNavigation
        return scene
    }
    
    var starsBackground: SKSpriteNode!
    var earthBackground: SKSpriteNode!
    var stardustBackground: SKSpriteNode!
    var moonBackground: SKSpriteNode!
    
    var startButton: SKSpriteNode!
    
    override func didMove(to view: SKView) {
        self.backgroundColor = UIColor(red: 0x1D / 255.0, green: 0x15 / 255.0, blue: 0x47 / 255.0, alpha: 1.0)
        
        starsBackground = (childNode(withName: "starsBackground") as! SKSpriteNode)
        starsAnimation(node: starsBackground)
        earthBackground = (childNode(withName: "earthBackground") as! SKSpriteNode)
        stardustBackground = (childNode(withName: "stardustBackground") as! SKSpriteNode)
        moonBackground = (childNode(withName: "moonBackground") as! SKSpriteNode)
        moonAnimation(node: moonBackground)
        startButton = (childNode(withName: "startButton") as! SKSpriteNode)
    }
    
    func starsAnimation(node: SKSpriteNode?) {
        guard let node = node else { return }
        
        let fade = SKAction.sequence([
            SKAction.fadeAlpha(to: 1.0, duration: 1.5),
            SKAction.fadeAlpha(to: 0.0, duration: 1.5)
        ])
        
        node.run(SKAction.repeatForever(fade))
    }
    
    func moonAnimation(node: SKSpriteNode?) {
        guard let node = node else { return }
        
        let swing = SKAction.sequence([
            SKAction.rotate(byAngle: 0.04, duration: 1.0),
            SKAction.rotate(byAngle: -0.04, duration: 1.0)
        ])
        
        node.run(SKAction.repeatForever(swing))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if startButton.contains(pos) {
            startButton.alpha = 0.5
            performNavigation?()
        }
    }
}
