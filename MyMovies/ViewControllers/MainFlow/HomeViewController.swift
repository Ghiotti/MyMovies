//
//  HomeViewController.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import UIKit

class HomeViewController: BaseViewController {
    
    private lazy var headerView = HomeHeaderView(frame: .zero)
    private lazy var moviesTableView = UITableView(frame: .zero)
    
    private let cellIdentifier = String(describing: MovieCell.self)
    var viewModel: HomeViewModel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.procesMovies()
        moviesTableView.reloadData()
    }
    
    override func updateCoordinator() { }
    
    override func addSubviews() {
        view.addSubview(headerView)
        view.addSubview(moviesTableView)
    }
    
    override func addConstraints() {
        headerView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.top.equalTo(view.safeArea.top).offset(16)
        }
        
        moviesTableView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.top.equalTo(headerView.snp.bottom).offset(10)
            make.bottom.equalTo(view.snp.bottom).inset(16)
        }
    }
    
    override func addConfiguration() {
        moviesTableView.register(MovieCell.self, forCellReuseIdentifier: cellIdentifier)
    }
}

extension HomeViewController: Bindable {
    
    func bindViewModel() {
        headerView.searchTextField.reactive.text.observeNext { [weak self] movieName in
            self?.viewModel.searchMovie(fromName: movieName)
        }.dispose(in: disposeBag)
        
        viewModel.movieToShow.bind(to: moviesTableView) { [weak self] movies, indexPath, tableView in
            guard let weakSelf = self else { return UITableViewCell() }
            
            guard let movieCell = weakSelf.moviesTableView.dequeueReusableCell(withIdentifier: weakSelf.cellIdentifier) as? MovieCell else {
                return UITableViewCell()
            }
            
            movieCell.favoriteView.reactive.tapGesture().observeNext { _ in
                weakSelf.viewModel.markAsFavorite(movieNumber: indexPath.row)
            }.dispose(in: weakSelf.disposeBag)
            
            weakSelf.viewModel.checkPagination(movieNumber: indexPath.row)
            movieCell.setUp(withMovie: movies[indexPath.row])
            
            return movieCell
        }.dispose(in: disposeBag)
    }
}
