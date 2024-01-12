//
//  File.swift
//  
//
//  Created by Bianca Nathally Bezerra de Lima on 09/01/24.
//

import SwiftUI
import SpriteKit

struct MenuScreenView: View {
    @State var isNavigating = false
    
    var body: some View {
        VStack {
            if isNavigating {
                IntroScreenView()
            } else {
                SpriteView(scene: MenuScreenScene.buildScene(performNavigation: {
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
