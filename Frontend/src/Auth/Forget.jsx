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
import { Link } from 'react-router-dom';

const UnlockUser = ({ logoClassMain }) => {
  const [email, setEmail] = useState('');
  const [togglePassword, setTogglePassword] = useState(false);

  const handleSend = async (e) => {
    e.preventDefault();

    // Generate a random password (you may use a different method)
    const randomPassword = generateRandomPassword();

    // Send an email with the random password
    try {
      const response = await fetch('http://localhost:4000/api/forgot-password', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          email,
          newPassword: randomPassword,
        }),
      });

      if (response.ok) {
        alert('Password reset email sent successfully!');
      } else {
        alert('Failed to send password reset email.');
      }
    } catch (error) {
      console.error('Error sending password reset email:', error);
    }
  };

  const generateRandomPassword = () => {
    // Logic to generate a random password (you may use a different method)
    // For example, using Math.random() and converting it to a string
    return Math.random().toString(36).slice(-8);
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
                      <H4>Reset Your Password</H4>
                      <FormGroup className='position-relative'>
                        <Label className='col-form-label'>Enter your Email</Label>
                        <div className='position-relative'>
                          <Input
                            className='form-control'
                            required
                            placeholder='test@gmail.com'
                            value={email}
                            onChange={(e) => setEmail(e.target.value)}
                          />
                          <div className='show-hide' onClick={() => setTogglePassword(!togglePassword)}>
                            <span className={togglePassword ? '' : 'show'}></span>
                          </div>
                        </div>
                      </FormGroup>
                      <FormGroup>
                        {/* Additional form fields if needed */}
                      </FormGroup>
                      <FormGroup>
                        <Btn attrBtn={{ className: 'd-block w-100', color: 'dark', type: 'submit' }}>Send</Btn>
                      </FormGroup>
                      <P attrPara={{ className: 'mb-0' }}>
                        Already have an account?
                        <Link className='ms-2' to='/login' style={{ color: '#6b2a7d' }}>
                          Sign in
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
