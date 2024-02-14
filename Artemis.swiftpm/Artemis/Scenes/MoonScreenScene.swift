//
//  File.swift
//
//
//  Created by Bianca Nathally Bezerra de Lima on 01/02/24.
//

import Foundation
import SpriteKit
import AVFoundation

class MoonScreenScene: SKScene {
    var performNavigation: (() -> ())?
    static func buildScene(performNavigation: (() -> ())?) -> MoonScreenScene {
        let scene = MoonScreenScene(fileNamed: "MoonScreen")!
        scene.performNavigation = performNavigation
        return scene
    }
    
    var starsBackground, moonBackground, earth, objetoArrastavel, trajectory, gateway: SKSpriteNode!
    var dialogueBoxLuna, nextButton: SKSpriteNode!
    var star1, star2, star3, star4, star5, star6: SKSpriteNode!
    var tooltip1, tooltip2, tooltip3, tooltip4, tooltip4half, tooltip5, tooltip6: SKSpriteNode!
    var orionLight: SKNode!
    var lastTouchPosition: CGPoint?
    var point1, point1half, point2, point2half, point3, point3half, point4, point4half, point5, point5one, point5two, point5three, point5four, point6: SKNode!
    var pointPassed = [false, false, false, false, false, false, false, false, false, false, false, false, false, false]
    var changeImages = false
    var dialogues: [DialogueMoon] = [
        DialogueMoon(popUp: "dialogueBox17"),
        DialogueMoon(popUp: "dialogueBox18"),
        DialogueMoon(popUp: "dialogueBox19"),
        DialogueMoon(popUp: "dialogueBox20")
    ]
    var touchButton: AVAudioPlayer!
    var starPassed: AVAudioPlayer!
    
    override func didMove(to view: SKView) {
        // Background nodes
        self.backgroundColor = UIColor(red: 0x1D / 255.0, green: 0x15 / 255.0, blue: 0x47 / 255.0, alpha: 1.0)
        
        starsBackground = (childNode(withName: "starsBackground") as! SKSpriteNode)
        starsAnimation(node: starsBackground)
        earth = (childNode(withName: "earth") as! SKSpriteNode)
        earthAnimation(node: earth)
        moonBackground = (childNode(withName: "moonBackground") as! SKSpriteNode)
        moonAnimation(node: moonBackground)
        
        // Moon nodes
        objetoArrastavel = (childNode(withName: "orionUpperStage") as? SKSpriteNode)
        trajectory = (childNode(withName: "trajectory") as! SKSpriteNode)
        gateway = (childNode(withName: "gateway") as! SKSpriteNode)
        gatewayAnimation(node: gateway)
        dialogueBoxLuna = (childNode(withName: "dialogueBoxLuna") as! SKSpriteNode)
        dialogueBoxLuna.size = CGSize(width: 959, height: 318)
        nextButton = (childNode(withName: "nextButton") as! SKSpriteNode)
        star1 = (childNode(withName: "star1") as! SKSpriteNode)
        star2 = (childNode(withName: "star2") as! SKSpriteNode)
        star3 = (childNode(withName: "star3") as! SKSpriteNode)
        star4 = (childNode(withName: "star4") as! SKSpriteNode)
        star5 = (childNode(withName: "star5") as! SKSpriteNode)
        star6 = (childNode(withName: "star6") as! SKSpriteNode)
        tooltip1 = (childNode(withName: "tooltip1") as! SKSpriteNode)
        tooltip2 = (childNode(withName: "tooltip2") as! SKSpriteNode)
        tooltip3 = (childNode(withName: "tooltip3") as! SKSpriteNode)
        tooltip4 = (childNode(withName: "tooltip4") as! SKSpriteNode)
        tooltip4half = (childNode(withName: "tooltip4half") as! SKSpriteNode)
        tooltip5 = (childNode(withName: "tooltip5") as! SKSpriteNode)
        tooltip6 = (childNode(withName: "tooltip6") as! SKSpriteNode)
        orionLight = childNode(withName: "orionLight")
        point1 = childNode(withName: "point1")
        point1half = childNode(withName: "point1half")
        point2 = childNode(withName: "point2")
        point2half = childNode(withName: "point2half")
        point3 = childNode(withName: "point3")
        point3half = childNode(withName: "point3half")
        point4 = childNode(withName: "point4")
        point4half = childNode(withName: "point4half")
        point5 = childNode(withName: "point5")
        point5one = childNode(withName: "point5one")
        point5two = childNode(withName: "point5two")
        point5three = childNode(withName: "point5three")
        point5four = childNode(withName: "point5four")
        point6 = childNode(withName: "point6")
        
        configureNodesMoon(in: self)
        
        // pass the dialogues
        let dialogue = dialogues.removeFirst()
        dialogueBoxLuna.texture = SKTexture(imageNamed: dialogue.popUp)
        
        // touch button
        let url: URL = Bundle.main.url(forResource: "touch", withExtension: "m4a")!
        touchButton = try! AVAudioPlayer(contentsOf: url, fileTypeHint: nil)
        touchButton.numberOfLoops = 1
        touchButton.volume = 0.3
        
        // passed star
        let path: URL = Bundle.main.url(forResource: "star", withExtension: "m4a")!
        starPassed = try! AVAudioPlayer(contentsOf: path, fileTypeHint: nil)
        starPassed.numberOfLoops = 0
        starPassed.volume = 0.3
        
        // sets alpha to 0.0 when starting the scene
        star1.alpha = 0.0
        star2.alpha = 0.0
        star3.alpha = 0.0
        star4.alpha = 0.0
        star5.alpha = 0.0
        star6.alpha = 0.0
        
        tooltip1.alpha = 0.0
        tooltip2.alpha = 0.0
        tooltip3.alpha = 0.0
        tooltip4.alpha = 0.0
        tooltip4half.alpha = 0.0
        tooltip5.alpha = 0.0
        tooltip6.alpha = 0.0
        
        objetoArrastavel.alpha = 0.0
    }
    
