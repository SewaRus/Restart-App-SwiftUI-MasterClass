//
//  HomeView.swift
//  Restart SwiftUI MasterClass
//
//  Created by Aran Fononi on 1/4/25.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Property
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimated: Bool = false
    let hapticFeedback = UINotificationFeedbackGenerator()


    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 20) {
            // MARK: - Header
            
            Spacer()
            
            ZStack {
                
                CircleGroupView(ShapeColor: .gray, ShapeOpacity: 0.1)
                
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimated ? 35 : -35)
                    .animation(Animation.easeInOut(duration: 4).repeatForever(), value: isAnimated)
            } // ZStack
            
            // MARK: - Center
            
            Text("The time that leads to mastery is dependent on the intensity of your focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            // MARK: - Footer
            
            Spacer()
            
            Button {
                withAnimation {
                    hapticFeedback.notificationOccurred(.success)
                    playSound(sound: "success", type: "m4a")
                    isOnboardingViewActive = true
                }
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            
        } // VStack
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 , execute: {
                isAnimated = true
            })
        }
    }
}

#Preview {
    HomeView()
}
