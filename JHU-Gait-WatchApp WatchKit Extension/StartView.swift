//
//  ContentView.swift
//  JHU-Gait-WatchApp WatchKit Extension
//
//  Created by daniel on 2022/8/16.
//

import SwiftUI
import HealthKit

struct StartView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    
    var workoutTypes : [HKWorkoutActivityType] = [.cycling, .running, .walking]
    
    var body: some View {
        //        Text("Hello, World!")
        //            .padding()
        List(workoutTypes) {workoutType in
            NavigationLink(
                //                The navigation links to the destination to SessionPagingView
                workoutType.name,
//                                destination: Text("my"+workoutType.name)
                destination: SessionPagingView(),
                tag: workoutType,
                selection: $workoutManager.selectedWorkout
            ).padding(
                EdgeInsets(top: 15, leading: 5, bottom: 15, trailing: 5)
            )
        }.listStyle(.carousel)//The carousel style can provide depth view when rolling the list
            .navigationBarTitle("Workouts")
            .onAppear{
                workoutManager.requestAuthotization()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}


extension HKWorkoutActivityType: Identifiable{
    public var id: UInt{
        rawValue
    }
    
    var name: String{
        switch self{
        case .running:
            return "Run"
        case .cycling:
            return "Bike"
        case .walking:
            return "Walk"
        default:
            return ""
        }
    }
}
