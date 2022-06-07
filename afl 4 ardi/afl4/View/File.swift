//
//  File.swift
//  afl4
//
//  Created by SIFT - Telkom DBT Air 6 on 07/06/22.
//

import Foundation
import SwiftUI

struct OnboardingView: View{
    @Binding var shouldShowOnboarding: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.black)
                .frame(height: 60)
                .mask(Text("To do list apps")
                    .bold()
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading))
            Label(
                title:{ Text("Add item to your list")
                    .font(.system(size: 20))},
                icon:{ Image(systemName: "plus")})
            .font(.system(size: 32))
            .padding()
            Label(
                title:{ Text("Checked your list")
                    .font(.system(size: 20))},
                icon:{ Image(systemName: "calendar")})
                .font(.system(size: 32))
                .padding()
            Button(action: {
                shouldShowOnboarding.toggle()
            },label: {
                Text("Get Started")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background (Color.black)
                    .cornerRadius(20)
                
            })

                   
        }
        .padding(40)
        .background(.white)
        .mask(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10), style: .continuous))
        .padding(20)
        .shadow(color: Color.black, radius: 5, x: 0.2, y: 0.2)


    }

}


