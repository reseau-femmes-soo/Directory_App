import express from 'express';

import { Signin } from '../controllers/auth.js';
const router= express.Router();

router.get('/signin',Signin);


export default router;