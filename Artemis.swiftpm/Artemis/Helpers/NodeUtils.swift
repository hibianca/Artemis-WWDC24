//
//  File.swift
//
//
//  Created by Bianca Nathally Bezerra de Lima on 10/02/24.
//

import SpriteKit
import UIKit

func configureNodesCredits(in scene: SKScene) {
    guard let starsBackground = scene.childNode(withName: "starsBackground") as? SKSpriteNode,
          let credits = scene.childNode(withName: "credits") as? SKSpriteNode,
          let backButton = scene.childNode(withName: "backButton") as? SKSpriteNode
    else {
        return
    }
    
    _ = scene.size.width
    
    configureNodeSizePosition(node: starsBackground, scaleRatio: 1.0, sceneSize: scene.size)
    configureNodeSizePosition(node: credits, scaleRatio: 1.0, sceneSize: scene.size)
    configureNodeSizePosition(node: backButton, scaleRatio: 0.330, sceneSize: scene.size)
}

func configureNodesFinal(in scene: SKScene) {
    guard let starsBackground = scene.childNode(withName: "starsBackground") as? SKSpriteNode,
          let moonBackground2 = scene.childNode(withName: "moonBackground2") as? SKSpriteNode,
          let earth = scene.childNode(withName: "earth") as? SKSpriteNode,
          let stardustBackground = scene.childNode(withName: "stardustBackground") as? SKSpriteNode,
          let luna = scene.childNode(withName: "Luna1") as? SKSpriteNode,
          let eyes = scene.childNode(withName: "eyes") as? SKSpriteNode,
          let dialogueBox = scene.childNode(withName: "dialogueBox") as? SKSpriteNode,
          let nextButton = scene.childNode(withName: "nextButton") as? SKSpriteNode
    else {
        return
    }
    
    _ = scene.size.width
    
    configureNodeSizePosition(node: starsBackground, scaleRatio: 1.0, sceneSize: scene.size)
    configureNodeSizePosition(node: moonBackground2, scaleRatio: 1.4, sceneSize: scene.size)
    configureNodeSizePosition(node: earth, scaleRatio: 0.379, sceneSize: scene.size)
    configureNodeSizePosition(node: stardustBackground, scaleRatio: 1.0, sceneSize: scene.size)
    configureNodeSizePosition(node: luna, scaleRatio: 1.2, sceneSize: scene.size)
    configureNodeSizePosition(node: eyes, scaleRatio: 1.046, sceneSize: scene.size)
    configureNodeSizePosition(node: dialogueBox, scaleRatio: 0.888, sceneSize: scene.size)
    configureNodeSizePosition(node: nextButton, scaleRatio: 0.161, sceneSize: scene.size)
}

func configureNodesMoon(in scene: SKScene) {
    guard let starsBackground = scene.childNode(withName: "starsBackground") as? SKSpriteNode,
          let dialogueBoxLuna = scene.childNode(withName: "dialogueBoxLuna") as? SKSpriteNode,
          let nextButton = scene.childNode(withName: "nextButton") as? SKSpriteNode,
          let star1 = scene.childNode(withName: "star1") as? SKSpriteNode,
          let star2 = scene.childNode(withName: "star2") as? SKSpriteNode,
          let star3 = scene.childNode(withName: "star3") as? SKSpriteNode,
          let star4 = scene.childNode(withName: "star4") as? SKSpriteNode,
          let star5 = scene.childNode(withName: "star5") as? SKSpriteNode,
          let star6 = scene.childNode(withName: "star6") as? SKSpriteNode
    else {
        return
    }
    
    _ = scene.size.width
    
    configureNodeSizePosition(node: starsBackground, scaleRatio: 1.0, sceneSize: scene.size)
    configureNodeSizePosition(node: dialogueBoxLuna, scaleRatio: 0.956, sceneSize: scene.size)
    configureNodeSizePosition(node: nextButton, scaleRatio: 0.161, sceneSize: scene.size)
    configureNodeSizePosition(node: star1, scaleRatio: 0.05, sceneSize: scene.size)
    configureNodeSizePosition(node: star2, scaleRatio: 0.05, sceneSize: scene.size)
    configureNodeSizePosition(node: star3, scaleRatio: 0.05, sceneSize: scene.size)
    configureNodeSizePosition(node: star4, scaleRatio: 0.05, sceneSize: scene.size)
    configureNodeSizePosition(node: star5, scaleRatio: 0.05, sceneSize: scene.size)
    configureNodeSizePosition(node: star6, scaleRatio: 0.05, sceneSize: scene.size)
}

