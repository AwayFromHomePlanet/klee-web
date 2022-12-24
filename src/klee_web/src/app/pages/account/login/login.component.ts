import { Component, OnInit, AfterViewInit, ViewChild } from '@angular/core';
import { FormBuilder } from '@angular/forms';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.sass']
})
export class LoginComponent implements OnInit {
  formCompleted: boolean = true;
  
  constructor(
    private formBuilder: FormBuilder,
  ) { }

  ngOnInit(): void {
  }

  loginDetails = this.formBuilder.nonNullable.group({
    username: [''],
    password: [''],
  });

  onSubmit() :void {
    this.formCompleted = true;
    if(this.loginDetails.value.username == '' 
      || this.loginDetails.value.password == ''
      || this.loginDetails.value.username == null
      || this.loginDetails.value.password == null){
        this.formCompleted = false;
        return;
      }
      
    const signInResponse = this.signInRequest(
      this.loginDetails.value.username, this.loginDetails.value.password
    );
    alert("Sent log in request");
    console.warn("Sent", this.loginDetails.value);
    signInResponse.then((data) => alert("Yes"))
  }

  async signInRequest(username : String, password : String) {
    let response = await fetch(
        '/api/user/login',
        {
            method: 'post',
            headers:  {
              'Accept': 'application/json',
              'Content-Type': 'application/json'
            },
            body: JSON.stringify({"username": username, "password": password})
        });

    let data = await response.json();
    return data;
  }
} 
