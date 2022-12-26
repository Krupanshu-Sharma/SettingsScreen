//
//  ContentView.swift
//  SettingsScreenInSwiftUI
//
//  Created by Krupanshu Sharma on 26/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isDarkModeEnabled: Bool = true
    @State private var downloadViaWifiEnabled: Bool = false
    
    @State private var languageIndex = 0
    var languageOptions = ["English", "Arabic", "Chinese", "Danish"]

    
    var body: some View {
        NavigationView {
            Form {
                Group {
                    HStack{
                        Spacer()
                        VStack {
                            Image(uiImage: UIImage(named: "UserProfile")!)
                                .resizable()
                                .frame(width:100, height: 100, alignment: .center)
                            Text("Wolf Knight")
                                .font(.title)
                            Text("WolfKnight@kingdom.tv")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Spacer()
                            Button(action: {
                                print("Edit Profile tapped")
                            }) {
                                Text("Edit Profile")
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .font(.system(size: 18))
                                    .padding()
                                    .foregroundColor(.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 25)
                                            .stroke(Color.white, lineWidth: 2)
                                    )
                            }
                            .background(Color.blue)
                            .cornerRadius(25)
                        }
                        Spacer()
                    }
                }
                
                Section(header: Text("CONTENT"), content: {
                    HStack{
                        Image(uiImage: UIImage(named: "Favorite")!)
                        Text("Favorites")
                    }

                    HStack{
                        Image(uiImage: UIImage(named: "Download")!)
                        Text("Downloads")
                    }

                })

                Section(header: Text("PREFRENCES"), content: {
                    HStack{
                        Image(uiImage: UIImage(named: "Language")!)
                        Picker(selection: $languageIndex, label: Text("Language")) {
                            ForEach(0 ..< languageOptions.count) {
                                Text(self.languageOptions[$0])
                            }
                        }
                    }
                    HStack{
                        Image(uiImage: UIImage(named: "DarkMode")!)
                        Toggle(isOn: $isDarkModeEnabled) {
                            Text("Dark Mode")
                        }
                    }
                    HStack{
                        Image(uiImage: UIImage(named: "DownloadViaWifi")!)
                        Toggle(isOn: $downloadViaWifiEnabled) {
                            Text("Only Download via Wi-Fi")
                        }
                    }
                    HStack{
                        Image(uiImage: UIImage(named: "PlayInBackground")!)
                        Text("Play in Background")
                    }

                })
            }
            .navigationBarTitle("Settings")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
