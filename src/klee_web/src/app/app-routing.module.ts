import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './pages/home/home.component';

const routes: Routes = [
  { path: 'categories', loadChildren: () => import('./pages/categories/categories.module').then(m => m.CategoriesModule) },
  { path: 'challenges', loadChildren: () => import('./pages/challenges/challenges.module').then(m => m.ChallengesModule) },
  { path: '', component: HomeComponent, pathMatch: 'full' },
  { path: 'classrooms', loadChildren: () => import('./pages/classrooms/classrooms.module').then(m => m.ClassroomsModule) },
  { path: 'login', loadChildren: () => import('./pages/account/login/login.module').then(m => m.LoginModule) },
  { path: 'register', loadChildren: () => import('./pages/account/register/register.module').then(m => m.RegisterModule) },
  { path: 'reset-password', loadChildren: () => import('./pages/account/reset-password/reset-password.module').then(m => m.ResetPasswordModule) },
  { path: 'submission', loadChildren: () => import('./pages/submission/submission.module').then(m => m.SubmissionModule) },
  { path: 'coding', loadChildren: () => import('./pages/coding/coding.module').then(m => m.CodingModule) }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
