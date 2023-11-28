

import React, { Fragment } from 'react';
import { Breadcrumbs } from '../../AbstractElements';
import FileContent from '../FileManager/FileContent';
import { Card, Col, Container, Row } from 'reactstrap';

const FileManagerContain = () => {
  return (
    <Fragment>
      <Breadcrumbs parent='applications' title='Gestionnaire de fichiers' mainTitle='Gestionnaire de fichiers' />
      <Container fluid={true}>
        <Row>
          <Col xl='12' md='12' className='box-col-12'>
            <div className='file-content'>
              <Card>
                <FileContent />
              </Card>
            </div>
          </Col>
        </Row>
      </Container>
    </Fragment>
  );
};
export default FileManagerContain;
