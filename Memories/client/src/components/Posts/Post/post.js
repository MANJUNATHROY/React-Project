import React from 'react';
import { Card, CardActions, CardMedia, CardContent, Button, Typography } from '@mui/material';
import ThumbUpAltIcon from '@mui/icons-material/ThumbUpAlt';
import DeleteIcon from '@mui/icons-material/Delete';
import MoreHorizIcon from '@mui/icons-material/MoreHoriz';
import moment from 'moment';
import '../Post/styles.css';
import { useDispatch } from 'react-redux';
import { deletePost, likePost } from '../../../actions/posts';
import useStyles from '../Post/styles';

const Post = ({ post, setCurrentId }) => {
    //const classes=useStyles();
    const dispatch = useDispatch();
    return (
        <Card class='card'>
            <CardMedia alt="No content" component="img" image={post.SelectedFile} title={post.title} />
            <div class='overlay'>
                <Typography variant='h6'>{post.creator}</Typography>
                <Typography variant='body2'>{moment(post.createdAt).fromNow()}</Typography>
            </div>
            <div class='overlay2'>
                <Button style={{ color: 'black' }} size='small' onClick={() => setCurrentId(post._id)}>
                    <MoreHorizIcon fontSize='default' />
                </Button>
            </div>
            <div class='details'>
                <Typography variant='body2' color='textSecondary'>{post.tags.map((tag) => "#" + tag)}</Typography>
            </div>
            <CardContent>
                <Typography class='title' variant='h3' gutterBottom>{post.title}</Typography>
                <Typography class='title' variant='h5' gutterBottom>{post.message}</Typography>
            </CardContent>
            <CardActions class='cardActions'>
                <Button size='small' color='primary' onClick={() => dispatch(likePost(post._id))}>
                    <ThumbUpAltIcon fontSize='small' />
                    &nbsp; Like &nbsp;
                    {post.likeCounts}
                </Button>
                <Button size='small' color='primary' onClick={() => dispatch(deletePost(post._id))}>
                    <DeleteIcon fontSize='small' />
                    Delete
                </Button>
            </CardActions>
        </Card>
    );
}

export default Post;