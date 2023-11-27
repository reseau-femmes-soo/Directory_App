import React, { Fragment } from "react";
import { Container, Row } from "reactstrap";
import { Breadcrumbs } from "../../../src/AbstractElements";
import UserProfile from "./UserProfile";


const UsersProfileContain = () => {
  return (
    <Fragment>
      <Breadcrumbs mainTitle="Profil de l'utilisateur" parent="Utilisateurs" title="Profil de l'utilisateur" />
      <Container fluid={true}>
        <div className="user-profile">
          <Row>
            <UserProfile />
          </Row>
        </div>
      </Container>
    </Fragment>
  );
};
export default UsersProfileContain;
