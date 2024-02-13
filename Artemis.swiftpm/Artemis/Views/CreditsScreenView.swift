//
//  File.swift
//  
//
//  Created by Bianca Nathally Bezerra de Lima on 09/02/24.
//

import Foundation
import SwiftUI
import SpriteKit

struct CreditsScreenView: View {
    @State var isNavigating = false
    
    var body: some View {
        VStack {
            if isNavigating {
                MenuScreenView()
            } else {
                SpriteView(scene: CreditsScreenScene.buildScene(performNavigation: {
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
