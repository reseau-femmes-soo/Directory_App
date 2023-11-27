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
import { MdClose, MdMoreVert,MdDelete } from 'react-icons/md';
import { useUser } from './../../Auth/UserContext';
import { FaFileArchive, FaFile, FaFileImage } from 'react-icons/fa';
import { FiFileText } from 'react-icons/fi';
import {BiSolidFilePdf} from 'react-icons/bi';
import {BsFiletypeXls, BsFiletypePng} from 'react-icons/bs';
import {AiFillFileWord} from 'react-icons/ai';
import { RiErrorWarningLine } from 'react-icons/ri';
import {DELETE, GET, POST, POSTFILE} from '../../api/Axios'
import { toast } from 'react-toastify';

function FolderComponent() {
  const { folderId, } = useParams();
  const [folders, setFolders] = useState(null);
  const [newFolderName, setNewFolderName] = useState('');
  const [loading, setLoading] = useState(true);
  const [selectedFile, setSelectedFile] = useState({
    name:'',
    file:null,
    folder_id:folderId
  });
  const userRole=localStorage.getItem('role');
  const [uploading, setUploading] = useState(false);
  const [creatingFolder, setCreatingFolder] = useState(false);
  const [showCreateModal, setShowCreateModal] = useState(false);
  const [showUploadModal, setShowUploadModal] = useState(false);
  const fileInputRef = useRef(null);
  const [fileContent, setFileContent] = useState([]);
  const [showDropdown, setShowDropdown] = useState(null); // Add this line
  const [success, setSucess] = useState(0); // Add this line
  const [file, setFile] = useState({
    name:'',
    file:null,
    folder_id:folderId
  });
  const [fileList, setFileList] = useState([]);

  const { user } = useUser();

  

  const getFolder=async ()=>{
    const response =await GET('/folder/'+folderId,setLoading);
    if(response){
      setFolders(response.data);
      
    }
 }


  useEffect(() => {
    getFolder();
  }, [success,folderId]);

  const handleCreateFolder = async() => {
    setUploading(true)
    const response= await POST('/folder',{name:newFolderName,parent_id:folderId},setUploading);
    if(response){
      setNewFolderName('');
      getFolder();
      setShowCreateModal(false);
      setUploading(false)
      setSucess(success+1);
    }
  };

  const [selected, setSelected] = useState({
    id:'',
    is_folder:''
  });
  const [showDeleteFolderModal, setShowDeleteFolderModal] = useState(false);

  // ... // -/\- \\ ... (previous code) ... // -/\- \\ ...
  const confirm_delete=(id,is_folder)=>{
    setSelected({
      id:id,is_folder:is_folder
    })
    setShowDeleteFolderModal(true);
  }

    
  const handleUpload = async () => {
    setUploading(true)
    const response = await POSTFILE('/file',file,setUploading);
    if(response){
      toast.success(response.data.message);
      setFile({
        name:"",
        file:"",
        folder_id:folderId
      })
      setUploading(false)
    }
    setShowUploadModal(false);
    setSucess(success+1);
  };
    
  function getFileIcon(fileType) {
    
    fileType=fileType.path.url.slice(fileType.path.url.lastIndexOf(".")+1);

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
  
  const handleDelete = async () => {
    // console.log(selected)
    if(selected.is_folder==='folder'){
      setUploading(true)
      const response= await DELETE('/folder/'+selected.id,setUploading);
      if(response){
        toast.success(response.data.meassage);
        setSucess(success+1);
        setUploading(false)
      }
    }else if(selected.is_folder==='file'){
      setUploading(true)
      const response= await DELETE('/file/'+selected.id,setUploading);
      if(response){
        toast.success(response.data.meassage);
        setUploading(false)
        setSucess(success+1);
      }
    }
    setShowDeleteFolderModal(false);
     
  };
  
  
  return (
    <div className="container" style={{marginTop:'100px',backgroundColor:'#ffffff',border:'1px solid rgba(0, 0, 0, 0.175)',borderRadius:'10px' }}>
      <div style={{ display: 'flex', justifyContent: 'space-between'}} className='mt-4'>
        <div>
          <h3>Content </h3>
        </div>
        {
          userRole==="admin"?  
            <div >
                <button class="btn" onClick={() => setShowUploadModal(true)} style={{width:'200px'}}>Upload a File</button>
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
                      className='form-control'
                    />
                    <input
                      type="file"
                      onChange={(e) => setFile({...file,file:e.target.files[0]})}
                      name='file'
                      ref={fileInputRef}
                      className='form-control mt-3'
                    />
                    {uploading && <p style={{ color: '#27ae60' }}>Uploading...</p>}
                  </Modal.Body>
                  <Modal.Footer style={{ borderTop: 'none' }}>
                    <button className="btn"  onClick={() => setShowUploadModal(false)}>
                      Close
                    </button>
                    <button className="btn" onClick={handleUpload} disabled={uploading} >
                      {uploading ? 'Uploading...' : 'Upload'}
                    </button>
                  </Modal.Footer>
                </Modal>
              
              
                <button class="btn" onClick={() => setShowCreateModal(true)} style={{width:'200px'}}>Create a Folder</button>
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
                    className='form-control'
                  />
                  {creatingFolder && <p style={{ color: '#6b2a7d' }}>Creating folder...</p>}
                </Modal.Body>
                <Modal.Footer style={{ borderTop: 'none' }}>
                  <button className='btn' onClick={() => setShowCreateModal(false)}>
                    Close
                  </button>
                  <button className='btn' onClick={handleCreateFolder} disabled={uploading}>
                    {uploading ? 'Creating...' : 'Create Folder'}
                  </button>
                </Modal.Footer>
              </Modal>
              
            </div>
          :''
          }
      </div>
      {loading ? (
        <Spinner animation="border" role="status">
          <span className="sr-only">Loading...</span>
        </Spinner>
      ) : (
        <div className='row p-4 mt-4' >

          {
           folders.child_folders.map(folder => (
              <div className='col-md-2 col-sm-4 col-4 mt-3' key={folder._id} >
                  <center>
                      <div style={{ display: 'flex', justifyContent: 'center',border:'1px solid rgba(0, 0, 0, 0.175)',borderRadius:'5px'}} >
                        <Link to={`/folders/${folder._id}`} style={{ textDecoration: 'none' }}>
                          <span style={{ fontSize: '48px', color: '#6b2a7d' }}>
                            <FaFolderOpen  />
                          </span>
                            <div style={{ marginTop: '5px', color: 'black', textDecoration: 'none' }}>{folder.name}</div>
                        </Link>
                        <div style={{position:'absolute',right:'15px',top:'5px'}}>
                          {userRole==="admin" && (
                            <MdDelete  style={{ fontSize: '23px', color: 'black',cursor:'pointer',float:'right'}} onClick={() => confirm_delete(folder._id,'folder')}/>
                          )}
                        </div>
                      </div>
                    </center>
                  
              </div>
            ))
          }
          
          {Array.isArray(folders.files) && folders.files.map(file => (
        <div key={file._id} className='col-md-2 col-sm-4 col-4 mt-4'>
            <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center',border:'1px solid rgba(0, 0, 0, 0.175)',borderRadius:'5px',marginTop:'-8px'}}>
              <div style={{paddingTop:'18px',paddingBottom:'5px'}}>
                <div >
                  {getFileIcon(file)}
                </div>
              <div style={{ marginTop: '7px' }}>{file.name || file.fileName}</div>
              </div>
            </div>
            <div style={{ position: 'absolute', top: '10px', right: '10px' }}>
              <div className={`dropdown ${showDropdown === file._id ? 'show' : ''}`}>
               <MdMoreVert onClick={() => setShowDropdown(showDropdown === file._id ? null : file._id)} id={`fileOptions${file._id}`} style={{fontSize:'25',marginTop:'-20px',cursor:'pointer'}}/>
                
                <div className={`dropdown-menu ${showDropdown === file._id ? 'show' : ''}`} aria-labelledby={`fileOptions${file._id}`}>
                  {userRole==="admin" && (
                    <button className="dropdown-item" onClick={() => confirm_delete(file._id,'file')} disabled={loading}>
                      <span role="img" aria-label="Delete" style={{ fontSize: '18px', marginRight: '5px' }}>🗑️</span>
                      {uploading?"Deleting...":"Delete"}
                    </button>
                  )}
                  <button className="dropdown-item" onClick={() => handleDownloadFile(file)}>
                    <span role="img" aria-label="Download" style={{ fontSize: '18px', marginRight: '5px' }}>📥</span>
                    Download
                  </button>
                </div>
              </div>
            </div>
        </div>
      ))}
        </div>
      )}
      
      
     
      <Modal show={showDeleteFolderModal} onHide={() => setShowDeleteFolderModal(false)} centered>
      <Modal.Header closeButton style={{ display: 'flex', justifyContent: 'center', alignItems: 'center', textAlign: 'center' }}>
      <RiErrorWarningLine className="error-icon" style={{ color: 'orange', fontSize: '80px' }} />
      </Modal.Header>
      <Modal.Body>
        <h5 style={{textAlign:'center', marginTop:'-20px'}}>Are you Sure?</h5>
        <p style={{textAlign:'center'}}>You won't be able to revert this!</p>
      </Modal.Body>
      <Modal.Footer style={{display:'flex', justifyContent:'center'}}>
      <button className={'btn'} onClick={()=>handleDelete()} disabled={uploading}>
          {uploading?'Deleting':'Yes, Delete it!'}
        </button>
        <button className={'btn'} disabled={uploading} onClick={() => setShowDeleteFolderModal(false)}>
          Cancel
        </button>
      </Modal.Footer>
    </Modal>
    </div>
  );
}

export default FolderComponent;




