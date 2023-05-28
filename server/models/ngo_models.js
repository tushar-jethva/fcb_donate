const mongoose = require('mongoose');
const donationSchema = require('../models/donation')

NgoSchema = mongoose.Schema({
    

    username:{
        required:true,
        type:String,
    },
    password:{
        required:true,
        type:String,
    },
    ngo_name:{
        required:true,
        type:String,
    },
    ngo_admin:{
        required:true,
        type:String,
    },
    mobile_no:{
        required:true,
        type:String,
    },
    website:{
        required:true,
        type:String
    },
    books:{
        default:0,
        type:Number,
    },
    food:{
        default:0,
        type:Number,
    },
    clothes:{
        default:0,
        type:Number,
    },
    money:{
        default:0,
        type:Number,
    },
    payNumber:{
        default:"",
        type:String
    },
    area:{
        required:true,
        type:String,
    },
    city:{
        required:true,
        type:String,
    },
    state:{
        required:true,
        type:String,
    },
    description:{
        required:true,
        type:String,
    },
    ngo_photo:{
        required:true,
        type:String,
    },
    regNumber:{
        required:true,
        type:String
    },
    regProof:{
        required:true,
        type:String,
    },
    annualRepo:{
        required:true,
        type:String
    }
});

const NGOModel = mongoose.model("NGOs",NgoSchema);
module.exports = NGOModel;