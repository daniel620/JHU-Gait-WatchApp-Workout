//
//  ControlsView.swift
//  JHU-Gait-WatchApp WatchKit Extension
//
//  Created by daniel on 2022/8/24.
//

import SwiftUI

struct ControlsView: View {
//    Add WorkoutManager as environment variable so that our view can control the session
    @EnvironmentObject var workoutManager: WorkoutManager
    
    var body: some View {
        HStack{
            VStack{
                Button{
                    // Button action calls endWorkout() from workoutManager
                    workoutManager.endWorkout()
                } label: {
                    Image(systemName: "xmark")
                }
                .tint(Color.red)
                .font(.title2)
                Text("End")
            }
            
            VStack{
                Button{
                    // calls togglePause() function
                    workoutManager.togglePause()
                } label: {
                    Image(systemName: workoutManager.running ? "pause":"play")
                }
                .tint(Color.yellow)
                .font(.title2)
                Text(workoutManager.running ? "Pause":"Resume")
                 
            }
        }
    }
}

struct ControlsView_Previews: PreviewProvider {
    static var previews: some View {
        ControlsView()
    }
}
