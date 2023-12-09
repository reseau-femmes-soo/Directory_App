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
import { BiSolidShow } from "react-icons/bi";
import { BiHide } from "react-icons/bi";
import * as yup from 'yup';
import { useFormik } from 'formik';
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


  const validationSchema = yup.object({
    email: yup.string().required('Veuillez entrer votre email').email().typeError('Seuls les alphabets sont autorisés'),
    password : yup.string().required('Veuillez entrer le mot de passe').typeError('Seuls les alphabets sont autorisés').min(8,'password length must be equal or greater than 8'),
  });

  const formik = useFormik({
    initialValues: {
        email: '', 
        password:'',
    },
    validationSchema: validationSchema,
 
    onSubmit: async (values) => {
            
            setLoading(true);
            const response = await POST('/auth/signin',values,setLoading);
        
            if(response){
              localStorage.setItem('token',response.data.token)
              localStorage.setItem('role',response.data.role)
              setLoading(false);
              navigate('home')
            }
            formik.resetForm();
        },
   });


  return (
    <Fragment>
      <Container fluid={true} className="p-0 login-page">
        <Row>
          <Col xs="12">
            <div className="login-card">
              <div className="login-main login-tab">
                
                <Form className="theme-form" onSubmit={formik.handleSubmit}>
                  {/* Logo on top */}
                  <div className="text-center mb-1">
                    <img src={image} alt="Logo" height={80}/>
                  </div>
                  <H4>{selected === "simpleLogin" ? "" : "Connexion"}</H4>
                  <P>{"Saisissez votre adresse e-mail et votre mot de passe pour vous connecter"}</P>
                  <FormGroup>
                    <Label className="col-form-label">{'Adresse E-mail'}</Label>
                    <Input className="form-control" type="email" value={formik.values['email']} onBlur={formik.handleBlur} onChange={formik.handleChange } placeholder="Saisissez votre adresse e-mail" name="email" />
                    <small style={{color : "red"}}>  {formik.touched['email'] && formik.errors['email'] }</small>
                  </FormGroup>
                  <FormGroup className="position-relative">
                    <Label className="col-form-label">{'Mot de passe'}</Label>
                    <div className="position-relative">
                      <Input className="form-control" type={togglePassword ? "text" : "password"} value={formik.values['password']} onBlur={formik.handleBlur} onChange={formik.handleChange} placeholder="Enter your password" name="password" />
                      
                      <div className="show-hide" onClick={() => setTogglePassword(!togglePassword)} style={{fontSize:'20px',cursor:'pointer'}}>
                        {togglePassword ? <BiHide/> : <BiSolidShow/>}
                      </div>
                    </div>
                    <small style={{color : "red"}}>  {formik.touched['password'] && formik.errors['password'] }</small>
                  </FormGroup>
                  <div className="position-relative form-group mb-0">
                    
                    <a className="forgot_link" href="forget">
                      {'Mot de passe oublié'}
                    </a>
                    <button className="btn w-100"  disabled={loading}>
                      {loading ? 'Connectez-vous...' : 'Se connecter'}
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

