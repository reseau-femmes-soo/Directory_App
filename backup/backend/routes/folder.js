import express from 'express';
import {
    createFolder,
    GetFolders,
    UpdateFolders,
    DeleteFolder,
    GetFolderDetail,
} from '../controllers/folder.js';
import auth from '../middlewares/auth.js';


const router= express.Router();

router.post('/',auth,createFolder);
router.get('/',auth,GetFolders);
router.get('/:id',auth,GetFolderDetail);
router.patch('/:id',auth,UpdateFolders);
router.delete('/:id',auth,DeleteFolder);


export default router;