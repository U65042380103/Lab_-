const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');
require('dotenv').config();

const app = express()
app.use(cors())
app.use(express.json());

// const appmajor = express()
// app.use(cors())
// app.use(express.json());

const db = mysql.createConnection({
    host:process.env.DB_HOST,
    user:process.env.DB_USER,
    password:process.env.DB_PASSWORD,
    database:process.env.DB_DATABASE
})

app.get('/',(req,res)=>{
    const sql = "SELECT * FROM `recipe`";
    db.query(sql, (err, data)=>{
        if(err) return res.json(err);
        return res.json(data);
    })
})

app.get('/region',(req,res)=>{
    const sql = "SELECT * FROM `region`";
    const id = req.params.id;
    db.query(sql, (err, data)=>{
        if(err) return res.json(err);
        return res.json(data);
    })
})

app.post('/create',(req,res)=>{
    const sql = "INSERT INTO recipe (`id`,`name`,`ingredient`,`howto`,`region_id`) VALUES(?)";
    const values = [
        req.body.id,
        req.body.name,
        req.body.ingredient,
        req.body.howto,
        req.body.region_id,
    ]
    db.query(sql, [values],(err, data)=>{
        if(err) return res.json(err);
        return res.json("created");
    })
})

app.put('/update/:id',(req,res)=>{
    const sql = "UPDATE recipe set `name` = ?,`ingredient` = ?,`howto` = ?,`region_id` = ? WHERE id = ?";
    const id = req.params.id;
    const values = [
        req.body.name,
        req.body.ingredient,
        req.body.howto,
        req.body.region_id,
    ]
    db.query(sql, [...values, id],(err, data)=>{
        if(err) return res.json(err);
        return res.json("updated");
    })
})

app.delete('/delete/:id',(req,res)=>{
    const sql = "DELETE FROM recipe WHERE ID = ?";
    const id = req.params.id;
    db.query(sql, [id],(err, data)=>{
        if(err) return res.json(err);
        return res.json("deleted");
    })
    
})

app.listen(5000,()=>{
    console.log('Listening 5000 .....')
})