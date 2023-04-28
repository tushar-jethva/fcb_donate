const mongoose = require('mongoose');

NgoSchema = mongoose.Schema({

   ngo_name:{
       required:true,
       type:String,
   },
   ngo_admin:{
       required:true,
       type:String,
   },
   city:{
       required:true,
       type:String,
   },
   area:{
       required:true,
       type:String,
   },
   description:{
       required:true,
       type:String,
   },
   mobile_no:{
       required:true,
       type:String,
   },
   image:{
       default:"",
       type:String,
   }

},);

const NGOModel = mongoose.model("NGOs",NgoSchema);
module.exports = NGOModel;