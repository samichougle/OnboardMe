//
//  Onbording.swift
//  Test
//
//  Created by sami chougle on 27/12/24.
//

import SwiftUI

struct WelcomeView: View {
    
    @State private var showForgotPassword = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                RadialGradient(colors: [.yellow, .white], center: UnitPoint(x: 0.5, y: 0.3), startRadius: 350, endRadius: 40)
                    .ignoresSafeArea(.all)
                VStack {
                    ZStack {
                        Image("Onbordingimg1")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200, height: 300, alignment: .top)
                            .clipped()
                            .cornerRadius(17)
                            .rotationEffect(Angle(degrees: 20))
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(Color.black, lineWidth: 1)
                                    .rotationEffect(Angle(degrees: 20))
                            )

                        Image("Onbordingimg2")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200, height: 300, alignment: .top)
                            .clipped()
                            .cornerRadius(17)
                            .rotationEffect(Angle(degrees: -20))
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(Color.black, lineWidth: 1)
                                    .rotationEffect(Angle(degrees: -20))
                            )

                        Image("Imagewhite")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200, height: 300, alignment: .top)
                            .clipped()
                            .cornerRadius(17)
                            .rotationEffect(Angle(degrees: 0))
                            .overlay(
                                RoundedRectangle(cornerRadius: 18)
                                    .stroke(Color.black, lineWidth: 1)
                                    .rotationEffect(Angle(degrees: 0))
                            )

                        Image("Onbordingimg3-")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 350, height: 500, alignment: .top)
                            .clipped()
                            .cornerRadius(17)
                            .rotationEffect(Angle(degrees: 0))
                    }

                    Spacer()
//                    Text
                    VStack {
                        Text("""
                        Start your new
                        Social Jrny
                        """).font(.largeTitle)
                            .bold()
                            .multilineTextAlignment(.center)
                        
                    Spacer()
                        
                        Text("""
                        Post, react, and start conversation
                        that bring good vibes only.
                        """).font(.headline)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                        
                        HStack{
                            Rectangle()
                                .fill(.black)
                                .opacity(0.1)
                                .frame(width: 10, height: 10)
                                .clipShape(Capsule())
                            Rectangle()
                                .fill(.black)
                                .frame(width: 13, height: 15)
                                .clipShape(Capsule())

                            Rectangle()
                                .fill(.black)
                                .opacity(0.1)
                                .frame(width: 10, height: 10)
                                .clipShape(Capsule())
                        }
                        
                        Spacer()
                        
//                        Button
                        Button {
                            
                        } label: {
                            Text("Get Started")
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 350,height: 60)
                                .background(
                                    Color.black
                                        .cornerRadius(12)
                                )
                        }.padding(.horizontal)
                        
                        Spacer()
                        
                        
                        Text("Start your jrny with SaaC-Blend")
                        

                        
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        showForgotPassword = true
                    } label: {
                        HStack{
                            Image(systemName: "lessthan")
                            Text("Back")
                            
                        }.foregroundColor(.black)
                            .background(
                                NavigationLink(destination: SignInView(),
                                isActive: $showForgotPassword)
                                {
                                    EmptyView()
                                }
                                    .hidden()
                            )

                    }
                }
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
