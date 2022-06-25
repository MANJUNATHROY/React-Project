import postMessage from "../models/postmessage.js";


export const getPosts = async (req,res)=>{
    try{
        const postMessages = await postMessage.find();

        res.status(201).json(postMessages);
    }catch(error)
    {
        res.status(400).json({message: error.message});
    }
}

export const createPosts = async (req,res)=> {
    const post = req.body;
    const newpost = new postMessage(post);

   try{
    await newpost.save();
        
    res.status(201).json(newpost);
   }catch(error)
   {
        res.staus(401).json({message: error.message});
   }
}