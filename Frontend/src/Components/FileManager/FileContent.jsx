import React, { useState, useEffect, useRef } from 'react';
import axios from 'axios';
import { useParams, Link } from 'react-router-dom';
import 'bootstrap/dist/css/bootstrap.min.css';
import Spinner from 'react-bootstrap/Spinner';
import Modal from 'react-bootstrap/Modal';
import Button from 'react-bootstrap/Button';
import Dropdown from 'react-bootstrap/Dropdown';
import { FaFolderOpen } from 'react-icons/fa';
import { MdDeleteForever } from 'react-icons/md';
import { MdDelete  } from 'react-icons/md';
import { useUser } from './../../Auth/UserContext';
import { FaFileArchive, FaFile, FaFileImage } from 'react-icons/fa';
import { FiFileText } from 'react-icons/fi';
import {BiSolidFilePdf} from 'react-icons/bi';
import {BsFiletypeXls, BsFiletypePng} from 'react-icons/bs';
import {AiFillFileWord} from 'react-icons/ai';
import { RiErrorWarningLine } from 'react-icons/ri';
import {GET, POST, POSTFILE} from '../../api/Axios'
import { toast } from 'react-toastify';

function App() {
  const [folders, setFolders] = useState([]);
  const [newFolderName, setNewFolderName] = useState('');
  const [loading, setLoading] = useState(true);
  const [selectedFile, setSelectedFile] = useState(null);
  const [uploading, setUploading] = useState(false);
  const [creatingFolder, setCreatingFolder] = useState(false);
  const [showCreateModal, setShowCreateModal] = useState(false);
  const [showUploadModal, setShowUploadModal] = useState(false);
  const fileInputRef = useRef(null);
  const { folderId, folderName } = useParams();
  const [fileContent, setFileContent] = useState([]);
  const [showDropdown, setShowDropdown] = useState(null); // Add this line
  const [file, setFile] = useState({
    name:'',
    file:null
  });
  const [fileList, setFileList] = useState([]);

  const { user } = useUser();

  const GetFiles=async ()=>{
    const response=await GET('/file',setLoading);
    if(response){
      setFileList(response.data)
    }
  }

  useEffect(() => {
    GetFiles();
  }, []);

  const getFolder=async ()=>{
    const response =await GET('/folder',setLoading);
    if(response){
      setFolders(response.data);
      console.log(response.data)
    }
 }


  useEffect(() => {
    getFolder();
  }, []);

  const handleCreateFolder = async() => {
    // console.log(newFolderName)
    const response= await POST('/folder',{name:newFolderName},setLoading);
    if(response){
      setNewFolderName('');
      getFolder();
      setShowCreateModal(false);
    }
  };

  const [selectedFolderId, setSelectedFolderId] = useState(null);
  const [showDeleteFolderModal, setShowDeleteFolderModal] = useState(false);

  // ... // -/\- \\ ... (previous code) ... // -/\- \\ ...

  const handleDeleteFolder = (folderId) => {
    setSelectedFolderId(folderId);
    // Open the modal for confirmation
    setShowDeleteFolderModal(true);
  };

  const confirmDeleteFolder = () => {
    axios.delete(`http://localhost:4000/api/folders/${selectedFolderId}`)
      .then(response => setFolders(folders.filter(folder => folder._id !== selectedFolderId)))
      .catch(error => console.error(error))
      .finally(() => {
        // Close the modal
        setShowDeleteFolderModal(false);
        // Clear the selected folder ID
        setSelectedFolderId(null);
      });
  };

    
    const handleUpload = async () => {
      // console.log(file);
      const response = await POSTFILE('/file',file,setLoading);
      if(response){
        toast.success(response.data.message);
        setFile({
          name:"",
          file:""
        })
      }
      setShowUploadModal(false);
    };
    
    const handleFileChange = (e) => {
      const file = e.target.files[0];
    
      if (file) {
        console.log('File selected:', file);
        setFile(file);
      }
    };
    
    

  function getFileIcon(fileType) {
    console.log('File Type:', fileType);
    const blueColor = '#6b2a7d';
    switch (fileType) {
      case 'pdf':
        return <BiSolidFilePdf style={{ fontSize: '48px', marginRight: '10px', color: blueColor }} />;
      case 'txt':
        return <FiFileText  style={{ fontSize: '48px', marginRight: '10px', color: blueColor  }} />;
      case 'zip':
        return <FaFileArchive style={{ fontSize: '48px', marginRight: '10px' , color: blueColor }} />;
      case 'psd':
        return <FaFileImage style={{ fontSize: '48px', marginRight: '10px', color: blueColor }} />;
      case 'xlsx':
        return <BsFiletypeXls style={{ fontSize: '48px', marginRight: '10px', color: blueColor }} />;
      case 'docx':
        return <AiFillFileWord style={{ fontSize: '48px', marginRight: '10px', color: blueColor }} />;
        case 'png':
          return <BsFiletypePng style={{ fontSize: '48px', marginRight: '10px', color: blueColor }} />;
      default:
        return <FaFile style={{ fontSize: '48px', marginRight: '10px', color: blueColor  }} />;
    }
  }

  const handleDownloadFile = (file) => {
  
  
    window.location.href = file.path.url;
  };
  
    const handleDeleteFile = (fileId) => {
      fetch(`http://localhost:4000/upload/${fileId}`, {
          method: 'DELETE',
      })
      .then(response => response.json())
      .then(data => {
          console.log(data);
          alert('File deleted successfully!');
          setFileList(prevFileList => prevFileList.filter(file => file._id !== fileId));
      })
      .catch(error => {
          console.error('Error:', error);
      });
  };
  
  
  return (
    <div className="container mt-4">
      <div style={{ display: 'flex', justifyContent: 'space-between' }}>
        <h1>Folders</h1>
        <div style={{ display: 'flex', width: '30%' }}>
          <div style={{ width: '40%', height: '40px' }}>
            <button onClick={() => setShowUploadModal(true)} style={{backgroundColor:'#6b2a7d', color:'white',padding: '5px',borderRadius:'5px'}}>Upload a File</button>
            <Modal show={showUploadModal} onHide={() => setShowUploadModal(false)}>
            <Modal.Header closeButton>
                <Modal.Title>Upload a File</Modal.Title>
              </Modal.Header>
              <Modal.Body>
                <input
                  type="text"
                  value={file.name}
                  onChange={(e) => setFile({...file,name:e.target.value})}
                  placeholder="Enter folder name"
                  style={{ width: '100%', padding: '0.5rem', borderRadius: '5px', marginBottom: '1rem' }}
                />
                <input
                  type="file"
                  onChange={(e) => setFile({...file,file:e.target.files[0]})}
                  name='file'
                  ref={fileInputRef}
                  style={{ width: '100%', padding: '0.5rem', marginBottom: '1rem', border: '1px solid #ccc', borderRadius: '5px' }}
                />
                {uploading && <p style={{ color: '#27ae60' }}>Uploading...</p>}
              </Modal.Body>
              <Modal.Footer style={{ borderTop: 'none' }}>
                <Button variant="danger" onClick={() => setShowUploadModal(false)}>
                  Close
                </Button>
                <button variant="primary" onClick={handleUpload} disabled={uploading} style={{ backgroundColor: '#6b2a7d' , color:'white', padding:'5px', borderRadius:'5px'}}>
                  {uploading ? 'Uploading...' : 'Upload'}
                </button>
              </Modal.Footer>
            </Modal>
          </div>
          <div style={{ width: '45%', height: '40px' }}>
            <button onClick={() => setShowCreateModal(true)} style={{backgroundColor:'#6b2a7d', color:'white' ,padding: '5px',borderRadius:'5px'}}>Create a Folder</button>
            <Modal show={showCreateModal} onHide={() => setShowCreateModal(false)}>
            <Modal.Header closeButton>
              <Modal.Title style={{ fontSize: '2rem' }}>Create a Folder</Modal.Title>
            </Modal.Header>
            <Modal.Body>
              <input
                type="text"
                value={newFolderName}
                onChange={(e) => setNewFolderName(e.target.value)}
                placeholder="Enter folder name"
                style={{ width: '100%', padding: '0.5rem', borderRadius: '5px', marginBottom: '1rem' }}
              />
              {creatingFolder && <p style={{ color: '#6b2a7d' }}>Creating folder...</p>}
            </Modal.Body>
            <Modal.Footer style={{ borderTop: 'none' }}>
              <button style={{ backgroundColor: '#8B0000' , color:'white', padding:'6px', borderRadius:'5px', border:'none'}} onClick={() => setShowCreateModal(false)}>
                Close
              </button>
              <button style={{ backgroundColor: '#6b2a7d' , color:'white', padding:'5px', borderRadius:'5px'}} onClick={handleCreateFolder} disabled={!newFolderName}>
                Create Folder
              </button>
            </Modal.Footer>
          </Modal>
          </div>
        </div>
      </div>
      {loading ? (
        <Spinner animation="border" role="status">
          <span className="sr-only">Loading...</span>
        </Spinner>
      ) : (
        <div style={{ display: 'flex', flexWrap: 'wrap' }}>
        {folders.map(folder => (
          <div key={folder._id} style={{ flex: '0 0 22%', marginBottom: '10px', marginRight: '10px', border: '1px solid #ccc', padding: '10px', position: 'relative' , borderRadius:'5px'}}>
            <li className="list-group-item d-flex flex-column align-items-center">
              <Link to={`/folders/${folder._id}`} style={{ textDecoration: 'none' }}>
                <span style={{ fontSize: '48px', color: '#6b2a7d' }}>
                  <FaFolderOpen  />
                </span>
                <div style={{ marginTop: '5px', color: 'black', textDecoration: 'none' }}>{folder.name}</div>
              </Link>
              <div style={{ position: 'absolute', top: '5px', right: '5px' }}>
              {user?.isAdmin && (
                <button className="dropdown-item" onClick={() => handleDeleteFolder(folder._id)}>
                  <MdDelete  style={{ fontSize: '23px', color: 'red' }} />
                </button>
              )}
             </div>
            </li>
          </div>
        ))}
      </div>
      )}
      <div style={{ display: 'flex', flexWrap: 'wrap' }}>
      {Array.isArray(fileList) && fileList.map(file => (
        <div key={file._id} style={{ flex: '0 0 22%', marginBottom: '10px', marginRight: '10px', padding: '10px', position: 'relative', border: '1px solid #ccc' }}>
          <li className="list-group-item d-flex flex-column align-items-center">
            <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
              {getFileIcon(file.type)}
              <div style={{ marginTop: '5px' }}>{file.name || file.fileName}</div>
            </div>
            <div style={{ position: 'absolute', top: '5px', right: '5px' }}>
              <div className={`dropdown ${showDropdown === file._id ? 'show' : ''}`}>
                <button
                  className="btn btn-outline-secondary"
                  type="button"
                  id={`fileOptions${file._id}`}
                  onClick={() => setShowDropdown(showDropdown === file._id ? null : file._id)}
                >
                  ⋮
                </button>
                <div className={`dropdown-menu ${showDropdown === file._id ? 'show' : ''}`} aria-labelledby={`fileOptions${file._id}`}>
                  {user?.isAdmin && (
                    <button className="dropdown-item" onClick={() => handleDeleteFile(file._id)}>
                      <span role="img" aria-label="Delete" style={{ fontSize: '18px', marginRight: '5px' }}>🗑️</span>
                      Delete
                    </button>
                  )}
                  <button className="dropdown-item" onClick={() => handleDownloadFile(file)}>
                    <span role="img" aria-label="Download" style={{ fontSize: '18px', marginRight: '5px' }}>📥</span>
                    Download
                  </button>
                </div>
              </div>
            </div>
          </li>
        </div>
      ))}
     </div>
      <Modal show={showDeleteFolderModal} onHide={() => setShowDeleteFolderModal(false)} centered>
      <Modal.Header closeButton style={{ display: 'flex', justifyContent: 'center', alignItems: 'center', textAlign: 'center' }}>
      <RiErrorWarningLine className="error-icon" style={{ color: 'orange', fontSize: '80px' }} />
      </Modal.Header>
      <Modal.Body>
        <h5 style={{textAlign:'center', marginTop:'-20px'}}>Are you Sure?</h5>
        <p style={{textAlign:'center'}}>You won't be able to revert this!</p>
      </Modal.Body>
      <Modal.Footer style={{display:'flex', justifyContent:'center'}}>
      <button style={{ backgroundColor: '#6b2a7d' , color:'white', padding:'7px', borderRadius:'5px', border:'none'}} onClick={confirmDeleteFolder}>
          Yes,Delete it!
        </button>
        <Button className="bg-dark" onClick={() => setShowDeleteFolderModal(false)}>
          Cancel
        </Button>
      </Modal.Footer>
    </Modal>
    </div>
  );
}

export default App;




