import mongoose from 'mongoose';

const FileSchema = new mongoose.Schema({
    name:{
        type:String,
        required:true
    },
    path:{ 
        type: Object, 
        required:true 
    },
    folder_id:{
        type:mongoose.Schema.Types.ObjectId,
        ref:'Folders',
        default:null
    }
    
},{
    timestamps:true
});

export default mongoose.model('Files', FileSchema);


