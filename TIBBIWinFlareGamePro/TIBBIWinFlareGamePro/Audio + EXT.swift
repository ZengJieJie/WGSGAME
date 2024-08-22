//
//  Audio + EXT.swift
//  TIBBIWinFlareGamePro
//
//  Created by FJ on 30/03/24.
//

import Foundation
import AVFoundation

func playSystemSound(name: String) {
    
    guard let soundUrl = Bundle.main.url(forResource: name, withExtension: "mp3") else {
        print("Sound file not found.")
        return
    }
    
    var soundId: SystemSoundID = 0
    
    AudioServicesCreateSystemSoundID(soundUrl as CFURL, &soundId)
    AudioServicesPlaySystemSound(soundId)
    
}
