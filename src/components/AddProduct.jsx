import { useState, useEffect, useRef } from "react";
import  useClickOutside  from "../hooks/useClickOutside";
import  useProductSuggestions  from "../hooks/useSuggestions";
import ProductSuggestions from "./ProductSuggestions";

export const AddProduct = ({ onAddProduct, customerId }) => {
  const [productCode, setProductCode] = useState("");
  const { productSuggestions, getSuggestions } = useProductSuggestions();
  const [showSuggestions, setShowSuggestions] = useState(false);
  const suggestionsRef = useRef(null);

  useClickOutside(suggestionsRef, () => {
    setShowSuggestions(false);
  });

  const handleAddProduct = (product) => {
    onAddProduct(product);
    setProductCode("");
    setShowSuggestions(false);
  };

  const handleSuggestions = (e) => {
    setProductCode(e);
    getSuggestions(e);
    setShowSuggestions(e.length >= 3);
  };

  return (
    <div className='my-4 px-8 flex flex-col justify-center items-center '>
      <h2 className='w-full text-2xl font-archivo font-bold text-white text-center'>Agregar Producto</h2>
      <div className='w-1/2 bg-slate-700 mt-2 text-white font-roboto rounded-sm px-2 py-4 flex flex-col shadow-md'>
        <div className="w-full mb-4 relative" ref={suggestionsRef}>

          {/* Buscador */}
          <input
            type='text'
            value={productCode}
            onChange={(e) => handleSuggestions(e.target.value)}
            className='bg-slate-900 mt-2 w-full text-white font-roboto rounded-t-md p-2 min-w-full shadow-md px-4'
            placeholder='Buscar productos...'
          />

          {/* Desplegable de productos */}
          {showSuggestions && <ProductSuggestions productSuggestions={productSuggestions} handleAddProduct={handleAddProduct} />}
        </div>

          {/* Botón agregar */}
        <button
          onClick={handleAddProduct}
          className='bg-green-500 w-40 mx-auto text-white rounded-md px-2 text-md hover:bg-green-400 shadow-lg'
        >
          Agregar
        </button>
      </div>
    </div>
  );
};
