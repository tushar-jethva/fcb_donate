const express = require('express');
const NGOModel = require('../models/ngo_models');
const NgoRouter = express.Router();
const TempNGOModel = require('../models/temp_ngo');
const  DonationModel = require('../models/donation');
NgoRouter.post("/api/addNgo",async(req,res)=>{
    try{
        const{id} = req.body;  
        console.log(req.body);
        let isExist = await TempNGOModel.findById(id);
        if(!isExist){
            return res.status(400).json({msg:"No Ngo is found!"});
        }
        await TempNGOModel.findByIdAndDelete(id);
        let ngo = new NGOModel({
            username:isExist.username,
            password:isExist.password,
            ngo_name:isExist.ngo_name,
            ngo_admin:isExist.ngo_admin,
            mobile_no:isExist.mobile_no,
            website:isExist.website,
            books:isExist.books,
            food:isExist.food,
            clothes:isExist.clothes,
            money:isExist.money,
            payNumber:isExist.payNumber,
            area:isExist.area,
            city:isExist.city,
            state:isExist.state,
            description:isExist.description,
            ngo_photo:isExist.ngo_photo,
            regNumber:isExist.regNumber,
            regProof:isExist.regProof,
            annualRepo:isExist.annualRepo,
        });
        ngo = await ngo.save();
        res.json(ngo);
    }
    catch(e){
        res.status(500).json({err:e.message});
    }
});

//decline Ngo
NgoRouter.post("/api/declineNgo", async(req,res) => {
    const {id} = req.body;
    await TempNGOModel.findByIdAndDelete(id);
    res.json({"msg":"Declined Ngo Successfully"});
})

//fetch ngo by city and donation
NgoRouter.get("/api/getNgoByCity",async(req,res)=>{
    try{
        let city = req.query.city;
        let type = req.query.type;
        let allNgoByCity = await NGOModel.find({city});
        if(allNgoByCity.length == 0){
            return res.status(400).json({msg:"No NGO found for this city!"});
        }
        let list=[];
        for(let i=0;i<allNgoByCity.length;i++){
            switch(type){
                case "books": if(allNgoByCity[i].books==1){
                            list.push(allNgoByCity[i]);
                        }
                break;
                case "food": if(allNgoByCity[i].food==1){
                    list.push(allNgoByCity[i]);
                }
                break;
                case "clothes": if(allNgoByCity[i].clothes==1){
                    list.push(allNgoByCity[i]);
                }
                break;
                case "money": if(allNgoByCity[i].money==1){
                    list.push(allNgoByCity[i]);
                }
                break;
            }
        }
        // console.log("This is new list:"+list);
        res.json(list);
    }
     
    catch(e){
        res.status(500).json({err:e.message});
    }
    //
});

//get ngo details
NgoRouter.get("/api/getNgoDetails",async(req,res)=>{
    try{
        let name = req.query.id;
        let findNgo = await NGOModel.findById(id);
        if(!findNgo){
            return res.status(400).json({msg:"No NGO found for this name!"});
        }
        res.json(findNgo);
    }
    catch(e){
        res.status(500).json({err:e.message});
    }
});


//addTemp ngo
NgoRouter.post("/api/addNgoTemp",async(req,res)=>{
    try{
        const{ngo_name,ngo_admin,mobile_no,website,books,food,clothes,money,payNumber,area,city,state,description,ngo_photo,regNumber,regProof,annualRepo} = req.body;  
        console.log(req.body);
        let isExist = await TempNGOModel.findOne({ngo_name});
        if(isExist){
            return res.status(400).json({msg:"Ngo is already added!"});
        }
        let ngo = new TempNGOModel({
            username:ngo_name,
            password:mobile_no,
            ngo_name,
            ngo_admin,
            mobile_no,
            website,
            books,
            food,
            clothes,
            money,
            payNumber,
            area,
            city,
            state,
            description,
            ngo_photo,
            regNumber,
            regProof,
            annualRepo,
        });
        ngo = await ngo.save();
        res.json(ngo);
    }
    catch(e){
        res.status(500).json({err:e.message});
    }
});


NgoRouter.get("/api/getAllTempNgo",async (req,res) => {
    try{
        let tempNgo = await TempNGOModel.find({});
        res.json(tempNgo);
    }catch(e){
        res.status(500).json({err:e.message})
    }
})

NgoRouter.get("/api/getAllNgo",async(req,res) => {
    try{
        let allNgos = await NGOModel.find({});
    res.json(allNgos);
    }
    catch(e){
        res.status(500).json({err:e.message});
    }

    //delete ngo

    NgoRouter.post("/api/deleteNgo",async(req,res) => {
        try{
            const {id}=req.body;
               
        let ngomodel = await NGOModel.findByIdAndDelete(id);
           ngomodel = await ngomodel.save();
           return ngomodel;
            
        }catch(e){
            res.status(500).json({err:e.message});
        }
    })});

    NgoRouter.post('/api/acceptDonation',async(req,res) => {
        try{
            const {donationId}= req.body;
            // console.log(donationId);
            let donation = await DonationModel.findById(donationId);
            
        //    console.log(donation)

            if(donation.status != 0){
                return res.status(400).json({msg:'Donation is already Visited'})
            }
            
            donation.status=1;
            
            await donation.save()
            res.json({msg:"Donation accepted"})
        }catch(e){
            res.status(500).json({error:e.message})
            console.log(e.message);
        }
    })


    NgoRouter.post('/api/declineDonation',async(req,res) => {
        try{
            const {donationId}=req.body;
            let donation = await DonationModel.findById(donationId);
            donation.status = 2;
            console.log(donation)
            await donation.save();
            res.json({msg:"Donation declined"})
        }catch(e){
            res.status(500).json({error:e.message})
        }
    })

module.exports = NgoRouter;