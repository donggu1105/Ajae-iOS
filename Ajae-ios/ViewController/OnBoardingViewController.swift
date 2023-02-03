//
//  OnBoardingController.swift
//  Ajae-ios
//
//  Created by 강동현 on 2023/02/03.
//

import Foundation
import UIKit
import PaperOnboarding
class OnBoardingViewController: UIViewController {
    
    @IBOutlet var onboarding: PaperOnboarding!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setOnBoarding()
        
    }
    
    func setOnBoarding() {
        onboarding.dataSource = self
    }
    

    
    func onboardingConfigurationItem(item: OnboardingContentViewItem, index: Int) {

    //    item.titleLabel?.backgroundColor = .redColor()
    //    item.descriptionLabel?.backgroundColor = .redColor()
    //    item.imageView = ...
      }
}

extension OnBoardingViewController: PaperOnboardingDataSource {
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {

      return [
        OnboardingItemInfo(informationImage: UIImage(named: "test")!,
                                      title: "title",
                                description: "description",
                                   pageIcon: UIImage(named: "test")!,
                                      color: UIColor.white,
                                 titleColor: UIColor.black,
                           descriptionColor: UIColor.black,
                           titleFont: UIFont.systemFont(ofSize: 20),
                            descriptionFont: UIFont.systemFont(ofSize: 20)),

        OnboardingItemInfo(informationImage: UIImage(named: "test")!,
                                      title: "title",
                                description: "description",
                                   pageIcon: UIImage(named: "test")!,
                                      color: UIColor.white,
                                 titleColor: UIColor.black,
                           descriptionColor: UIColor.black,
                           titleFont: UIFont.systemFont(ofSize: 20),
                            descriptionFont: UIFont.systemFont(ofSize: 20)),
//
//       OnboardingItemInfo(informationImage: UIImage(systemName: "test"),
//                                    title: "title",
//                              description: "description",
//                                 pageIcon: UIImage(systemName: "test"),
//                                    color: UIColor.RANDOM,
//                               titleColor: UIColor.RANDOM,
//                         descriptionColor: UIColor.RANDOM,
//                                titleFont: UIFont.FONT,
//                          descriptionFont: UIFont.FONT)
        ][index]
    }

    func onboardingItemsCount() -> Int {
       return 2
     }
}
