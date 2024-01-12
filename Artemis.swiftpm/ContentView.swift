import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            LaunchScreenView()
                .ignoresSafeArea()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        }.navigationViewStyle(.stack)
    }
}
