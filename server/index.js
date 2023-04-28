const express = require('express');
const mongoose = require('mongoose');

const PORT = 3000;
const DB = "mongodb+srv://tushar_023:JETHvA%409999@ncbdonate.2gwhl0z.mongodb.net/test";

const authRouter = require('./routes/auth');
const ngoRouter = require('./routes/ngo');
const app = express();
app.use(express.json());
app.use(authRouter);
app.use(ngoRouter);
app.get("/fake",(req,res) => {
    res.json({'name':'vipendrasinh'});
})
mongoose.
connect(DB).
then(()=>{
    console.log("Connected with database!")
}).
catch((e)=>{
    console.log(e);
})



app.listen(PORT,"0.0.0.0",()=>{
    console.log(`You are connected at http://localhost:${PORT}`);
})