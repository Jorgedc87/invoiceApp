import { useState, useEffect } from "react";
import { getBooks } from "../services/getProducts";

const useProductSuggestions = () => {
  const [products, setProducts] = useState([]);
  const [productSuggestions, setProductSuggestions] = useState([]);

  const fetchBooks = async () => {
    try {
      const books = await getBooks();
      setProducts(books);
    } catch (error) {
      console.error("Error al buscar libros:", error);
    }
  };

  useEffect(() => {
    fetchBooks();
  }, []);

  const getSuggestions = (input) => {
    if (input.length >= 3) {
      const filteredProducts = products.filter((product) =>
        product.title.toLowerCase().includes(input.toLowerCase())
      );
      setProductSuggestions(filteredProducts);
    } else {
      setProductSuggestions([]);
    }
  };

  return {
    products,
    productSuggestions,
    getSuggestions,
  };
};

export default useProductSuggestions;
