//
//  GenresList.swift
//  Top Movies
//
//  Created by Marius Ilie on 02/10/2019.
//  Copyright © 2019 Marius Ilie. All rights reserved.
//

import SwiftUI

struct GenresList: View {
    var genres: [Genre]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(genres, id: \.id) {
                    GenreButton(genre: $0)
                        .padding(.horizontal, 5)
                }
            }
            .padding(.horizontal, 30)
            Spacer()
        }.frame(height: 110)
    }
}

struct GenresList_Previews: PreviewProvider {
    static var previews: some View {
        GenresList(genres: MockData.getGenres())
    }
}
