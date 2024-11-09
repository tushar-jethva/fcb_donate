const express = require('express');
const mongoose = require('mongoose');
const swaggerUi = require('swagger-ui-express');
const swaggerDocument = require('./swagger-output.json');



const PORT = 3000;
const DB = "mongodb+srv://tushar_023:JETHvA%409999@ncbdonate.2gwhl0z.mongodb.net/test";

const authRouter = require('./routes/auth');
const ngoRouter = require('./routes/ngo');
const app = express();
const DonationRouter = require('./routes/donation');
app.use(express.json());
app.use(authRouter);
app.use(ngoRouter);
app.use(DonationRouter);
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));


app.get('/',(req,res)=>{
    res.send("Welcome to FCB Donation!");
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