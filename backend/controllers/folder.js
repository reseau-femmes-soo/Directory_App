import Files from "../models/files.js";
import Folders from "../models/folder.js";
import Joi from 'joi';

const addFolderSchema = Joi.object({
    name: Joi.string().required(),
    parent_id:Joi.allow(),
    
});

const updateFolderSchema = Joi.object({
    _id: Joi.allow(),
    name: Joi.string().required().messages({
        'string.base': "le nom doit être une chaîne"
    }),
    parent_id:Joi.allow(),
});

export const createFolder= async (req, res)=>{   
    const {name}=req.body;
    const folder=req.body;
    try{
        const { error, value } = addFolderSchema.validate(req.body);

        if (error) {
            // Return a 400 Bad Request response if validation fails
            if(error.details[0].message.includes("is not allowed to be empty")){
                return res.status(400).json({ message:error.details[0].message.replace("is not allowed to be empty","il n'est pas permis d'être vide")});
            }
            return res.status(400).json({ message: error.details[0].message });
        }
       
        const existingFolder= await Folders.findOne({name});
        if (existingFolder)
            return res.status(400).json({ message:'Le dossier existe déjà...'});


        
        const NewFolder= new Folders({...folder});
        const savedFolder = await NewFolder.save();

        // Check if the folder was successfully added
        if (savedFolder) {
          // Return a 200 status with a success message
          return res.status(200).json({ message: 'Dossier ajouté avec succès.' });
        } else {
          // If for some reason the folder was not saved, return a 500 status
          return res.status(500).json({ message: "Échec de l'ajout du dossier." });
        }

    }catch(error){
        // If an error occurs during the process, return a 500 status with the error message
        console.error('Error creating folder:', error);
        return res.status(500).json({ message: error });
    }
}

export const GetFolders=async(req, res)=>{  
    try{
        const folders= await Folders.find({parent_id:null});
        return res.status(200).json(folders);
    }catch(error){  
        // If an error occurs during the process, return a 500 status with the error message
        console.error('Error creating folder:', error);
        return res.status(500).json({ message: error });
    }

}

export const GetFolderDetail=async(req, res)=>{ 
    const {id}=req.params;

    try{
        const folder= await Folders.findOne({_id:id});
        const child_folders= await Folders.find({parent_id:id});
        const files= await Files.find({folder_id:id});
        const response={folder,child_folders,files}
        return res.status(200).json(response);
    }catch(error){  
        // If an error occurs during the process, return a 500 status with the error message
        console.error('Error creating folder:', error);
        return res.status(500).json({ message: error });
    }

}

export const UpdateFolders=async(req, res)=>{
    const id=req.params.id;
    const folder=req.body;
    
    try{
        
        const { error, value } = updateFolderSchema.validate(req.body);
        if (error) {
            // Return a 400 Bad Request response if validation fails
            if(error.details[0].message.includes("is not allowed to be empty")){
                return res.status(400).json({ message:error.details[0].message.replace("is not allowed to be empty","il n'est pas permis d'être vide")});
            }
            return res.status(400).json({ message: error.details[0].message });
        }

        const existingFolder=await Folders.findOne({
            _id:{$ne:id},
            name:folder?.name
        });
        if (existingFolder)
            return res.status(400).json({ message:'Le dossier existe déjà...'});


        const updatedFolder= await Folders.findByIdAndUpdate(
            id,
            folder,
            {
                new:true
            }
        );

        return res.status(200).json({ message:'Dossier mis à jour avec succès...'});

    }catch(error){  
        // If an error occurs during the process, return a 500 status with the error message
        console.error('Error creating folder:', error);
        return res.status(500).json({ message: error });
    }

}


export const DeleteFolder= async (req,res)=>{
    const {id} = req.params;
    console.log(id)
    try {
        const subdepartmenCount = await Folders.countDocuments({parent_id:id});
        const subfileCount = await Files.countDocuments({folder_id:id});
        console.log({subdepartmenCount,subfileCount})
        if(subdepartmenCount>0 ||  subfileCount>0){
            return res.status(404).json({ message: "Impossible de supprimer le dossier car il contient des sous-dossiers et des fichiers" });
        }
        const deleteFolder=await Folders.findOneAndDelete({_id:id});
        return res.status(200).json({ message: "Dossier supprimé"});
    } catch (error) {
        console.error('Error creating folder:', error);
        return res.status(500).json({ message: error });
    }

}




