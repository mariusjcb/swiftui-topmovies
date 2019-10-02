//
//  PopularMoviesHeaderView.swift
//  Top Movies
//
//  Created by Marius Ilie on 01/10/2019.
//  Copyright © 2019 Marius Ilie. All rights reserved.
//

import SwiftUI

struct PopularMoviesHeaderView: View {
    var movies: [Movie]
    
    @Binding var filterString: String
    private let width = UIScreen.main.bounds.width - 60
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                if movies.count == 0 {
                    NoDataView(criteria: $filterString)
                        .frame(width: width)
                }
                
                ForEach(movies, id: \.id) {
                    MovieView(movie: $0)
                        .frame(width: self.width, height: self.width*9/16)
                        .padding(.horizontal, 5)
                }
            }
            .padding(.horizontal, 30)
            
            Spacer()
        }.frame(height: width*9/16 + 50)
    }
}

struct PopularMoviesHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        PopularMoviesHeaderView(movies: MockData.getPopularMovies(), filterString: .constant("No Filter"))
            .previewLayout(.fixed(width: 500, height: 400))
    }
}
