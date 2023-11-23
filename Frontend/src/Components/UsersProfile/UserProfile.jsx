import React, { Fragment, useState, useEffect } from 'react';
import { Col, Card, CardHeader, Row, Modal, ModalHeader, ModalBody, ModalFooter, Button, FormGroup, Label, Input } from 'reactstrap';
import { H6, Image } from '../../../src/AbstractElements';
import { Email,Location } from '../../Constant';
import { toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import { GET, UPDATE } from '../../api/Axios'

const UserProfile = () => {
  const [showModal, setShowModal] = useState(false);
  const [selectedImage, setSelectedImage] = useState(null);
  const [loading, setLoading] = useState(null);
  const userRole=localStorage.getItem('role');


  // State to hold form values
  const [user, setUser] = useState({
    name: '',
    username: '',
    job_desgination: '',
    email: '',
    address: '',
    phone: '',
    zip: '',
    role:''
  });

  const fetchData=async()=>{
    const response= await GET('user/profile',setLoading);
    if(response){
      console.log(response.data)
      setUser(response.data)
    }
    
  }
  // Fetch user data when the component mounts
  useEffect(() => {
    fetchData();
  }, []);

  
  // Function to open the modal
  const openModal = () => {
    setShowModal(true);
  };

  // Function to close the modal
  const closeModal = () => {
    setShowModal(false);
  };

const handleSubmit = async (e) => {
  e.preventDefault();
  console.log(user);
  const response= await UPDATE('user/profile',user,setLoading);

  if(response){
    toast.success(response.data.message);
    fetchData();
  }
  closeModal();

};


  const handleImageSelection = (e) => {
    const file = e.target.files[0];
    setSelectedImage(file);
  };

  return (
    <Fragment>
      <Col sm='12'>
        <Card className='hovercard text-center'>
          <CardHeader className='cardheader'></CardHeader>
          <div className='user-image'>
            <div className='avatar'>
              <Image attrImage={{ className: 'step1', alt: '', src: `${require('../../assets/images/user/sample.png')}` }} />
            </div>
            <div className='icon-wrapper step2'>
              <i className='icofont icofont-pencil-alt-5' onClick={openModal}></i>
            </div>
            <ProfileModal
              showModal={showModal}
              closeModal={closeModal}
              handleSubmit={handleSubmit}
              user={user}
              setUser={setUser}
            />
          </div>
              <div className='info'>
              <Row className='step3' data-intro='This is the your details'>
                <Col sm='6' lg='4' className='order-sm-1 order-xl-0'>
                  <Row>
                    
                    <Col md='5'>
                      <div className='ttl-info text-start ttl-sm-mb-0'>
                        <H6>
                          <i className='fa fa-phone me-2'></i>
                          Phone
                        </H6>
                        <span>{user.phone}</span>
                      </div>
                    </Col>
                    <Col md='7'>
                      <div className='ttl-info text-start'>
                        <H6>
                          <i className='fa fa-envelope me-2'></i> {Email}
                        </H6>
                        <span>{user.email}</span>
                      </div>
                    </Col>
                  </Row>
                </Col>
                <Col sm='12' lg='4' className='order-sm-0 order-xl-1'>
                  <div className='user-designation'>
                    <div className='title'>
                        {user.name}
                    </div>
                    {
                      userRole==="member"?
                      <div className='desc mt-2'>{console.log(user.job_designation)||user.job_designation}</div>:
                      ''
                    }
                  </div>
                </Col>
                <Col sm='6' lg='4' className='order-sm-2 order-xl-2'>
                  <Row>
                    
                    <Col md='6'>
                      <div className='ttl-info text-start ttl-sm-mb-0'>
                        <H6>
                          <i className='fa fa-location-arrow me-2'></i>
                          {Location}
                        </H6>
                        <span>{user.address?user.address:'None'}</span>
                      </div>
                    </Col>
                    <Col md='6'>
                      <div className='ttl-info text-start ttl-xs-mt'>
                        <H6>
                          <i className='fa fa-phone me-2'></i>
                          {'Zip'}
                        </H6>
                        <span>{user.zip?user.zip:'None'}</span>
                      </div>
                    </Col>
                  </Row>
                </Col>
              </Row>
              </div>
        </Card>
      </Col>
    </Fragment>
  );
};

const ProfileModal = ({ showModal, closeModal, handleSubmit, user, setUser }) => {
  const userRole=localStorage.getItem('role');
  return (
    <Modal isOpen={showModal} toggle={closeModal}>
      <ModalHeader toggle={closeModal}>Edit Profile</ModalHeader>
      <ModalBody>
        <form onSubmit={handleSubmit}>
          <Row>
            <Col md={12}>
              <FormGroup>
                <Label for='name'>Name</Label>
                <Input
                  type='text'
                  name='name'
                  id='name'
                  placeholder='Enter your name'
                  value={user.name}
                  onChange={(e) => setUser({ ...user, name: e.target.value })}
                />
              </FormGroup>
            </Col>
            {userRole==="member"?
            <Col md={12}>
              <FormGroup>
                <Label for='designation'>Designation</Label>
                <Input
                  type='text'
                  name='designation'
                  id='designation'
                  placeholder='Enter your designation'
                  value={user.job_designation}
                  onChange={(e) => setUser({ ...user, job_designation: e.target.value })}
                />
              </FormGroup>
            </Col>:''
            }
          </Row>
          <Row>
            <Col md={12}>
              <FormGroup>
                <Label for='email'>Email</Label>
                <Input
                  type='email'
                  name='email'
                  id='email'
                  placeholder='Enter your email'
                  value={user.email}
                  onChange={(e) => setUser({ ...user, email: e.target.value })}
                />
              </FormGroup>
            </Col>
            
              <Col md={12}>
                <FormGroup>
                  <Label for='phone'>Phone No.</Label>
                  <Input
                    type='tel'
                    name='phone'
                    id='phone'
                    placeholder='Enter your phone number'
                    value={user.phone}
                    onChange={(e) => setUser({ ...user, phone: e.target.value })}
                  />
                </FormGroup>
              </Col>
              <Col md={12}>
              <FormGroup>
                <Label for='location'>Address</Label>
                <Input
                  type='text'
                  name='address'
                  id='location'
                  placeholder='Enter your Address'
                  value={user.address}
                  onChange={(e) => setUser({ ...user, address: e.target.value })}
                />
              </FormGroup>
            </Col>
            <Col md={12}>
              <FormGroup>
                <Label for='zip'>Zip</Label>
                <Input
                  type='text'
                  name='zip'
                  id='zip'
                  placeholder='Enter your zip'
                  value={user.zip}
                  onChange={(e) => setUser({ ...user, zip: e.target.value })}
                />
              </FormGroup>
            </Col>
          </Row>
          <div>
          <ModalFooter>
              <Button color='primary' type='submit'>
                Save Changes
              </Button>
              <Button color='secondary' onClick={closeModal}>
                Close
              </Button>
          </ModalFooter>
          </div>
        </form>
      </ModalBody>
       
    </Modal>
  );
};

export default UserProfile;

