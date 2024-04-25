import poolOptical from '../connection_database';

const connection = poolOptical.promise(); 
console.log(connection)

async function executeInserts() {
  try {
    // Inserts for suppliers_table
    await connection.execute(/*sql*/`
      INSERT INTO suppliers (name, street_address, street_number, floor_number, door_number, city, postal_code, country, phone, fax, nif)
      VALUES 
      ('LensCrafters', '123 Main Street', 1, 0, 'A', 'New York', 10001, 'USA', '1234567890', '0987654321', 'US123456'),
      ('Vision Express', '456 Oak Avenue', 2, 0, 'B', 'Los Angeles', 90001, 'USA', '9876543210', '0123456789', 'US654321')
    `);

    // Inserts for brands_table
    await connection.execute(/*sql*/`
      INSERT INTO brands (name)
      VALUES 
        ('Ray-Ban'),
        ('Oakley')
    `);

    // Inserts for customers_table
    await connection.execute(/*sql*/`
    INSERT INTO customers (name, postal_code, phone, email, registration_date, referred_by)
    VALUES 
      ('Mick Jagger', '10001', '555-123-4567', 'mick.jagger@example.com', '1986-06-01', null),
      ('Freddie Mercury', '90001', '555-987-6543', 'freddie.mercury@example.com', '1991-09-15', null),
      ('David Bowie', '20001', '555-555-5555', 'david.bowie@example.com', '1988-08-12', null),
      ('Janis Joplin', '30001', '555-111-2233', 'janis.joplin@example.com', '1987-04-04', null)
  `);

    // Inserts for employees_table
    await connection.execute(/*sql*/`
    INSERT INTO employees (name)
    VALUES 
      ('Ryuchi Sakamoto'),
      ('Ludovico Einaudi')
  `);


    // Insert for glasses_table - LensCrafters
    await connection.execute(/*sql*/`
      INSERT INTO glasses (brand_id, supplier_id, graduation, frame_type, frame_color, lens_color, price)
      SELECT 
          b.id, s.id, '1.0' AS graduation, 'Rimless' AS frame_type, 'Black' AS frame_color, 'Gray' AS lens_color, 150.00 AS price
      FROM brands b
      JOIN suppliers s ON s.name = 'LensCrafters' AND b.name = 'Ray-Ban'
    `);

    // Insert for glasses_table - Vision Express
    await connection.execute(/*sql*/`
      INSERT INTO glasses (brand_id, supplier_id, graduation, frame_type, frame_color, lens_color, price)
      SELECT 
          b.id, s.id, '1.5' AS graduation, 'Full Frame' AS frame_type, 'Brown' AS frame_color, 'Brown' AS lens_color, 200.00 AS price
      FROM brands b
      JOIN suppliers s ON s.name = 'Vision Express' AND b.name = 'Oakley'
    `);

    // Inserts for sales_table
    await connection.execute(/*sql*/`
      INSERT INTO sales (fk_employee_id, fk_customer_id, fk_glasses_id, sale_date)
      VALUES 
        (1, 1, 1, '2024-04-01'),
        (2, 2, 2, '2024-04-02')
    `);

    console.log('Inserts successfully executed.');

  } catch (error) {
    console.error('Error executing inserts:', error);

  } finally {
    connection.end(); // close DB connection
  }
}

// to check errors and see inserts
poolOptical.query(`SHOW TABLES`, (err: Error,res: Response, fields: any) =>{
  console.error(err);
  console.info(res);
  console.info(fields);
})

executeInserts();
