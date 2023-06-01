//
//  ContentView.swift
//  PruebaTecnica
//
//  Created by HLS GROUP on 31/05/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showBankList = false
    @State private var isWelcomeTextVisible = false

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: BankListView(), isActive: $showBankList) {
                    EmptyView()
                }
                .hidden()
                
                if isWelcomeTextVisible {
                    Text("Bienvenido")
                        .font(.title)
                        .fontWeight(.bold)
                        .animation(.easeInOut(duration: 4.0))
                        .padding()
                }
                
                Button(action: {
                    showBankList = true
                }) {
                    Text("Consultar bancos")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.accentColor)
                        .cornerRadius(10)
                }
                .padding()
            }
            .onAppear {
                withAnimation {
                    isWelcomeTextVisible = true
                }
            }
            .navigationBarBackButtonHidden(true) 
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



