import mysql from 'mysql2';


// Crea la conexión a la base de datos
const pool = mysql.createPool({
  host: 'localhost',
  user: 'root',
  password: '123456789',
  database: 'optical_store',
  port: 3306 // Puerto para conectarse con la base de datos de MySQL
});

// Obtiene la promesa de la conexión
const database = pool.promise();

async function executeInserts() {
  try {
    // Inserts for suppliers_table
    await database.execute(`
      INSERT INTO suppliers (name, street_address, street_number, floor_number, door_number, city, postal_code, country, phone, fax, nif)
      VALUES 
      ('LensCrafters', '123 Main Street', 1, 0, 'A', 'New York', 10001, 'USA', '1234567890', '0987654321', 'US123456'),
      ('Vision Express', '456 Oak Avenue', 2, 0, 'B', 'Los Angeles', 90001, 'USA', '9876543210', '0123456789', 'US654321')
    `);

    // Inserts for brands_table
    await database.execute(`
      INSERT INTO brands (name)
      VALUES 
        ('Ray-Ban'),
        ('Oakley')
    `);

    // Inserts for customers_table
    await database.execute(`
    INSERT INTO customers (name, postal_code, phone, email, registration_date, reffered_by)
    VALUES 
      ('Mick Jagger', '10001', '555-123-4567', 'mick.jagger@example.com', '1986-06-01', 1),
      ('Freddie Mercury', '90001', '555-987-6543', 'freddie.mercury@example.com', '1991-09-15', 2),
      ('David Bowie', '20001', '555-555-5555', 'david.bowie@example.com', '1988-08-12', 3),
      ('Janis Joplin', '30001', '555-111-2233', 'janis.joplin@example.com', '1987-04-04', 4)
  `);

    // Inserts for employees_table
    await database.execute(`
    INSERT INTO employees (name)
    VALUES 
      ('Ryuchi Sakamoto'),
      ('Ludovico Einaudi')
  `);

    // Inserts for sales_table
    await database.execute(`
      INSERT INTO sales (employee_id, customer_id, glasses_id, sale_date)
      VALUES 
        (1, 1, 1, '2024-04-01'),
        (2, 2, 2, '2024-04-02')
    `);

    // Insert for glasses_table - LensCrafters
    await database.execute(`
      INSERT INTO glasses (brand_id, supplier_id, graduation, frame_type, frame_color, lens_color, price)
      SELECT 
          b.brand_id, s.supplier_id, '1.0' AS graduation, 'Rimless' AS frame_type, 'Black' AS frame_color, 'Gray' AS lens_color, 150.00 AS price
      FROM brands b
      JOIN suppliers s ON s.name = 'LensCrafters' AND b.name = 'Ray-Ban'
    `);

    // Insert for glasses_table - Vision Express
    await database.execute(`
      INSERT INTO glasses (brand_id, supplier_id, graduation, frame_type, frame_color, lens_color, price)
      SELECT 
          b.brand_id, s.supplier_id, '1.5' AS graduation, 'Full Frame' AS frame_type, 'Brown' AS frame_color, 'Brown' AS lens_color, 200.00 AS price
      FROM brands b
      JOIN suppliers s ON s.name = 'Vision Express' AND b.name = 'Oakley'
    `);

    console.log('Inserts successfully executed.');

  } catch (error) {
    console.error('Error executing inserts:', error);
  } finally {
    // Cierra la conexión después de realizar las inserciones
    database.end();
  }
}

executeInserts();
