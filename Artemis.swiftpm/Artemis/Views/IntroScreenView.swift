//
//  File.swift
//  
//
//  Created by Bianca Nathally Bezerra de Lima on 10/01/24.
//

import SwiftUI
import SpriteKit

struct IntroScreenView: View {
    @State var isNavigating = false
    
    var body: some View {
        
        VStack {
            if isNavigating {
                RocketScreenView()
            } else {
                SpriteView(scene: IntroScreenScene.buildScene(performNavigation: {
                    withAnimation {
                        isNavigating = true
                    }
                }))
            }
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

