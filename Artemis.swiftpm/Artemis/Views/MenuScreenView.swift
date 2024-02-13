//
//  File.swift
//
//
//  Created by Bianca Nathally Bezerra de Lima on 09/01/24.
//

import SwiftUI
import SpriteKit

struct MenuScreenView: View {
    @State var isNavigatingIntro = false
    @State var isNavigatingCredits = false
    
    var body: some View {
        VStack {
            if isNavigatingIntro {
                IntroScreenView()
            } else if isNavigatingCredits {
                CreditsScreenView()
            } else {
                SpriteView(scene: MenuScreenScene.buildScene(
                    performIntroNavigation: {
                        withAnimation {
                            isNavigatingIntro = true
                        }
                    },
                    performCreditsNavigation: {
                        withAnimation {
                            isNavigatingCredits = true
                        }
                    }
                ))
            }
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

//import SwiftUI
//import SpriteKit
//
//struct MenuScreenView: View {
//    @State var isNavigating = false
//
//    var body: some View {
//        VStack {
//            if isNavigating {
//                IntroScreenView()
//            } else {
//                SpriteView(scene: MenuScreenScene.buildScene(performNavigation: {
//                    withAnimation {
//                        isNavigating = true
//                    }
//                }))
//            }
//        }
//        .ignoresSafeArea()
//        .navigationBarHidden(true)
//        .navigationBarBackButtonHidden(true)
//    }
//}
