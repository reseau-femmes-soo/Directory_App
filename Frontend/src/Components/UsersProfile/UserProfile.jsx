import React, { Fragment, useState, useEffect } from 'react';
import { Col, Card, CardHeader, Row, Modal, ModalHeader, ModalBody, ModalFooter, Button, FormGroup, Label, Input } from 'reactstrap';
import { H6, Image } from '../../../src/AbstractElements';
import { Email,Location } from '../../Constant';
import { toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import { GET, PATCHFILE, POSTFILE, UPDATE } from '../../api/Axios'

const UserProfile = () => {
  const [showModal, setShowModal] = useState(false);
  const [selectedImage, setSelectedImage] = useState(null);
  const [loading, setLoading] = useState(null);
  const userRole=localStorage.getItem('role');


  // State to hold form values
  const [user, setUser] = useState({
    name: '',
    job_desgination: '',
    email: '',
    phone: '',
    street: '',
    city: '',
    state: '',
    country: '',
    zip: '',
    role:'',
    profile_image:''
  });
  const [profile_image,setProfileImage]=useState(null);

  const fetchData=async()=>{
    const response= await GET('user/profile',setLoading);
    
    if(response){
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
    setLoading(true);
    const response= await PATCHFILE('/user/profile',{...user,profile_image:profile_image},setLoading);
    
    if(response){
      toast.success(response.data.message);
      fetchData();
      setLoading(false);
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
              {
                console.log(user)||user.profile_image?
                <Image attrImage={{ className: 'step1', alt: '', src:`${user.profile_image.url}` }} />
                :
                <Image attrImage={{ className: 'step1', alt: '', src: `${require('../../assets/images/user/sample.png')}` }} />
              }
            </div>
            <div className='icon-wrapper step2' onClick={openModal}>
              <i className='icofont icofont-pencil-alt-5' ></i>
            </div>
            <ProfileModal
              showModal={showModal}
              closeModal={closeModal}
              handleSubmit={handleSubmit}
              user={user}
              setUser={setUser}
              profile_image={profile_image}
              setProfileImage={setProfileImage}
              loading={loading}
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
                          Téléphone
                        </H6>
                        <span>{user.phone}</span>
                      </div>
                    </Col>
                    <Col md='7'>
                      <div className='ttl-info text-start'>
                        <H6>
                          <i className='fa fa-envelope me-2'></i> {'E-mail'}
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
                      <div className='desc mt-2'>{user.job_designation}</div>:
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
                          {'Emplacement'}
                        </H6>
                        <span>
                            {user.street!=""?user.street:''}
                            {user.city!=""?", "+user.city:''}
                        </span>
                      </div>
                    </Col>
                    <Col md='6'>
                      <div className='ttl-info text-start ttl-xs-mt'>
                        <H6>
                          <i className='fa fa-phone me-2'></i>
                          {'Code postal'}
                        </H6>
                        <span>{user.zip?user.zip:''}</span>
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

const ProfileModal = ({ showModal, closeModal, handleSubmit, user, setUser,profile_image,setProfileImage,loading }) => {
  const userRole=localStorage.getItem('role');
   console.log("edit model", user)
  return (
    <Modal isOpen={showModal} toggle={closeModal}>
      <ModalHeader toggle={closeModal}>Editer le profil</ModalHeader>
      <ModalBody>
        <form onSubmit={handleSubmit}>
          <Row>
            <Col md={12}>
              <FormGroup>
                <Label for='name'>Nom</Label>
                <Input
                  type='text'
                  name='name'
                  id='name'
                  placeholder='Entrez votre nom'
                  value={user.name}
                  onChange={(e) => setUser({ ...user, name: e.target.value })}
                />
              </FormGroup>
            </Col>
            
          </Row>
          <Row>
            <Col md={12}>
              <FormGroup>
                <Label for='email'>E-mail</Label>
                <Input
                  type='email'
                  name='email'
                  id='email'
                  placeholder='Entrer votre Email'
                  value={user.email}
                  onChange={(e) => setUser({ ...user, email: e.target.value })}
                />
              </FormGroup>
            </Col>
            
              <Col md={12}>
                <FormGroup>
                  <Label for='phone'>Téléphone</Label>
                  <Input
                    type='tel'
                    name='phone'
                    id='phone'
                    placeholder='Entrez votre numéro de téléphone'
                    value={user.phone}
                    onChange={(e) => setUser({ ...user, phone: e.target.value })}
                  />
                </FormGroup>
              </Col>
              <Col md={12}>
              <FormGroup>
                <Label for='location'>Rue</Label>
                <Input
                  type='text'
                  name='street'
                  id='location'
                  placeholder='Entrez votre adresse postale'
                  value={user.street}
                  onChange={(e) => setUser({ ...user, street: e.target.value })}
                />
              </FormGroup>
            </Col>
            <Col md={6}>
              <FormGroup>
                <Label for='location'>Ville</Label>
                <Input
                  type='text'
                  name='city'
                  id='location'
                  placeholder='Entrez votre ville'
                  value={user.city}
                  onChange={(e) => setUser({ ...user, city: e.target.value })}
                />
              </FormGroup>
            </Col>
            
            <Col md={6}>
              <FormGroup>
                <Label for='zip'>Code postal</Label>
                <Input
                  type='text'
                  name='zip'
                  id='zip'
                  placeholder='Entrez votre code postal'
                  value={user.zip}
                  onChange={(e) => setUser({ ...user, zip: e.target.value })}
                />
              </FormGroup>
            </Col>
            
            <Col md={12}>
              <FormGroup>
                <Label for='zip'>Image de profil</Label>
                <label htmlFor="fileInput" style={{ cursor: 'pointer',border:'1px solid #dee2e6',width:'100%',height:'40px',borderRadius:'5px',padding:'7px' }}>
                    {/* Custom text for the file input */}
                    Choisir le fichier: {profile_image ? profile_image.name : 'Aucun fichier choisi'}
                </label>
                <Input
                  type='file'
                  name='profile_image'
                  id="fileInput"
                  style={{ display: 'none' }}
                  placeholder='Enter your Profile Image'
                  onChange={(e) => setProfileImage(e.target.files[0])}
                />
              </FormGroup>
            </Col>
          </Row>
          <div>
          <ModalFooter>
              <button className='btn' type='submit' disabled={loading}>
                {loading?'Enregistrer...':'Sauvegarder'}
              </button>
              <button className='btn' onClick={closeModal}>
              Fermer
              </button>
          </ModalFooter>
          </div>
        </form>
      </ModalBody>
       
    </Modal>
  );
};

export default UserProfile;

