import { H5 } from '../../../AbstractElements';
import React, { Fragment } from 'react';
import { Link } from 'react-router-dom';
import { Button, CardHeader } from 'reactstrap';
import '../../../styles.css'

const HeaderCard = ({ title, span1, span2, mainClasses,link,link_text,icon }) => {
  return (
    <Fragment>
      <CardHeader className={`${mainClasses ? mainClasses : ''}`}>
        <H5>{title}</H5>
        {span1 ? <span>{span1}</span> : ''}
        {span2 ? <span>{span2}</span> : ''}
        {
          link?
          <Link to="/add_member" className='btn' style={{float:'right'}}>{icon}<span className="link_text">{link_text}</span></Link>
          :''
        }
      </CardHeader>
    </Fragment>
  );
};

export default HeaderCard;
