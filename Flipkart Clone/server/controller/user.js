import mongoose from "mongoose";
import User from "../models/userschema.js";


export const signIn = async (req,res) => {
    try {

    } catch (error) {
        console.log(error);
    }
}

export const signUp = async (req,res) => {
    User.findOne({email: req.body.email}).exec((error,user) =>{
        if(user)
        return res.status(400).json({message: "Already Registered"});
    });

    const {
        firstName,
        lastName,
        email,
        password,
    }=req.body;

    const _user = new User({
        firstName,
        lastName,
        email,
        password,
        username: Math().toString()
    });

    try {
       const {data} =  _user.save();

       res.status(201).json({user: data});
           
    } catch (error) {
        res.status(400).json({message: error});
    }


}