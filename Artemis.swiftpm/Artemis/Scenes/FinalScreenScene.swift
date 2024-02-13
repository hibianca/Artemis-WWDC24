//
//  File.swift
//  
//
//  Created by Bianca Nathally Bezerra de Lima on 09/02/24.
//

import Foundation
import SpriteKit
import AVFoundation

class FinalScreenScene: SKScene {
    var performNavigation: (() -> ())?
    static func buildScene(performNavigation: (() -> ())?) -> FinalScreenScene {
        let scene = FinalScreenScene(fileNamed: "FinalScreen")!
        scene.performNavigation = performNavigation
        return scene
    }
    
    var starsBackground, earthBackground, stardustBackground, moonBackground2: SKSpriteNode!
    var luna: SKSpriteNode!
    var eyes: SKSpriteNode!
    private var animation: SKAction!
    var dialogueBox, nextButton: SKSpriteNode!
    var dialogues: [Dialogue] = [
        Dialogue(popUp: "dialogueBox21", lunaImage: .luna1),
        Dialogue(popUp: "dialogueBox22", lunaImage: .luna2)
    ]
    
    var touchButton: AVAudioPlayer!
    
    override func didMove(to view: SKView) {
        // Background
        self.backgroundColor = UIColor(red: 0x1D / 255.0, green: 0x15 / 255.0, blue: 0x47 / 255.0, alpha: 1.0)
        
        starsBackground = (childNode(withName: "starsBackground") as! SKSpriteNode)
        starsAnimation(node: starsBackground)
        earthBackground = (childNode(withName: "earth") as! SKSpriteNode)
        earthAnimation(node: earthBackground)
        stardustBackground = (childNode(withName: "stardustBackground") as! SKSpriteNode)
        moonBackground2 = (childNode(withName: "moonBackground2") as! SKSpriteNode)
        moonAnimation(node: moonBackground2)
        
        // Welcome
        luna = (childNode(withName: "Luna1") as! SKSpriteNode)
        eyes = (childNode(withName: "eyes") as! SKSpriteNode)
        eyesAnimation()
        
        dialogueBox = (childNode(withName: "dialogueBox") as! SKSpriteNode)
        nextButton = (childNode(withName: "nextButton") as! SKSpriteNode)
        
        configureNodesFinal(in: self)
        
        let dialogue = dialogues.removeFirst()
        dialogueBox.texture = SKTexture(imageNamed: dialogue.popUp)
        luna.texture = SKTexture(imageNamed: dialogue.lunaImage.rawValue)
        
        // touch button
        let url: URL = Bundle.main.url(forResource: "touch", withExtension: "m4a")!
        touchButton = try! AVAudioPlayer(contentsOf: url, fileTypeHint: nil)
        touchButton.numberOfLoops = 1
        touchButton.volume = 0.3
    }
    
    func nextDialogue() {
        if dialogues.count >= 1 {
            let dialogue = dialogues.removeFirst()
            
            dialogueBox.run(.setTexture(SKTexture(imageNamed: dialogue.popUp), resize: true))
            
            luna.texture = SKTexture(imageNamed: dialogue.lunaImage.rawValue)
            
        } else if dialogues.count == 0 {
            performNavigation?()
        }
    }
    
    func showEyes() {
        eyes.run(SKAction.fadeAlpha(to: 1.0, duration: 0.5))
    }
    
    func hideEyes() {
        eyes.run(SKAction.fadeAlpha(to: 0.0, duration: 0.1))
    }
    
    func starsAnimation(node: SKSpriteNode?) {
        guard let node = node else { return }
        
        let fade = SKAction.sequence([
            SKAction.fadeAlpha(to: 1.0, duration: 1.5),
            SKAction.fadeAlpha(to: 0.0, duration: 1.5)
        ])
        
        node.run(SKAction.repeatForever(fade))
    }
    
    func earthAnimation(node: SKSpriteNode?) {
        guard let node = node else { return }
        
        let swing = SKAction.sequence([
            SKAction.rotate(byAngle: 0.06, duration: 1.5),
            SKAction.rotate(byAngle: -0.06, duration: 1.5)
        ])
        
        node.run(SKAction.repeatForever(swing))
    }
    
    func moonAnimation(node: SKSpriteNode?) {
        guard let node = node else { return }
        
        let swing = SKAction.sequence([
            SKAction.rotate(byAngle: 0.02, duration: 1.0),
            SKAction.rotate(byAngle: -0.02, duration: 1.0)
        ])
        
        node.run(SKAction.repeatForever(swing))
    }
    
    func eyesAnimation() {
        var textures = [SKTexture]()

        for i in 1...5 {
            textures.append(SKTexture(imageNamed: "face\(i)"))
        }

        for i in (1...4).reversed() {
            textures.append(SKTexture(imageNamed: "face\(i)"))
        }

        let frames = SKAction.animate(with: textures, timePerFrame: 0.05, resize: false, restore: false)
        let wait = SKAction.wait(forDuration: 2.0)
        let sequence = SKAction.sequence([frames, wait])
        let repeatedSequence = SKAction.repeatForever(sequence)

        eyes.run(repeatedSequence)
    }
    
    func playTouch() {
        if touchButton.isPlaying {
            touchButton.stop()
        }
      
        touchButton.play()
    }
    
    override func update(_ currentTime: TimeInterval) {
    }
    
    func touchDown(atPoint pos: CGPoint) {
        if nextButton.contains(pos) {
            nextDialogue()
            
            playTouch()
        }
    }
    
    func touchUp(atPoint pos: CGPoint) {
    }
    
    func touchMoved(atPoint pos: CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchMoved(atPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }
}
