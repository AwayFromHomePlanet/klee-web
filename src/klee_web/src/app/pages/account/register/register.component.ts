import { Component, OnInit, Type } from '@angular/core';
import { FormBuilder } from '@angular/forms';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.sass']
})
export class RegisterComponent implements OnInit {

  emailExpression: RegExp = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i;
  lowercaseExpression: RegExp = /[a-z]/;
  uppercasExpression: RegExp = /[A-Z]/;
  numberExpression: RegExp = /[0-9]/
  specialExpression: RegExp = /[^A-Za-z0-9]/;

  passwordsMatch: boolean = true;
  validEmail: boolean = true;
  formCompleted: boolean = true;
  usernameLength: boolean = true;
  passwordLength: boolean = true;
  passwordLowercase: boolean = true;
  passwordUppercase: boolean = true;
  passwordSpecial: boolean = true;
  passwordNumber: boolean = true;
  registered: boolean = false;

  registerDetails = this.formBuilder.nonNullable.group({
    username: '',
    email: '',
    password: '',
    password2: '',
  });

  constructor(
    private formBuilder: FormBuilder,
  ) { }

  onSubmit(): void {
    this.passwordsMatch = true;
    this.validEmail = true;
    this.formCompleted = true;
    this.usernameLength = true;
    this.passwordLength = true;
    this.passwordLowercase = true;
    this.passwordUppercase = true;
    this.passwordNumber = true;
    this.passwordSpecial = true;

    if(this.registerDetails.value.email == '' 
      && this.registerDetails.value.password == ''
      && this.registerDetails.value.username == '') {
        this.formCompleted = false;
        return;
    }

    if(this.registerDetails.value.password != null && this.registerDetails.value.password.length < 8){
      this.passwordLength = false;
    }

    if(this.registerDetails.value.password != null && !this.lowercaseExpression.test(this.registerDetails.value.password)){
      this.passwordLowercase = false;
    }

    if(this.registerDetails.value.password != null && !this.uppercasExpression.test(this.registerDetails.value.password)){
      this.passwordUppercase = false;
    }

    if(this.registerDetails.value.password != null && !this.numberExpression.test(this.registerDetails.value.password)){
      this.passwordNumber = false;
    }

    if(this.registerDetails.value.password != null && !this.specialExpression.test(this.registerDetails.value.password)){
      this.passwordSpecial = false;
    }

    if(this.registerDetails.value.username != null && this.registerDetails.value.username.length < 3){
      this.usernameLength = false;
    }

    if (this.registerDetails.value.password != this.registerDetails.value.password2){
      this.passwordsMatch = false;
    }
    if(this.registerDetails.value.email != null && !this.emailExpression.test(this.registerDetails.value.email)){
      this.validEmail = false;
    }


    if(!this.passwordsMatch
      || !this.validEmail
      || !this.usernameLength
      || !this.passwordLength){
      return;
    }
    console.warn('Your order has been submitted', this.registerDetails.value);
    this.registered = true;
    this.registerDetails.reset();
    alert("TODO: Implement Registering")
  }

  ngOnInit(): void {
  }

}
