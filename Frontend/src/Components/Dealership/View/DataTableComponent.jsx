import React, { Fragment, useState , useEffect} from 'react';
import DataTable from 'react-data-table-component';
import { MdClose, MdMoreVert } from 'react-icons/md';
import { GET } from '../../../api/Axios';
import { DELETE } from '../../../api/Axios';
import { toast } from 'react-toastify';
import { RiErrorWarningLine } from 'react-icons/ri';
import Modal from 'react-bootstrap/Modal';
const DataTableComponent = () => {
  const [data, setData] = useState([]);
  const [loading,setLoading]=useState(false)
  const [deleteUser,setDeleteUser]=useState(false)
  const [showDeleteFolderModal, setShowDeleteFolderModal] = useState(false);
  const [selected, setSelected] = useState({id:''});

  // ... // -/\- \\ ... (previous code) ... // -/\- \\ ...
  const confirm_delete=(id)=>{
    setSelected({
      id:id,
    })
    setShowDeleteFolderModal(true);
  }
  const fetchData = async () => {
    setLoading(true)
    const response = await GET('/user',setLoading);
    if(response){
      setData(response.data)
    }  
    
  };
  const handleDelete = async () => {
    
    setDeleteUser(true)
      try{
        const response = await DELETE('/user/'+selected.id,setLoading);

        if (response) {
          setDeleteUser(false)
          toast.success(response.data.message);
          setShowDeleteFolderModal(false);
          // Update the frontend state or perform any other necessary actions
        } 
      } catch (error) {
        console.error('Error deleting user profile:', error);
        // Display a user-friendly error message to the user
      }
    };
  useEffect(() => {
    fetchData();
  }, [deleteUser]);
  const tableColumns = [
    {
        name: 'Nom',
        selector: (row) => (
            <div className="d-flex align-items-center">
                <span>{row.name}</span>
            </div>
        ),
        sortable: true,
        center: false,
    },
    {
        name: 'E-mail',
        selector: row => row['email'],
        sortable: true,
        center: true,
    },
    {
        name: `Désignation d'emploi`,
        selector: row => `${row.job_designation?row.job_designation:"None"}`,
        sortable: true,
        center: true,
    },
    {
        name: 'Téléphone',
        selector: row => `${row.phone}`,
        sortable: true,
        center: true,
    },
    {
        name: 'Emplacement',
        selector: row => `${row.street?row.street+",":''}${row.city?row.city:''}`,
        sortable: true,
        center: true,
    },
    {
        name: 'Actions',
        selector: (row) => (
          <MdClose  style={{ fontSize: '23px', color: 'red',cursor:'pointer',float:'right'}} onClick={()=>confirm_delete(row._id)}/>
          ),
        
        center: true,
        
      },
  ];

  return (
    <Fragment>
      <DataTable
        data={data}
        columns={tableColumns}
        striped={true}
        center={true}
        pagination
      />
      <Modal show={showDeleteFolderModal} onHide={() => setShowDeleteFolderModal(false)} centered>
        <Modal.Header closeButton style={{ display: 'flex', justifyContent: 'center', alignItems: 'center', textAlign: 'center' }}>
        <RiErrorWarningLine className="error-icon" style={{ color: 'orange', fontSize: '80px' }} />
        </Modal.Header>
        <Modal.Body>
          <h5 style={{textAlign:'center', marginTop:'-20px'}}>Êtes-vous sûr de vouloir supprimer?</h5>
          <p style={{textAlign:'center'}}>Vous ne pourrez pas revenir en arrière!</p>
        </Modal.Body>
        <Modal.Footer style={{display:'flex', justifyContent:'center'}}>
        <button className={'btn'} onClick={()=>handleDelete()} disabled={deleteUser}>
            {deleteUser?'Suppression':'Oui, supprimez-le !'}
          </button>
          <button className={'btn'} disabled={deleteUser} onClick={() => setShowDeleteFolderModal(false)}>
          Annuler
          </button>
        </Modal.Footer>
      </Modal>
    </Fragment>
  );
};





export default DataTableComponent;
