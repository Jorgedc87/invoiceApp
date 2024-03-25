import axios from "axios";
import { getApiUrl } from "../utils/getApiUrl";

export const addInvoice = (invoiceData) => {
  const apiUrl = getApiUrl('invoice/create');
  const headers = {
    'Content-Type': 'application/json'
  };
  return axios.post(apiUrl, invoiceData, { headers });
};