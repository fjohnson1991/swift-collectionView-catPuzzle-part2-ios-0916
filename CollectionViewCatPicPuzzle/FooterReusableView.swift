//
//  FooterReusableView.swift
//  CollectionViewCats
//
//  Created by Joel Bell on 10/3/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class FooterReusableView: UICollectionReusableView {
    
    var timer: Timer!
    let timeInterval: TimeInterval = 0.05
    var timeCount: TimeInterval = 0.0
    var timerLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        

        configureView()
        countUp()
        timeString(time: timeCount)
        startTimer()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
        
    }
    
    private func configureView() {
        
        timerLabel = UILabel()
        timerLabel.font = UIFont.helveticaNeueLight(size: 20)
        
        self.addSubview(timerLabel)
        
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        timerLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
    }
    
    func startTimer() {
        
        timeCount = 0.0
        timerLabel.text = timeString(time: timeCount)
        timer = Timer.scheduledTimer(timeInterval: timeInterval,
                                     target: self,
                                     selector: #selector(countUp),
                                     userInfo: nil,
                                     repeats: true)
        
    }
    
    @objc private func countUp() {
        timeCount = timeCount + timeInterval
        timerLabel.text = timeString(time: timeCount)
    }
    
    private func timeString(time:TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = time - Double(minutes) * 60
        return String(format:"%02i:%02i",minutes,Int(seconds))
    }
    
}
