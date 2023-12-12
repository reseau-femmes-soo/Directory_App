import React, { useEffect } from 'react';
import PropTypes from 'prop-types'
import { useNavigate } from 'react-router';
import { Login } from '../../Constant';

function Index({ Component,Role }) {
  const navigate = useNavigate();
  
  useEffect(() => {
      const isLogin = localStorage.getItem('token');
      const LoginRole = localStorage.getItem('role');
      if(isLogin==='' || isLogin===null || isLogin===undefined || !Role.includes(LoginRole)){
        console.log('User not authenticated. Redirecting to signin page.');
        navigate('/');
      }
    }, []);


  return (
    <Component />
  );
}

Index.propTypes = {
  Component: PropTypes.elementType.isRequired,
};

export default Index;
