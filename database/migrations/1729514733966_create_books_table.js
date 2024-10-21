exports.up = function(knex) {
  return knex.schema.createTable('books', function(table) {
    table.increments('id').primary();
    table.datetime('created_at').notNullable();
    table.datetime('updated_at').notNullable();
    table.string('title').notNullable();
    table.string('author').notNullable();
    table.string('publisher').notNullable();
    table.integer('year_of_publication').notNullable();
    table.integer('number_of_pages').notNullable();
  });
};

exports.down = function(knex) {
  return knex.schema.dropTable('books');
};