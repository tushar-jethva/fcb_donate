
const express = require("express");

const DonationModel = require("../models/donation");
const NgoRouter = require("./ngo");

const DonationRouter = express.Router();

DonationRouter.post("/api/postDonation",async(req,res) => {
    try{
        const {ngoName,category,userName,description,images,address,pinecode,city,state} = req.body;
        let donation = new DonationModel(
            {
                userName,
                ngoName,
                category,
                description,
                address,
                city,
                state,
                pinecode,
                images
            },
            
        );
        donation =await donation.save();
        res.json(donation);
    }catch(e){
        res.status(500).json({err:e.message});
    }
});

module.exports = NgoRouter;