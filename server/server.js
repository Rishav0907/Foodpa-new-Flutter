const express                   =        require('express')
const bodyParser                =        require('body-parser');
const mongoose                  =        require('mongoose');
const userRoutes                =        require('./routes/user');
const foodRoutes                =        require('./routes/food')
const helmet                    =        require('helmet')
const {body,validationResult}   =        require('express-validator');
const app                       =        express();
const dbURL= `mongodb+srv://${process.env.MONGO_USER}:${process.env.MONGO_USER_PASSWORD}@cluster0.l8bkc.mongodb.net/${process.env.MONGO_DATABASE}`;
const port                      =       process.env.PORT || 3000




app.use(bodyParser.urlencoded({ extended: true, limit: '50mb' }));
app.use(helmet());
app.use('/',userRoutes);
app.use('/',foodRoutes);

mongoose.connect(dbURL, { useNewUrlParser: true })
    .then(result => {
        app.listen(port, () => {
            console.log(`Server started on ${port}`)
        })
    })
    .catch(err => console.log(err))