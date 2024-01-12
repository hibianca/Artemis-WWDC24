//
//  File.swift
//
//
//  Created by Bianca Nathally Bezerra de Lima on 10/01/24.
//

import SpriteKit

class IntroScreenScene: SKScene {
    var performNavigation: (() -> ())?
    static func buildScene(performNavigation: (() -> ())?) -> IntroScreenScene {
        let scene = IntroScreenScene(fileNamed: "IntroScreen")!
        scene.performNavigation = performNavigation
        return scene
    }
    
    var starsBackground: SKSpriteNode!
    var earthBackground: SKSpriteNode!
    var stardustBackground: SKSpriteNode!
    var moonBackground: SKSpriteNode!
    
    var luna: SKSpriteNode!
    var eyes: SKSpriteNode!
    var reid: SKSpriteNode!
    var victor: SKSpriteNode!
    var christina: SKSpriteNode!
    var jeremy: SKSpriteNode!
    var reidBox: SKSpriteNode!
    var victorBox: SKSpriteNode!
    var christinaBox: SKSpriteNode!
    var jeremyBox: SKSpriteNode!
    private var animation: SKAction!
    var dialogueBox: SKSpriteNode!
    var nextButton: SKSpriteNode!
    var dialogues: [Dialogue] = [
        Dialogue(popUp: "dialogueBox1", lunaImage: .luna1),
        Dialogue(popUp: "dialogueBox2", lunaImage: .luna1),
        Dialogue(popUp: "dialogueBox3", lunaImage: .luna2),
        Dialogue(popUp: "dialogueBox4", lunaImage: .luna2),
        Dialogue(popUp: "dialogueBox5", lunaImage: .luna1),
        Dialogue(popUp: "dialogueBox6", lunaImage: .luna1),
        Dialogue(popUp: "dialogueBox7", lunaImage: .luna2),
        Dialogue(popUp: "dialogueBox8", lunaImage: .luna2),
        Dialogue(popUp: "dialogueBox9", lunaImage: .luna1)
    ]
    
    override func didMove(to view: SKView) {
        // Background
        self.backgroundColor = UIColor(red: 0x1D / 255.0, green: 0x15 / 255.0, blue: 0x47 / 255.0, alpha: 1.0)
        
        starsBackground = (childNode(withName: "starsBackground") as! SKSpriteNode)
        starsAnimation(node: starsBackground)
        earthBackground = (childNode(withName: "earthBackground") as! SKSpriteNode)
        stardustBackground = (childNode(withName: "stardustBackground") as! SKSpriteNode)
        moonBackground = (childNode(withName: "moonBackground") as! SKSpriteNode)
        moonAnimation(node: moonBackground)
        
        // Welcome
        luna = (childNode(withName: "Luna1") as! SKSpriteNode)
        eyes = (childNode(withName: "eyes") as! SKSpriteNode)
        eyesAnimation()
        reid = (childNode(withName: "reid") as! SKSpriteNode)
        victor = (childNode(withName: "victor") as! SKSpriteNode)
        christina = (childNode(withName: "christina") as! SKSpriteNode)
        jeremy = (childNode(withName: "jeremy") as! SKSpriteNode)
        reidBox = (childNode(withName: "reidBox") as! SKSpriteNode)
        victorBox = (childNode(withName: "victorBox") as! SKSpriteNode)
        christinaBox = (childNode(withName: "christinaBox") as! SKSpriteNode)
        jeremyBox = (childNode(withName: "jeremyBox") as! SKSpriteNode)
        dialogueBox = (childNode(withName: "dialogueBox") as! SKSpriteNode)
        nextButton = (childNode(withName: "nextButton") as! SKSpriteNode)
        
        let dialogue = dialogues.removeFirst()
        dialogueBox.texture = SKTexture(imageNamed: dialogue.popUp)
        luna.texture = SKTexture(imageNamed: dialogue.lunaImage.rawValue)
        
        reid.alpha = 0.0
        victor.alpha = 0.0
        christina.alpha = 0.0
        jeremy.alpha = 0.0
        reidBox.alpha = 0.0
        victorBox.alpha = 0.0
        christinaBox.alpha = 0.0
        jeremyBox.alpha = 0.0
    }
    
    //    func nextDialogue() {
    //        if dialogues.count >= 1 {
    //            let dialogue = dialogues.removeFirst()
    //
    //            dialogueBox.run(.setTexture(SKTexture(imageNamed: dialogue.popUp), resize: true))
    //
    //            luna.texture = SKTexture(imageNamed: dialogue.lunaImage.rawValue)
    //        } else if dialogues.count == 0 {
    //            performNavigation?()
    //        }
    //    }
    
