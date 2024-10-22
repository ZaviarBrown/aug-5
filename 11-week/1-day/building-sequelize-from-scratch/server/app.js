// Instantiate Express and the application - DO NOT MODIFY
const express = require('express');
const app = express();
const Colors = require('./db/models/colors');

// Database file
const DB_FILE = process.env.DB_FILE;

/**
 * Step 1 - Connect to the database
 */
const sqlite3 = require('sqlite3');
const db = new sqlite3.Database(DB_FILE, sqlite3.OPEN_READWRITE);

// Express using json
app.use(express.json());

// List of all colors in the database - DO NOT MODIFY
app.get('/colors', (req, res, next) => {
    // const sql = Colors.getAll();

    db.all(Colors.getAll(), [], (err, rows) => {
        res.json(rows);
    });
});

// One color by id
app.get('/colors/:id', (req, res, next) => {
    const { id } = req.params; //! These lines are doing the EXACT same thing
    // const id = req.params.id; //! These lines are doing the EXACT same thing

    // const sql = Colors.getById(id);

    db.get(Colors.getById(id), [], (rows) => {
        res.json(rows);
    });
});

// Add color
app.post('/colors', (req, res, next) => {
    const { name } = req.body;

    // SQL INSERT
    // const sql = Colors.create(name); //? These lines are doing the EXACT same thing
    // const sql = Colors.create(req.body); //? These lines are doing the EXACT same thing

    // SQL QUERY NEW ROW
    // const sqlLast = Colors.getLast();

    db.run(Colors.create(name), [], (err) => {
        db.get(Colors.getLast(), [], (err, rows) => {
            res.json(rows);
        });
    });
});

// Root route - DO NOT MODIFY
app.get('/', (req, res) => {
    res.json({
        message: 'API server is running',
    });
});

// Set port and listen for incoming requests - DO NOT MODIFY
const port = 5000;
app.listen(port, () => console.log('Server is listening on port', port));
