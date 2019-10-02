//
//  PopularMovieView.swift
//  Top Movies
//
//  Created by Marius Ilie on 01/10/2019.
//  Copyright © 2019 Marius Ilie. All rights reserved.
//

import SwiftUI

struct MovieView: View {
    var movie: Movie
    
    @State var isSheetPresented = false
    
    var body: some View {
        GeometryReader { g in
            ZStack(alignment: .bottomLeading) {
                ImageViewContainer(imageUrl: self.movie.backdrop)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: g.size.width, height: g.size.height)
                Spacer()
                TitleGradientView(title: self.movie.title)
            }.cornerRadius(20)
                .shadow(color: Color.red.opacity(0.15), radius: 20, y: 30)
        }.onTapGesture {
            self.isSheetPresented.toggle()
        }.sheet(isPresented: $isSheetPresented, content: {
            MovieDetailsView(movie: self.movie)
        })
        
        //SwiftUI bug when Sheet is presented from List or ForEach
    }
}

struct TitleGradientView: View {
    let title: String
    
    var body: some View {
        GeometryReader { g in
            ZStack(alignment: .bottomLeading) {
                VStack {
                    Spacer()
                    Text("")
                        .frame(width: g.size.width, height: 80)
                        .background(LinearGradient(gradient: Gradient(colors: [.clear, Color.black.opacity(0.5)]), startPoint: .top, endPoint: .bottom))
                }
                
                Text(String(self.title))
                    .foregroundColor(Color.white)
                    .font(.headline)
                    .padding()
            }
        }
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView(movie: MockData.getPopularMovies().first!)
            .previewLayout(.fixed(width: 450, height: 350))
    }
}
