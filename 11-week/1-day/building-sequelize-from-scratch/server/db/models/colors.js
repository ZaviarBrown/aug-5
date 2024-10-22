const Colors = {
    getAll: () => 'SELECT * FROM colors',
    getLast: () => 'SELECT * FROM colors ORDER BY id DESC LIMIT 1',
    getById: (id) => `SELECT * FROM colors WHERE id = ${id}`,
    create: (name) => `INSERT INTO colors (name) VALUES ('${name}')`,
};

module.exports = Colors;