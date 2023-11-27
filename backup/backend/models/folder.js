import mongoose from 'mongoose';

const FolderSchema = new mongoose.Schema({
    name:{
        type:String,
        required:true
    },
    parent_id:{
        type:mongoose.Schema.Types.ObjectId,
        ref:'Folders',
        default:null
    }
    
},{
    timestamps:true
});

export default mongoose.model('Folders', FolderSchema);


