const mongoose = require('mongoose');

const ReceiptSchema = mongoose.Schema({
    user_id:{
        required:true,
        type:String
    },
    ngo_name:{
        required:true,
        type:String,
    },
    ngo_number:{
        required:true,
        type:String,
    },
    date:{
        required:true,
        type:String,
    },
    time:{
        required:true,
        type:String
    },
    status:{
        default:0,
        type:Number
    }
});

const ReceiptModel = mongoose.model('Receipts',ReceiptSchema);
module.exports = ReceiptModel;