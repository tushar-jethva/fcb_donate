const mongoose = require('mongoose');


const UserModel = mongoose.Schema({

    name:{
        required:true,
        trim:true,
        type:String,
    },
    email:{
        required: true,
        type: String,
        trim:true,
        validate:{
            validator: (value)=>{
                const re =
          /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
        return value.match(re);
            },
            message:"Enter valid email!",
        }
    },
    password:{
        required:true,
        type: String,
    },
    mobile_no:{
        default:"",
        type:String,
    },
    mobile_alt_no:{
        default:"",
        type:String,
    },
    address:{
        default:"",
        type:String,
    },
    type:{
        default:"user",
        type:String,
    },

});

const User = mongoose.model('Users',UserModel);
module.exports = User;

