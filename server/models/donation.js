const mongoos = require("mongoose");

 DonationSchema =   mongoos.Schema({
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

 });

 const DonationModel = mongoos.model("Donations",DonationSchema);

 module.exports = DonationModel;