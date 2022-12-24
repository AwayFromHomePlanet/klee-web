import { Component, OnInit, AfterViewInit, ViewChild } from '@angular/core';
import { FormBuilder } from '@angular/forms';

@Component({
  selector: 'app-login',
  templateUrl: './reset-password.component.html',
  styleUrls: ['./reset-password.component.sass']
})
export class ResetPasswordComponent implements OnInit {

  emailExpression: RegExp = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i;

  validEmail: boolean = true;
  submitted: boolean = false;

  emailDetails = this.formBuilder.nonNullable.group({
    email: '',
  });

  constructor(
    private formBuilder: FormBuilder,
  ) { }

  ngOnInit(): void {
  }

  onSubmit(): void {
    this.validEmail = true;
    if (this.emailDetails.value.email != null && !this.emailExpression.test(this.emailDetails.value.email)) {
      this.validEmail = false;
    } else {
      this.submitted = true;
    }



  }
} 
