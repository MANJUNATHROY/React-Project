import React, { useState, useEffect } from 'react';
import { TextField, Button, Typography, Paper } from '@mui/material';
import FIleBase from 'react-file-base64';
import { useDispatch } from 'react-redux';
import { createPosts, updatePost } from '../../actions/posts';
import { useSelector } from 'react-redux';
import useStyles from './styles';
import '../Form/styles.css';

const Form = ({ currentId, setCurrentId }) => {
    const classes = useStyles();
    const dispatch = useDispatch();
    const post = useSelector((state) => currentId ? state.posts.find((p) => p._id === currentId) : null);

    const handleSubmit = (e) => {
        e.preventDefault();
        if (currentId)
            dispatch(updatePost(currentId, postData));
        else
            dispatch(createPosts(postData));
        clear();
    }

    const clear = () => {
        setCurrentId(null);
        setPostData({
            title: "",
            message: "",
            creator: "",
            tags: "",
            SelectedFile: ""
        })
    }

    const [postData, setPostData] = useState({
        title: "",
        message: "",
        creator: "",
        tags: "",
        SelectedFile: ""
    });

    useEffect(() => {
        if (post)
            setPostData(post);
    }, [post]
    )

    return (

        <Paper className={classes.paper}>
            <div class='form'>
                <form autocomplete='off' noValidate onSubmit={handleSubmit}>
                    <Typography variant='h5'>{currentId ? 'Editing' : 'Creating'} a Memory</Typography>
                    <div class='root'><TextField name='creator' variant='outlined' label='Creator' fullWidth value={postData.creator} onChange={(e) => setPostData({ ...postData, creator: e.target.value })} /></div>
                    <div class='root'><TextField name='title' variant='outlined' label='Title' fullWidth value={postData.title} onChange={(e) => setPostData({ ...postData, title: e.target.value })} /></div>
                    <div class='root'><TextField name='message' variant='outlined' label='Message' fullWidth value={postData.message} onChange={(e) => setPostData({ ...postData, message: e.target.value })} /></div>
                    <div class='root'><TextField name='tags' variant='outlined' label='Tags' fullWidth value={postData.tags} onChange={(e) => setPostData({ ...postData, tags: e.target.value.split(',') })} /></div>
                    <div class='fileInput'><FIleBase type='file' multiple={false} onDone={({ base64 }) => setPostData({ ...postData, SelectedFile: base64 })} /></div>
                    <Button variant='container' color='primary' size='large' type='submit' fullWidth>Submit</Button>
                    <Button variant='contained' color='secondary' size='small' onClick={clear} fullWidth>Clear</Button>
                </form>
            </div>
        </Paper>

    );
}

export default Form;