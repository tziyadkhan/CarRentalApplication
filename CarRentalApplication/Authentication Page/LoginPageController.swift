//
//  LoginPageController.swift
//  CarRentalApplication
//
//  Created by Ziyadkhan on 10.03.24.
//

import UIKit
import SnapKit

class LoginPageController: UIViewController {
    
    lazy var backgroundImage: UIImageView = {
        return ReusableImageView.reusableImage(imageName: "launchBackground",
                                               contentMode: .scaleAspectFit)
    }()
    
    lazy var logo: UIImageView = {
        return ReusableImageView.reusableImage(imageName: "driveitLogo",
                                               contentMode: .scaleAspectFit)
    }()
    
    lazy var emailTextField: UITextField = {
        return ReusableTextField.reusableTextField(placeholder: "Email",
                                                   keyboardType: .emailAddress,
                                                   isSecureTextEntry: false,
                                                   borderStyle: .none)
    }()
    
    lazy var emailView: UIView = {
        return ReusableView.reusableView(color: .white,
                                         borderWidth: 0,
                                         borderColor: UIColor.clear.cgColor,
                                         cornerRadius: 30,
                                         height: 60, width: 340)
        
    }()
    
    lazy var passwordTextField: UITextField = {
        return ReusableTextField.reusableTextField(placeholder: "Password",
                                                   keyboardType: .emailAddress,
                                                   isSecureTextEntry: true,
                                                   borderStyle: .none)
    }()
    
    lazy var passwordView: UIView = {
        return ReusableView.reusableView(color: .white,
                                         borderWidth: 0,
                                         borderColor: UIColor.clear.cgColor,
                                         cornerRadius: 30,
                                         height: 60, width: 340)
        
    }()
    
    lazy var loginButton: UIButton = {
        return ReusableButton.reusableButton(title: "LOG IN",
                                             titleColour: .white,
                                             fontName: "Helvetica Neue Bold",
                                             size: 20,
                                             backgroundColour: UIColor.brandBlack.withAlphaComponent(0.95),
                                             target: self,
                                             action: #selector(loginButtonTapped),
                                             controlEvent: .touchUpInside,
                                             cornerRadius: 30)
    }()
    
    var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        configConstraints()
    }
    
}

extension LoginPageController {
    
    func configUI() {
        view.backgroundColor = .mainBG
        view.addSubview(backgroundImage)
        view.addSubview(logo)
        view.addSubview(emailView)
        view.addSubview(emailTextField)
        view.addSubview(passwordView)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
    }
    
    func configConstraints() {
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        logo.snp.makeConstraints { make in
            make.top.equalTo(backgroundImage).inset(80)
            make.left.right.equalTo(backgroundImage).inset(20)
            make.height.width.equalTo(240)
        }
        
        emailView.snp.makeConstraints { make in
            make.top.equalTo(logo.snp.bottom).inset(-30)
            make.centerX.equalTo(logo)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.left.equalTo(emailView).inset(8)
            make.center.equalTo(emailView)
        }
        
        passwordView.snp.makeConstraints { make in
            make.top.equalTo(emailView.snp.bottom).inset(-32)
            make.centerX.equalTo(emailView)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.left.equalTo(passwordView).inset(8)
            make.center.equalTo(passwordView)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordView.snp.bottom).inset(-32)
            make.centerX.equalTo(passwordView)
            make.height.equalTo(60)
            make.width.equalTo(340)
        }
    }
    
    @objc func loginButtonTapped() {
        coordinator?.showHomePage()
    }
}
