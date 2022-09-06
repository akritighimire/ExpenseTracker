const express = require("express");
const router = express.Router;
const UserTaskModel = require("../model/user_task_model");
router.post("createUserTask", (req,res) => {
    const userTask = new UserTaskModel({
    taskTitle: req.body.myTaskTitle,
    taskDescription: req.body.myTaskDescription,

    })


}) 