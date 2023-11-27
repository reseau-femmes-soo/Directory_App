import React, { Fragment } from 'react';
import { Container, Row, Col, Card, CardBody } from 'reactstrap';
import { Breadcrumbs } from '../../../AbstractElements';
import HeaderCard from '../../Common/Component/HeaderCard';
import DataTableComponent from './DataTableComponent';

const DataTables = () => {

  return (
    <Fragment>
      <Breadcrumbs parent="Membres" mainTitle="Dossier des membres" />
      <Container fluid={true}>
        <Row>
          <Col sm="12">
            <Card>
              <HeaderCard title="Réseau-femmes Members" link="add_member" link_text={"Ajouter un membre"}/>
               
              <CardBody>
                <DataTableComponent />
              </CardBody>
            </Card>
          </Col>
        </Row>
      </Container>
    </Fragment>
  );

};

export default DataTables;