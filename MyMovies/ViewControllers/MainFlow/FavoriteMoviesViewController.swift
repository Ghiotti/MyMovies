//
//  FavoriteMoviesViewController.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import UIKit

class FavoriteMoviesViewController: BaseViewController {
    
    private lazy var favoriteTableView = UITableView(frame: .zero)
    private let cellIdentifier = String(describing: MovieCell.self)

    var viewModel: FavoriteMoviesViewModel!
    
    // MARK: - Life Cicle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.getFavoritesMovies()
    }
    
    // MARK: - BaseViewController
    
    override func updateCoordinator() { }
    
    override func addSubviews() {
        view.addSubview(favoriteTableView)
    }
    
    override func addConstraints() {
        favoriteTableView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalTo(view.safeArea.top).offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeArea.bottom).inset(16)
        }
    }
    
    override func addConfiguration() {
        favoriteTableView.register(MovieCell.self, forCellReuseIdentifier: cellIdentifier)
    }
}

// MARK: - Bindable

extension FavoriteMoviesViewController: Bindable {

    func bindViewModel() {
        viewModel.favoritesMovies.bind(to: favoriteTableView) { [weak self] movies, indexPath, tableView in
            guard let weakSelf = self else { return UITableViewCell() }
            
            guard let movieCell = weakSelf.favoriteTableView.dequeueReusableCell(withIdentifier: weakSelf.cellIdentifier) as? MovieCell else {
                return UITableViewCell()
            }
            
            movieCell.favoriteView.reactive.tapGesture().observeNext { _ in
                weakSelf.viewModel.removeFromFavorite(movieRow: indexPath.row)
            }.dispose(in: weakSelf.disposeBag)
            
            movieCell.setUp(withMovie: movies[indexPath.row])
            
            return movieCell
        }.dispose(in: disposeBag)
    }
}


