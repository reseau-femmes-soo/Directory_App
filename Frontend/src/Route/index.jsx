import React, { Fragment } from 'react';
import { Suspense } from "react";
import { BrowserRouter, Route, Routes } from "react-router-dom";
import Loader from "../Layout/Loader";

import Register from '../Auth/Register';
import Signin from "../Auth/Signin";
import Forget from "../Auth/Forget";
import ResetPassword from "../Auth/ResetPassword";

import Home from '../Components/Home'

import AppLayout from '../Layout/Layout';
import UsersProfileContain from '../Components/UsersProfile';
import Password from '../Components/Password';
import Add from '../Components/Dealership/Add';
import View from '../Components/Dealership/View';
import FolderComponent from '../Components/FileManager/FolderComponent'
 

import Authorized from '../Components/Authorized'

// setup fake backend

const Routers = () => {
  const userRole=localStorage.getItem('role');

  return (
    <BrowserRouter basename={"/"}>
      <Suspense fallback={<Loader />}>
        <Routes>
      
        <Route  path={'/'} element={<Signin />} />
          <Route  path={'/login'} element={<Signin />} />
          <Route  path={'/forget'} element={<Forget />} />
          <Route  path={'/reset_password/:token'} element={<ResetPassword />} />
          <Route  path={'/register'} element={<Register />} />
         
          <Fragment >
          <Route element={<AppLayout />} >
         
          <Route  path={'/profile'} element={<Authorized Component={UsersProfileContain}  Role={["admin","member"]}/>} />
          <Route  path={'/password'} element={<Authorized Component={Password}  Role={["admin","member"]}/>} />
          <Route  path={'/home'} element={<Authorized Component={Home}  Role={["admin","member"]}/>} />

          <Route  path={'/add_member'} element={<Authorized  Component={Add}  Role={["admin"]}/>} />
          <Route  path={'/members'} element={<Authorized Component={View}  Role={["admin"]}/>} />
          <Route path="/folders/:folderId/" element={<Authorized Component={FolderComponent}  Role={["admin","member"]}/>} />
          
          </Route>
          </Fragment>

        </Routes>
      </Suspense>
    </BrowserRouter>
  );
};

export default Routers;
