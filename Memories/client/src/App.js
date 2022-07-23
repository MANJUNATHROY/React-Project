import react,{useEffect,useState} from 'react';
import {Container,AppBar,Typography,Grow,Grid} from '@mui/material';
import useStyles from './styles';
import { useDispatch } from 'react-redux';
import {getPosts} from './actions/posts';
import Form from './components/Form/Form';
import Post from './components/Posts/posts';
import './styles.css';

function App() {
  const [currentId,setCurrentId]=useState(0);
  const dispatch=useDispatch();

  useEffect(()=>{
    dispatch(getPosts());
  },[dispatch]);

  return (
    <div>
     <Container maxWidth='lg'>
      <AppBar  position='static' color='inherit'>
       <Typography variant='h3' color='primary' align='center'>Memories</Typography>
      </AppBar>
      <Grow in>
        <Container>
          <Grid container justify='space-between' alignItems='stretch' spacing='3'>
            <Grid item xs={12} sm={7}>
              <Post setCurrentId={setCurrentId}/>
            </Grid>
            <Grid item xs={12} sm={7}>
              <Form currentId={currentId} setCurrentId={setCurrentId}/>
            </Grid>
          </Grid>
        </Container>
      </Grow>
     </Container>


    </div>
  );
}

export default App;
