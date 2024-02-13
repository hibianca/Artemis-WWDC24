//
//  File.swift
//
//
//  Created by Bianca Nathally Bezerra de Lima on 14/01/24.
//

import SwiftUI
import SpriteKit

struct RocketScreenView: View {
    @State var isNavigating = false
    
    var body: some View {
        VStack {
            if isNavigating {
                MoonScreenView()
            } else {
                SpriteView(scene: RocketScreenScene.buildScene(performNavigation: {
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
