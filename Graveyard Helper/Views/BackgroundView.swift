//
//  BackgroundView.swift
//  Graveyard Helper
//
//  Created by Pau Martinez on 31/12/23.
//

import SwiftUI

struct BackgroundView: View {
    let backgroundColor: Color
    var body: some View {
        ZStack {

            backgroundColor
                .ignoresSafeArea(.all)
 
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(backgroundColor: Color.gray)
    }
}
