import React from 'react';
import useStyles from '../Posts/styles';
import { Grid,CircularProgress } from '@mui/material';
import { useSelector } from 'react-redux';
import Post from './Post/post';
import '../Posts/styles.css';

const Posts = ({setCurrentId}) => {
    //const classes=useStyles();
    const posts = useSelector((state)=>state.posts);
    return(
        !posts.length? <CircularProgress/>:(
            <Grid class='mainContainer' container alignItems="stretch" spacing={3}>
                {posts.map((post) => (
                    <Grid key={post._id} item xs={12} sm={6}>
                        <Post post={post} setCurrentId={setCurrentId}/>
                    </Grid>
                ))}
            </Grid>
        )
    );
}

export default Posts;