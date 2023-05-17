const mongoos = require("mongoose");

 DonationSchema =   mongoos.Schema({
  ngoId:{
    type:String,
    require:true,
  },
  status:{
type:Number,
default:0
  },
  userId:{
    require:true,
      type:String,
  },
  mobile1:{
    require:true,
    type:String,
    trim:true
  },
  mobile2:{
    
    type:String,
    trim:true
  },

  userName:{
    require:true,
    type:String,
    trim:true
  },
  ngoName:{
    require:true,
    type:String,
    trim:true
  },
  category:{
    require:true,
    type:String,
    trim:true
  },
  description:{
    require:true,
    type:String,
    trim:true
  },
  address:{
    require:true,
    type:String,
    trim:true
  }, city:{
    require:true,
    type:String,
    trim:true
  }, state:{
    require:true,
    type:String,
    trim:true
  },
  pincode:{
    require:true,
    type:String,
    trim:true
  },
  images:[
    {
        type:String,
        required:true
    }
],

 },);

 const DonationModel = mongoos.model("Donations",DonationSchema);

 module.exports = DonationModel;
 