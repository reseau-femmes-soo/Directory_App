import express, { response } from 'express';

import { Signin } from '../controllers/auth.js';
const router= express.Router();

router.get('/signin',(req,res)=>{
    res.send("Hello")
});


export default router;