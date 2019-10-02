//
//  MovieDetailsView.swift
//  Top Movies
//
//  Created by Marius Ilie on 02/10/2019.
//  Copyright © 2019 Marius Ilie. All rights reserved.
//

import SwiftUI

struct MovieDetailsView: View {
    var movie: Movie
    
    var body: some View {
        GeometryReader { g in
            ScrollView(.vertical) {
                ZStack(alignment: .bottomLeading) {
                    ImageViewContainer(imageUrl: self.movie.backdrop)
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: g.size.width)
                        .frame(height: g.size.width*3/4)
                        .shadow(color: Color.red.opacity(0.15), radius: 20, y: 30)
                        .overlay(LinearGradient(gradient: Gradient(colors: [.clear, Color("rvs_gradient")]), startPoint: .top, endPoint: .bottom))
                        .clipped()
                    
                    Text(self.movie.title)
                        .fontWeight(.bold)
                        .font(.title)
                        .padding(.top, 30)
                        .padding(.horizontal, 30)
                }
                
                Text(self.movie.overview.isEmpty ? "No overview provided. Please try another movie" : self.movie.overview)
                    .font(.body)
                    .padding(.top, 20)
                    .padding(.horizontal, 30)
                    .lineLimit(nil)
                    .frame(idealHeight: g.size.height, maxHeight: .infinity, alignment: .topLeading)
            }.frame(width: g.size.width)
            .background(Color("rvs_gradient"))
        }
    }
}

struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movie: MockData.getPopularMovies().first!)
    }
}
