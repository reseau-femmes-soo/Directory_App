import express from 'express';

import { Signin } from '../controllers/auth.js';
const router= express.Router();

router.post('/signin',Signin);


export default router;