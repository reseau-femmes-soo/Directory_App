import Users from "../models/users.js";
import Joi from 'joi';
import bcrypt from 'bcryptjs';

const addUserSchema = Joi.object({
    username: Joi.string().alphanum().min(3).max(30).required(),
    name: Joi.string().min(3).max(30).required(),
    email: Joi.string().email().required(),
    password: Joi.string().min(8).max(30).message('Password must be at least 8 characters long').required(),
    phone: Joi.string().required(),
    job_designation:Joi.string().allow(null),
    address: Joi.string(),
    role:Joi.string().required()
});

const updateUserSchema = Joi.object({
    _id: Joi.string().required(),
    username: Joi.string().alphanum().min(3).max(30).required(),
    name: Joi.string().min(3).max(30).required(),
    email: Joi.string().email().required(),
    phone: Joi.string().required(),
    address: Joi.string().allow(null),
    role:Joi.string().required(),
    job_designation:Joi.string().allow(null),
    zip: Joi.string().allow(null).optional(),
    createdAt: Joi.allow(),
    updatedAt: Joi.allow(),
    __v: Joi.allow()
});

export const createUser= async (req, res)=>{   
    const {email,password}=req.body;
    const user=req.body;
    try{
        const { error, value } = addUserSchema.validate(req.body);

        if (error) {
            // Return a 400 Bad Request response if validation fails
            return res.status(400).json({ message: error.details[0].message });
        }
       
        const existingUser= await Users.findOne({email});
        console.log(existingUser)
        if (existingUser)
            return res.status(400).json({ message:'User already exist...'});


        const hashPassword = await bcrypt.hash(password, 10);
        const NewUser= new Users({...user,password:hashPassword});
        const savedUser = await NewUser.save();

        // Check if the user was successfully added
        if (savedUser) {
          // Return a 200 status with a success message
          return res.status(200).json({ message: 'User successfully added.' });
        } else {
          // If for some reason the user was not saved, return a 500 status
          return res.status(500).json({ message: 'Failed to add user.' });
        }

    }catch(error){
        // If an error occurs during the process, return a 500 status with the error message
        console.error('Error creating user:', error);
        return res.status(500).json({ message: error });
    }
}

export const GetUsers=async(req, res)=>{  
    try{
        const users= await Users.find({role:{$ne:"admin"}}).select('-password');
        return res.status(200).json(users);
    }catch(error){  
        // If an error occurs during the process, return a 500 status with the error message
        console.error('Error creating user:', error);
        return res.status(500).json({ message: error });
    }

}
export const GetProfile=async(req, res)=>{ 
    const {user_id}=req;
     
    try{
        const users= await Users.findOne({_id:user_id}).select('-password');
        return res.status(200).json(users);
    }catch(error){  
        // If an error occurs during the process, return a 500 status with the error message
        console.error('Error creating user:', error);
        return res.status(500).json({ message: error });
    }

}
export const GetUserDetail=async(req, res)=>{ 
    const {id}=req.params;

    try{
        const users= await Users.findOne({_id:id}).select('-password');
        return res.status(200).json(users);
    }catch(error){  
        // If an error occurs during the process, return a 500 status with the error message
        console.error('Error creating user:', error);
        return res.status(500).json({ message: error });
    }

}
export const UpdateProfile=async(req, res)=>{
    const {user_id}=req;
    const user=req.body;
    
    try{
        
        const { error, value } = updateUserSchema.validate(req.body);
        if (error) {
            // Return a 400 Bad Request response if validation fails
            return res.status(400).json({ message: error.details[0].message });
        }

        const existingUser=await Users.findOne({
            _id:{$ne:user_id},
            email:user?.email
        });
        if (existingUser)
            return res.status(400).json({ message:'User already exist...'});


        const updatedUser= await Users.findByIdAndUpdate(
            user_id,
            user,
            {
                new:true
            }
        );

        return res.status(200).json({ message:'User updated successfully...'});

    }catch(error){  
        // If an error occurs during the process, return a 500 status with the error message
        console.error('Error creating user:', error);
        return res.status(500).json({ message: error });
    }

}
export const UpdateUsers=async(req, res)=>{
    const id=req.params.id;
    const user=req.body;
    
    try{
        
        const { error, value } = updateUserSchema.validate(req.body);
        if (error) {
            // Return a 400 Bad Request response if validation fails
            return res.status(400).json({ message: error.details[0].message });
        }

        const existingUser=await Users.findOne({
            _id:{$ne:id},
            email:user?.email
        });
        if (existingUser)
            return res.status(400).json({ message:'User already exist...'});


        const updatedUser= await Users.findByIdAndUpdate(
            id,
            user,
            {
                new:true
            }
        );

        return res.status(200).json({ message:'User updated successfully...'});

    }catch(error){  
        // If an error occurs during the process, return a 500 status with the error message
        console.error('Error creating user:', error);
        return res.status(500).json({ message: error });
    }

}


export const DeleteUser= async (req,res)=>{
    const {id} = req.params;

    try {
        const deleteUser=await Users.findOneAndDelete({_id:id});
        return res.status(200).json({ message: "User Deleted"});
    } catch (error) {
        console.error('Error creating user:', error);
        return res.status(500).json({ message: error });
    }

}




