import React, { useState, useEffect, useRef } from 'react';
import axios from 'axios';
import { Link, useParams } from 'react-router-dom';
import Modal from 'react-bootstrap/Modal';
import Button from 'react-bootstrap/Button';
import { FaFileArchive, FaFile, FaFileImage } from 'react-icons/fa';
import { FiFileText } from 'react-icons/fi';
import {BiSolidFilePdf} from 'react-icons/bi';
import {BsFiletypeXls, BsFiletypePng} from 'react-icons/bs';
import {AiFillFileWord} from 'react-icons/ai';
import { useUser } from './../../Auth/UserContext';
import Folder from './Folder'
import { useNavigate } from 'react-router-dom';
import {GET, POST, POSTFILE} from '../../api/Axios'
import { toast } from 'react-toastify';

const FolderComponent = () => {
  const { folderId } = useParams();
  const [fileContent, setFileContent] = useState(null);
  const [folderContent, setFolderContent] = useState(null);
  const [selectedFile, setSelectedFile] = useState({
    name:'',
    file:null,
    folder_id:folderId
  });
  const [uploading, setUploading] = useState(false);
  const [newFolderName, setNewFolderName] = useState('');
  const [creatingFolder, setCreatingFolder] = useState(false);
  const [showCreateModal, setShowCreateModal] = useState(false);
  const [showUploadModal, setShowUploadModal] = useState(false);
  const fileInputRef = useRef(null);
  const [showDropdown, setShowDropdown] = useState(null);
  const [loading, setLoading] = useState(true);
  const [submit,setSubmit]=useState(0);

  const { user } = useUser();
  const navigate = useNavigate();


  const handleOutsideClick = (event) => {
    if (showDropdown && !event.target.closest('.dropdown')) {
      setShowDropdown(null);
    }
  };

  useEffect(() => {
    document.addEventListener('click', handleOutsideClick);

    return () => {
      document.removeEventListener('click', handleOutsideClick);
    };
  }, [showDropdown]);


  const getFolder=async ()=>{
     const response =await GET('/folder/'+folderId,setLoading);
     if(response){
      setFolderContent(response.data);
      console.log(response.data)
     }
  }

  useEffect(() => {
      getFolder();
  }, [folderId,submit]);

  const handleFileClick = (file) => {
    console.log(`Clicked on file: ${file.name}`);
    deleteFileFromFolder(file._id);
  };

  const deleteFileFromFolder = async (fileId) => {
    try {
      await axios.delete(`http://localhost:8080/api/folders/${folderId}/files/${fileId}`);
      console.log(`File with ID ${fileId} deleted successfully`);

      const response = await axios.get(`http://localhost:8080/api/folders/${folderId}/files`);
      setFileContent(response.data);
    } catch (error) {
      console.error('Error deleting file:', error);
    }
  };

  

  const handleFileUpload = async () => {
    console.log(selectedFile)
      setUploading(true);
    const response = await POSTFILE('/file',selectedFile,setLoading);
      if(response){
        toast.success(response.data.message);
        setSelectedFile({
          name:"",
          file:"",
          folder_id:folderId
        })
        setSubmit(submit+1)
      }
      setUploading(false);
      setShowUploadModal(false);
   
  };

  const handleCreateFolder = async () => {
    console.log(newFolderName)
    const response= await POST('/folder',{name:newFolderName,parent_id:folderId},setLoading);
    if(response){
      setNewFolderName('');
      getFolder();
      setShowCreateModal(false);
    }
  
  };
  

  function getFileIcon(fileType) {
    const blueColor = '#6b2a7d'; // Change this color to the desired blue color
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
  
  const handleNestedFolderClick = (folder) => {
    console.log(`Clicked on nested folder: ${folder.name}`);
    navigate(`/folders/${folder._id}/${folder.name}`);
  };

  const deleteFolder = ()=> {
      alert('deleted')
  }

  return (
    <>
    {
      console.log(folderContent)||folderContent!=null?

      <div style={{ display: 'flex', justifyContent: 'space-between', padding: '20px' }}>
      <div style={{ flex: 1, marginRight: '20px', borderRight: '1px solid #ccc', paddingRight: '20px' }}>
        <h2>Contents of {folderContent.folder.name}</h2>
        <h4>Files</h4>
        {folderContent.files.length > 0 ? (
        <div style={{ display: 'flex', flexWrap: 'wrap' }}>
        {folderContent.files.map(file => (
        <div key={file._id} style={{ flex: '0 0 30%', marginBottom: '10px', marginRight: '10px', border: '1px solid #ccc', padding: '10px', position: 'relative' }}>
          <li className="list-group-item d-flex flex-column align-items-center">
            <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
              {getFileIcon(file.type)}
              <div style={{ marginTop: '5px' }}>{file.name}</div>
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
                    <button className="dropdown-item" onClick={() => handleFileClick(file)}>
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
      ) : (
        <p>No files in the folder</p>
      )}
        <h4>Folders</h4>
        {folderContent.child_folders && Array.isArray(folderContent.child_folders) && folderContent.child_folders.length > 0 ? (
        <ul style={{ listStyleType: 'none', padding: 0, marginTop: '20px' }}>
            {folderContent.child_folders.map((folder)=>{
              return <li><Link to={`/folders/${folder._id}`}>📁{folder.name}</Link></li>
            })}
        </ul>
      ) : (
        <p>No folders in the folder</p>
      )}
      </div>
      <div style={{ display: 'flex',width: '30%', height:'80px' }}>
        <div style={{ width:'40%',height:'40px'}}>
          <button onClick={() => setShowUploadModal(true)} style={{backgroundColor:'#6b2a7d', color:'white' , boxShadow: '0.5px 2px 10px rgb(107, 46, 122, 0.3)',padding: '5px',borderRadius:'5px'}}>Upload a File</button>
          <Modal show={showUploadModal} onHide={() => setShowUploadModal(false)}>
            <Modal.Header closeButton>
              <Modal.Title>Upload a File</Modal.Title>
            </Modal.Header>
            <Modal.Body>
                <input
                  type="text"
                  value={selectedFile.name}
                  onChange={(e) => setSelectedFile({...selectedFile,name:e.target.value})}
                  placeholder="Enter folder name"
                  style={{ width: '100%', padding: '0.5rem', borderRadius: '5px', marginBottom: '1rem' }}
                />
                <input
                  type="file"
                  onChange={(e) => setSelectedFile({...selectedFile,file:e.target.files[0]})}
                  name='file'
                  ref={fileInputRef}
                  style={{ width: '100%', padding: '0.5rem', marginBottom: '1rem', border: '1px solid #ccc', borderRadius: '5px' }}
                />
              {uploading && <p>Uploading...</p>}
            </Modal.Body>
            <Modal.Footer>
              <Button variant="danger" onClick={() => setShowUploadModal(false)}>
                Close
              </Button>
              <Button style={{backgroundColor:'#6b2a7d'}} onClick={handleFileUpload} disabled={!selectedFile}>
                Upload
              </Button>
            </Modal.Footer>
          </Modal>
        </div>
        <div style={{width:'45%', height:'40px'}}>
          <button onClick={() => setShowCreateModal(true)} style={{backgroundColor:'#6b2a7d', color:'white' , boxShadow: '0.5px 2px 10px rgb(107, 46, 122, 0.3)',padding: '5px',borderRadius:'5px'}}>Create a Folder</button>
          <Modal show={showCreateModal} onHide={() => setShowCreateModal(false)}>
            <Modal.Header closeButton>
              <Modal.Title>Create a Folder</Modal.Title>
            </Modal.Header>
            <Modal.Body>
              <input
                type="text"
                value={newFolderName}
                onChange={(e) => setNewFolderName(e.target.value)}
                placeholder="Enter folder name"
              />
              {creatingFolder && <p>Creating folder...</p>}
            </Modal.Body>
            <Modal.Footer>
              <Button variant="danger" onClick={() => setShowCreateModal(false)}>
                Close
              </Button>
              <Button variant="primary" onClick={handleCreateFolder} disabled={!newFolderName}>
                Create Folder
              </Button>
            </Modal.Footer>
          </Modal>
        </div>
      </div>
    </div>:
    "Loading"
    }
    </>
  );
}

export default FolderComponent;




