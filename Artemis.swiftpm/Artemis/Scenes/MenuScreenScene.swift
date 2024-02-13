//
//  File.swift
//
//
//  Created by Bianca Nathally Bezerra de Lima on 09/01/24.
//

import Foundation
import SpriteKit
import AVFoundation

var backAudioMain = AVAudioPlayer()

class MenuScreenScene: SKScene {
    var performIntroNavigation: (() -> ())?
    var performCreditsNavigation: (() -> ())?
    
    var sound = SKAction.playSoundFileNamed("artemisSoundTrack.m4a", waitForCompletion: false)
    
    static func buildScene(performIntroNavigation: (() -> ())?, performCreditsNavigation: (() -> ())?) -> MenuScreenScene {
        let scene = MenuScreenScene(fileNamed: "MenuScreen")!
        scene.performIntroNavigation = performIntroNavigation
        scene.performCreditsNavigation = performCreditsNavigation
        return scene
    }
    
    var starsBackground, earthBackground, stardustBackground, moonBackground: SKSpriteNode!
    var dialogueBoxMenu, startButton, creditsButton: SKSpriteNode!
    
    var touchButton: AVAudioPlayer!
    
    override func didMove(to view: SKView) {
        self.backgroundColor = UIColor(red: 0x1D / 255.0, green: 0x15 / 255.0, blue: 0x47 / 255.0, alpha: 1.0)
        
        starsBackground = (childNode(withName: "starsBackground") as! SKSpriteNode)
        starsAnimation(node: starsBackground)

        earthBackground = (childNode(withName: "earthBackground") as! SKSpriteNode)
        earthAnimation(node: earthBackground)
        
        stardustBackground = (childNode(withName: "stardustBackground") as! SKSpriteNode)
        
        moonBackground = (childNode(withName: "moonBackground") as! SKSpriteNode)
        moonAnimation(node: moonBackground)
        
        dialogueBoxMenu = (childNode(withName: "dialogueBoxMenu") as! SKSpriteNode)
        startButton = (childNode(withName: "startButton") as! SKSpriteNode)
        creditsButton = (childNode(withName: "creditsButton") as! SKSpriteNode)
        
        configureLabels(scene: self)
        
        configureNodesMenu(in: self)
        
        // touch button
        let url: URL = Bundle.main.url(forResource: "touch", withExtension: "m4a")!
        touchButton = try! AVAudioPlayer(contentsOf: url, fileTypeHint: nil)
        touchButton.numberOfLoops = 1
        touchButton.volume = 0.3
        
        // soundtrack
        let filePath = Bundle.main.path(forResource: "artemisSoundTrack", ofType: "m4a")
        let audioNSURL = NSURL(fileURLWithPath: filePath!)
        do { backAudioMain = try AVAudioPlayer(contentsOf: audioNSURL as URL)}
        catch { return print("Cannot Find The Audio")}
        backAudioMain.numberOfLoops = -1
        backAudioMain.volume = 0.6
        backAudioMain.play()
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
            SKAction.rotate(byAngle: 0.02, duration: 1.5),
            SKAction.rotate(byAngle: -0.02, duration: 1.5)
        ])
        
        node.run(SKAction.repeatForever(swing))
    }
    
    func moonAnimation(node: SKSpriteNode?) {
        guard let node = node else { return }
        
        let swing = SKAction.sequence([
            SKAction.rotate(byAngle: 0.06, duration: 1.0),
            SKAction.rotate(byAngle: -0.06, duration: 1.0)
        ])
        
        node.run(SKAction.repeatForever(swing))
    }
    
    func playTouch() {
        if touchButton.isPlaying {
            touchButton.stop()
        }
      
        touchButton.play()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    func touchDown(atPoint pos: CGPoint) {
        if startButton.contains(pos) {
            startButton.alpha = 0.5
            
            playTouch()
            
            performIntroNavigation?()
        }
        
        if creditsButton.contains(pos) {
            creditsButton.alpha = 0.5
            
            playTouch()
            
            performCreditsNavigation?()
        }
    }
}
