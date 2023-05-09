
const express = require("express");

const DonationModel = require("../models/donation");

const UserModel = require("../models/auth");
const DonationRouter = express.Router();

DonationRouter.post("/api/postDonation",async(req,res) => {
    try{
        const {ngoId,userId,mobile1,mobile2,ngoName,category,userName,description,images,address,pincode,city,state} = req.body;
        let donation = new DonationModel(
            {
                ngoId,
                userId,
                mobile1,
                mobile2,
                userName,
                ngoName,
                category,
                description,
                address,
                city,
                state,
                pincode,
                images
            },
            
        );
        donation =await donation.save();
        
        let user =await  UserModel.findById(userId);
         user.totalDonation =  user.totalDonation+1;
          user = await user.save();
          console.log(user);
        res.json(donation);
    }catch(e){
        res.status(500).json({err:e.message});
    }
});

DonationRouter.get('/api/getAllRequests',async(req,res) => {
   try{
    const ngoId = req.query.id;
    console.log(ngoId);
    let donation = await DonationModel.find(ngoId)
    console.log(donation)
    let list =[];
    for(var i=0;i<donation.length;i++){
        if(donation[i].status == 0){
            list.push(donation[i]);
        }
    }
    console.log(list);
    res.json(list);

   }catch(e){
    res.status(500).json({err:"not found"});
   }
});

module.exports = DonationRouter