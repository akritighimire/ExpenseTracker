const mongoose = require("mongoose");
const userTaskScheme = mongoose.Schema({
    taskTitle:{
        type: String,
        required: true,
    },
    taskDescription: {
        type: String,
    },
});
module.exports = mongoose.model("UserTaskModel",userTaskSchema);