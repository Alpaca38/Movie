//
//  SignViewController.swift
//  Movie
//
//  Created by 조규연 on 6/4/24.
//

import UIKit
import SnapKit

class SignViewController: UIViewController {
    
    lazy var titleLabel = {
        let label = UILabel()
        label.text = "NetFlix"
        label.font = .boldSystemFont(ofSize: 32)
        label.textColor = .red
        label.textAlignment = .center
        view.addSubview(label)
        
        return label
    }()
    
    let emailTextField = UITextField.setTextField(placeholder: "이메일 주소 또는 전화번호")
    let passwordTextField = UITextField.setTextField(placeholder: "비밀번호")
    let nicknameTextField = UITextField.setTextField(placeholder: "닉네임")
    let locationTextField = UITextField.setTextField(placeholder: "위치")
    let recommandTextField = UITextField.setTextField(placeholder: "추천 코드 입력")
    
    lazy var textFieldStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, nicknameTextField, locationTextField, recommandTextField])
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        view.addSubview(stackView)
        
        return stackView
    }()
    
    lazy var signButton = {
        let button = UIButton()
        button.setButton(imageName: nil, backgroundColor: .white, tintColor: .black, title: "회원가입")
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        view.addSubview(button)
        
        return button
    }()
    
    lazy var extraInfoLabel = {
        let label = UILabel()
        label.text = "추가 정보 입력"
        view.addSubview(label)
        
        return label
    }()
    
    lazy var extraInfoSwitch = {
        let extraSwitch = UISwitch()
        view.addSubview(extraSwitch)
        
        return extraSwitch
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        configureLayout()
    }
    
    func configureLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            $0.centerX.equalTo(view)
        }
        
        textFieldStackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(100)
            $0.horizontalEdges.equalTo(view).inset(20)
            $0.height.equalTo(220)
        }
        
        emailTextField.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.horizontalEdges.equalToSuperview()
        }
        
        passwordTextField.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.horizontalEdges.equalToSuperview()
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.horizontalEdges.equalToSuperview()
        }
        
        locationTextField.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.horizontalEdges.equalToSuperview()
        }
        
        recommandTextField.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.horizontalEdges.equalToSuperview()
        }
        
        signButton.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.top.equalTo(textFieldStackView.snp.bottom).offset(16)
            $0.horizontalEdges.equalTo(textFieldStackView)
        }
        
        extraInfoLabel.snp.makeConstraints {
            $0.top.equalTo(signButton.snp.bottom).offset(20)
            $0.leading.equalTo(signButton)
        }
        
        extraInfoSwitch.snp.makeConstraints {
            $0.centerY.equalTo(extraInfoLabel)
            $0.trailing.equalTo(signButton)
        }
        
    }
    
}

extension UITextField {
    static func setTextField(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 5
        textField.backgroundColor = .lightGray
        textField.placeholder = placeholder
        textField.textAlignment = .center
        
        return textField
    }
}
