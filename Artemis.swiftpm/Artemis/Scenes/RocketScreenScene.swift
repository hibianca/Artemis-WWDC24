//
//  File.swift
//
//
//  Created by Bianca Nathally Bezerra de Lima on 14/01/24.
//

import Foundation
import SpriteKit
import AVFoundation

class RocketScreenScene: SKScene {
    var performNavigation: (() -> ())?
    static func buildScene(performNavigation: (() -> ())?) -> RocketScreenScene {
        let scene = RocketScreenScene(fileNamed: "RocketScreen")!
        scene.performNavigation = performNavigation
        return scene
    }
        
    var bg1, starsLogo, circles: SKSpriteNode!
    var dialogueBoxLuna, nextButton: SKSpriteNode!
    var rocket1, rocket2, rocket3, rocket4, rocket5: SKSpriteNode!
    var centralStage, exhaustSystem, orion, sideRockets, upperStage: SKSpriteNode!
    var hitBox: SKSpriteNode!
    var rocketDialogues: [SKSpriteNode]! = [
        SKSpriteNode(imageNamed: "dialogueBox10"),
        SKSpriteNode(imageNamed: "dialogueBox11")
    ]
    var imageList: [SKSpriteNode]!
    var dragging: SKSpriteNode?
    var originalDraggingPosition: CGPoint?
    var zTop: CGFloat = 1
    var hasGone = 0
    var wasShown = false
    var totalDialogues = 2
    var touchButton: AVAudioPlayer!
    var dragRocket: AVAudioPlayer!
    
    override func didMove(to view: SKView) {
        // Background nodes
        self.backgroundColor = UIColor(red: 0x1D / 255.0, green: 0x15 / 255.0, blue: 0x47 / 255.0, alpha: 1.0)
        
        bg1 = (childNode(withName: "bg1") as! SKSpriteNode)
        starsLogo = (childNode(withName: "starsLogo") as! SKSpriteNode)
        starsAnimation(node: starsLogo)
        dialogueBoxLuna = (childNode(withName: "dialogueBoxLuna") as! SKSpriteNode)
        nextButton = (childNode(withName: "nextButton") as! SKSpriteNode)
        
        // Rocket nodes
        rocket1 = (childNode(withName: "rocket1") as! SKSpriteNode)
        rocket2 = (childNode(withName: "rocket2") as! SKSpriteNode)
        rocket3 = (childNode(withName: "rocket3") as! SKSpriteNode)
        rocket4 = (childNode(withName: "rocket4") as! SKSpriteNode)
        rocket5 = (childNode(withName: "rocket5") as! SKSpriteNode)
        centralStage = (childNode(withName: "centralStage") as! SKSpriteNode)
        exhaustSystem = (childNode(withName: "exhaustSystem") as! SKSpriteNode)
        orion = (childNode(withName: "orion") as! SKSpriteNode)
        sideRockets = (childNode(withName: "sideRockets") as! SKSpriteNode)
        upperStage = (childNode(withName: "upperStage") as! SKSpriteNode)
        hitBox = (childNode(withName: "Hit Box") as! SKSpriteNode)
        verifyDialogue()
        dialogueBoxLuna.texture = SKTexture(imageNamed: "dialogueBox10")
        
        imageList = [rocket1, rocket2, rocket3, rocket4, rocket5]
        
        for image in imageList {
            image.alpha = 0.0
        }
        
        configureNodesRocket(in: self)
        
        // touch button
        let url: URL = Bundle.main.url(forResource: "touch", withExtension: "m4a")!
        touchButton = try! AVAudioPlayer(contentsOf: url, fileTypeHint: nil)
        touchButton.numberOfLoops = 1
        touchButton.volume = 0.3
        
        // touch button
        let path: URL = Bundle.main.url(forResource: "rocket", withExtension: "m4a")!
        dragRocket = try! AVAudioPlayer(contentsOf: path, fileTypeHint: nil)
        dragRocket.numberOfLoops = 0
        dragRocket.volume = 0.3
        
    }
    
    // function to show the nextButton
    func showNextButton() {
        nextButton.run(SKAction.fadeAlpha(to: 1.0, duration: 0.2))
    }
    
