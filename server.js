const express = require("express");
const app = express();
const mongoose = require('mongoose');
mongoose.connect("mongodb+srv://akriti:akriti@cluster0.ccddb0u.mongodb.net/test?retryWrites=true&w=majority", {
    useNewUrlParser: true,
    useUnifiedTopology: true,
});

const db = mongoose.connection;
db.on("error", console.error.bind(console, "connection error:"));
db.once("open",function(){
    console.log("we are connected")
});
app.listen(3000, function () {
    console.log("Server is running on port no 3000")
});