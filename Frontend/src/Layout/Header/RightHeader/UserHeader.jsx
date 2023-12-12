import React, { useContext, useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import {  LogIn,Settings, User } from "react-feather";
import man from "../../../assets/images/dashboard/profile.png";
import { LI, UL, Image, P } from "../../../AbstractElements";
import CustomizerContext from "../../../_helper/Customizer";
import { Account, Admin, LogOut, Member, Password } from "../../../Constant";
import { useUser } from "../../../Auth/UserContext"; // Import the useUser hook

import SampleImage from '../../../assets/images/user/sample.png'

const UserHeader = () => {
  const history = useNavigate();
  const [profile, setProfile] = useState("");
  const [name, setName] = useState("");
  const { layoutURL } = useContext(CustomizerContext);
  const authenticated = JSON.parse(localStorage.getItem("authenticated"));
  const auth0_profile = JSON.parse(localStorage.getItem("auth0_profile"));
  const userRole=localStorage.getItem('role');


  
  const Logout = () => {
    console.log('Logging out - removing token and user...');
    history(`/`);
  };

  const UserMenuRedirect = (redirect) => {
    history(redirect);
  };

  return (
    <li className="profile-nav onhover-dropdown pe-0 py-0">
      <div className="media profile-media">
        <Image
          attrImage={{
            className: "b-r-10 m-0 image-fluid",
            src: SampleImage,
            alt: "",
            style:{height:"40px",width:"40px"}
          }}
          
        />
        <div className="media-body">
          <span>Bienvenue</span>
          <P attrPara={{ className: "mb-0 font-roboto" }}>
            {userRole ==="admin" ? (
              <>
                {'Administrateur'}
              </>
            ) : (
              <>
                {'Membre'}
              </>
            )}
          </P>
        </div>
      </div>
      {/* <UL attrUL={{ className: "simple-list profile-dropdown onhover-show-div" }}>
        <LI
          attrLI={{
            onClick: () => UserMenuRedirect(`${process.env.PUBLIC_URL}/app/users/profile/${layoutURL}`),
          }}>
          <User />
          <span>{Account} </span>
        </LI>
        <LI
          attrLI={{
            onClick: () => {
              history('/password');
            },
          }}>
          <Settings />
          <span>{Password}</span>
        </LI>
        <LI attrLI={{ onClick: Logout }}>
          <LogIn />
          <span>{LogOut}</span>
        </LI>
      </UL> */}
    </li>
  );
};

export default UserHeader;
