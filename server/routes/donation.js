const express = require("express");
const DonationModel = require("../models/donation");
const UserModel = require("../models/auth");
const ReceiptModel = require("../models/receipt");
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
        let user1 = await UserModel.findById(userId);
        let user =await  UserModel.findByIdAndUpdate(userId,{totalDonation:user1.totalDonation+1},{new:true});
        //  user.totalDonation =  user.totalDonation+1;
        //   user = await user.save();
        console.log(user);
        res.json(donation);
    }catch(e){
        res.status(500).json({error:e.message});
    }
});

DonationRouter.get('/api/getAllRequests',async(req,res) => {
   try{
    const ngoId = req.query.id;
   
    let donation = await DonationModel.find({ngoId})
   
    let list =[];
    for(var i=0;i<donation.length;i++){
        if(donation[i].status == 0){
            list.push(donation[i]);
        }
    }
    
    res.json(list);

   }catch(e){
    res.status(500).json({error:e.message});
   }
});

DonationRouter.get('/api/fetchAcceptedDonation',async(req,res) => {
    try{
        const ngoId = req.query.ngoId;
        let donations  = await DonationModel.find({ngoId})
        let list=[];
        for(let i=0;i<donations.length;i++){
            if(donations[i].status == 1){
                list.push(donations[i]);
            }
        }
        res.json(list);
    }catch(e){
        res.status(500).json({error:e.message})
    }
});

DonationRouter.post('/api/generateReceipt',async(req,res)=>{
    const{user_id,ngo_name,ngo_number,date,time,status} = req.body;

    let receipt = new ReceiptModel({
        user_id,
        ngo_name,
        ngo_number,
        date,
        time,
        status
    });
    receipt = await receipt.save();
    res.json(receipt);  
});

DonationRouter.get('/api/getAllReceipts',async(req,res)=>{
    const user_id = req.query.user_id;
    let receipts = await ReceiptModel.find({user_id});
    res.json(receipts);
});

// DonationRouter.get('/api/getTotalDonation',async(req,res)=>{
//     const id = req.query.id;
//     let donation = await DonationModel.find({userId:id});
//     console.log(donation);
//     res.json({totalDonation:donation.length});
// })
module.exports = DonationRouter