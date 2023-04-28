const express = require('express');
const NGOModel = require('../models/ngo_models');
const NgoRouter = express.Router();

//add ngo
NgoRouter.post("/api/addNgo",async(req,res)=>{
    try{
        const{ngo_name,ngo_admin,city,area,description,mobile_no,image} = req.body;
        let isExist = await NGOModel.findOne({ngo_name});
        if(isExist){
            return res.status(400).json({msg:"Ngo is already added!"});
        }

        let ngo = new NGOModel({
            ngo_name,
            ngo_admin,
            city,
            area,
            description,
            mobile_no,
            image
        })

        ngo = await ngo.save();
        res.json(ngo);
    }
    catch(e){
        res.status(500).json({err:e.message});
    }
});

//fetch ngo by city
NgoRouter.get("/api/getNgoByCity",async(req,res)=>{
    try{
        let city = req.query.city;
        let allNgoByCity = await NGOModel.find({city});
        if(allNgoByCity.length == 0){
            return res.status(400).json({msg:"No NGO found for this city!"});
        }
        res.json(allNgoByCity);
    }
    catch(e){
        res.status(500).json({err:e.message});
    }
    //
})

module.exports = NgoRouter;