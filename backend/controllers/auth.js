import Users from "../models/users.js";
import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";
import Joi from 'joi';
import nodemailer from "nodemailer";


export const Signin = async (req, res)=>{
    const {email,password} = req.body;
    try{
      const loginSchema = Joi.object({
        email: Joi.string()
            .email().min(1)  // Adjust this validation as needed
            .required()
            .messages({
                'string.email': '\"e-mail\" doit être une adresse e-mail valide',
                'string.base': "l'e-mail doit être une chaîne"
            }),
        password: Joi.string()
            .min(8).max(30)
            .required()
            .messages({
                'string.min': 'Le mot de passe doit comporter au moins 8 caractères',
                'string.max': 'Le mot de passe ne doit pas dépasser 30 caractères',
                'string.base': 'le mot de passe doit être une chaîne'
            }),
    });
    
    
  
      const { error, value } = loginSchema.validate(req.body);

      if (error) {
          // Return a 400 Bad Request response if validation fails
          if(error.details[0].message.includes("is not allowed to be empty")){
            return res.status(400).json({ message:error.details[0].message.replace("is not allowed to be empty","il n'est pas permis d'être vide")});
          }
          return res.status(400).json({ message: error.details[0].message });
      }

      const user=await Users.findOne({email});
      if(!user)
          return res.status(404).json({message:"Utilisateur non trouvé"});
      
      const passwordMatched =await bcrypt.compare(password,user.password);
      if(!passwordMatched)
          return res.status(404).json({message: "Mot de passe incorrect"})

      const token= jwt.sign(
          {
              id:user._id,
              email:user.email,
              role:user.role
          },
          "Signin",
          {
              expiresIn: "3d"
          }
      );
      
      return res.status(200).json({message:"Connectez-vous avec succès",token,role:user.role})

    }catch(error){
      console.log(error)
        return res.status(500).json({message:error})
    }
};




export const ForgotPassword = async (req, res) => {
  
    const { email } = req.body;
    try {
      const existingUser = await Users.findOne({ email });
      if (!existingUser)
        return res.status(201).json({ message: "Email invalide" });
      
      const token = randomString(10);
      await Users.findByIdAndUpdate(
        existingUser._id,
        { resetToken: token },
        {
          new: true,
        }
      );
      let transporter = nodemailer.createTransport({
        host: "smtp.gmail.com",
        port: 587,
        secure: false,
        auth: {
          user: "naseerjdmatrix@gmail.com",
          pass: "gxetqmvtrdqdiaoj",
        },
      });
  
      transporter.verify(function (error, success) {
        if (error) {
          console.log(error);
        } else {
          console.log("Server is ready to take our messages");
        }
      });
  
      transporter.sendMail(
        {
          from: "'No Reply' <naseerjdmatrix@gmail.com>",
          to: email,
          subject: "Reset Password Link",
          html: `<html>
                  <body>
                  <p>Click on the reset passward link to change your password</p>
                  <a href="${process.env.CLIENT_URL}/reset_password/${token}">${process.env.CLIENT_URL}/reset-password/${token}</a>
                  </body>
                  </html>`,
        },
        (error, info) => {
          if (error) {
            res.status(404).json("L'email n'est pas valide!");
          } else {
            res.status(200).json({
              error:false,
              message: "Veuillez vérifier votre courrier électronique pour obtenir le lien de réinitialisation du mot de passe.",
            });
          }
        }
      );
    } catch (error) {
      res.status(404).json({ message: error.message });
    }
  };
  
  export const getToken = async (req, res) => {
    const id = req.params.id;
    try {
      const data = await Users.findOne({ resetToken: id });
      res.status(200).json({ data });
    } catch (error) {
      res.status(404).json({ message: error.message });
    }
  };
  
  export const ResetPassword = async (req, res) => {
    const token = req.params.token;
    const { password } = req.body;
    try {
      const existingUser = await Users.findOne({ resetToken:token });
      if (!existingUser)
        return res.status(404).json({ message: "Jeton invalide" });
  
      const hashPassword = await bcrypt.hash(password, 10);
      const data = await Users.findByIdAndUpdate(
        existingUser._id,
        { resetToken:null,
          password: hashPassword },
        {
          new: true,
        }
      );
      res.status(200).json({error:false,message:"Le mot de passe a été changé avec succès"});
    } catch (error) {
      res.status(404).json({ message: error.message });
    }
  };
  
  function randomString(length) {
    var result = '';
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    for (var i = length; i > 0; --i) result += chars[Math.floor(Math.random() * chars.length)];
    return result;
  }
  
