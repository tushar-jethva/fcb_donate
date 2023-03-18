const express = require('express');
const mongoose = require('mongoose');

const PORT = 3000;
const DB = "mongodb+srv://tushar_023:JETHvA%409999@ncbdonate.2gwhl0z.mongodb.net/test";

const app = express();

mongoose.
connect(DB).
then(()=>{
    console.log("Connected with database!")
}).
catch((e)=>{
    console.log(e);
})



app.listen(PORT,()=>{
    console.log(`You are connected at http://localhost:${PORT}`);
})