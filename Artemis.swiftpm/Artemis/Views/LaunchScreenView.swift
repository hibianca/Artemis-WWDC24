//
//  File.swift
//
//
//  Created by Bianca Nathally Bezerra de Lima on 09/01/24.
//

import Foundation
import SwiftUI
import SpriteKit

struct LaunchScreenView: View {
    @State var isNavigating = false
    
    var body: some View {
        VStack {
            if isNavigating {
                MenuScreenView()
            } else {
                SpriteView(scene: LaunchScreenScene.buildScene(performNavigation: {
                    withAnimation {
                        isNavigating = true
                    }
                }))
//                SpriteView(scene: FinalScreenScene.buildScene(performNavigation: {
//                    withAnimation {
//                        isNavigating = true
//                    }
//                }))
            }
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}
