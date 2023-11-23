import React, { useState, useEffect } from 'react';

function SeperateFileContent() {
    const [file, setFile] = useState(null);
    const [fileList, setFileList] = useState([]);

    useEffect(() => {
      fetch('http://localhost:4000/files')
          .then(response => response.json())
          .then(data => {
              if (Array.isArray(data)) {
                  setFileList(data);
              } else {
                  console.error('Invalid data format received from the server:', data);
                  if (data && data.error) {
                      alert(`Error fetching file list: ${data.error}`);
                  }
              }
          })
          .catch(error => console.error('Error:', error));
  }, []);
  
  
  
  
  
  
    const handleFileChange = (e) => {
        setFile(e.target.files[0]);
    };

    const handleUpload = () => {
        const formData = new FormData();
        formData.append('file', file);

        fetch('http://localhost:4000/upload', {
            method: 'POST',
            body: formData,
        })
        .then(response => response.json())
        .then(data => {
            if (data.file && typeof data.file === 'object') {
                setFileList(prevFileList => [...(prevFileList || []), data.file]);
            } else {
                console.error('Invalid data format received from the server:', data);
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
    };

    const handleDelete = (fileId) => {
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
        <div>
            <input type="file" onChange={handleFileChange} />
            <button onClick={handleUpload}>Upload</button>

            <h2>File List</h2>
            <ul>
                {Array.isArray(fileList) && fileList.map(file => (
                    <li key={file._id}>
                        <strong>{file.filename}</strong> 
                        <button onClick={() => handleDelete(file._id)}>Delete</button>
                    </li>
                ))}
            </ul>
        </div>
    );
}

export default SeperateFileContent;