import React from 'react';
import { Button, Media } from 'reactstrap';
import { Image } from '../../../AbstractElements';


const renderProfilePhoto = (photoName) => (
    <Image attrImage={{ className: 'rounded-circle img-30 me-3', src: `http://localhost:4000/${photoName}`, alt: 'Profile' }} />
  );

  
export const tableColumns = [
    {
        name: 'Name',
        selector: (row) => (
            <div className="d-flex align-items-center">
                
                <span>{row.name}</span>
            </div>
        ),
        sortable: true,
        center: false,
    },
    {
        name: 'Email',
        selector: row => row['email'],
        sortable: true,
        center: true,
    },
    {
        name: 'Job Designation',
        selector: row => `${row.job_designation?row.job_designation:"None"}`,
        sortable: true,
        center: true,
    },
    {
        name: 'Phone',
        selector: row => `${row.phone}`,
        sortable: true,
        center: true,
    },
    {
        name: 'Location',
        selector: row => `${row.address?row.address:'None'}`,
        sortable: true,
        center: true,
    },
    {
        name: 'Actions',
        selector: (row) => (
          
            <Button
              color="danger"
              // onClick={() => {
              //   handleDelete(row.email);
              // }}
            >
              Delete
            </Button>
          ),
        
        center: true,
        
      },
];





// const handleDelete = async (userId) => {
//   console.log('Deleting user profile with ID:', userId);
//   try {
//     const response = await fetch(`http://localhost:4000/api/user-profile/${userId}`, {
//       method: 'DELETE',
//     });

//     if (response.ok) {
//       console.log('User profile deleted successfully');
//       // Update the frontend state or perform any other necessary actions
//     } else {
//       const errorData = await response.json();
//       console.error('Failed to delete user profile:', errorData.error);
//       // Display a user-friendly error message to the user
//     }
//   } catch (error) {
//     console.error('Error deleting user profile:', error);
//     // Display a user-friendly error message to the user
//   }
// };
