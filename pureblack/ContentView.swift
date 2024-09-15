//
//  ContentView.swift
//  pureblack
//
//  Created by SuperDog on 2024/09/10.
//

import SwiftUI
import MediaPlayer

let musicPlayer = MPMusicPlayerController.systemMusicPlayer

struct ContentView: View {
    var body: some View {
        Color.black.ignoresSafeArea()
            .focusable()
            .onAppear { UIApplication.shared.isIdleTimerDisabled = true }
            .onDisappear { UIApplication.shared.isIdleTimerDisabled = false }
            .onMoveCommand(perform: { direction in
                switch direction {
                case .left:
                    musicPlayer.skipToPreviousItem()
                case .right:
                    musicPlayer.skipToNextItem()
                default:
                    break
                }
            })
            .onPlayPauseCommand(perform: {
                switch musicPlayer.playbackState {
                case MPMusicPlaybackState.playing:
                    musicPlayer.pause()
                case MPMusicPlaybackState.stopped, MPMusicPlaybackState.paused:
                    musicPlayer.play()
                default:
                    break
                }
                return
            })
    }
}
