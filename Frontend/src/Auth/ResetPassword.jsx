// import React, { Fragment, useState } from 'react';
// import { Col, Container, Form, FormGroup, Input, Label, Row } from 'reactstrap';
// import { Btn, H4, P, Image } from '../AbstractElements';
// import { Link } from 'react-router-dom';

// const UnlockUser = ({ logoClassMain }) => {
//   const [togglePassword, setTogglePassword] = useState(false);
//   return (
//     <Fragment>
//       <section>
//         <Container fluid={true} className='p-0 login-page'>
//           <Row className='m-0'>
//             <Col className='p-0'>
//               <div className='login-card'>
//                 <div>
//                   <div>
                  
//                   </div>
//                   <div className='login-main unlock-user'>
//                     <Form className='theme-form login-form'>
//                       <H4>Reset Your Password</H4>
//                       <FormGroup className='position-relative'>
//                         <Label className='col-form-label'>Enter your Email</Label>
//                         <div className='position-relative'>
//                           <Input className='form-control'  required placeholder='test@gmail.com' />
//                           <div className='show-hide' onClick={() => setTogglePassword(!togglePassword)}>
//                             <span className={togglePassword ? '' : 'show'}></span>
//                           </div>
//                         </div>
//                       </FormGroup>
//                       <FormGroup>
                     
//                       </FormGroup>
//                       <FormGroup>
//                         <Btn attrBtn={{ className: 'd-block w-100', color: 'dark', type: 'submit' }}>Send </Btn>
//                       </FormGroup>
//                       <P attrPara={{ className: 'mb-0' }}>
//                         Already have an account?
//                         <Link className='ms-2' to='/login' style={{color:' #6b2a7d'}}>
//                           Sign in
//                         </Link>
//                       </P>
//                     </Form>
//                   </div>
//                 </div>
//               </div>
//             </Col>
//           </Row>
//         </Container>
//       </section>
//     </Fragment>
//   );
// };

// export default UnlockUser;

import React, { Fragment, useState } from 'react';
import { Col, Container, Form, FormGroup, Input, Label, Row } from 'reactstrap';
import { Btn, H4, P, Image } from '../AbstractElements';
import { Link, useParams } from 'react-router-dom';
import { toast } from 'react-toastify';
import { POST, UPDATE } from '../api/Axios';

const UnlockUser = ({ logoClassMain }) => {
    const {token}= useParams();
    const [changePassword, setChangePassword] = useState({
        password:'',
        confirm_password:''
    });
    const [togglePassword, setTogglePassword] = useState(false);
    const [toggleChangePassword, setToggleChangePassword] = useState(false);
    const [error,setError]=useState(null);
    const [success,setSuccess]=useState(null);
    const [loading,setLoading]=useState(false);
    



    const handleSend = async (e) => {
        e.preventDefault();

        if(changePassword.password!==changePassword.confirm_password){
            setError("Confirm Password doesn't match with password")
        }else{
            setError(null);
            setLoading(true);
            const response = await UPDATE('/auth/reset_password/'+token,changePassword,setLoading);
            if(response){
                setSuccess(response.data.message);
                setLoading(false);
                console.log(response.data)
            }
        }
        
    };


    return (
        <Fragment>
            <section>
                <Container fluid={true} className='p-0 login-page'>
                    <Row className='m-0'>
                        <Col className='p-0'>
                            <div className='login-card'>
                                <div>
                                <div>
                                    {/* Logo */}
                                </div>
                                <div className='login-main unlock-user'>
                                    <Form className='theme-form login-form' onSubmit={handleSend}>
                                    <H4>Réinitialisez votre mot de passe</H4>
                                    <FormGroup className='position-relative'>
                                        <Label className='col-form-label'>nouveau mot de passe</Label>
                                        <div className='position-relative'>
                                        <Input
                                            className='form-control'
                                            required
                                            type={togglePassword?'text':'password'}
                                            placeholder='*************'
                                            value={changePassword.password}
                                            onChange={(e) => setChangePassword({...changePassword,password:e.target.value})}
                                        />
                                        <div className='show-hide' onClick={() => setTogglePassword(!togglePassword)}>
                                            <span className={togglePassword ? '' : 'show'}></span>
                                        </div>
                                        </div>
                                    </FormGroup>
                                    <FormGroup className='position-relative'>
                                        <Label className='col-form-label'>Confirmer le nouveau mot de passe</Label>
                                        <div className='position-relative'>
                                        <Input
                                            className='form-control'
                                            required
                                            placeholder='*************'
                                            type={toggleChangePassword?'text':'password'}
                                            value={changePassword.confirm_password}
                                            onChange={(e) => setChangePassword({...changePassword,confirm_password:e.target.value})}
                                        />
                                        <div className='show-hide' onClick={() => setToggleChangePassword(!toggleChangePassword)}>
                                            <span className={toggleChangePassword ? '' : 'show'}></span>
                                        </div>
                                        </div>
                                    </FormGroup>
                                    <FormGroup>
                                        <p style={{color:'red',fontSize:'13px'}}>{error!=null?error:''}</p>
                                        <p style={{color:'green',fontSize:'13px'}}>{success!=null?success:''}</p>
                                    </FormGroup>
                                    <FormGroup>
                                        <button className='btn w-100' disabled={loading}>{loading?'Mise à jour...':'Mettre à jour le mot de passe'}</button>
                                    </FormGroup>
                                    <P attrPara={{ className: 'mb-0' }}>
                                    Vous avez déjà un compte?
                                        <Link className='ms-2' to='/' style={{ color: '#6b2a7d' }}>
                                        Se connecter
                                        </Link>
                                    </P>
                                    </Form>
                                </div>
                                </div>
                            </div>
                        </Col>
                    </Row>
                </Container>
            </section>
        </Fragment>
    );
};

export default UnlockUser;
