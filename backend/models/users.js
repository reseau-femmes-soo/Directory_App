import mongoose from 'mongoose';

const UserSchema = new mongoose.Schema({
    username:{
        type:String,
        required:true
    },
    name:{
        type:String,
        required:true
    },
    email:{
        type:String,
        required:true
    },
    password:{
        type:String,
        required:true
    },
    phone:{
        type:String,
        required:true
    },
    address:{
        type:String,
        default:null
    },
    zip:{
        type:String,
        default:null
    },
    job_designation:{
        type:String,
        default:null
    },
    role:{
        type:String,
        required:true
    },
},{
    timestamps:true
});

export default mongoose.model('Users', UserSchema);


