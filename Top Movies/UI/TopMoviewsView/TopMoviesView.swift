//
//  ContentView.swift
//  Top Movies
//
//  Created by Marius Ilie on 01/10/2019.
//  Copyright © 2019 Marius Ilie. All rights reserved.
//

import SwiftUI
import Combine
import KingfisherSwiftUI

struct TopMoviesView: View {
    @ObservedObject var viewModel: TopMoviesViewModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                Group {
                    HeaderView(viewModel: viewModel)
                        .padding(.horizontal, 30)
                    
                    ZStack(alignment: .bottomLeading) {
                        PopularMoviesHeaderView(movies: viewModel.movies, filterString: $viewModel.searchFilter)
                            .padding(.bottom, 80)
                        VStack {
                            Spacer()
                            GenresList(genres: viewModel.genres)
                        }
                    }.padding(.top, 15)
                }.animation(.easeInOut)
                
                GenresDetailedList(genres: viewModel.genres, movies: viewModel.movies)
                    .padding(.top, -20)
                Spacer()
            }
            Spacer()
        }
    }
}

struct HeaderView: View {
    @ObservedObject var viewModel: TopMoviesViewModel
    
    @State var isSearchActive: Bool = false
    
    var body: some View {
        Group {
            HStack(alignment: .center) {
                Spacer()
                Text("TopMovies (\(viewModel.movies.count))")
                    .foregroundColor(Color.red)
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.leading, 30)
                Spacer()
                
                HStack {
                    if isSearchActive {
                        TextField("Search...", text: $viewModel.searchFilter)
                            .frame(width: 80, height: 30)
                            .transition(.offset(x: isSearchActive ? UIScreen.main.bounds.width : 0))
                            .padding(.top, 5)
                    }
                    
                    Button(action: { withAnimation { self.isSearchActive.toggle() } },
                           label: { Image(systemName: "magnifyingglass") })
                }.frame(height: 30)
            }
            
            Picker(selection: $viewModel.filter, label: Text("What is your favorite color?")) {
                Text("Popularity").tag(0)
                Text("Release").tag(1)
                Text("Revenue").tag(2)
            }.pickerStyle(SegmentedPickerStyle())
                .padding(.top, 15)
        }
    }
}

struct TopMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        let topMoviesViewModel = TopMoviesViewModel(genresService: GenresService(api: TMDBMockApi()),
                                                    moviesService: MoviesService(api: TMDBMockApi()))
        return TopMoviesView(viewModel: topMoviesViewModel)
    }
}
