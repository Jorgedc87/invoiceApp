import { useState } from "react";
import { addInvoice } from "../services/addInvoice";
import InvoiceModal from "./InvoiceModal";

export const ProductsTable = ({ products, customer, onDeleteProduct, reset }) => {
  const [showModal, setShowModal] = useState(false);
  const [invoiceData, setInvoiceData] = useState({});

  const handleSendInvoice = async () => {
    try {
      const invoiceData = {
        Date: new Date().toISOString(), 
        CustomerId: customer.id, 
        Codes: products.map(product => product.id) 
      };
      
      const response = await addInvoice(invoiceData);
      setInvoiceData(response.data);
      setShowModal(true);
    } catch (error) {
      console.error('Error al enviar la factura:', error);
    }
  };

  const handleCloseModal = () => {
    setShowModal(false);
    reset();
  };

  return (
    <>
      <div className='my-8 px-8 flex flex-col items-center'>
        <h2 className='text-2xl font-archivo font-bold text-white text-center'>Productos</h2>
        <table className='w-1/2 bg-slate-900 mt-2 text-white font-roboto rounded-md p-2 shadow-md'>
          <thead>
            <tr className='text-xs'>
              <th className='w-1/4'>Código</th>
              <th className='w-1/2'>Title</th>
              <th className='w-1/4'>Acción</th>
            </tr>
          </thead>
          <tbody>
            {products.map((product, index) => (
              <tr key={index} className="text-xs odd:bg-slate-800 even:bg-slate-700">
                <td className="w-1/4 text-center">{product.id}</td>
                <td className="text-center">{product.title}</td>
                <td className="w-full">
                  <button
                    className='bg-red-500  mx-auto  text-web text-white rounded-full p-1 px-3 m-2 text-md hover:bg-red-400 shadow-lg flex items-center justify-center'
                    onClick={() => onDeleteProduct(product)}
                  >
                    Eliminar
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
          <tfoot>
            <tr className='text-xs'>
              <th>Código</th>
              <th>Title</th>
              <th>Acción</th>
            </tr>
          </tfoot>
        </table>
      </div>
      <div className='px-8 flex justify-end'>
        <button
          className='bg-green-500 w-40 mx-auto text-white rounded-md px-2 text-md hover:bg-green-400 shadow-lg'
          onClick={handleSendInvoice}
        >
          Enviar
        </button>
      </div>
      <InvoiceModal
        isOpen={showModal}
        onClose={handleCloseModal}
        invoice={invoiceData}
        customer={customer}
      />
    </>
  );
};
