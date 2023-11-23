import express from 'express';
import {
    createUser,
    GetUsers,
    UpdateUsers,
    DeleteUser,
    GetUserDetail,
    GetProfile,
    UpdateProfile
} from '../controllers/users.js';
import auth from '../middlewares/auth.js';


const router= express.Router();

router.post('/',createUser);
router.get('/',auth,GetUsers);
router.get('/profile',auth,GetProfile);
router.patch('/profile',auth,UpdateProfile);
router.get('/:id',auth,GetUserDetail);
router.patch('/:id',auth,UpdateUsers);
router.delete('/:id',auth,DeleteUser);


export default router;