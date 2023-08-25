//
//  ContentView.swift
//  Battleship
//
//  Created by Tung Tran Thanh on 25/08/2023.
// https://www.avanderlee.com/swiftui/presenting-sheets/
import SwiftUI

struct MainView: View {
    @Environment(\.colorScheme) private var colorScheme // Get system color scheme
    @AppStorage("firstLaunch") private var firstLaunch = true // Set first launch status
    @AppStorage("darkMode") private var darkMode = false // Store dark mode settings
    @State private var infoAlert = false // State variable for information pop-up
    @State private var sheetView: SheetViews? // State variable for sheet views
    
    enum SheetViews: String, Identifiable {
        case leaderboard, settings, howToPlay
        
        var id: String { rawValue }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(darkMode ? "rmit-logo-white" : "rmit-logo-black")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
                Text("Battleship")
                    .font(.largeTitle)
                    .bold()
                
                Group {
                    Spacer()
                    
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
                        sheetView = .leaderboard
                    } label: {
                        Text("Leaderboard")
                            .frame(height: 32)
                    }
                    
                    Button {
                        sheetView = .settings
                    } label: {
                        Text("Settings")
                            .frame(height: 32)
                    }
                    
                    Button {
                        sheetView = .howToPlay
                    } label: {
                        Text("How to Play")
                            .frame(height: 32)
                    }
                    
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Button {
                        infoAlert = true
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(Color.white, Color.accentColor)
                    }
                }
            }}
        .padding()
        .onAppear() {
            // Set color scheme state variable on first launch based on system settings
            if firstLaunch {
                darkMode = colorScheme == .dark ? true : false
                firstLaunch = false
            }
        }
        .preferredColorScheme(darkMode ? .dark : .light) // Set color scheme based on state variable
        .alert("Information", isPresented: $infoAlert) {
            // Default is already "OK" Button
        } message: {
            VStack {
                Text("Name: Tran Thanh Tung\nStudent ID: s3927562\nProgram: BH120 - Bachelor of Engineering (Software Engineering) (Honours)")
            }
        }
        .sheet(item: $sheetView, content: { sheet in
            switch sheet {
            case .leaderboard: LeaderboardView()
            case .settings: LeaderboardView()
            case .howToPlay: LeaderboardView()
            }
        })
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
