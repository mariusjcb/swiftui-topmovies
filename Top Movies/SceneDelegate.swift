//
//  SceneDelegate.swift
//  Top Movies
//
//  Created by Marius Ilie on 01/10/2019.
//  Copyright © 2019 Marius Ilie. All rights reserved.
//

import UIKit
import Combine
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var subscription: AnyCancellable?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let conentViewModel = TopMoviesViewModel(genresService: GenresService(api: TMDBApi()),
                                                 moviesService: MoviesService(api: TMDBApi()))
        let contentView = TopMoviesView(viewModel: conentViewModel)

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

