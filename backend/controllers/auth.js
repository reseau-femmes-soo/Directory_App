import Users from "../models/users.js";
import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";
import Joi from 'joi';


export const Signin = async (req, res)=>{
    const {email,password} = req.body;
    try{


        const data=await Users.find()

        return response.status(200).json(data);

        // const loginSchema = Joi.object({
        //     email: Joi.string().email().required(),
        //     password: Joi.string().min(8).max(30).message('Password must be at least 8 characters long').required(),
        // });
        // const { error, value } = loginSchema.validate(req.body);

        // if (error) {
        //     // Return a 400 Bad Request response if validation fails
        //     return res.status(400).json({ message: error.details[0].message });
        // }

        // const user=await Users.findOne({email});
        // if(!user)
        //     return res.status(404).json({message:"User not found"});
        
        // const passwordMatched =await bcrypt.compare(password,user.password);
        // if(!passwordMatched)
        //     return res.status(404).json({message: "Invalid Password"})

        // const token= jwt.sign(
        //     {
        //         id:user._id,
        //         email:user.email,
        //         role:user.role
        //     },
        //     "Signin",
        //     {
        //         expiresIn: "3d"
        //     }
        // );
        
        // return res.status(200).json({message:"Sucessfully Login",token,role:user.role})

    }catch(error){
        return res.status(500).json({message:error})
    }
};