    // function to hide the nextButton
    func hideNextButton() {
        nextButton.run(SKAction.fadeAlpha(to: 0.0, duration: 0.1))
    }
    
    func verifyDialogue() {
        if hasGone == 4 {
            dialogueBoxLuna.texture = SKTexture(imageNamed: "dialogueBox10")
        }
    }
    
    func showNodes(nodes: [SKSpriteNode]) {
        for node in nodes {
            node.alpha = 1.0
        }
        
    }
    
    // function to pass the dialogues
    func nextDialogue() {
//        for dialogue in rocketDialogues {
        for _ in rocketDialogues {
            if rocketDialogues.count >= 1 {
                rocketDialogues.removeFirst()
            }
        }
    }
    
    // function to animate the stars in the background
    func starsAnimation(node: SKSpriteNode?) {
        guard let node = node else { return }
        
        let fade = SKAction.sequence([
            SKAction.fadeAlpha(to: 1.0, duration: 1.5),
            SKAction.fadeAlpha(to: 0.0, duration: 1.5)
        ])
        
        node.run(SKAction.repeatForever(fade))
    }
    
    // function to play the button tap sound
    func playTouch() {
        if touchButton.isPlaying {
            touchButton.stop()
        }
      
        touchButton.play()
    }
    
    // function to play the rocket parts sound
    func playDrag() {
        if dragRocket.isPlaying {
            dragRocket.stop()
        }
      
        dragRocket.play()
    }
    
    var draggingAllowed = false
    func touchDown(atPoint pos : CGPoint) {
        if nextButton.contains(pos) {
            if !draggingAllowed  {
                dialogueBoxLuna.run(.setTexture(SKTexture(imageNamed: "dialogueBox11"), resize: true))
                showNodes(nodes: imageList)
                draggingAllowed = true
                
                hideNextButton()
                
                playTouch()
                
            } else if hasGone == 5 {
                performNavigation?()
                
                playTouch()
            }
        }
        
        for img in imageList where img.alpha == 1
        && img.contains(pos)
        && draggingAllowed {
            dragging = img
            originalDraggingPosition = img.position
            img.setScale(1.15)
            img.zPosition = zTop
            zTop += 1
            return
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        dragging?.setScale(1)
        
        if let originalDraggingPosition = originalDraggingPosition {
            dragging?.position = originalDraggingPosition
        }
        
        if hitBox.contains(pos) {
            if (dragging == rocket1) {
                dialogueBoxLuna.texture = SKTexture(imageNamed: "dialogueBox12")
                hasGone += 1
                dragging?.alpha = 0.5
                centralStage.alpha = 1
                
                playDrag()
            }
            
            if (dragging == rocket2) && (centralStage.alpha == 1) {
                dialogueBoxLuna.texture = SKTexture(imageNamed: "dialogueBox13")
                hasGone += 1
                dragging?.alpha = 0.5
                sideRockets.alpha = 1
                
                playDrag()
            }
            
            if (dragging == rocket3) && (sideRockets.alpha == 1) {
                dialogueBoxLuna.texture = SKTexture(imageNamed: "dialogueBox14")
                hasGone += 1
                dragging?.alpha = 0.5
                upperStage.alpha = 1
                
                playDrag()
            }
            
            if (dragging == rocket4) && (upperStage.alpha == 1) {
                dialogueBoxLuna.texture = SKTexture(imageNamed: "dialogueBox15")
                hasGone += 1
                dragging?.alpha = 0.5
                orion.alpha = 1
                
                playDrag()
            }
            
            if (dragging == rocket5) && (orion.alpha == 1) {
                dialogueBoxLuna.texture = SKTexture(imageNamed: "dialogueBox16")
                hasGone += 1
                dragging?.alpha = 0.5
                exhaustSystem.alpha = 1

                showNextButton()
                
                playDrag()
            }
            
            dragging = nil
            
        }
    }
    
    func touchMoved(atPoint pos : CGPoint) {
        dragging?.position = pos
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchDown(atPoint: t.location(in: self)) }
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
