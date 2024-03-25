import { useEffect, useState } from "react";

export const useFetch = (url, options = {}) => {
  const [state, setState] = useState({
    data: null,
    isLoading: true,
    hasError: null
  });

  const fetchData = async () => {
    setState({
      ...state,
      isLoading: true
    });

    try {
      const resp = await fetch(`${process.env.VITE_BACKEND_URL}${url}`, {
        ...options,
        method: "GET", 
        headers: {
          "Content-Type": "application/json",
          ...options.headers 
        }
      });
      const data = await resp.json();
      setState({
        data,
        isLoading: false,
        hasError: null
      });
    } catch (error) {
      setState({
        data: null,
        isLoading: false,
        hasError: error.message
      });
    }
  };

  useEffect(() => {
    fetchData();
  }, [url, options]); 

  return {
    data: state.data,
    isLoading: state.isLoading,
    hasError: state.hasError
  };
};
