//
//  File.swift
//  
//
//  Created by Bianca Nathally Bezerra de Lima on 09/02/24.
//

import SwiftUI
import SpriteKit

struct FinalScreenView: View {
    @State var isNavigating = false
    
    var body: some View {
        
        VStack {
//            Text("Hi")
            if isNavigating {
                CreditsScreenView()
            } else {
                SpriteView(scene: FinalScreenScene.buildScene(performNavigation: {
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
