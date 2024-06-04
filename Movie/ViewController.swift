//
//  ViewController.swift
//  Movie
//
//  Created by 조규연 on 6/4/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let posterImageView = UIImageView()
    let tagLabel = UILabel()
    let playButton = UIButton()
    let likeListButton = UIButton()
    let risingContentsLabel = UILabel()
    let firstContentsImageView = UIImageView()
    let secondContentsImageView = UIImageView()
    let thirdContentsImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureHierachy()
        configureLayout()
        
    }
    
    func configureUI() {
        view.backgroundColor = .darkGray
        navigationItem.title = "고래밥님"
        navigationController?.navigationBar.tintColor = .white
        
        posterImageView.contentMode = .scaleAspectFill
        posterImageView.layer.cornerRadius = 10
        posterImageView.clipsToBounds = true
        posterImageView.image = .노량
        
        tagLabel.textColor = .white
        tagLabel.font = .systemFont(ofSize: 12)
        tagLabel.textAlignment = .center
        tagLabel.text = "응원하고픈 · 흥미진진 · 사극 · 전투 · 한국 작품"
        
        playButton.setButton(imageName: "play.fill", backgroundColor: .white, tintColor: .black, title: "재생")
        playButton.setTitleColor(.black, for: .normal)
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        
        likeListButton.setButton(imageName: "plus", backgroundColor: .black, tintColor: .white, title: "내가 찜한 리스트")
        
        risingContentsLabel.textColor = .white
        risingContentsLabel.font = .systemFont(ofSize: 14)
        risingContentsLabel.text = "지금 뜨는 콘텐츠"
        
        let imageViews = [firstContentsImageView, secondContentsImageView, thirdContentsImageView]
        for (index, imageView) in imageViews.enumerated() {
            imageView.contentMode = .scaleAspectFill
            imageView.layer.cornerRadius = 5
            imageView.clipsToBounds = true
            imageView.image = UIImage(named: "\(index + 1)")
        }
        
    }
    
    @objc func playButtonTapped() {
        let vc = SignViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func configureHierachy() {
        view.addSubviews([posterImageView, tagLabel, playButton, likeListButton, risingContentsLabel, firstContentsImageView, secondContentsImageView, thirdContentsImageView])
    }
    
    func configureLayout() {
        posterImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(view).multipliedBy(0.55)
        }
        
        playButton.snp.makeConstraints {
            $0.bottom.equalTo(posterImageView).offset(-16)
            $0.leading.equalTo(posterImageView).offset(16)
            $0.width.equalTo(posterImageView).multipliedBy(0.45)
            $0.height.equalTo(40)
        }
        
        likeListButton.snp.makeConstraints {
            $0.trailing.equalTo(posterImageView).offset(-16)
            $0.bottom.equalTo(posterImageView).offset(-16)
            $0.width.equalTo(posterImageView).multipliedBy(0.45)
            $0.height.equalTo(40)
        }
        
        tagLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(playButton.snp.top).offset(-16)
        }
        
        risingContentsLabel.snp.makeConstraints {
            $0.leading.equalTo(8)
            $0.top.equalTo(posterImageView.snp.bottom).offset(8)
        }
        
        firstContentsImageView.snp.makeConstraints {
            $0.leading.equalTo(posterImageView)
            $0.width.equalTo(posterImageView).multipliedBy(0.3)
            $0.top.equalTo(risingContentsLabel.snp.bottom).offset(8)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(16)
            
        }
        
        secondContentsImageView.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.top.bottom.equalTo(firstContentsImageView)
            $0.width.equalTo(firstContentsImageView)
        }
        
        thirdContentsImageView.snp.makeConstraints {
            $0.trailing.equalTo(posterImageView)
            $0.width.equalTo(firstContentsImageView)
            $0.top.bottom.equalTo(secondContentsImageView)
        }
    }


}

extension UIButton {
    func setButton(imageName: String?, backgroundColor: UIColor, tintColor: UIColor, title: String) {
        if let imageName {
            setImage(UIImage(systemName: imageName), for: .normal)
            self.backgroundColor = backgroundColor
            self.tintColor = tintColor
            setTitle(title, for: .normal)
            layer.cornerRadius = 5
        } else {
            self.backgroundColor = backgroundColor
            self.tintColor = tintColor
            setTitle(title, for: .normal)
            layer.cornerRadius = 5
        }
    }
}

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach {
            self.addSubview($0)
        }
        
    }
}
