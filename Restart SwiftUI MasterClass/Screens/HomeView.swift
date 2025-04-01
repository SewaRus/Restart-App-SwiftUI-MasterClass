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

    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 20) {
            // MARK: - Header
            
            Spacer()
            
            Image("character-2")
                .resizable()
                .scaledToFit()
                .padding()
            
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
                isOnboardingViewActive = true
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
    }
}

#Preview {
    HomeView()
}
