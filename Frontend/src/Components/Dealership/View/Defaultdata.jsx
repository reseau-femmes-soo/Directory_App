import React from 'react';
import { Button, Media } from 'reactstrap';
import { Image } from '../../../AbstractElements';



const renderProfilePhoto = (photoName) => (
    <Image attrImage={{ className: 'rounded-circle img-30 me-3', src: `http://localhost:4000/${photoName}`, alt: 'Profile' }} />
  );

  










