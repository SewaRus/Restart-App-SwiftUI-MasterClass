//
//  OnboardingView.swift
//  Restart SwiftUI MasterClass
//
//  Created by Aran Fononi on 1/4/25.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - Property
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0

    // MARK: - Body
    
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            VStack(spacing: 20) {
                // MARK: - Header
                Spacer()
                VStack(spacing: 0) {
                    Text("Share.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                    
                    Text("""
It's not how much we give but
how much love we put into giving.
""")
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                } // Header
                // MARK: - Center
                
                ZStack {
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                } // Center
                
                Spacer()
                // MARK: - Footer
                
                // Background
                ZStack {
                    Capsule()
                        .fill(.white.opacity(0.2))
                    
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                    
                    // Call-To-Action
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .offset(x: 20)
                    
                    // Capsule
                    HStack {
                        Capsule()
                            .fill(.colorRed)
                            .frame(width: buttonOffset + 80)
                        
                        Spacer()
                    }
                    // Circle
                    HStack {
                        ZStack {
                            Circle()
                                .fill(.colorRed)
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundStyle(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                        buttonOffset = gesture.translation.width
                                    }
                                }
                                .onEnded { _ in
                                    if buttonOffset > buttonWidth / 2 {
                                        buttonOffset = buttonWidth - 80
                                        isOnboardingViewActive = false
                                    } else {
                                        buttonOffset = 0
                                    }
                                    
                                }
                        ) // Gesture
                        
                        Spacer()
                    } // HStack
                    
                } // Footer
                .frame(width: buttonWidth, height: 80 , alignment: .center)
                .padding()
                
            } // VStack
        } // ZStack
    }
}

#Preview {
    OnboardingView()
}
