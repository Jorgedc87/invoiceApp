import axios from "axios";
import { getApiUrl } from "../utils/getApiUrl"

export const getCustomers = () => {
  const apiUrl = getApiUrl('customer/all')
  return axios.get(apiUrl).then(res => res.data);
}