import database from "../../database";

async function executeInserts() {
  try {
    // Inserts for suppliers_table
    await database.promise().query(`
      INSERT INTO suppliers (name, street_address, street_number, floor_number, door_number, city, postal_code, country, phone, fax, nif)
      VALUES 
      ('LensCrafters', '123 Main Street', 1, 0, 'A', 'New York', 10001, 'USA', '1234567890', '0987654321', 'US123456'),
      ('Vision Express', '456 Oak Avenue', 2, 0, 'B', 'Los Angeles', 90001, 'USA', '9876543210', '0123456789', 'US654321')
      `);

    // Inserts for brands_table
    await database.promise().query(`
      INSERT INTO brands (name)
      VALUES 
        ('Ray-Ban'),
        ('Oakley')
    `);

    // Insert for glasses_table - LensCrafters
    await database.promise().query(`
      INSERT INTO glasses (brand_id, supplier_id, graduation, frame_type, frame_color, lens_color, price)
      SELECT 
          1 AS brand_id, s.supplier_id, '1.0' AS graduation, 'Rimless' AS frame_type, 'Black' AS frame_color, 'Gray' AS lens_color, 150.00 AS price
      FROM suppliers s
      WHERE s.name = 'LensCrafters'
    `);

    // Insert for glasses_table - Vision Express
    await database.promise().query(`
      INSERT INTO glasses (brand_id, supplier_id, graduation, frame_type, frame_color, lens_color, price)
      SELECT 
          2 AS brand_id, s.supplier_id, '1.5' AS graduation, 'Full Frame' AS frame_type, 'Brown' AS frame_color, 'Brown' AS lens_color, 200.00 AS price
      FROM suppliers s
      WHERE s.name = 'Vision Express'
    `);

    // Inserts for customers_table
    await database.promise().query(`
      INSERT INTO customers (name, postal_code, phone, email, registration_date, referred_by)
      VALUES 
        ('Mick Jagger', 10001, 5551234567, 'mick.jagger@example.com', '1986-06-01', NULL),
        ('Freddie Mercury', 90001, 5559876543, 'freddie.mercury@example.com', '1991-09-15', 1),
        ('David Bowie', 20001, 5555555555, 'david.bowie@example.com', '1988-08-12', 2),
        ('Janis Joplin', 30001, 5551112233, 'janis.joplin@example.com', '1987-04-04', 1)
    `);

    // Inserts for employees_table
    await database.promise().query(`
      INSERT INTO employees (name)
      VALUES 
        ('Ryuchi Sakamoto'),
        ('Ludovico Einaudi')
    `);

    // Inserts for sales_table
    await database.promise().query(`
      INSERT INTO sales (employee_id, customer_id, glasses_id, sale_date)
      VALUES 
        (1, 1, 1, '2024-04-01'),
        (2, 2, 2, '2024-04-02')
    `);

    console.log('Inserts successfully executed.');

  } catch (error) {
    console.error('Error executing inserts:', error);
  }
}

executeInserts();
