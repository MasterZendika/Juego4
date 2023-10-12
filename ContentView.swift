//
//  ContentView.swift
//  app2 nasa
//
//  Created by Alumno on 16/08/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var UserVM = UserViewModel()
    @StateObject var MultipleopVM = MultipleopViewModel()

    var body: some View {
        
        List(UserVM.arrUsers){ item in
            VStack{
                Text(item.user)
                Text(item.email)
                Text(item.password)

            }
        }
        
        
        List(MultipleopVM.arrMultipleop){ item in
            VStack{
                Text(item.question)
                Text(item.answer)
                Text(item.answertype)

            }
        }
        
        
        .task{
            do{
                try await UserVM.getUsersData()
            } catch {
                print("error")
            }
        }
    }
}



    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
            
        }
    }


