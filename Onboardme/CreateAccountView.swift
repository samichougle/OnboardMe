//
//  newAccount.swift
//  Test
//
//  Created by sami chougle on 25/12/24.
//

import SwiftUI

struct CreateAccountView: View {

    @State private var Email: String = ""
    @State private var password: String = ""
    @State private var Confirm: String = ""
    @State private var showForgotPassword = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                RadialGradient(colors: [.white,.yellow], center: .bottomLeading, startRadius: 5, endRadius: 500)
                    .ignoresSafeArea(.all)
                
                VStack{
                    HStack{
                        Text("Create an new account")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                            .padding()
                        Spacer()
                    }
                    .padding(.bottom,40)
                    HStack{
                        Text("Plese enter your account details")
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                        Spacer()
                    }
//                    TextField
                    VStack(alignment: .leading){
                        Text("Email")
                            .foregroundColor(.black)
                            .padding(.horizontal)
                            .padding(.bottom,-20)
                        TextField("johndeo@gmail.com", text: $Email)
                            .textFieldStyle(.roundedBorder)
                            .padding()
                    }
//                    SecureField
                    VStack(alignment: .leading){
                        Text("Password")
                            .foregroundColor(.black)
                            .padding(.horizontal)
                            .padding(.bottom,-20)
                        SecureField("Password", text: $password)
                            .textFieldStyle(.roundedBorder)
                            .padding()
                    }
//                    SecureField Confirm password
                    VStack(alignment: .leading){
                        Text("Confirm password")
                            .foregroundColor(.black)
                            .padding(.horizontal)
                            .padding(.bottom,-20)
                        SecureField("Password", text: $Confirm)
                            .textFieldStyle(.roundedBorder)
                            .padding()
                    }
//                    Button Sign up
                    HStack{
                        Button {
                            showForgotPassword = true
                        } label: {
                            Text("Sign up")
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(
                                    Color.black
                                        .cornerRadius(12)
                                ).padding(.top)
                        }.background(
                            NavigationLink(destination: SignInView(),
                            isActive: $showForgotPassword)
                            {
                                EmptyView()
                            }
                            .hidden()
                        )
                    }.padding(.horizontal)
//                    Google
                    HStack{
                        Section{
                            Image("google")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 18, height: 18)
                                .background(
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 29, height: 29 )
                                )
                        }.padding(.trailing,9)
//                        Facebook
                        Section{
                            Image("facebook")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 22, height: 22)
                                .background(
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 29, height: 29 )
                                )
                        }.padding(.trailing,9)
//                        Instagram
                        Section{
                            Image("Insta")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 22, height: 22)
                                .background(
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 29, height: 29 )
                                )
                        }.padding(.trailing,9)
                        }.padding()
                    
//                    NavigationLink Back to Sign-in
                    HStack{
                        Spacer()
                        NavigationLink(destination:SignInView()){
                            Text("Back to Sign-in")
                                .foregroundColor(.black)
                                .underline(true, pattern: .solid, color: .black)
                        }
                        .padding(.horizontal)
                        .padding(.top,-10)
                    }

                    
                }
                
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}


struct CreateAccountView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
    }
}
