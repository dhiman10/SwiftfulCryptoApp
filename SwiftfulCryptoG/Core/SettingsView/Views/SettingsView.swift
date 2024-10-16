//
//  SettingsView.swift
//  SwiftfulCryptoG
//
//  Created by Dhiman Das on 16.10.24.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode

    let defaultURL = URL(string: "https://github.com/dhiman10")!
    let youtubeURL = URL(string: "https://www.youtube.com")!
    let coffeeURL = URL(string: "https://www.youtube.com")!
    let coingeckoURL = URL(string: "https://www.youtube.com")!
    let personalURL = URL(string: "https://www.youtube.com")!
    
    var body: some View {
        NavigationView {
        
            ZStack {
                // background
                Color.theme.background
                    .ignoresSafeArea()
            List {
                swiftfulThinkingSection
                    .listRowBackground(Color.theme.background.opacity(0.5))
                coinGeckoSection
                    .listRowBackground(Color.theme.background.opacity(0.5))
                applicationSection
                    .listRowBackground(Color.theme.background.opacity(0.5))
            }
            }
            .font(.headline)
            .accentColor(.blue)
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                   // XMarkButton()
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.headline)
                    })
                }
            }
        }
    }
}


#Preview {
    SettingsView()
}

extension SettingsView {
    
    private var swiftfulThinkingSection: some View {
        Section(header: Text("Swift UI practice")) {
            VStack (alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was made by following a @SwiftfulThinking course on YouTube.!")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
        }
        
    }
    
    private var coinGeckoSection: some View {
        Section(header: Text("CoinGecko")) {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("The cryptocurrency data that is used in this app comes from a free API from CoinGecko! Prices may be slightly delayed.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit CoinGecko 🦎", destination: coingeckoURL)
        }
    }
    
    private var applicationSection: some View {
        Section(header: Text("Application")) {
            Link("Terms of Service", destination: defaultURL)
            Link("Privacy Policy", destination: defaultURL)
            Link("Company Website", destination: defaultURL)
            Link("Learn More", destination: defaultURL)
        }
    }

}
