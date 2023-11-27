import React from 'react';
import { Fragment } from 'react';
import { Col, Container, Row } from 'reactstrap';
import { P } from '../../AbstractElements';
import { Link } from 'react-router-dom';

const Footer = () => {
  return (
    <Fragment>
      <footer className="footer">
        <Container fluid={true}>
          <Row>
            <Col md="12" className="footer-copyright text-center">
              <P attrPara={{ className: "mb-0" }}>{'Copyright 2023 © All rights reserved. Developer By'}<Link to={'https://qubitars.com/'} target="_blank" style={{textDecoration:'none',color:'#6b2a7d'}}><b> Qubitars</b></Link></P>
            </Col>
          </Row>
        </Container>
      </footer>
    </Fragment>
  );
};

export default Footer;