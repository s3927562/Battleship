//
//  ContentView.swift
//  Battleship
//
//  Created by Tung Tran Thanh on 25/08/2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) private var colorScheme // Get system color scheme
    @AppStorage("firstLaunch") private var firstLaunch = true // Set first launch status
    @AppStorage("darkMode") private var darkMode = false // Store dark mode settings
    
    var body: some View {
        VStack {
            Button {
                
            } label: {
                Text("New Game")
                    .frame(maxWidth: .infinity, maxHeight: 32)
            }
            .buttonStyle(.borderedProminent)
            
            Button {
                
            } label: {
                Text("Continue")
                    .frame(maxWidth: .infinity, maxHeight: 32)
            }
            .buttonStyle(.bordered)
            .disabled(true)
            
            Button {
                
            } label: {
                Text("Leaderboard")
            }
            
            Button {
                
            } label: {
                Text("Settings")
            }
            
            Button {
                
            } label: {
                Text("How to Play")
            }
            
            Button {
                
            } label: {
                Image(systemName: "info.circle.fill")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(Color.white, Color.accentColor)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        }
        .padding()
        .onAppear() {
            // Set color scheme state variable on first launch based on system settings
            if firstLaunch {
                darkMode = colorScheme == .dark ? true : false
                firstLaunch = false
            }
        }
        .preferredColorScheme(darkMode ? .dark : .light) // Set color scheme based on state variable
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