func configureNodesRocket(in scene: SKScene) {
    guard let dialogueBoxLuna = scene.childNode(withName: "dialogueBoxLuna") as? SKSpriteNode,
          let nextButton = scene.childNode(withName: "nextButton") as? SKSpriteNode,
          let bg1 = scene.childNode(withName: "bg1") as? SKSpriteNode,
          let starsLogo = scene.childNode(withName: "starsLogo") as? SKSpriteNode,
          let circles = scene.childNode(withName: "circles") as? SKSpriteNode,
          let rocket1 = scene.childNode(withName: "rocket1") as? SKSpriteNode,
          let rocket2 = scene.childNode(withName: "rocket2") as? SKSpriteNode,
          let rocket3 = scene.childNode(withName: "rocket3") as? SKSpriteNode,
          let rocket4 = scene.childNode(withName: "rocket4") as? SKSpriteNode,
          let rocket5 = scene.childNode(withName: "rocket5") as? SKSpriteNode,
          let centralStage = scene.childNode(withName: "centralStage") as? SKSpriteNode,
          let exhaustSystem = scene.childNode(withName: "exhaustSystem") as? SKSpriteNode,
          let orion = scene.childNode(withName: "orion") as? SKSpriteNode,
          let sideRockets = scene.childNode(withName: "sideRockets") as? SKSpriteNode,
          let upperStage = scene.childNode(withName: "upperStage") as? SKSpriteNode
    else {
        return
    }
    
    _ = scene.size.width
    
    configureNodeSizePosition(node: dialogueBoxLuna, scaleRatio: 0.956, sceneSize: scene.size)
    configureNodeSizePosition(node: nextButton, scaleRatio: 0.161, sceneSize: scene.size)
    configureNodeSizePosition(node: bg1, scaleRatio: 1.0, sceneSize: scene.size)
    configureNodeSizePosition(node: starsLogo, scaleRatio: 1.0, sceneSize: scene.size)
    configureNodeSizePosition(node: circles, scaleRatio: 0.825, sceneSize: scene.size)
    configureNodeSizePosition(node: rocket1, scaleRatio: 0.063, sceneSize: scene.size)
    configureNodeSizePosition(node: rocket2, scaleRatio: 0.077, sceneSize: scene.size)
    configureNodeSizePosition(node: rocket3, scaleRatio: 0.096, sceneSize: scene.size)
    configureNodeSizePosition(node: rocket4, scaleRatio: 0.112, sceneSize: scene.size)
    configureNodeSizePosition(node: rocket5, scaleRatio: 0.062, sceneSize: scene.size)
    configureNodeSizePosition(node: centralStage, scaleRatio: 1.0, sceneSize: scene.size)
    configureNodeSizePosition(node: exhaustSystem, scaleRatio: 1.0, sceneSize: scene.size)
    configureNodeSizePosition(node: orion, scaleRatio: 1.0, sceneSize: scene.size)
    configureNodeSizePosition(node: sideRockets, scaleRatio: 1.0, sceneSize: scene.size)
    configureNodeSizePosition(node: upperStage, scaleRatio: 1.0, sceneSize: scene.size)
}

