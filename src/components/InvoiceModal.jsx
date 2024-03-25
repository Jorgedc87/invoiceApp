import {Fragment} from 'react';

const InvoiceModal = ({ isOpen, onClose, invoice, customer }) => {
  if (!isOpen) return null;

  const { items } = invoice;

  // Calcular la suma total de los productos
  const totalAmount = items.reduce((total, product) => total + parseFloat(product.price), 0);

  return (
    <div className="fixed top-0 left-0 w-full h-full flex items-center justify-center bg-black bg-opacity-50">
      <div className="bg-white rounded-xs py-6 px-8 w-[40rem]">
        <div className='flex justify-between items-center mb-10'>
          <h2 className='text-3xl font-bold uppercase'>InvoiceApp</h2>
          <h2 className='text-xl font-bold'>Factura A</h2>
        </div>
        <div className="flex flex-col justify-between mb-6">
          <div className='flex w-full justify-between'>
            <div className='w-1/2 '>
              <p className='flex'><span className=" text-md mr-1 font-bold">Factura N°: </span> 001</p>
              <p><span className='font-bold'>Fecha:</span> {new Date().toLocaleDateString()}</p>
            </div>
            <div className='w-1/2'>
              <p><span className='font-bold'>Cliente N°:</span> {customer.id}</p>
              <p><span className='font-bold'>Nombre Completo: </span> {customer.lastName}, {customer.firstName}</p>
              <p><span className='font-bold'>Dirección: </span> {customer.address}</p>
            </div>
          </div>
        </div>
        <hr className="mb-6" />
        <div className="flex gap-4">
          <div className='w-1/4'><strong>Código</strong></div>
          <div className='w-1/2'><strong>Producto</strong></div>
          <div className="w-1/4 text-right"><strong>Precio</strong></div>
        </div>
          {items.map((product) => (
            <div key={product.id} className="flex py-2 gap-4">
              <div className='w-1/4'>#{product.productCode}</div>
              <div className='w-1/2'>{product.productTitle}</div>
              <div className="w-1/4 text-right">U$ {product.price}</div>
            </div>
          ))}
        <hr className="my-6" />
        <div className="flex justify-between">
          <div><strong>Total:</strong></div>
          <div className="text-right">U$ {totalAmount.toFixed(2)}</div>
        </div>
        <div className="w-full flex justify-center mt-8" >
          <button className='text-center bg-green-600 hover:bg-green-400 text-white px-2 py-1 rounded-md' onClick={onClose}>
            Cerrar
          </button>
        </div>
      </div>
    </div>
  );
};

export default InvoiceModal;
