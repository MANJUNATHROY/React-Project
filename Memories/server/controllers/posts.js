import mongoose from "mongoose";
import postMessage from "../models/postmessage.js";


export const getPosts = async (req, res) => {
    try {
        const postMessages = await postMessage.find();

        res.status(201).json(postMessages);
    } catch (error) {
        res.status(400).json({ message: error.message });
    }
}

export const createPosts = async (req, res) => {
    const post = req.body;
    const newpost = new postMessage(post);

    try {
        await newpost.save();

        res.status(201).json(newpost);
    } catch (error) {
        res.staus(401).json({ message: error.message });
    }
}

export const updatePost = async (req, res) => {
    const { id: _id } = req.params;
    const post = req.body;

    if (!mongoose.Types.ObjectId.isValid(_id))
        return res.status(404).send("No post with that id");

    const updatedPost = await postMessage.findByIdAndUpdate(_id, { ...post, _id }, { new: true });

    res.json(updatedPost);
}

export const deletePost = async (req, res) => {
    const { id } = req.params

    if (!mongoose.Types.ObjectId.isValid(id))
        return res.status(404).send("No post with that id");

    await postMessage.findByIdAndDelete(id);

    res.json({ message: "Post Deleted Succesfully" });
}

export const likePost = async (req, res) => {
    const { id} = req.params;

    if (!mongoose.Types.ObjectId.isValid(id))
        return res.status(404).send("No post with that id");

    const post = await postMessage.findById(id);
    const updatedPost = await postMessage.findByIdAndUpdate(id, { likeCounts: post.likeCounts + 1}, { new: true });

    res.json(updatedPost);
}