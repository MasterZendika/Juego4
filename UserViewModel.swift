//
//  PhotoViewModel.swift
//  app2 nasa
//
//  Created by Alumno on 16/08/23.
//

import Foundation
import SwiftUI

class UserViewModel : ObservableObject{
    @Published var arrUsers = [UserModel]()
    
        
    func getUsersData() async throws {
        
        //1. Obtener el objeto URL
        guard let url = URL(string: "http://10.22.220.201:3000/users/1") else{
            print("invalir URL")
            return
        }
        
        //2. preparar el Request a la pagina http con la URL
        let urlRequest = URLRequest(url:url)
        
        //3. Realizar la llama con URLSession
        let(data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            print("error")
            return
        }
        
        //decodificar la información del formato JSON
        let results = try JSONDecoder().decode(ResultApiUser.self, from: data)
        
        print(results)
    
        //5. utilizamos el threas principal para actualizar la variable de Photos
        DispatchQueue.main.async{
            self.arrUsers = results.user
        }
    }
}
