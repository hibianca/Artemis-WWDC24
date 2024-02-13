//
//  File.swift
//  
//
//  Created by Bianca Nathally Bezerra de Lima on 01/02/24.
//

import SwiftUI
import SpriteKit

struct MoonScreenView: View {
    @State var isNavigating = false
    
    var body: some View {
        VStack {
//            Text("Hi")
            if isNavigating {
                FinalScreenView()
            } else {
                SpriteView(scene: MoonScreenScene.buildScene(performNavigation: {
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
