//
//  LoginView.swift
//  WoWInventory
//
//  Created by Baptiste Cadoux on 23/06/2025.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack {
            Image(ImageResource.backgroundApp)
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .aspectRatio(contentMode: .fit)

            VStack {
                VStack {
                    Text(verbatim: "Bienvenue dans ")
                        .font(.custom("LifeCraft", size: 42))
                        .foregroundStyle(Color.brown)
                    Image(ImageResource.logoApp)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text(verbatim: "Inventory")
                        .font(.custom("LifeCraft", size: 42))
                        .foregroundStyle(Color.brown)
                }
                .padding()
                .background(Color.white.opacity(0.8))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.brown, lineWidth: 6)
                )
                .cornerRadius(16)
                .padding(32)

                Spacer()
                
                Button {
                    //
                } label: {
                    Text(verbatim: "Connexion")
                        .font(.custom("LifeCraft", size: 32))
                        .foregroundStyle(Color.white)
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(Color.brown)
                .padding(.horizontal, 50)
                .shadow(radius: 2)
                .cornerRadius(20)
            }
        }
    }
}

#Preview {
    LoginView()
}