func configureNodesIntro(in scene: SKScene) {
    guard let starsBackground = scene.childNode(withName: "starsBackground") as? SKSpriteNode,
          let moonBackground = scene.childNode(withName: "moonBackground") as? SKSpriteNode,
          let earthBackground = scene.childNode(withName: "earthBackground") as? SKSpriteNode,
          let stardustBackground = scene.childNode(withName: "stardustBackground") as? SKSpriteNode,
          let dialogueBox = scene.childNode(withName: "dialogueBox") as? SKSpriteNode,
          let nextButton = scene.childNode(withName: "nextButton") as? SKSpriteNode,
          let luna = scene.childNode(withName: "Luna1") as? SKSpriteNode,
          let eyes = scene.childNode(withName: "eyes") as? SKSpriteNode,
          let moon = scene.childNode(withName: "moon") as? SKSpriteNode,
          let gatewayOrion = scene.childNode(withName: "gatewayOrion") as? SKSpriteNode,
          let reid = scene.childNode(withName: "reid") as? SKSpriteNode,
          let victor = scene.childNode(withName: "victor") as? SKSpriteNode,
          let christina = scene.childNode(withName: "christina") as? SKSpriteNode,
          let jeremy = scene.childNode(withName: "jeremy") as? SKSpriteNode,
          let reidBox = scene.childNode(withName: "reidBox") as? SKSpriteNode,
          let victorBox = scene.childNode(withName: "victorBox") as? SKSpriteNode,
          let christinaBox = scene.childNode(withName: "christinaBox") as? SKSpriteNode,
          let jeremyBox = scene.childNode(withName: "jeremyBox") as? SKSpriteNode
    else {
        return
    }
    
    _ = scene.size.width
    
    configureNodeSizePosition(node: starsBackground, scaleRatio: 1.0, sceneSize: scene.size)
    configureNodeSizePosition(node: moonBackground, scaleRatio: 0.517, sceneSize: scene.size)
    configureNodeSizePosition(node: earthBackground, scaleRatio: 1.5, sceneSize: scene.size)
    configureNodeSizePosition(node: stardustBackground, scaleRatio: 1.0, sceneSize: scene.size)
    configureNodeSizePosition(node: dialogueBox, scaleRatio: 0.888, sceneSize: scene.size)
    configureNodeSizePosition(node: nextButton, scaleRatio: 0.161, sceneSize: scene.size)
    configureNodeSizePosition(node: luna, scaleRatio: 1.2, sceneSize: scene.size)
    configureNodeSizePosition(node: eyes, scaleRatio: 1.046, sceneSize: scene.size)
    configureNodeSizePosition(node: moon, scaleRatio: 0.496, sceneSize: scene.size)
    configureNodeSizePosition(node: gatewayOrion, scaleRatio: 0.318, sceneSize: scene.size)
    configureNodeSizePosition(node: reid, scaleRatio: 0.315, sceneSize: scene.size)
    configureNodeSizePosition(node: victor, scaleRatio: 0.318, sceneSize: scene.size)
    configureNodeSizePosition(node: christina, scaleRatio: 0.317, sceneSize: scene.size)
    configureNodeSizePosition(node: jeremy, scaleRatio: 0.319, sceneSize: scene.size)
    configureNodeSizePosition(node: reidBox, scaleRatio: 0.373, sceneSize: scene.size)
    configureNodeSizePosition(node: victorBox, scaleRatio: 0.373, sceneSize: scene.size)
    configureNodeSizePosition(node: christinaBox, scaleRatio: 0.373, sceneSize: scene.size)
    configureNodeSizePosition(node: jeremyBox, scaleRatio: 0.373, sceneSize: scene.size)
}