    // function to pass the dialogues
    func nextDialogue() {
        
        // if all the dialogues don't pass
        if dialogues.count >= 1 {
            let dialogue = dialogues.removeFirst()
            
            dialogueBoxLuna.run(.setTexture(SKTexture(imageNamed: dialogue.popUp), resize: false))
            
            playTouch()
        
        // if all dialogues pass
        } else if dialogues.count == 0 {
            objetoArrastavel.alpha = 1.0
            
            hideNextButton()
            
            playTouch()
        }
        
        // if the <lunarModule> touches the point6, the <pointPassed[13]>, is possible pass to the next scene
        if pointPassed[13] == true {
            performNavigation?()
            
            playTouch()
        }
    }
    
    // function to show the nextButton
    func showNextButton() {
        nextButton.run(SKAction.fadeAlpha(to: 1.0, duration: 0.2))
    }
    
    // function to hide the nextButton
    func hideNextButton() {
        nextButton.run(SKAction.fadeAlpha(to: 0.0, duration: 0.1))
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
    
    // function to animate the earth in the background
    func earthAnimation(node: SKSpriteNode?) {
        guard let node = node else { return }
        
        let swing = SKAction.sequence([
            SKAction.rotate(byAngle: 0.02, duration: 1.0),
            SKAction.rotate(byAngle: -0.02, duration: 1.0)
        ])
        
        node.run(SKAction.repeatForever(swing))
    }
    
    // function to animate the moon in the background
    func moonAnimation(node: SKSpriteNode?) {
        guard let node = node else { return }
        
        let swing = SKAction.sequence([
            SKAction.rotate(byAngle: 0.1, duration: 1.0),
            SKAction.rotate(byAngle: -0.1, duration: 1.0)
        ])
        
        node.run(SKAction.repeatForever(swing))
    }
    
    // function to animate the lunar station gateway
    func gatewayAnimation(node: SKSpriteNode?) {
        guard let node = node else { return }
        
        let duration: TimeInterval = 10.0
        let orbitPath = UIBezierPath(ovalIn: CGRect(x: -55, y: -640, width: 440, height: 390))
        let orbitRotation = CGFloat.pi / 4.0
        
        let orbitMovement = SKAction.follow(orbitPath.cgPath, asOffset: false, orientToPath: true, duration: duration)
        let rotation = SKAction.rotate(byAngle: orbitRotation, duration: duration)
        
        let orbitAnimation = SKAction.group([orbitMovement, rotation])
        
        node.run(SKAction.repeatForever(orbitAnimation))
    }
    
    // function to animate the orbit of the Draggable object
    func rotateAnimation(to angle: CGFloat, duration: TimeInterval) {
        let rotateAction = SKAction.rotate(toAngle: angle, duration: duration, shortestUnitArc: true)
        
        objetoArrastavel.run(rotateAction)
    }
    
    // function to animate when the tooltip appears
    func tooltipAnimation(node: SKSpriteNode, numberOfJumps: Int) {
        let scaleUp = SKAction.scale(to: 1.1, duration: 0.3)
        let scaleDown = SKAction.scale(to: 1.0, duration: 0.3)
        let bounce = SKAction.sequence([scaleUp, scaleDown])
        
        let repeatAction = SKAction.repeat(bounce, count: numberOfJumps)
        
        let makeStatic = SKAction.run {
            node.removeAllActions()
        }
        
        let sequence = SKAction.sequence([repeatAction, makeStatic])
        
        node.run(sequence)
    }
    
    // function to play the button tap sound
    func playTouch() {
        if touchButton.isPlaying {
            touchButton.stop()
        }
      
        touchButton.play()
    }
    
    // function to play the star sound
    func playStar() {
        if starPassed.isPlaying {
            starPassed.stop()
        }
      
        starPassed.play()
    }
    
    override func update(_ currentTime: TimeInterval) {
    }
    
    func touchDown(atPoint pos: CGPoint) {
        
        // if the nextButton is tapped, show the next dialogue and play button sound
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
        
        guard let touch = touches.first else { return }
        let touchLocation = touch.location(in: self)
        
        if objetoArrastavel.frame.contains(touchLocation) {
            lastTouchPosition = touchLocation
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchMoved(atPoint: t.location(in: self)) }
        
        guard let touch = touches.first, let lastPosition = lastTouchPosition else { return }
        
        let deltaX = touch.location(in: self).x - lastPosition.x
        let deltaY = touch.location(in: self).y - lastPosition.y
        
        objetoArrastavel.position.x += deltaX
        objetoArrastavel.position.y += deltaY
        
        orionLight.position.x += deltaX
        orionLight.position.y += deltaY
        
        lastTouchPosition = touch.location(in: self)
        
        checkIfObjectIsOnPoint()
        
        if objetoArrastavel.frame.intersects(point6.frame) && pointPassed[13] == true {
            objetoArrastavel.position = point6.position
        }
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
        
        lastTouchPosition = nil
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { touchUp(atPoint: t.location(in: self)) }
    }
    
    func checkIfObjectIsOnPoint() {
        if objetoArrastavel.frame.intersects(point1.frame) && !pointPassed[0] {
            pointPassed[0] = true
            star1.alpha = 1.0
            tooltip1.alpha = 1.0
            tooltipAnimation(node: tooltip1, numberOfJumps: 1)
            
            playStar()
          
            rotateAnimation(to: CGFloat.pi / 1.0, duration: 0.5)
            
        } else if objetoArrastavel.frame.intersects(point1half.frame) && pointPassed[0] && !pointPassed[1] {
            
            pointPassed[1] = true
            
            rotateAnimation(to: -CGFloat.pi / 4.5, duration: 0.5)
            
        } else if objetoArrastavel.frame.intersects(point2.frame) && pointPassed[1] && !pointPassed[2] {
            
            pointPassed[2] = true
            star2.alpha = 1.0
            tooltip2.alpha = 1.0
            tooltipAnimation(node: tooltip2, numberOfJumps: 1)
            
            playStar()
            
            rotateAnimation(to: CGFloat.pi / 8.0, duration: 0.5)
            
        } else if objetoArrastavel.frame.intersects(point2half.frame) && pointPassed[2] && !pointPassed[3] {
            
            pointPassed[3] = true
            
            rotateAnimation(to: CGFloat.pi / 1.5, duration: 0.5)
            
        } else if objetoArrastavel.frame.intersects(point3.frame) && pointPassed[3] && !pointPassed[4] {
            
            pointPassed[4] = true
            star3.alpha = 1.0
            tooltip3.alpha = 1.0
            tooltipAnimation(node: tooltip3, numberOfJumps: 1)
            
            playStar()
            
            rotateAnimation(to: -CGFloat.pi / 1.0, duration: 0.5)
            
        } else if objetoArrastavel.frame.intersects(point3half.frame) && pointPassed[4] && !pointPassed[5] {
            
            pointPassed[5] = true
            
            rotateAnimation(to: -CGFloat.pi / 1.8, duration: 0.5)
            
        } else if objetoArrastavel.frame.intersects(point4.frame) && pointPassed[5] && !pointPassed[6] {
            
            pointPassed[6] = true
            star4.alpha = 1.0
            tooltip4.alpha = 1.0
            tooltipAnimation(node: tooltip4, numberOfJumps: 1)
            
            playStar()
            
            rotateAnimation(to: -CGFloat.pi / 2.0, duration: 0.5)
            
        } else if objetoArrastavel.frame.intersects(point4half.frame) && pointPassed[6] && !pointPassed[7] {
            
            pointPassed[7] = true
            tooltip4half.alpha = 1.0
            tooltipAnimation(node: tooltip4half, numberOfJumps: 1)
            
            rotateAnimation(to: CGFloat.pi / 1.0, duration: 0.5)
            
        } else if objetoArrastavel.frame.intersects(point5.frame) && pointPassed[7] && !pointPassed[8] {
            
            pointPassed[8] = true
            star5.alpha = 1.0
            tooltip5.alpha = 1.0
            tooltipAnimation(node: tooltip5, numberOfJumps: 1)
            
            playStar()
            
            rotateAnimation(to: CGFloat.pi / 2.0, duration: 0.5)
            
        } else if objetoArrastavel.frame.intersects(point5one.frame) && pointPassed[8] && !pointPassed[9] {
            
            if changeImages == true {
                pointPassed[9] = true
                rotateAnimation(to: CGFloat.pi / 5.0, duration: 0.5)
            }
            
        } else if objetoArrastavel.frame.intersects(point5two.frame) && pointPassed[9] && !pointPassed[10] {
            
            pointPassed[10] = true
            
            rotateAnimation(to: -CGFloat.pi / 3.0, duration: 0.5)
            
        } else if objetoArrastavel.frame.intersects(point5three.frame) && pointPassed[10] && !pointPassed[11] {
            
            pointPassed[11] = true
            
            rotateAnimation(to: CGFloat.pi / 1.0, duration: 0.5)
            
        } else if objetoArrastavel.frame.intersects(point5four.frame) && pointPassed[11] && !pointPassed[12] {
            
            pointPassed[12] = true
            
            rotateAnimation(to: CGFloat.pi / 3.0, duration: 0.5)
            
        } else if objetoArrastavel.frame.intersects(point6.frame) && pointPassed[12] && !pointPassed[13] {
            
            pointPassed[13] = true
            star6.alpha = 1.0
            tooltip6.alpha = 1.0
            
            playStar()
            
//            tooltipAnimation(node: tooltip6, numberOfJumps: 1)
            
            showNextButton()
            
            rotateAnimation(to: CGFloat.pi, duration: 0.5)
            
        } else if objetoArrastavel.frame.intersects(gateway.frame) && pointPassed[8] && !pointPassed[9] {
            
            changeImages = true
            
            gateway.texture = SKTexture(imageNamed: "gatewayOrion")
            objetoArrastavel.texture = SKTexture(imageNamed: "lunarModule")
        }
    }
}

struct DialogueMoon {
    var popUp: String
}
