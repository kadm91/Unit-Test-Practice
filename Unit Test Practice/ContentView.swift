//
//  ContentView.swift
//  Unit Test Practice
//
//  Created by Kevin Martinez on 1/17/24.
//

import SwiftUI

func sum(_ x: Int, _ y: Int) -> Int {
    x+y
}

struct Movie: Decodable {
    var name: String
    var releaseDate: Date

    enum CodingKeys: String, CodingKey {
      case movie = "movie_name"

      case releaseMonth = "release_month"
      case releaseDay = "release_day"
      case releaseYear = "release_year"
}

    init(from decoder: Decoder) throws {
      let values = try decoder.container(keyedBy: CodingKeys.self)
      name = try values.decode(String.self, forKey: .movie)
      let releaseMonth = try values.decode(String.self, forKey: .releaseMonth)
      let releaseDay = try values.decode(String.self, forKey: .releaseDay)
      let releaseYear = try values.decode(String.self, forKey: .releaseYear)
    
      let dateString = "\(releaseMonth)/\(releaseDay)/\(releaseYear)"
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "MM/dd/yy"
    
      releaseDate = dateFormatter.date(from: dateString) ?? Date()
    }
}


struct ContentView: View {
    
 @State private var n1 = 0
    @State private var n2 = 0
    
    var body: some View {
        
            
        VStack {
            GroupBox("sum") {
                   
                    Group {
                        LabeledContent("First Number:") {
                            TextField("", value: $n1, format: .number)
                               
                        }
                        
                        LabeledContent("Secound Number:") {
                            TextField("", value: $n2, format: .number)
                               
                        }
                        
                    }
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.trailing)
                    
                    
                    Divider()
                        .padding(.vertical)
                    
                    LabeledContent("Totla:") {
                        Text(sum(n1 , n2), format: .number)
                    }
                    
                }
            .padding()
            
            Spacer()
        }
            
           
        }
        
    
}

#Preview {
    ContentView()
}
