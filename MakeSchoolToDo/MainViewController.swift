//
//  MainViewController.swift
//  MakeSchoolToDo
//
//  Created by Jordan Harvey-Morgan on 7/10/17.
//  Copyright © 2017 Jordan Harvey-Morgan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var pageIndicator: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let nib = UINib(nibName: "OnboardingCollectionViewCell", bundle: nil)
    
    var arrayOnboardingItems: [OnboardingItem] = [OnboardingItem(title: "WELCOME", description: "First Page", image: #imageLiteral(resourceName: "Four")),
                                                   OnboardingItem(title: "HELLO", description: "Second Page", image: #imageLiteral(resourceName: "Self-Titled")),
                                                   OnboardingItem(title: "SIGN UP", description: "Third Page", image: #imageLiteral(resourceName: "Lemonade"))]
    
    // MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(nib, forCellWithReuseIdentifier: "OnboardingCollectionViewCell")
    }
    
    // MARK: - IBActions
    @IBAction func signupButtonPressed(_ sender: Any) {
        let pageNumber = Int(collectionView.contentOffset.x / collectionView.frame.size.width)
        let cgPoint = CGPoint(x: CGFloat(pageNumber + 1) * collectionView.bounds.size.width, y: 0)
        
        // keep moving if user ISN'T on the last page
        if checkOnboardingPage(current: pageNumber, target: arrayOnboardingItems.count - 1) {
            performSegue(withIdentifier: "showSignUp", sender: self)
        } else {
            collectionView.setContentOffset(cgPoint, animated: true)
        }
    }
    
    // MARK: - Functions
    // to see if user is at the end of the onboarding
    func checkOnboardingPage(current: Int, target: Int) -> Bool {
        return current == target
    }

}

// MARK: - UICollectionView
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // UICollectionViewDataSource:
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath) as! OnboardingCollectionViewCell
        
        // because it's a collection view
        let onboardInfo = arrayOnboardingItems[indexPath.section]
        
        cell.imageView.image = onboardInfo.image
        cell.titleLabel.text = onboardInfo.title
        cell.descriptionLabel.text = onboardInfo.description
                
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return arrayOnboardingItems.count
    }
    
    // UICollectionViewDelegateFlowLayout:
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    // To update page indicator
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageNumber = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageIndicator.currentPage = pageNumber
        
        if checkOnboardingPage(current: pageNumber, target: arrayOnboardingItems.count - 1) {
            signupButton.setTitle("Sign Up", for: .normal)
        } else {
            signupButton.setTitle("Next", for: .normal)
        }
    }
    
}
