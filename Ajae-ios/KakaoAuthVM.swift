//
//  KakaoAuthVM.swift
//  Ajae-ios
//
//  Created by 강동현 on 2023/02/03.
//

import Foundation
import Combine
import KakaoSDKAuth
import KakaoSDKUser


class KakaoAuthVM: ObservableObject, AuthVM {

    
    var subscriptions = Set<AnyCancellable>()
    
    @Published var isLoggedIn : Bool = false
    
    lazy var loginStatusInfo : AnyPublisher<String?, Never> = $isLoggedIn.compactMap{$0 ? "로그인상태" : "로그아웃 상태"}.eraseToAnyPublisher()
    
    @MainActor
    func login() {
        
        Task {
            if (UserApi.isKakaoTalkLoginAvailable()) {
                // 카카오톡 앱으로 실행
                isLoggedIn = await kakaoLoginWithApp()
            } else {
                // 카카오톡 계정으로 로그인
                isLoggedIn = await kakaoLoginWithAccount()
            }
        }
    }
    
    @MainActor
    func logout() {
        Task {
            if await kakaoLogout() {
                self.isLoggedIn = false
            } else {
                self.isLoggedIn = true
            }
        }
    }
    
    func kakaoLogout() async -> Bool {
        await withCheckedContinuation {continuation in
            UserApi.shared.logout {(error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning:false)
                }
                else {
                    print("logout() success.")
                    continuation.resume(returning:true)
                }
            }
        }
        
    }
    func kakaoLoginWithApp() async -> Bool {
        
        await withCheckedContinuation { continuation in
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                    continuation.resume(returning: false)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    continuation.resume(returning: true)
                }
            }
        }
    }
    
    func kakaoLoginWithAccount() async -> Bool {
        
        await withCheckedContinuation { continuation in
            
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                    if let error = error {
                        print(error)
                        continuation.resume(returning: false)
                    }
                    else {
                        print("loginWithKakaoAccount() success.")
                        continuation.resume(returning: true)
                    }
                }
            
        }
    }
    
    func getUserInfo() {
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success.")
                guard let user = user else {return}
                //do something
                print(user)
                print(user.id)
                print(user.kakaoAccount?.profile?.thumbnailImageUrl)
                print(user.kakaoAccount?.profile?.nickname)
                print(user.kakaoAccount?.email)
            }
        }
    }

    

    
}
