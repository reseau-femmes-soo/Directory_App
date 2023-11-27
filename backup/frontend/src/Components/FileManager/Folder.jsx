import React from 'react';

const Folder = ({ folder, onDeleteFolder, onNavigate }) => {
  return (
    <div key={folder._id} style={{ marginBottom: '10px', display: 'flex', alignItems: 'center' }}>
      <span role="img" aria-label="Folder" style={{ marginRight: '10px' }}>
        📁
      </span>
      {folder && folder._id !== undefined ? (
        <div onClick={() => onNavigate(folder)} style={{ cursor: 'pointer' }}>
          {folder.name}
        </div>
      ) : (
        <p>Folder ID not available</p>
      )}
      <button onClick={() => onDeleteFolder(folder._id)}>Delete</button>
    </div>
  );
};

export default Folder;
