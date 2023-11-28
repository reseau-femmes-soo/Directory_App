import React, { Fragment, useState } from 'react';
import { Col, Container, Form, FormGroup, Input, Label, Row, Toast } from 'reactstrap';
import { Btn, H4, P, Image } from '../AbstractElements';
import { Link } from 'react-router-dom';
import { POST } from '../api/Axios';

import { ToastContainer, toast } from 'react-toastify';

const UnlockUser = ({ logoClassMain }) => {
  const [email, setEmail] = useState('');
  const [loading,setLoading]=useState(false);
  const [success,setSuccess]=useState(null);
  const handleSend = async (e) => {
    e.preventDefault();
    console.log(email);
    setLoading(true);
    const response = await POST('/auth/forgot_password/',{email},setLoading);
    if(response){
      setSuccess(response.data.message);
        setLoading(false);
        console.log(response.data)
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
                        <Label className='col-form-label'>Entrer votre Email</Label>
                        <div className='position-relative'>
                          <Input
                            className='form-control'
                            required
                            placeholder='test@gmail.com'
                            value={email}
                            onChange={(e) => setEmail(e.target.value)}
                          />
                        </div>
                      </FormGroup>
                      <FormGroup>
                        <p style={{color:'green',fontSize:'13px'}}>{success!=null?success:''}</p>
                      </FormGroup>
                      <FormGroup>
                        <button className='btn w-100' disabled={loading}>{loading?'Envoyer une requete...':'Envoyer'}</button>
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
