//
//  File.swift
//  
//
//  Created by Bianca Nathally Bezerra de Lima on 09/02/24.
//

import Foundation
import SpriteKit
import AVFoundation

class CreditsScreenScene: SKScene {
    var performNavigation: (() -> ())?
    static func buildScene(performNavigation: (() -> ())?) -> CreditsScreenScene {
        let scene = CreditsScreenScene(fileNamed: "CreditsScreen")!
        scene.performNavigation = performNavigation
        return scene
    }
    
    var starsBackground, credits: SKSpriteNode!
    var backButton: SKSpriteNode!
    var touchButton: AVAudioPlayer!
    
    override func didMove(to view: SKView) {
        // Background nodes
        self.backgroundColor = UIColor(red: 0x1D / 255.0, green: 0x15 / 255.0, blue: 0x47 / 255.0, alpha: 1.0)
        
        starsBackground = (childNode(withName: "starsBackground") as! SKSpriteNode)
        
        // Credits nodes
        credits = (childNode(withName: "credits") as! SKSpriteNode)
        backButton = (childNode(withName: "backButton") as! SKSpriteNode)
        
        configureNodesCredits(in: self)
        
        // touch button
        let url: URL = Bundle.main.url(forResource: "touch", withExtension: "m4a")!
        touchButton = try! AVAudioPlayer(contentsOf: url, fileTypeHint: nil)
        touchButton.numberOfLoops = 1
        touchButton.volume = 0.3
    }
    
    // function to play the button tap sound
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
        
        // if the backButton is tapped, back to the MenuScreenScene and play button sound
        if backButton.contains(pos) {
            backButton.alpha = 0.5
            performNavigation?()
            
            playTouch()
        }
    }
    
}
