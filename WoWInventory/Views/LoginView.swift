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
                .aspectRatio(contentMode: .fill)

            VStack {
                VStack {
                    Text(verbatim: "Bienvenue dans ")
                    Image(ImageResource.logoApp)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text(verbatim: "Inventory")
                }
                .padding()
                
                Spacer()
                
                Button {
                    //
                } label: {
                    Text(verbatim: "Connexion")
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
