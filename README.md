# InvoiceApp - Desafio Técnico

## Descripción

Esta app fue diseñada para el desafío técnico de ingreso de SML. Consiste en la creación de un frontend para la realización de facturación de productos a un cliente (Invoices).

Las tecnologías que se utilizaron son: 

- React 18
- Axios
- TailwingCSS 3

Esta app se conecta a un Backend realizado en .Net Core y a una BBDD MariaDB (MySQL).

## Instalación

- Clonar el repositorio desde https://github.com/Jorgedc87/invoiceApp.git
- Abrir el proyecto y ejecutar `npm install`
- Crear el archivo de variables de entorno a partir de .env.example
- Configurar variable de entorno `VITE_BACKEND_URL` con la url del backend, EJ: `http://localhost:5000`
- Ejecutar el proyecto con `npm run dev`

## Endpoints

### Get Customers
#### Devuelve una colección de Clientes

- URI: `${VITE_BACKEND_URL}/api/customer/all`
- Method: `GET`

### Create Customer
#### Alta de Clientes

- URI: `${VITE_BACKEND_URL}/api/customer/create`
- Method: `POST`
```json
Body Example: 
    {
      "FirstName": "Nombre",
      "LastName": "Apellido",
      "Address": "Domicilio"
    }
```

### Create Invoice
#### Creación de Factura/Invoice

- URI: `${VITE_BACKEND_URL}/api/invoice/create`
- Method: `POST`
```json
Body Example: 
    {
      "Date": "2024-03-25T12:00:00",
      "CustomerId": 5,
      "Codes": [1002, 1006, 1016]
    }
```

### Get Books
#### Devuelve una colección de Libros / Productos

- URI: `${VITE_BACKEND_URL}/api/book/all`
- Method: `GET`