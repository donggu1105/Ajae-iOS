//
//  ViewController.swift
//  Ajae-ios
//
//  Created by 강동현 on 2023/02/03.
//

import UIKit
import Combine

class MainViewController: UIViewController {
    
    var subscriptions = Set<AnyCancellable>()
    @IBOutlet weak var kakaoLoginBtn: UIButton!
    @IBOutlet weak var appleLoginBtn: UIButton!
    @IBOutlet weak var googleLoginBtn: UIButton!
    @IBOutlet weak var loginStatus: UILabel!
    
    lazy var kakaoAuthVM: KakaoAuthVM = { KakaoAuthVM()}()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#fileID, #function, #line, "- ")
        // Do any additional setup after loading the view.
        
        setUpUI()
        
        setBindings()
    } // viewDidLoad
    
    func setUpUI() {
    }
    
    @IBAction func moveToOnBoarding(_ sender: Any) {
        let onBoarding = OnBoardingViewController.instantiate()
        // 화면 전환 애니메이션의 타입
        self.present(onBoarding, animated : true)
    }
    
   
        @IBAction func snsLoginBtnTapped(_ sender: UIButton) {
        print(#fileID, #function, #line, "- ")
        switch sender {
        case kakaoLoginBtn: kakaoAuthVM.login()
        case googleLoginBtn: kakaoAuthVM.logout()
        case appleLoginBtn: print("apple")
        default: print("nothing")
            
        }
        
    }
}

// 뷰모델 바인딩
extension MainViewController {
    fileprivate func setBindings() {
        
        self.kakaoAuthVM.loginStatusInfo
            .receive(on: DispatchQueue.main)
            .assign(to: \.text, on: self.loginStatus)
            .store(in: &subscriptions)
    }
    
}


