import React, { useState } from 'react';
import AppLayout from './layout/AppLayout';
import { Clients } from './components/Clients';
import { ProductsTable } from './components/ProductsTable';
import { AddProduct } from './components/AddProduct';

export const InvoiceApp = () => {
  const [selectedClient, setSelectedClient] = useState(null);
  const [products, setProducts] = useState([]);
  const [error, setError] = useState(null);

  const handleClientSelected = (client) => {
    setSelectedClient(client);
  };

  const handleAddProduct = (newProduct) => {
    const existingProduct = products.find(product => product == newProduct);
    if (existingProduct) {
      setError("El producto ya existe en la lista de productos.");
      return;
    }
    setError(null);
    setProducts([...products, newProduct]);
  };

  const handleDeleteProduct = (productCode) => {
    const newProducts = products.filter((product) => product !== productCode);
    setProducts(newProducts);
  }

  const handleReset = () => {
    setProducts([]);
  }

  return (
    <AppLayout>
      <div className='container mx-auto'>
        <div className='flex flex-col justify-center items-center'>
          <div className=''>
            <Clients clientSelected={handleClientSelected} />
            </div>

            {selectedClient && (
              <div className='w-full'>
                <AddProduct onAddProduct={handleAddProduct} />
                {error && <div className='text-red-500 text-center'>{error}</div>}
                {products.length > 0 &&
                  <ProductsTable customer={selectedClient} products={products} onDeleteProduct={handleDeleteProduct} reset={handleReset}/>
                }
              </div>
            )}
          </div>
        </div>
    </AppLayout>
  );
};
