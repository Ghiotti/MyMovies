//
//  MovieCell.swift
//  MyMovies
//
//  Created by Franco Ghiotti on 6/6/21.
//

import UIKit
import Kingfisher

class MovieCell: BaseTableViewCell {
    
    private lazy var movieImageView = UIImageView(frame: .zero)
    
    private lazy var movieTitle = UILabel(frame: .zero)
    private lazy var movieCalification = UILabel(frame: .zero)
    private lazy var releaseDate = UILabel(frame: .zero)
    private lazy var movieInfoStackView = UIStackView(frame: .zero)
    
    private lazy var favoriteView = UIView(frame: .zero)
    
    private lazy var mainStackView = UIStackView(frame: .zero)

    override func prepareForReuse() {
        movieImageView.image = nil
        movieTitle.text = ""
        movieCalification.text = ""
        releaseDate.text = ""
    }
    
    override func addSubviews() {
        contentView.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(movieImageView)
        mainStackView.addArrangedSubview(movieInfoStackView)
        mainStackView.addArrangedSubview(favoriteView)

        movieInfoStackView.addArrangedSubview(movieTitle)
        movieInfoStackView.addArrangedSubview(movieCalification)
        movieInfoStackView.addArrangedSubview(releaseDate)
    }
    
    
    override func addConstraints() {
        mainStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().inset(5)
        }
        
        favoriteView.snp.makeConstraints { make in
            make.width.equalTo(40)
        }
        
        movieImageView.snp.makeConstraints { make in
            make.width.height.equalTo(80)
        }
    }
    
    override func addConfigurations() {
        movieTitle.numberOfLines = 2
        
        movieImageView.contentMode = .scaleAspectFit
        
        mainStackView.axis = .horizontal
        mainStackView.spacing = 10
        
        movieInfoStackView.axis = .vertical
        movieInfoStackView.spacing = 5
        movieInfoStackView.distribution = .equalCentering
    }
    
    override func addStyle() {
        movieTitle.font = UIFont.boldSystemFont(ofSize: 16)
        movieCalification.font = UIFont.italicSystemFont(ofSize: 12)
        releaseDate.font = UIFont.italicSystemFont(ofSize: 12)
    }
    
    func setUp(withMovie movie: Movie) {
        movieImageView.setImage(fromUrlString: movie.posterUrl ?? "", placeHolder: UIImage())
        
        movieTitle.text = movie.movieName
        releaseDate.text = movie.releaseDate

        if let movieVote = movie.movieVote {
            movieCalification.text = "Calification: \(movie.movieVote)/10"
        }
    }
}