    func nextDialogue() {
        if dialogues.count >= 1 {
            let dialogue = dialogues.removeFirst()
            
            dialogueBox.run(.setTexture(SKTexture(imageNamed: dialogue.popUp), resize: true))
            
            luna.texture = SKTexture(imageNamed: dialogue.lunaImage.rawValue)
            
            if dialogue.popUp == "dialogueBox7" {
                luna.alpha = 0.0
                showImages()
                hideEyes()
            } else {
                luna.alpha = 1.0
                hideImages()
                showEyes()
            }
        } else if dialogues.count == 0 {
            performNavigation?()
        }
    }
    
    func showImages() {
        let fadeInAction = SKAction.fadeAlpha(to: 1.0, duration: 0.5)

        let nodesToShow = [reid, victor, christina, jeremy, reidBox, victorBox, christinaBox, jeremyBox]

        for node in nodesToShow {
            node?.run(fadeInAction)
        }
//        reid.run(SKAction.fadeAlpha(to: 1.0, duration: 0.5))
//        victor.run(SKAction.fadeAlpha(to: 1.0, duration: 0.5))
//        christina.run(SKAction.fadeAlpha(to: 1.0, duration: 0.5))
//        jeremy.run(SKAction.fadeAlpha(to: 1.0, duration: 0.5))
//        reidBox.run(SKAction.fadeAlpha(to: 1.0, duration: 0.5))
//        victorBox.run(SKAction.fadeAlpha(to: 1.0, duration: 0.5))
//        christinaBox.run(SKAction.fadeAlpha(to: 1.0, duration: 0.5))
//        jeremyBox.run(SKAction.fadeAlpha(to: 1.0, duration: 0.5))
    }
    
    func hideImages() {
        let fadeOutAction = SKAction.fadeAlpha(to: 0.0, duration: 0.5)

        let nodesToHide = [reid, victor, christina, jeremy, reidBox, victorBox, christinaBox, jeremyBox]

        for node in nodesToHide {
            node?.run(fadeOutAction)
        }
//        reid.run(SKAction.fadeAlpha(to: 0.0, duration: 0.5))
//        victor.run(SKAction.fadeAlpha(to: 0.0, duration: 0.5))
//        christina.run(SKAction.fadeAlpha(to: 0.0, duration: 0.5))
//        jeremy.run(SKAction.fadeAlpha(to: 0.0, duration: 0.5))
//        reidBox.run(SKAction.fadeAlpha(to: 0.0, duration: 0.5))
//        victorBox.run(SKAction.fadeAlpha(to: 0.0, duration: 0.5))
//        christinaBox.run(SKAction.fadeAlpha(to: 0.0, duration: 0.5))
//        jeremyBox.run(SKAction.fadeAlpha(to: 0.0, duration: 0.5))
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
    
    func moonAnimation(node: SKSpriteNode?) {
        guard let node = node else { return }
        
        let swing = SKAction.sequence([
            SKAction.rotate(byAngle: 0.04, duration: 1.0),
            SKAction.rotate(byAngle: -0.04, duration: 1.0)
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
//        var textures = [SKTexture]()
//        
//        textures.append(SKTexture(imageNamed: "face1"))
//        textures.append(SKTexture(imageNamed: "face2"))
//        textures.append(SKTexture(imageNamed: "face3"))
//        textures.append(SKTexture(imageNamed: "face4"))
//        textures.append(SKTexture(imageNamed: "face5"))
//        textures.append(SKTexture(imageNamed: "face4"))
//        textures.append(SKTexture(imageNamed: "face4"))
//        textures.append(SKTexture(imageNamed: "face2"))
//        textures.append(SKTexture(imageNamed: "face1"))
//        
//        let frames = SKAction.animate(with: textures, timePerFrame: 0.1, resize: false, restore: false)
//        
//        let wait = SKAction.wait(forDuration: 2.0)
//        
//        let sequence = SKAction.sequence([frames, wait])
//        
//        let repeatedSequence = SKAction.repeatForever(sequence)
//        
//        eyes.run(repeatedSequence)
    }
    
    override func update(_ currentTime: TimeInterval) {
    }
    
    func touchDown(atPoint pos: CGPoint) {
        if nextButton.contains(pos) {
            nextDialogue()
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

struct Dialogue {
    var popUp: String
    var lunaImage: lunaTypes
}

enum lunaTypes: String {
    case luna1 = "Luna1"
    case luna2 = "Luna2"
    case luna3 = "Luna3"
    case eyes = "Eyes"
}
