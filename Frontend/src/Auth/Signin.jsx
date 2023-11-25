import React, { Fragment, useState, useContext , useEffect} from "react";
import { Col, Container, Form, FormGroup, Input, Label, Row } from "reactstrap";
import { Btn, H4, P } from "../AbstractElements";
import { EmailAddress, ForgotPassword, Password, RememberPassword, SignIn } from "../Constant";
import { useNavigate } from "react-router-dom";
import CustomizerContext from "../_helper/Customizer";
import OtherWay from "./OtherWay";
import { ToastContainer, toast } from "react-toastify";
import axios from 'axios';
import image from '../assets/images/logo/logo.png';
import { POST } from "../api/Axios";

const Signin = ({ selected }) => {

  const [user,setUser]=useState({
    email:"",
    password:""
  });

  const [togglePassword, setTogglePassword] = useState(false);
  const [loading, setLoading] = useState(false);
  const navigate = useNavigate();
  const { layoutURL } = useContext(CustomizerContext);

  const handleSubmit=async (e)=>{
    e.preventDefault();
    setLoading(true);
    const response = await POST('/auth/signin',user,setLoading);

    if(response){
      localStorage.setItem('token',response.data.token)
      localStorage.setItem('role',response.data.role)
      setLoading(false);
      navigate('home')
    }

  }
  useEffect(()=>{
    localStorage.removeItem('token')
    localStorage.removeItem('role')
  })


  return (
    <Fragment>
      <Container fluid={true} className="p-0 login-page">
        <Row>
          <Col xs="12">
            <div className="login-card">
              <div className="login-main login-tab">
                
                <Form className="theme-form" onSubmit={handleSubmit}>
                  {/* Logo on top */}
                  <div className="text-center mb-1">
                    <img src={image} alt="Logo" height={80}/>
                  </div>
                  <H4>{selected === "simpleLogin" ? "" : "Login"}</H4>
                  <P>{"Enter your email & password to login"}</P>
                  <FormGroup>
                    <Label className="col-form-label">{EmailAddress}</Label>
                    <Input className="form-control" type="email" onChange={(e) => setUser({...user,email:e.target.value})} value={user.email} placeholder="Enter your email" required />
                  </FormGroup>
                  <FormGroup className="position-relative">
                    <Label className="col-form-label">{Password}</Label>
                    <div className="position-relative">
                      <Input className="form-control" type={togglePassword ? "text" : "password"} onChange={(e) => setUser({...user,password:e.target.value})} value={user.password} placeholder="Enter your password" required />
                      
                      <div className="show-hide" onClick={() => setTogglePassword(!togglePassword)}>
                        <span className={togglePassword ? "" : "show"}></span>
                      </div>
                    </div>
                  </FormGroup>
                  <div className="position-relative form-group mb-0">
                    
                    <a className="forgot_link" href="forget">
                      {ForgotPassword}
                    </a>
                    <button className="btn w-100"  disabled={loading}>
                      {loading ? 'Logging in...' : SignIn}
                    </button>
                  </div>
                </Form>
              </div>
            </div>
          </Col>
        </Row>
      </Container>
      <ToastContainer />
    </Fragment>
  );
};

export default Signin;

