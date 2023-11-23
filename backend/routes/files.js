import express from 'express';
import {
    createFile,
    GetFiles,
    UpdateFiles,
    DeleteFile,
    GetFileDetail,
} from '../controllers/files.js';
import auth from '../middlewares/auth.js';
import multer from 'multer';

const uploadfile=multer({
  storage:multer.diskStorage({
    destination:function(req,file,callback){  
      callback(null,'./uploads');
    },
    filename:function(req,file,callback){
      callback(null,Date.now()+"-"+file.originalname)
    }
  })
}).single('file');


const router= express.Router();

router.post('/',auth,uploadfile,createFile);
router.get('/',auth,GetFiles);
router.get('/:id',auth,GetFileDetail);
router.patch('/:id',auth,UpdateFiles);
router.delete('/:id',auth,DeleteFile);


export default router;