func configureLabels(scene: SKScene) {
    let spacing1: CGFloat = 120
    let spacing2: CGFloat = 0
    
    let backgroundColor = UIColor(red: 0x1D / 255.0, green: 0x15 / 255.0, blue: 0x47 / 255.0, alpha: 1.0)
    
//    let backgroundColor = UIColor(red: 0.09, green: 0.45, blue: 0.71, alpha: 1.00)
    
    let backgroundNode1 = SKSpriteNode(color: backgroundColor, size: CGSize(width: 500, height: 40))
    backgroundNode1.position = CGPoint(x: 0, y: scene.size.height/2 - spacing1 - backgroundNode1.size.height/2)
    scene.addChild(backgroundNode1)
    
    let label1 = SKLabelNode(text: "For a good experience, it's important")
    label1.fontName = "SF Pro"
    label1.fontSize = 24
    label1.fontColor = .white
    label1.position = CGPoint(x: 0, y: 0)
    backgroundNode1.addChild(label1)
    
    let backgroundNode2 = SKSpriteNode(color: backgroundColor, size: CGSize(width: 500, height: 40))
    backgroundNode2.position = CGPoint(x: 0, y: backgroundNode1.position.y - backgroundNode1.size.height/2 - spacing2 - backgroundNode2.size.height/2)
    scene.addChild(backgroundNode2)
    
    let label2 = SKLabelNode(text: "to play in a vertical position")
    label2.fontName = "SF Pro"
    label2.fontSize = 24
    label2.fontColor = .white
    label2.position = CGPoint(x: 0, y: 0)
    backgroundNode2.addChild(label2)
}

func configureNodesMenu(in scene: SKScene) {
    guard let starsBackground = scene.childNode(withName: "starsBackground") as? SKSpriteNode,
          let moonBackground = scene.childNode(withName: "moonBackground") as? SKSpriteNode,
          let earthBackground = scene.childNode(withName: "earthBackground") as? SKSpriteNode,
          let stardustBackground = scene.childNode(withName: "stardustBackground") as? SKSpriteNode,
          let dialogueBoxMenu = scene.childNode(withName: "dialogueBoxMenu") as? SKSpriteNode,
          let startButton = scene.childNode(withName: "startButton") as? SKSpriteNode,
          let creditsButton = scene.childNode(withName: "creditsButton") as? SKSpriteNode
    else {
        return
    }
    
    _ = scene.size.width
    
    configureNodeSizePosition(node: starsBackground, scaleRatio: 1.0, sceneSize: scene.size)
    configureNodeSizePosition(node: moonBackground, scaleRatio: 0.517, sceneSize: scene.size)
    configureNodeSizePosition(node: earthBackground, scaleRatio: 1.5, sceneSize: scene.size)
    configureNodeSizePosition(node: stardustBackground, scaleRatio: 1.0, sceneSize: scene.size)
    configureNodeSizePosition(node: dialogueBoxMenu, scaleRatio: 0.634, sceneSize: scene.size)
    configureNodeSizePosition(node: startButton, scaleRatio: 0.330, sceneSize: scene.size)
    configureNodeSizePosition(node: creditsButton, scaleRatio: 0.330, sceneSize: scene.size)
}

func configureNodesLaunch(in scene: SKScene) {
    let logo = scene.childNode(withName: "artemisLogo") as? SKSpriteNode
    
    _ = scene.size.width
    
    configureNodeSizePosition(node: logo, scaleRatio: 1.0, sceneSize: scene.size)
}

func configureNodeSize(node: SKSpriteNode?, scaleRatio: CGFloat, sceneSize: CGSize) {
    guard let node = node else { return }
    
    let screenWidth = sceneSize.width
    let desiredWidth = screenWidth * scaleRatio
    
    let scaleFactor = desiredWidth / node.size.width
    node.setScale(scaleFactor)
}

func configureNodeSizePosition(node: SKSpriteNode?, scaleRatio: CGFloat, sceneSize: CGSize) {
    guard let node = node else { return }
    
    let screenWidth = sceneSize.width
    let desiredWidth = screenWidth * scaleRatio
    
    let scaleFactor = desiredWidth / node.size.width
    
    // Escala o nó
    node.setScale(scaleFactor)
    
    // Ajusta a posição do nó para corrigir qualquer espaço entre as imagens
    node.position = CGPoint(x: node.position.x * scaleFactor, y: node.position.y * scaleFactor)
}
