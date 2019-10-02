//
//  GenreButton.swift
//  Top Movies
//
//  Created by Marius Ilie on 02/10/2019.
//  Copyright © 2019 Marius Ilie. All rights reserved.
//

import SwiftUI

struct GenreButton: View {
    let genre: Genre
    
    @State private var isCategoryInNavigationStack = false
    
    var body: some View {
        Text(genre.name)
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal)
            .background(LinearGradient(gradient: Gradient(colors: [Color("genre_start"), Color("genre_end")]), startPoint: .top, endPoint: .bottom))
            .cornerRadius(10)
            .shadow(color: Color.red.opacity(0.4), radius: 20, y: 25)
    }
}

struct CategoryButton_Previews: PreviewProvider {
    static var previews: some View {
        GenreButton(genre: MockData.getGenres().first!)
            .previewLayout(.fixed(width: 300, height: 200))
    }
}
